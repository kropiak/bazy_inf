# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Złączanie tabel, podzapytania oraz wybrane funkcje wbudowane MySQL

### Zadanie 1

1. Wyświetl dane klientów, którzy nie złożyli żadnego zamówienia. Wykonaj zadanie na dwa sposoby - patrz podpowiedź.
2. Wyświetl nazwy jednostek miary (`UNIT_NAME`), które nie zostały wykorzystane w tabeli `INVENTORY`. Wykorzystaj do tego celu `RIGHT JOIN`.
3. Wylicz średnią różnicę między ceną zakupu a ceną sprzedaży każdego sprzedanego produktu i wyświetl nazwy tych produktów oraz tę wyliczoną różnicę. Dane posortuj po różnicy malejąco.


**Podpowiedź:**  
* Pkt.1 - Wykorzystaj `LEFT JOIN` lub `NOT IN` z podzapytaniem.
* Pkt.2 - Kolejność tabel przy  `RIGHT JOIN` i `LEFT JOIN` ma znaczenie.
* Pkt.3 - Grupowanie + agregacja.

---
### Zadanie 2

1. Wyświetl unikalną listę nazw departamentów, w których pracują pracownicy, którzy wystawili zamówienia.
2. Zsumuj wartość zamówień dla każdego departamentu. Wyświetlaj dane w postaci nazwy departamentu oraz łącznej wartości zamówień.
3. Do zadania numer 2 (jako drugą kolumnę) dodaj jeszcze podsumę dla każdego statusu (wyświetlaj jego nazwę, a nie identyfikator).

**Podpowiedź:**
* Pkt. 1 - Wykorzystaj wyrażenie `DISTINCT`.
* Pkt. 2 - wykorzystaj `GROUP BY`.
* Pkt. 3 - wykorzystaj `GROUP BY` z kilkoma kolumnami.
---
### Zadanie 3

1. Wykorzystując wbudowaną funkcję `CONCAT` wyświetl pełne nazwy produktów w formacie: `Nazwa produktu (Opis produktu)`. Patrz przykładowe wyniki poniżej.
2. Wykorzystując wbudowaną funkcję `CONCAT_WS` wyświetl wszystkie kolumny z tabeli `PRODUCT` oddzielając wartości przecinkiem.
3. Wykorzystując wbudowaną funkcję `CONCAT` oraz `GROUP_CONCAT` wyświetl dla każdego działu listę pracowników (imię i nazwisko) pracujących w danym dziale.
4. Wykorzystując wbudowaną funkcję `GROUP_CONCAT` wyświetl nazwę kategorii, a w kolejnej kolumnie listę nazw produktów z tej kategorii, które nigdy nie były sprzedane.

**Przykładowe wyniki dla pkt. 1:**
```csv
Laptop HP (Laptop 15 cali z dyskiem SSD 512GB)
Monitor Samsung (Monitor 24" LED)
Papier A4 (Recznik papierowy do drukarki)
Cukier 1kg (Cukier bialy)
...
```
---

### Zadanie 4

1. Wyświetl numer zamówienia oraz w kolejnej kolumnie tekst `Zakończone`, jeśli status zamówienia to `3,4,7 lub 10`, w przeciwnym wypadku wyświetlaj tekst `Inny`.
2. Wyświetl nazwę produktu, a w następnej kolumnie o nazwię `dostepnosc` wyświetl tekst w zależności od ilości dostępnej w magazynie (`INVENTORY.AMOUNT`):
   * `Brak` - jeśli ilość jest równa 0
   * `Mała ilość` - jeśli ilość jest większa niż 0, ale mniejsza niż 10
   * `Średnia ilość` - jeśli ilość jest większa niż 9, ale mniejsza lub równa 30
   * `Duża ilość` - jeśli ilość jest większa niż 30
3. Wykorzystując funkcję `IFNULL` wyświetl wartość z kolumny `TAX_IDENTIFIER` z tabeli `CLIENT` jeżeli nie jest pusta lub tekst `Klient indywidualny` w przeciwnym wypadku.

**Podpowiedź:**
* Pkt. 1 - Wykorzystaj funkcję `IF` (https://www.w3resource.com/mysql/control-flow-functions/if-function.php).
* Pkt. 2 - Wykorzystaj funkcję `CASE` (https://www.w3resource.com/mysql/control-flow-functions/case-operator.php).

---

### Zadanie 5

1. Wyświetl wartość z kolumny `CITY`, a następnie w kolejnej kolumnie 2 pierwsze znaki z kolumny `POSTAL_CODE` w tabeli `CLIENT_ADDRESS`.
2. Wykorzystując zapytanie z zadania 1, wyświetl nazwę miasta, a następnie w kolejnej kolumnie unikalne 2 pierwsze znaki z kodów dla tego miasta (patrz podpowiedź).
3. Wykorzystując dowolne funkcje tekstowe wyświetl tylko nazwę ulicy bez początkowego `ul.` lub `al.`oraz końcowego numeru w tabeli `CLIENT_ADDRESS`.


**Podpowiedź:**
* Pkt. 1 - Wykorzystaj funkcję `SUBSTR`.
* Pkt. 2 - Wykorzystaj funkcję `GROUP_CONCAT` wraz z `DISTINCT` oraz `SUBSTR`. Tylko dla miasta `Warszawa` będzie więcej niż jedna unikalna wartość.
* Pkt. 3 - Lista, opis i przykłady funkcji tekstowych MySQL (patrz panel po lewej): . https://www.w3resource.com/mysql/string-functions/mysql-ascii-function.php
Przykładowy wynik dla pkt. 3:
```csv
 Brzoskwiniowa
 Brzozowa
 Cicha
 Debowa
 Dluga
 Dworcowa
 Dzikiej Rozy
 Grabowa
 Jagodowa
 Jana Pawla II
```