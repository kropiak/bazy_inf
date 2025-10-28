# Bazy danych, informatyka, studia stacjonarne, semestr 2025Z


## SQL. Tworzenie, aktualizacja oraz usuwanie tabel. Wstawianie, aktualizacja i usuwanie danych z tabeli

### Zadanie 1

1. Stwórz tabelę o nazwie `pracownik` i dodaj pola (kolumny) według wytycznych:
   * `id_pracownika` - klucz główny, liczba samozwiększająca się,
   * `imie` - ciąg znaków, pole wymagane, maksymalnie 40 znaków,
   * `nazwisko` -  ciąg znaków, pole wymagane, maksymalnie 60 znaków,
   * `data_urodzenia` - typ daty, pole wymagane

2. Do tabeli `pracownik` wstaw 3 rekordy danych.
3. Zmodyfikuj wartość w kolumnie `data_urodzenia` dla dowolnego rekordu.

### Zadanie 2

1. Stwórz tabelę `zadanie` z poniższymi polami:
   * `id_zadania` - klucz główny, liczba samozwiększająca się,
   * `nazwa_zadania` - ciąg znaków, pole wymagane, długość max. 150 znaków,
   * `priorytet` - typ wyliczeniowy (`normalny`, `wysoki`, `niski`),
   * `opis` - długi tekst, pole opcjonalne,
   * `pracownik` - klucz obcy do tabeli `pracownik`, w razie usunięcia wstaw `null`.
2. Zmodyfikuj pole `priorytet` i ustaw wartość domyślną na `normalny`.
3. Dodaj po jednym zadaniu dla każdego pracownika.


### Zadanie 3

1. Stwórz tabelę `projekt` z polami:
   * `id_projektu` - klucz glówny, liczba samozwiększająca się,
   * `nazwa_projektu` - ciąg znaków, max. 150 znaków,
   * `data_rozpoczecia` - typ daty,
   * `data_zakonczenia` - typ daty, może być pusty.

2. Za pomocą oddzielnego polecenia dodaj do tabeli `projekt` pole `menadzer_projektu` - klucz obcy do tabeli `pracownik`.
3. Dodaj 2 rekordy do tabeli `projekt`.
4. Dodaj do tabeli `zadanie` kolumnę `projekt`, klucz obcy do tabeli `projekt`, kaskadowe usuwanie rekordów.
5. Zaktualizuj wartości w tabeli `zadanie` dodając brakujące identyfikatory projektu, do którego należy je przypisać.

### Zadanie 4

1. Stwórz tabelę `sprint` z polami:
   * `id_sprintu` - klucz główny, liczba samozwiększająca się,
   * `numer_sprintu` - liczba całkowita nieujemna,
   * `data_rozpoczecia` - typ daty,
   * `data_zakonczenia` - typ daty.

2. Zmodyfikuj tabelę `zadanie` i dodaj kolumnę `sprint`, która będzie kluczem obcym do tabeli `sprint`, można wstawiać w niej wartość `null` (pole opcjonalne). Wstawiaj `null` w razie usunięcia rekordu nadrzędnego.
3. Dodaj 1 sprint i przydziel do niego 2 zadania.

### Zadanie 5

1. Stwórz tabelę `status` z polami:
   * `id_statusu` - klucz główny, liczba samozwiększająca się,
   * `nazwa_statusu` - ciąg znaków, max. 20 znaków.

2. Dodaj 3 różne statusy do tabeli `status`.
3. Stwórz tabelę `zadanie_has_status` z polami:
   * `id_zdarzenia` - klucz główny, liczba samozwiększająca się,
   * `id_zadania` - klucz obcy do tabeli `zadanie`,
   * `id_statusu` - klucz obcy do tabeli `status`,
   * `data_zdarzenia` - typ daty i czasu, domyślnie `CURRENT_TIMESTAMP`.
4. Wstaw 3 rekordy do tabeli `zadanie_has_status`.
5. Usuń z tabeli `projekt` jeden projekt i sprawdź czy powiązane rekordy w tabeli `zadanie` również zostały usunięte.