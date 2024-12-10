# Bazy danych, informatyka, studia stacjonarne 2024/2025

## 1. Wstęp.

### 1.1 Wyzwalacze

Wyzwalacze (ang. `trigger`) są strukturami, które są automatycznie uruchamiane przez bazę danych w momencie, w którym warunek ich uruchomienia został spełniony. Takim warunkiem może być operacja wstawienia nowego rekordu, aktualizacji rekordu czy jego usunięcia (`INSERT, UPDATE, DELETE`). Operacje zadeklarowane w wyzwalaczu mogą zostać wykonane przed (`BEFORE`) lub po (`AFTER`) wystąpieniu zdarzenia. Jako, że domyślnym znakiem oddzielającym zapytania SQL od siebie (ang. `delimiter`) jest `';'` a taki znak może wystąpić w 'ciele' wyzwalacza wielokrotnie, powinniśmy najpierw zmienić ten domyślny ogranicznik na coś co ma małe szanse wystąpić w zapytaniu, np. `//` lub `&&`, które są spotykane najczęściej. Po zakończeniu bloku kodu wracamy do poprzednich ustawień.

**Przykład 1**

```sql
-- poniższa instrukcja zamienia domyślny delimiter ze znaku ;
-- na //, gdyż w samym ciele wyzwalacza (ale i procedury czy funkcji)
-- może on wystąpić co powoduje wykonanie polecenie do znaku delimitera
-- a tego przed końcem deklaracji wyzwalacza byśmy nie chcieli
DELIMITER //
-- nazwa wyzwalacza
CREATE TRIGGER towar_before_insert
-- określenie warunku wywołania wyzwalacza (kiedy i na jakiej tabeli)
BEFORE INSERT ON towar
-- pętla wywołania operacji na każdym wierszu polecenia (tu INSERT)
FOR EACH ROW
-- faktyczny blok, który wywołany będzie w każdej iteracji pętli
BEGIN
  IF NEW.cena_zakupu < 0
  THEN
    SET NEW.cena_zakupu = 0;
  END IF;
-- koniec bloku
END
-- delimiter, który spowoduje przekazanie całego polecenia do interpretera
//
-- przywracamy delimiter do wartości domyślnej
DELIMITER ;
```

W zależności od rodzaju operacji, której nasłuchuje wyzwalacz możemy mieć dostępn do przestrzeni nazw `NEW` lub/i `OLD`. Dla operacji:

* `INSERT`: tylko `NEW` gdyż tylko nowe dane są wstawiane,
* `UPDATE`: `NEW` oraz `OLD` gdyż aktualizujemy stare dane (`OLD`) nowymi (`NEW`),
* `DELETE`: tylko `OLD` gdyż nowych danych w tej operacji nie dostarczamy, ale usuwamy istniejące.

W ciele wyzwalacza możemy również deklarować zmienne i przypisywać im wartości w sposób statyczny lub dynamiczny.

**Przykład 2**
```sql
DELIMITER $$

CREATE TRIGGER uczestnicy_after_insert
AFTER INSERT ON uczestnicy
FOR EACH ROW
BEGIN
	DECLARE postac varchar(100);
	DECLARE has_postac bool;
	SET postac = 'Dziadek';
    -- kolejne zmienne ...

IF postac in (
	SELECT nazwa from kreatura WHERE idKreatury in 
	(SELECT id_uczestnika from uczestnicy where id_wyprawy=NEW.id_wyprawy)) 
THEN 
	SET has_postac = true;
	END IF;
    
IF has_postac
THEN 
    -- tu możemy wywołać funkcję, zapytanie SQL, czy zgłosić
	-- INSERT INTO ...;
END IF;

END
$$
DELIMITER ;
```

### 1.2 Procedury i funkcje

Procedury i funkcje są strukturami, które podobnie jak wyzwalacze są przechowywane w konkretnej bazie danych. Tworzy się je wtedy kiedy istnieje potrzeba zebrania kilku operacji w jednym miejscu i wywoływania ich wielokrotnie dla różnych danych wejściowych.


**Przykład 3**

```sql
DELIMITER $$
CREATE PROCEDURE premia(IN id int)
BEGIN
Update pracownik set pensja = 1.2 * pensja where id_pracownika = id;
END
$$
DELIMITER ;
```

Następnie procedurę wywołujemy poprzez instrukcję `CALL`.

```sql
CALL premia(10)
```

W powyższym przypadku procedura posiada tylko parametr wejściowy, ale procedura może również zwracać wartość poprzez określenie parametru wyjściowego - `OUT`.

**Przykład 4**
```sql
DELIMITER $$
CREATE PROCEDURE przedstaw_sie(IN id int, OUT powitanie VARCHAR(255))
BEGIN
SELECT concat('Nazywam się ', imie, ' ', nazwisko, '.') INTO powitanie from pracownik where id_pracownika=id;
END
$$
DELIMITER ;

CALL przedstaw_sie(10, @p);
select @p;
```

