# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Funkcje okienkowe


## Zadanie 1  
Stwórz ranking pracowników oparty na wysokości pensji (pensja). Jeśli dwie osoby mają tę samą pensję, mają ten sam numer rankingu (użyj funkcji `RANK()`).

## Zadanie 2  
Dodaj kolumnę pokazującą całkowitą sumę pensji wszystkich pracowników bez grupowania (funkcja `SUM() OVER ()`).

## Zadanie 3  
Dla każdego pracownika wyświetl: nazwisko, nazwę produktu, skumulowaną wartość sprzedaży (cena * ilość) dla pracownika (użyj `SUM() OVER PARTITION BY EMPLOYEE_ID`), ranking wartości sprzedaży względem wszystkich zamówień (`RANK() OVER ORDER BY`).


## Zadanie 4  
Dla każdego wiersza w tabeli `ORDER_POSITION` wypisz nazwisko pracownika, nazwę produktu, cenę produktu, liczbę transakcji tego produktu w danym dniu, sumę zapłaconą danego dnia za produkt, poprzednią i następną cenę danego produktu (użyj funkcji `LAG` i `LEAD`).


## Zadanie 5  
Dla każdego wiersza wypisz nazwę produktu, cenę, sumę całkowitą zapłaconą w danym miesiącu oraz sumę rosnącą zapłaconą w danym miesiącu (użyj `SUM()` i `SUM() OVER PARTITION BY MONTH(ORDER_DATE)`).


## Zadanie 6  
Dla każdej kategorii produktów wyświetl zestawienie sumy cen produktów w miesiącach styczeń, luty, marzec oraz kwiecień 2025 roku. Oblicz również różnicę sum cen pomiędzy kwietniem a styczniem (jako wartość bezwzględną). Zaprezentuj wyniki w formie tabeli z kolumnami: nazwa kategorii, suma cen w styczniu, suma cen w lutym, suma cen w marcu, suma cen w kwietniu oraz różnica sum cen między kwietniem a styczniem.


## Zadanie 7  
Dla każdego wiersza wypisz nazwę kategorii produktu, nazwę produktu, cenę, minimalną cenę w kategorii, maksymalną cenę i różnicę między nimi (funkcje `MIN()`, `MAX() OVER PARTITION BY`).

## Zadanie 8  
Dla każdego wiersza wypisz nazwę produktu i średnią kroczącą ceny, biorąc pod uwagę poprzednią, bieżącą i następną cenę według kolejnych dat (użyj `AVG() OVER` z `ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING`).


## Zadanie 9  
Dla każdego wiersza wypisz nazwę produktu, kategorię, ranking cen wewnątrz kategorii, numer wiersza dla kategorii według ceny oraz ranking gęsty cen (funkcje `RANK()`, `ROW_NUMBER()`, `DENSE_RANK() OVER PARTITION BY CATEGORY_ID ORDER BY PRICE`).


## Zadanie 10  

Dla każdej pozycji zamówienia wypisz:

- nazwisko pracownika,
- nazwę produktu,
- wartość sprzedaży pozycji (cena produktu * ilość),
- skumulowaną wartość sprzedaży pracownika w kolejności dat zamówień,
- ranking wartości sprzedaży pozycji w obrębie danego pracownika.

**Podpowiedź:** Użyj funkcji okienkowych `SUM() OVER (PARTITION BY ... ORDER BY ...)` do obliczenia skumulowanej wartości sprzedaży pracownika oraz `RANK() OVER (PARTITION BY ... ORDER BY ...)` do nadania rangi sprzedaży wewnątrz pracownika.


## Zadanie 11 (W tym zadaniu nie wykorzystuj funkcji okienkowych.)
Wyświetl imiona i nazwiska pracowników oraz ich stanowisko (z tabeli `EMPLOYEE`﻿ i `JOB_POSITION`﻿), którzy uczestniczyli w sprzedaży (posiadają zamówienia w `ORDER`﻿
