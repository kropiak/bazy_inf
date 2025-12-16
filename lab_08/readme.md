# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Funkcje tekstowe, daty i czasu MySQL

### Zadanie 1
1. Pełna nazwa klienta, nazwa ulicy, liczbę znaków i pierwsze 5 znaków z nazwy ulicy.
2. Skrócona nazwa klienta i nazwa typu adresu (z uwzględnieniem klientów bez przypisanego typu adresu).
3. Nazwa produktu, nazwa kategorii, pierwsze trzy znaki nazwy produktu.
4. Nazwy produktów i opisy tych, które zostały sprzedane.

---
### Zadanie 2
1. Nazwa klienta, numer i data zamówienia oraz dni które upłynęły od daty zamówienia.
2. Dla wszystkich zamówień które nie mają statusu `Zwrocone` albo `Zamkniete`.  Oblicz i wyświetl termin płatności który wynosi 14 dni od daty zamówienia. 
3. Imię, nazwisko, data zatrudnienia, dzień tygodnia i nazwa działu (również pracownicy bez działu).
4. Różnica dni pomiędzy najwcześniejszym, a najpóźniejszym zamówieniem klienta, także dla klientów bez zamówień.

**Podpowiedź**  
> Opis funkcji daty i czasu możesz znaleźć np. tu: https://www.w3resource.com/mysql/date-and-time-functions/date-and-time-functions.php

1. Możesz wykorzystać funkcję `DATEDIFF`.
2. Możesz wykorzystać funkcję `DATE_ADD` (to samo co `ADDDATE`).
---
### Zadanie 3

1. Skrócona nazwa klienta oraz lista adresów oddzielona przecinkami.
2. Miasta i unikalne dwuznakowe prefixy kodów pocztowych (pierwsze 2 znaki) po przecinku w jednej kolumnie. 
3. Wyświetl dla każdego pracownika połączone nazwisko i imię  dodatkowo dział oraz  liczbę dnia od zatrudnienia.
4. Dla każdego klienta wyświetl dwie kolumny:
-  Pierwsza kolumna zawiera pełną nazwę klienta oraz nazwę skróconą po myślniku (np. "Food Market SA' - FoodMarket"),
-  Druga kolumna zawiera listę trzech ostatnich cyfr wszystkich numerów zamówień, które złożył klient, oddzielonych przecinkami, w formacie (np. "003, 005, 123").
1. Dla każdego pracownika stwórz i wyświetl hasło, które będzie składać się z 
- pierwszych 3 liter imienia (małymi literami),
- a następnie ostatnich 4 znaków nazwiska (wielkimi literami),
- a na koniec suma długości imienia i nazwy jego ulicy (liczba znaków).

Hasło powinno wyglądać np. tak  **`abcWXYZ7`**, gdzie **`abc`** to trzy pierwsze litery imienia małymi literami, **`WXYZ`** to ostatnie cztery litery nazwiska wielkimi literami, a **`7`** to suma długości imienia i nazwy jego ulicy.

---
### Zadanie 4

1. Wykorzystując funkcję `DATE_FORMAT` ([dokumentacja](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format)) wyświetl datę sprzedaży zamówienia w postaci:
* `dzień-miesiąc-rok`,
* `rok - tydzień roku`,
* `rok - dzień roku`,
* `angielska nazwa miesiąca/dzień/rok`.
2. Przygotuj zapytanie SQL, które odpowie na pytanie: W którym tygodniu 2025 roku złożono zamówienia o największej łącznej wartości?
