# Bazy danych, informatyka, studia stacjonarne 2024/2025

## Zadania powtórzeniowe, część 1

Baza danych, na której należy wykonać zadania to baza o nazwie `__firma_zti`, której schemat znajduje się [w tym pliku](schemat_firma.png).

**Zadania 1.1**

1. Z tabeli `pracownik` wyświetl nazwiska posortowane alfabetycznie od A do Z.
2. Z tabeli `pracownik` wyświetl imie, nazwisko, pensję dla pracowników urodzonych po roku 1979.
3. Z tabeli `pracownik` wyświetl wszystkie informacje dla pracowników z pensją pomiędzy 3500 a 5000 (z włączeniem tych wartości).
4. Z tabeli `stan_magazynowy` wyświetl towary, których ilość jest większa niż 10.
5. Z tabeli `towar` wyświetl wszystkie towary, których nazwa zaczyna się od A, B lub C.
6. Z tabeli `klient` wyświetl wszystkich klientów indywidualnych (nie firmy).
7. Z tabeli `zamowienie` wyświetl 10 najnowszych zamówień.
8. Z tabeli `pracownik` wyświetl 5 najmniej zarabiających pracowników.
9. Z tabeli `towar` wyświetl 10 najdroższych towarów, których nazwa nie zawiera litery 'a'.
10. Z tabeli `towar` wyświetl towar, których jednostka miary to 'szt', posortuj po nazwie (ad A do Z) następnie po cenie zakupu malejąco.
11. Stwórz nową tabelę o nazwie `towary_powyzej_100`, do której wstaw towary, których cena jest większa równa 100. Użyj `CREATE ... SELECT`.
12. Stwórz nową tabelę o nazwie `pracownik_50_plus` na podstawie tabeli pracownik z wykorzystaniem `LIKE`. Wstaw do tej tabeli wszystkie rekordy z tabeli `pracownik` gdzie wiek pracownika jest większy równy 50 lat.


**Zadania 1.2**

1. Wyświetl `imie`, `nazwisko` i `nazwę działu` każdego pracownika.
2. Wyświetl `nazwę towaru`, `nazwę kategorii` oraz `ilość towaru` i posortuj dane po kolumnie `ilość` malejąco.
3. Wyświetl wszystkie anulowane zamówienia.
4. Wyświetl wszystkich klientów, których adres podstawowy znajduje się w miejscowości Olsztyn.
5. Wyświetl wszystkie nazwy jednostek miary, które nie zostały nigdy wykorzystane w tabeli `stan_magazynowy`.
6. Wyświetl `numer zamówienia`, `nazwę towaru`, `ilosc` i `cenę` dla zamówień złożonych w 2018 roku.
7. Stwórz nową tabelę o nazwie `towary_full_info`, w której znajdą się kolumny `nazwa_towaru`, `cena_zakupu`, `kategoria(tylko nazwa)`, `ilosc` , `jednostka miary(nazwa)`.
8. Wyświetl pozycje zamówień dla 5 najstarszych zamówień.
9. Wyświetl wszystkie zamówienia, które mają status inny niż `zrealizowane`.
10. Wyświetl wszystkie adresy, których kod pocztowy został niepoprawnie zapisany (czyli niezgodnie ze wzorcem `LL-LLL`, gdzie `L` to dowolna cyfra od 0 do 9).

Rozwiązania zapisz w swoich repozytorium GitHub.