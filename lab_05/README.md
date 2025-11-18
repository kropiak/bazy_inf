# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z

## SQL. Zapytania SELECT – filtrowanie, sortowanie

---

Schemat bazy znajdziesz **[tu](schemat_company_2025.png)**

### Zadanie 1

1. Skopiuj tabele `CLIENT`, `ORDER`, `EMPLOYEE` z bazy company_2025.  
2. Wypisz wszystkie rekordy z tabeli `ORDER`.  
3. Wypisz wszystkie rekordy z tabeli `ORDER`, gdzie `ORDER_STATUS = 5`.  
4. Wypisz `ORDER_ID`, `ORDER_STATUS` dla klientów o identyfikatorach `1`, `3`, `5`.  

 **Podpowiedź**  
- Użyj polecenia `CREATE TABLE ... AS SELECT ...` do skopiowania tabel.  
- W punkcie 4 wykorzystaj operator `IN`.

---

### Zadanie 2

1. Wyświetl pracownice, które mają na imię **Agnieszka** oraz zarabiają **3900 PLN**.  
2. Wyświetl pracowników, którzy zarabiają pomiędzy **5000 PLN** a **7000 PLN**.  
3. Wyświetl klientów, których skrócona nazwa zawiera `'eco'` i są firmą (`IS_COMPANY = 1`).

---

### Zadanie 3

1. Wyświetl zamówienia, które zostały przyjęte w **czerwcu** oraz **lipcu**.  
2. Wyświetl klientów, którzy posiadają numer NIP (`TAX_IDENTIFIER`) w porządku alfabetycznym według skróconej nazwy.  
3. Wyświetl **5 najstarszych pracowników**.  

 **Podpowiedź**  
- W punkcie 1 możesz wykorzystać funkcję `MONTH()`.

---

### Zadanie 4

1. Wyświetl **unikalne pierwsze imiona** pracowników.  
2. Wyświetl w jednej kolumnie **imię i nazwisko** pracownika (w formacie `imię - nazwisko`), gdzie nazwisko zaczyna się od `'Ko'`.  
3. Wyświetl **nazwiska pracowników oraz ich pensje** dla osób zatrudnionych w latach **2010–2014**.

---

### Zadanie 5

1. Zakładając, że pensja pracownika zawiera **25% podatku**, dla każdego pracownika wyświetl:
   - pensję  
   - pensję **netto** (pomniejszoną o 25%),  
   - kwotę **podatku**.  
3. Wyświetl klientów, którzy **nie mają podanego numeru NIP**.  
4. Wyświetl skrócone nazwy klientów, których nazwa:  
   - zaczyna się od `'K'`, **lub**  
   - kończy się na `'ski'`.  
   Dane posortuj **malejąco** (od Z do A) według skróconej nazwy.

---

