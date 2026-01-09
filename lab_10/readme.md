# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Tworzenie wyzwalaczy, procedur i funkcji.

> Zadania należy wykonać na swojej bazie imiennej. W razie potrzeby przekopiuj brakujące tabele z bazy company_2025.


### 1. Ogólna postać wyzwalacza oraz przykładowa deklaracja wyzwalacza w bazie MySQL.

> Oficjalna dokumentacja MySQL odnośnie wyzwalaczy: https://dev.mysql.com/doc/refman/8.4/en/trigger-syntax.html


Ogólna postać wyzwalacza.
```sql
CREATE TRIGGER nazwa_triggera [ BEFORE / AFTER ]  [ INSERT / UPDATE / DELETE ]
ON nazwa_tabeli [FOR EACH ROW]
BEGIN
    kod wywoływany w ramach triggera
END;
```

Przykładowy wyzwalacz.

```sql
DELIMITER //
CREATE TRIGGER product_after_insert AFTER INSERT
ON PRODUCT 
FOR EACH ROW
BEGIN
    INSERT INTO product_archive VALUES (null, OLD.PRODUCT_ID, OLD.PRODUCT_NAME, OLD.PURCHASE_PRICE);
END //
DELIMITER ;
```

Po wykonaniu powyższego kodu w bazie zostanie osadzony wyzwalacz o nazwie `product_after_insert` (autor wykorzystuje zazwyczaj taką konwencję nazw wyzwalaczy), który nasłuchuje zdarzenia `DELETE` na tabeli `PRODUCT` i **po** pomyślnym wykonaniu usunięcia wykona polecenie `INSERT INTO ...` dla każdego usuniętego wiersza (gdyż jest `FOR EACH ROW`, ale może to być pojedyncze wywołanie ciała wyzwalacza w przypadku jego braku). Tabela `product_archive` musi istnieć. 

W kodzie wyzwalacza widzimy również odwołanie do aliasu `OLD`, który jest jedną z dwóch przestrzeni wartości dostępnej w ramach wyzwalaczy:
* `OLD` - dane usuwane, nadpisywane (`DELETE`,`UPDATE`)
* `NEW` - dane wstawiane (`INSERT`, `UPDATE`)

