# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Praca z kluczami głównymi i obcymi  
### Wstawianie, aktualizacja i usuwanie danych z tabeli 

---

### Zadanie 1

1. Usuń klucze obce, które wskazują na `pracownik.id_pracownika` (w tabelach `zadanie` i `projekt`).
2. Usuń klucz główny z tabeli `pracownik`.
3. Dodaj ponownie klucz główny na kolumnie `id_pracownika`. 
4. Odtwórz usunięte wcześniej klucze obce:
   - `ON DELETE SET NULL` w tabeli `zadanie`,
   - bez kaskadowego usuwania w tabeli `projekt`.

---

### Zadanie 2

1. Dodaj do tabeli `zadanie` nową kolumnę `godziny_szacowane INTEGER` z domyślną wartością `8`.
2. Ustaw różne wartości `godziny_szacowane` dla istniejących zadań (np. `4`, `12`, `16`).
3. Zmień domyślną wartość kolumny `godziny_szacowane` z `8` na `6`.
4. Wstaw nowe zadanie (dowolne dane) i pokaż, że bez podania `godziny_szacowane` przyjmuje teraz wartość `6`, następnie usuń to zadanie.

---

### Zadanie 3

1. Dodaj do `projekt` kolumnę `opis_projektu` – ciąg znaków, max. `50` znaków (może być `NULL`).
2. Zmień typ tej kolumny na ciąg znaków, max. `200` znaków (rozszerzenie długości).
3. Zaktualizuj kilka projektów, ustawiając w `opis_projektu` krótkie opisy (np. „MVP”, „pilne wdrożenie”).
4. Usuń kolumnę `opis_projektu` z tabeli `projekt`.

---

### Zadanie 4

1. Usuń klucz obcy `zadanie.projekt` wskazujący na `projekt.id_projektu`.
2. Dodaj ponownie klucz obcy `zadanie.projekt` → `projekt(id_projektu)` z opcją `ON DELETE SET NULL`.
3. Usuń jeden wybrany projekt z tabeli `projekt`.
4. Sprawdź (np. za pomocą `SELECT`), że zadania, które należały do usuniętego projektu, mają teraz w kolumnie `projekt` wartość `NULL`.