W powyższej procedurze zadeklarowany jest zarówno parametr wejściowy jak i wyjściowy. Następnie w zapytaniu select wartość zwracana zapisywana jest do zmiennej. Dalej w wywołaniu procedury użyta jest nazwa lokalnej zmiennej, do której wartość zwracana przez procedurę zostanie zapisana (`SELECT ... INTO zmienna`). I ostatecznie poprzez `SELECT @p` wartość zmiennej jest wyświetlana.

Procedura może również być bezparametryczna.

**Przykład 5**
```sql
DELIMITER $$
CREATE PROCEDURE usun_nieaktywnych()
BEGIN
DELETE FROM uzytkownicy WHERE datediff(now(), data_ostatniego_logowania) > 365;
END
$$
DELIMITER ;
```

Korzystając z procedur i wyzwalaczy możemy usprawnić mechanizm walidacji danych na poziomie bazy. W systemie MySQL nie możemy w ramach pojedynczego wyzwalacza określić kilku zdarzeń jego uruchomienia. Możemy jednak zamiast przepisywać ten sam kod ciała wyzwalacza uruchomić procedurę z jego wnętrza.
Instrukcja `SIGNAL SQLSTATE '45000' ...` jest mechanizmem zwracającym komunikat (wyjątek) na wyjściu, a wartość 45000 oznacza 'unhandled user-defined exception' czyli poczynając od tego numeru możemy okreslać włane wyjątki dla konkretnej bazy danych, opisując je następnie komunikatami, które mogą znaleźć się również w finalnej dokumentacji projektu ułatwiając analizę zdarzeń. 
Więcej: https://dev.mysql.com/doc/refman/8.0/en/signal.html


**Przykład 6**

```sql
DELIMITER $

CREATE PROCEDURE `check_cena_sprzedazy`(IN cena_zakupu DECIMAL(7,2), IN cena_sprzedazy DECIMAL(7,2))
BEGIN
    IF cena_zakupu < 0 THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'Cena zakupu poniżej 0!';
    END IF;
    
    IF cena_sprzedazy < 0 THEN
	SIGNAL SQLSTATE '45001'
	   SET MESSAGE_TEXT = 'Cena sprzedaży poniżej 0!';
    END IF;
    
    IF cena_sprzedazy < cena_zakupu THEN
	SIGNAL SQLSTATE '45002'
           SET MESSAGE_TEXT = 'Cena sprzedazy ponizej ceny zakupu!';
    END IF;
END$
DELIMITER ;
```

**Przykład 7**

```sql
DELIMITER $
CREATE TRIGGER `pozycja_zamowienia_before_insert` BEFORE INSERT ON `pozycja_zamowienia`
FOR EACH ROW
BEGIN
	DECLARE koszt DECIMAL(7,2);
	SELECT cena_zakupu INTO koszt FROM towar WHERE id_towaru=new.towar;
    CALL check_cena_sprzedazy(koszt, new.cena);
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER `pozycja_zamowienia_before_update` BEFORE UPDATE ON `pozycja_zamowienia`
FOR EACH ROW
BEGIN
	DECLARE koszt DECIMAL(7,2);
	SELECT cena_zakupu INTO koszt FROM towar WHERE id_towaru=new.towar;
    CALL check_cena_sprzedazy(koszt, new.cena);
END$   
DELIMITER ;
```