Wyrażenie `DELIMITER \\`, które pojawia się przed poleceniem `CREATE ...` nie jest elementem związanym typowo z wyzwalaczami, ale jest częścią specyfikacji SQL. Pozwala to na zmianę aktualnie obowiązującego ogranicznika między kolejnymi zapytaniami SQL. Domyślnie jest to znak `;`, ale ten może się pojawić wewnątrz bardziej złożonych struktur, właśnie takich jak wyzwalacze, procedury oraz funkcje, co spowodowałoby wykonanie kodu przed faktycznym końcem ich deklaracji. Ogranicznik `//` nie jest częścią specyfikacji i może być to niemal dowolna kombinacja znaków, ale powinniśmy unikać znaku backslash (`\`), który jak w wielu innych miejscach jest w SQL wykorzystywany jako tzw. znak ucieczki (ang. escape sign) i ma swoje specjalne działanie. Najcześciej spotykane są właśnie `//` oraz `$$`, które nie pojawiają się zazwyczaj w samych zapytaniach.

### 2. Zgłaszanie wyjątków

W momencie, w którym w kodzie wyzwalacza, procedury czy funkcji pojawi się sytuacja określana jako wyjątek z koniecznością jego zgłoszenia i często przerwania dalszego wykonania kodu. Może to być np. chęć zatrzymania wykonania polecenia SQL, które w normalnych warunkach zostałoby wykonane po uruchomieniu wyzwalacza. Możemy w ten sposób dla wyzwalaczy uruchamianych przed (`BEFORE`) wykonaniem akcji zapobiec wykonaniu zapytania w przypadku pojawienia się określonych warunków.

> Dokumentacja sposobu zgłaszania własnych wyjątków: 
> https://dev.mysql.com/doc/refman/8.4/en/signal.html

Przykładowe wykorzystanie `SQLSTATE SIGNAL` z wyjątkiem definiowanym przez użytkownika. Jak zapewne już student zauważył, błędy które są zgłaszane przez system posiadają numery oraz komunikat o błędzie. Przestrzeń dostęnych numerów błędów zarezerwowana dla użytkowników w systemie MySQL rozpoczyna się od kodu 45000. Poniżej przykład takie deklaracji w ciele wyzwalacza.

```sql
delimiter $$
create trigger foo before insert on postac
for each row
begin
if new.wiek <= 0 then
signal sqlstate '45000'
	SET MESSAGE_TEXT = 'Wiek musi być większy niż 0!';
end if;
end;$$
```

Wywołanie takiego wyzwalacza w przypadku próby wstawienia rekordu do tabeli `postac` z polem `wiek <= 0` spowoduje zgłoszenie wyjątku i przerwanie wykonania wyzwalacza oraz brak wywołania samego zapytania `INSERT`.

### 3. Deklaracja i odwołanie do zmiennych

> Dokumentacja: 
> * https://dev.mysql.com/doc/refman/8.4/en/local-variable-scope.html
> * https://www.tutorialspoint.com/mysql/mysql-variables.htm

Przykładowa deklaracja i odwołanie do zmiennej w zapytaniu, również w ciele wyzwalacza, procedury lub funkcji, ale bez użycia dyrektywy `DECLARE` (te pozostawiam do analizy z podlinkowanej dokumentacji).

```sql
# deklaracja (lub nadpisanie istniejącej zmiennej)
SET @amount = NULL;
# pobranie wartości zmiennej
select @amount;

# deklaracja oraz ustawienie wartości dla zmiennej w zapytaniu SELECT
select @amount := AMOUNT from INVENTORY where PRODUCT_ID = 1;
@ odwołanie do zmiennej poza zapytaniem (jest to tzw. zmienna sesyjna)
select @amount;
```

### 4. Procedury

Ogólna postać procedury w systemie MySQL wygląda następująco:
```sql
DELIMITER //
CREATE PROCEDURE procedure_name([IN|OUT|INOUT] nazwa_aparametru typ_danych_parametru)
BEGIN
    -- instrukcje sterujące + SQL do wykonania
END //
DELIMITER;
```

Przykładowe procedury:
```sql
DELIMITER $$
CREATE PROCEDURE premia(IN id int)
BEGIN
Update pracownik set pensja = 1.2 * pensja where id_pracownika = id;
END
$$
DELIMITER ;
Następnie procedurę wywołujemy poprzez instrukcję CALL.

CALL premia(10)
```

W powyższym przypadku procedura posiada tylko parametr wejściowy, ale procedura może również zwracać wartość poprzez określenie parametru wyjściowego - `OUT`.

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

**Transakcje w procedurach**

W przypadku procedur warto chociaż wspomnieć iż umożliwiają obsługę transakcji, które są bardzo ważnym elementem wielu rozwiązań software'owych. Transakcje są blokiem, w którym operacje są wykonywane w pewnej izolacji od innych operacji oraz danych, które w danym systemie bazy danych istnieją. Mogą one również powodować zakleszczenia poprzez nieprawidłowe wykorzystanie blokad (odczytu i zapisu) dla danych zasobów (tabele, rekordy). Zaawansowane aspekty transakcji nie zostaną tutaj poruszone, skupimy się na dość prostym przykładzie.

W przypadku transakcji możliwe jest zatwierdzenie zmian, które zostały przez nią dokonane (`COMMIT`) lub ich wycofanie (`ROLLBACK`), jeżeli coś poszło nie tak jak zakładano (lub został zdefiniowany wyjątek, który ma takie wycofanie wywołać).

Transakcję rozpoczynamy poprzez dyrektywę `START TRANSACTION`. Poniżej prosty przykład oraz sposób weryfikacji poprawności działania całego mechanizmu transakcji (w domyślnej trybie jej działania).

```sql
-- kopiujemy tabelę z bazy z zajęć do swojej bazy (o ile nie zostało to jeszcze wykonane)
create table PRODUCT as select * from company_2025.PRODUCT;

-- sprawdzamy cenę zakupu produktu o ID = 1
select * from PRODUCT where PRODUCT_ID = 1;

-- powinna ona wynosić 2500

-- rozpoczynamy transakcję
START TRANSACTION;

-- wykonujemy przykładowe polecenie SQL
UPDATE PRODUCT SET PURCHASE_PRICE = 3000 WHERE PRODUCT_ID = 1;

-- ponownie sprawdzamy cenę zakupu produktu o ID = 1
select * from PRODUCT where PRODUCT_ID = 1;
-- teraz powinno być 3000

-- jeżeli w tym momencie zalogujemy się w nowej sesji (np. poprzez putty)
-- do tego samego konta i odytamy tabelę o ten sam produkt to cena
-- pozostanie bez zmian czyli wyniesie 2500.
-- Dzieje się tak dlatego, że póki nie zostanie wywołana operacji COMMIT
-- lub ROLLBACK dane nie są propagowane dla innych sesji (więc użytkowników też)

-- wycofanie zmian
ROLLBACK;

-- ponownie sprawdzamy cenę zakupu produktu o ID = 1
select * from PRODUCT where PRODUCT_ID = 1;

-- cena wróciła do wartości oryginalnej w tej sesji
```

transakcje są wykorzystywane najczęściej w sytuacjach, gdzie konieczne jest wykonanie wielu operacji wzajemnie od siebie zależnych, a niepowodzenie jednej z nich powinno skutkować wycofaniem wszystkich dotychczasowych etapów tej transakcji. Jednem z najczęściej podawanych przykładów jest transakcja bankowa, która wymaga spełnienia kilku warunków jednocześnie (zdjęcie środków z jednego konta, transfer na inne konto) i zapewnienie spójności systemu (np. stanu kont).

### 5. Funkcje

> Dokumentacja: https://dev.mysql.com/doc/refman/8.4/en/create-procedure.html
Ogólna postać funkcji (za dokumentacją):


```sql

CREATE
    [DEFINER = user]
    PROCEDURE [IF NOT EXISTS] sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

CREATE
    [DEFINER = user]
    FUNCTION [IF NOT EXISTS] sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

func_parameter:
    param_name type

type:
    Any valid MySQL data type

characteristic: {
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
}

routine_body:
    SQL routine
```

Przykładowa funkcja.

```sql
DELIMITER //
CREATE FUNCTION count_pracownicy()
    RETURNS INTEGER
BEGIN
    DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM pracownik;
    RETURN @ile;
END //

-- wywołanie funkcji (tak jak dotychczas)
select count_pracownicy();
```

Funkcje mają dużo ograniczeń względem procedur składowanych, a jedną z nich jest brak możliwości wykorzystania transakcji. Funkcje również zwracają tylko jedną wartość i to określonego w ciele funkcji typu, a procedura może zwracać np. wynik zapytania typu `SELECT`.

### Zadanie 1

Stwórz wyzwalacz, który do nowo utworzonej tabeli z polami:
- `ORDER_NUMBER` - tak jak w tabeli `ORDER`
- `CHANGE_DATE` - data i czas
- `NEW_STATUS_NAME` - nazwa statusu z tabeli `STATUS_NAME`

będzie wstawiał rekord dla każdej zmiany statusu w tabeli `ORDER`.
Przetestuj działanie i dołącz do rozwiązania zarówno kod wyzwalacza, nowej tabeli oraz kodu testującego działanie wyzwalacza.

### Zadanie 2

Stwórz wyzwalacz, który będzie uruchamiany w przypadku dodawania nowej pozycji zamówienia, a który będzie sprawdzał czy dodawany do pozycji produkt w danej ilości występuje w tabeli `INVENTORY`. Jeżeli nie, wstawienie takiego rekordu nie powinno być wykonane.

### Zadanie 3

Stwórz procedurę o nazwie `product_find_by_phrase`, która wyszukuje w tabeli `PRODUCT` wszystkie produkty zawierające w nazwie oraz opisie zadaną frazę. Ta fraza jest parametrem tej procedury. Zwracaj wszystkie pasujące rekordy z tabeli.

### Zadadnie 4

Napisz funkcję o nazwie `income_for_month`, która przyjmuje parametry: `YEAR`, `MONTH`. Ta funkcja zwraca wartość typu `DECIMAL` i jest nią suma przychodów (suma pozycji wszystkich zamówień zrealizowanych w danym miesiącu) lub 0.00 jeżeli takich zamówień nie ma (sprawdź czy potrzebne są dodatkowe warunki w ciele funkcji, czy też można to osiągnąć samym zapytaniem SQL).

### Zadanie 5

Stwórz procedurę, która wykorzystując transakcję będzie wstawiała do tabel `ORDER_ARCHIVE` oraz `ORDER_POSITION_ARCHIVE` (należy je utworzyć na wzór tabel `ORDER` oraz `ORDER_POSITION`) rekordy odpowiednio z tabel `ORDER` oraz `ORDER_POSITION` przed operacją ich usuwania (do wywołania tej procedury należy stworzyć odpowiedni wyzwalacz).
Do tych tabel nie wstawiamy oryginalnych kluczy obcych, ale te, które zostaną utworzone w trakcie operacji `INSERT` z procedury (po dodaniu rekordu najpierw do `ORDER_ARCHIVE` taki `ORDER_ID` otrzymamy, który zostanie wykorzystany dla rekordów do `ORDER_POSITION_ARCHIVE`). Wykorzystaj (w tej samej transakcji) `SELECT LAST_INSERT_ID();` do pobrania najnowszej wartości klucza głównego wstawionego do tabeli.