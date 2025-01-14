# Bazy danych, informatyka, studia stacjonarne 2024/2025

## Zadania powtórzeniowe, część 3

**Zadanie 1**

Utwórz tabelę `student` z następującymi polami:
  * `id_studenta` - liczba całkowita nieujemna, klucz główny, auto numeracja,
  * `imie` - łańcuch znaków, długość max 100, wymagany
  * `nazwisko` - łańcuch znaków, długość max 100, wymagany
  * `rok_studiow` - wartość numeryczna nieujemna,
  * `data_urodzenia` - typ daty.


**Zadanie 2**

Utwórz tabelę o nazwie `kierunek` z polami:
* `id_kierunku` - liczba całkowita nieujemna, klucz główny, auto numeracja,
* `nazwa_kierunku` - łańcuch znaków, max. 200 znaków, niepuste.

**Zadanie 3**

Utwórz tabelę o nazwie `student_na_kierunku` z polami:
* `student` - klucz obcy do tabeli student, część klucza głównego
* `kierunek` - klucz obcy do tabeli kierunek, część klucza głównego

**Zadanie 4**

Utwórz tabelę `przedmiot` z polami:
* `id_przedmiotu`, numeryczne, klucz główny, automatyczna inkrementacja
* `nazwa_przedmiotu`, łańcuch znaków, max. 200 znaków, wymagane
* `opis`, długi tekst, opcjonalne

**Zadanie 5**

Utwórz tabelę o nazwie `kierunek_has_przedmioty` z polami:
* `kierunek`, klucz obcy do tabeli kierunek, wymagane, część klucza głównego,
* `przedmiot`, klucz obcy do tabeli przedmiot, wymagane, część klucz głównego,
* `obowiazkowy`, wartość logiczna, domyślnie 1 (prawda),

**Zadanie 6**

Dodaj dane do tabel w następującej ilości:
* tabela `student` - 4 rekordy,
* tabela `kierunek` - 2 rekordy,
* tabela `student_na_kierunku` - przypisz wszystkich studentów do jakiegoś kierunku,
* tabela `przedmiot` - 4 rekordy, przynajmniej jeden przedmiot nieobowiązkowy,
* tabela `kierunek_has_przedmioty` - przypisz wszystkie przedmioty do dowolnych kierunków,

**Zadanie 7**

Zmień typ kolumny `opis` w tabeli `przedmiot` na VARCHAR oraz ustaw wartość domyślną dla tej kolumny na `Brak opisu`.

**Zadanie 8**

 W tabeli `student` dodaj nową kolumnę o nazwie `indeks` i ustaw ją jako klucz główny. Tu będzie konieczne wykonanie kilku operacji w określonej kolejności.

**Zadanie 9**

Do tabeli `kierunek_has_przedmioty` dodaj nowe kolumny:
* `semestr`, typ tekstowy, pole wymagane i wstaw dane w formacie np. 2024Z, 2024L, itp.,
* `rok_studiow` - numeryczne, nieujemne, wymagane, uzupełnij danymi

**Zadanie 10**

Napisz zapytanie wybierające, które wyświetli indeks studenta, jego imię i nazwisko, nazwę kierunku studiów, semestr oraz nazwę przedmiotu.
