Lekcja 2

zadanie 1
pkt.a

DELETE FROM postac WHERE rodzaj='wiking' AND nazwa<>'Bjorn' ORDER BY data_ur ASC LIMIT 2;

#wyjaśnienie
W klauzuli WHERE możemy złączać wiele warunków za pomocą koniunkcji logicznej AND lub dodawać alternatywne warunki za pomocą klauzuli OR.

Operator '<>' oznacza różne od. Można użyć również != czyli zanegowania równości.

Klauzula ORDER BY służy do sortowania wyników zapytanie według wybranej kolumny oraz kierunku. ASC oznacza rosnąco (liczby lub alfabetycznie), DESC - malejąco. Możemy sortować po wielu kolumnach, np. ... ORDER BY data_ur ASC, nazwa DESC;.

Klauzula LIMIT służy do ograniczania ilość rekordów zapytania. Podanie jednej wartości, np. LIMIT 2 powoduje wyświetlenie 2-óch pierwszych rekordów, a polecenie LIMIT 2,3 wyświetli 3 rekordy poczynając od rekordu o indeksie 2 (pamiętajmy, że indeksowanie rozpoczyna się od wartości 0). Czyli w tym przypadku zostanie wyświetlony 3,4 oraz 5 rekord.

pkt.b

# usuwanie klucza obcego
ALTER TABLE ... DROP FOREIGN KEY nazwa_klucza.
# nazwa_klucza to wartość CONSTRAINT, którą możemy uzyskać np. wyświetlając SQL dla danej tabeli poleceniem show create table tabela;

# usuwanie klucza głównego
ALTER TABLE ... DROP PRIMARY KEY;
# tutaj może pojawić się komunikat o braku możliwości wykonania takiej operacji ze względu na atrybut auto_increment. Jeżeli kolumna posiada taki atrybut to musi być to kolumna PRIMARY KEY. W takim przypadku najpierw należy zmenić definicję tej kolumny poprzez ALTER TABLE ... tak aby pozbyć się auto_increment. DOpiero wtedy można usunąć klucz główny.


Zadanie 2.
pkt.a
Typ INT w MySQL nie jest w stanie przechować liczby składającej się 11 cyfr. Poczytaj w internecie lub z materiałów wykładowych o maksymalnych wartościach dla typu znakowego i bez znaku.
W tym przypadku trzeba zastosować typ varchar(11), CHAR(11) lub typ liczbowy o większych możliwościach taki jak BIGINT.

Dodanie kolumny do tabeli, w której dane już istnieją powoduje, że ta kolumna musi być jakimiś danymi uzupełniona. Będą to wartości domyślne dla danego typu a co za tym idzie takie same dla każdego rekordu. Taka kolumna, zawierająca duplikaty wartości, nie może być ustawiona jako PRIMARY KEY. Trzeba najpierw doprowadzić do ustawienia wartości unikalnych w ramach tej kolumny.

pkt.b
ALTER TABLE ... ALTER COLUMN ...
ALTER TABLE ... MODIFY COLUMN ...
# do dalszego doczytania, który sposób będzie mniej pracochłonny.

pkt.c
INSERT INTO...

Zadanie 3
pkt. a
Tutaj mamy do czynienia z dopasowanie do wyrażenia regularnego. W tym przypadku możemy się posłużyć formą uproszczoną dostępną z klauzulą LIKE. Znak '%' zastępuje dowolny ciąg dowolnej długości.
SELECT * FROM postac WHERE nazwa LIKE '%a%';

pkt.b
UPDATE statek SET ladownosc=ladownosc*0.7 WHERE
i tu mamy co najmniej 2 możliwości
data_wodowania > 'data start' AND data_wodowania < 'data_end'

lub 
data_wodowania BETWEEN 'data_start' AND 'data_end';

pkt.c
Tutaj trzeba doczytać o klauzuli CHECK, która może sprawdzać poprawność wprowadznych wartości. Ciekawostką jest to, że mimo iż poprawnie zdefiniowane polecenie w MySQL zwróci 'Query OK' to i tak nie będzie działało. W innych silnikach baz danych działa. Tę rolę w MySQL mogą przejąć wyzwalacze (ang. TRIGGER), które zostaną wprowadzone w kolejnych ćwiczeniach.

Zadanie 4

pkt.a
INSERT INTO...

pkt.b
Mamy 2 możliwości.
1. CREATE TABLE marynarz SELECT * FROM postac;
Tworzy nową tabelę o nazwie marynarz o strukturze tabeli postac (ale bez kluczy) i wstawia do niej dane wybrane poleceniem SELECT.

2. CREATE TABLE marynarz LIKE postac;
Tworzy nową tabelę marynarz o strukturze tabeli postac z kluczami, ale bez danych.
Dane można wstawić do tabeli poleceniem
INSERT INTO marynarz SELECT ... FROM postac;

Dodatkowo mamy tutaj sprawdzenie czy wartość kolumny jest równa/różna NULL co robi się za pomocą porównania logicznego (czyli zwracającego jedną z dwóch możliwych wartości - PRAWDA lub FAŁSZ).
Możemy to zrobić poleceniem
... WHERE statek IS NOT NULL lub statek IS NULL.

pkt. c
Tutaj obowiązują zasady, które zostały opisane wcześniej (unikalne wartości w kolumnie dla kluczy głównych, zgodność typów kolumn dla kluczy obcych).
Dodawanie kluczy głównych i obcych odbywa się poprzez polecenie ALTER TABLE marynarz ADD PRIMARY KEY(kolumna) lub ALTER TABLE marynarz ADD [CONSTRAINT nazwa_klucza] FOREIGN KEY(kolumna) REFERENCES tabela(kolumna) [ON DELETE ...];

Zadanie 5

a)
UPDATE postac set statek = NULL;
b)
DELETE FROM postac WHERE ... ;
c)
DELETE FROM statek;
można też
TRUNCATE statek ; # tutaj wyzerowana zostanie również ewentualna wartość auto_increment
d)
DROP table statek;
e)
CREATE TABLE zwierz (id int primary key auto_increment,
nazwa varchar(50), wiek int);
f)
INSERT INTO zwierz SELECT id_kreatury, nazwa, wiek FROM kreatura where rodzaj IN ('syrena','malpa','ptak','waz');















