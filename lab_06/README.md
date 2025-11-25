# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Funkcje agregujące, grupowanie, łączenie tabel

---

### Zadanie 1

1. Wyświetl **średnią pensję** wszystkich pracowników.  
2. Wyświetl **średnią pensję oraz liczbę pracowników** dla każdego stanowiska (`JOB_POSITION_ID`).  
3. Wyświetl **średni wiek** dla każdego departamentu (`DEPARTMENT_ID`), do którego należy pracownik.  

 **Podpowiedź:**  
- Użyj funkcji agregujących (`AVG`, `COUNT`).  
- W zadaniu 2 potrzebne będzie `GROUP BY`.  
- W zadaniu 3 można wykorzystać funkcję `YEAR()` do obliczenia wieku na podstawie daty urodzenia.

---

### Zadanie 2

1. Dla każdego **departamentu (`DEPARTMENT_ID`)** wyświetl **łączną pensję** jego pracowników.  
   Dane posortuj **malejąco**.  
2. Dla każdego **stanowiska pracy** pracownika wyświetl **średnią pensję**,  
   jeśli liczba pracowników na danym stanowisku jest **≥ 3** oraz średnia jest **> 3000 PLN**.  
3. Wyświetl, **ile jest różnych pensji** dla każdego departamentu,  
   jeśli minimalna liczba pracowników departamentu jest **> 4**.  
   Dane posortuj **rosnąco** według ilości różnych pensji.  

 **Podpowiedź:**  
- We wszystkich zadaniach występuje `GROUP BY`.  
- W zadaniach 2–3 przyda się `HAVING`.

---

### Zadanie 3

1. Skopiuj tabele `DEPARTMENT` i `JOB_POSITION` z bazy `company_2025` do swojej bazy danych.  
2. Wyświetl dla każdej **nazwy departamentu** liczbę jego pracowników.  
3. Wyświetl dla każdej **nazwy departamentu** imiona oraz nazwiska pracowników, którzy w nim pracują (łącznie).  

 **Podpowiedź:**  
- Do kopiowania tabel użyj `CREATE TABLE ... AS SELECT ...`.  
- W punktach 2–3 połącz tabele `DEPARTMENT` i `EMPLOYEE` (`JOIN`).

---

### Zadanie 4

1. Wyświetl **nazwiska pracowników**, którzy urodzili się w **latach 90-tych XX wieku**, oraz **nazwy stanowisk**, na których są zatrudnieni  
   (użyj `NATURAL JOIN`, jeśli to możliwe).  
2. Wyświetl **imiona i nazwiska 5 najmłodszych pracowników**, którzy pracują jako **„Magazynier”**.  
3. Wypisz obok siebie **skrócone nazwy klientów**, których numer `CLIENT_ID` różni się o **5**  
   (np. `Kowalski - AutoMax`, `Nowak - Kaczmarek`).  

 **Podpowiedź:**  
- W ostatnim punkcie użyj **połączenia tabeli samej ze sobą** (`SELF JOIN`).

---

### Zadanie 5

1. Dla każdego **stanowiska pracy** wyświetl **średnie zarobki pracowników**,  
   jeśli pracownik **nie pracuje w departamencie** „IT” ani „HR”  
   i liczba pracowników jest **powyżej 3**.  
2. Dla każdego **stanowiska pracownika** wyświetl:  
   - imię, nazwisko,  
   - datę urodzenia **najmłodszej** i **najstarszej** osoby,  
   - oraz **departament**, w którym pracują.

---