Przykłady i więcej informacji o procedurach mozna znaleźć między innymi tu:
* [W3resource MySQL Procedures](https://www.w3resource.com/mysql/mysql-procedure.php)


**Funkcje** to nic innego jak struktury, z których korzystaliśmy wielokrotnie używając funkcji wbudowanych. Jednak teraz możemy zdefiniować je na własne potrzeby w danej bazie. Są podobne do procedur w konstrukcji kodu, ale sposób ich wywołania jest inny.

**Przykład 8**
```sql
DELIMITER //
CREATE FUNCTION count_pracownicy()
    RETURNS INTEGER
BEGIN
    DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM pracownik;
    RETURN @ile;
END //

select count_pracownicy();
```

Warto wspomnieć o innych różnicach między funkcjami a procedurami aby rozwiać wątpliwości, że zawsze można ich używać zamiennie (dla funkcji i procedur tworzonych przez użytkownika). Otóż funkcje mają kilka istotnych ograniczeń względem procedur i nie możemy korzystać z transakcji. Transakcja to operacja (lub zbiór operacji), które dzięki mechanizmom bazy danych pozwala na ich atomowe wykonanie i przywrócenie zmian (ang. rollback), jeżeli jedna z operacji się nie powiedzie. 

W funkcjach nie są dozwolone poniższe polecenia SQL:

```sql
ALTER
'CACHE INDEX' 
CALL 
COMMIT 
CREATE 
DELETE
DROP 
'FLUSH PRIVILEGES' 
GRANT 
INSERT 
KILL
LOCK 
OPTIMIZE 
REPAIR 
REPLACE 
REVOKE
ROLLBACK 
SAVEPOINT 
'SELECT FROM table'
'SET zmienna_systemowa' 
'SET TRANSACTION'
SHOW 
'START TRANSACTION' 
TRUNCATE 
UPDATE
```


Oficjalna dokumentacja odnośnie tworzenia własnych funkcji: [MySQL Functions](https://dev.mysql.com/doc/refman/8.0/en/create-function-udf.html) i [User Defined Functions](https://dev.mysql.com/doc/refman/8.0/en/adding-udf.html)

## 2. **Zadania**

### Dziura

Bjorn niepewnym krokiem udał się w stronę pieczary. Jeszcze raz się upewnił, że nie ma w
środku teściowej, po czym zaczął szybko kopać dziurę. Gdy była już gotowa przykrył ją liśćmi, a futro ułożył obok pułapki. Aż tu nagle, usłyszał kroki teściowej. Szybko schował się za pobliskie drzewo, aby obserwować sytuację.

**Zadanie 1**
1. Napisz wyzwalacz, który przed wstawieniem lub modyfikacją tabeli `kreatura` sprawdzi czy
`waga` jest większa od zera.


### Futro

Coraz bardziej było słychać kroki teściowej, aż w końcu Bjorn wychylając się zza drzewa,
zobaczył ją. Staruszka, wracając do swojej pieczary, dostrzegła piękne futro leżące na ziemi i
zaryczała: „Muuuuuuszę to mieć!” Zaczęła biec w jego stronę, a ziemia trzęsła się tak, że aż biedny wiking zaczął podskakiwać. W końcu wpadła w pułapkę Bjorna i krzyknęła tak głośno, że staruszek siedzący w krzakach osiwiał, a Drozd stracił wszystkie pióra.

**Zadanie 2**

1. Stwórz tabelę archiwum_wypraw z polami `id_wyprawy`, `nazwa`, `data_rozpoczecia`,
`data_zakonczenia`, `kierownik` (varchar), do której będą wstawiane rekordy po usunięciu z
tabeli `wyprawa`. Do kolumny `kierownik` wstawiane jest nazwa kreatury na podstawie
usuwanego `id_kreatury`.

__Podpowiedź__

Za pomocą wyzwalacza.

### Spalony

Bjorn nie odważył się od razu porozmawiać z teściową, więc postanowił poczekać do rana.
Kiedy pokonał strach, podszedł do dziury i cieniutkim głosikiem powiedział „Hop hop, nic mamusi nie jest?” Wtedy ta zionęła ogniem w jego stronę, przypalając mu brodę, Bjorn strasznie się zezłościł, bo bardzo kochał swoją rudą brodę i strzelił pieprzem w jej oczy.

**Zadanie 3**

1. Napisz procedurę o nazwie "eliksir_sily", która będzie podnosiła wartość pola `udzwig` z tabeli `kreatura` o 20% na podstawie `id_kreatury` przekazywanego jako parametr.
2. Napisz funkcję, która będzie pobierała tekst i zwracała go z wielkich liter.

### Salwa śmiechu

Teściowa na chwilę oślepła po celnym strzale Bjorna. Wykorzystał on okazję, wskoczył do
staruszki i zaczął ja gilgotać w stopy piórkiem drozda. Nie wytrzymując ze śmiechu, zaczęła się trząść jak galareta i kazać mu przestać. Bjorn odpowiedział, jej „Przestanę, jak obiecasz mi, że już nigdy nie tkniesz mojego bigosu”. Teściowa nie mając innego wyboru, od razu zgodziła się.

**Zadanie 4**

1. Stwórz tabelę "system_alarmowy" z polami `id_alarmu`, `wiadomosc`.
2. Dodaj wyzwalacz, który będzie sprawdzał czy w tabeli wyprawy pojawiła się misja, w której
bierze udział teściowa oraz czy jednym z sektorów misji jest domek dziadka. Jeżeli powyższy warunek zaistnieje wyzwalacz wstawi rekord do tabeli "system_alarmowy" z treścią "Teściowa
nadchodzi !!!".

### Happy End

Zaniepokojeni ciszą Staruszek z ptakiem wybiegli ze swojej kryjówki, aby zobaczyć co się
dzieje. Gdy Drozd zobaczył ich razem uśmiechnął się i powiedział: „ A morał z tej bajki jest krótki i niektórym znany: gdy teściowa swój nos wtyka, tylko bigos jej usta zamyka!”

**Zadanie 5**

1. Napisz procedurę mającą jako parametry wyjściowe średnią, sumę i maks udźwigu z tabeli
`kreatura`.
2. Napisz procedurę, która jako parametr wejściowy przyjmuje `id_wyprawy` a na wyjściu numer
sektora (np. A1, B3 itd.) oraz nazwę sektora posortowaną według kolejności w jakiej występują w danej wyprawie.

__Podpowiedź__

LOOP, CONCAT, UNION
