# Bazy danych, informatyka, studia stacjonarne 2024/2025

## **Zadania**

### CICHA WODA
Po wielu tygodniach bujania się po morzu w wielkim skwarze bez najmniejszego podmuchu wiatru, który muskałby ich brody, zorientowali się, że kończą im się zapasy wody, a co najgorsze, od tygodnia nie mieli w ustach czegoś mocniejszego. Wikingowie, jako naród żyjący wśród śniegu nie są przyzwyczajeni do słońca, dlatego też strasznie cierpieli w upale i zaczęli coś majaczyć.

**Zadanie 1**  
a) uśmierć dwóch najstarszych wikingów, ale to nie może być Bjorn (`DELETE` z `WHERE`)  
b) usuń klucz główny z tabeli `postac` - może być potrzebnych kilka komend (np. odłączenie kluczy obcych)

### SYRENKA
Następnego ranka na horyzoncie ujrzeli skałę, a na niej postać kobiety. Wszyscy co do jednego chwycili za wiosła i zaczęli gnać w jej stronę. Gdy podpłynęli trochę bliżej zobaczyli, że to piękna syrena, kusząca ich swoim głosem. Wikingowie nie mogąc oprzeć się tej niewiaście, siedzieli oparci o burtę z jęzorami na wierzchu i śliną cieknącą po brodzie. Drozd przyglądał się im z góry dłuższą chwilę, po czym rzekł: „Księga Wikingów mówi jasno: Kto się w syrenie zakocha, temu morze strzeli focha!”, lecz nikt go nie słuchał, więc odwrócił się do nich ogonem i odleciał.

**Zadanie 2**  
a) do tabeli `postac` dodaj pole `pesel` składające się z 11 znaków i ustaw to pole na klucz główny  
b) w tabeli `postac` zmień pole `rodzaj`, tak, aby możliwe było dodanie syreny  
c) wstaw do tabeli `postac` syrenę o nazwie Gertruda Nieszczera  


### PRZECHYŁY
Wszyscy jeszcze oszołomieni widokiem syreny nie zauważyli, że zaczęło coraz bardziej bujać statkiem. Jedni kładli się sądząc, że przechyły będą mniej odczuwalne, inni trzymali się masztu, bo uznali go za dobre miejsce, a reszta załogi dzielnie sterowała statkiem, aby płynąć ciągle przed siebie i jak najszybciej uciec od wrednej kobiety – TEŚCIOWEJ.

**Zadanie 3**  
a) Wszystkie postacie, które mają w swojej nazwie 'a', wsadź na statek Bjorna  
b) Zmniejsz ładowność wszystkim statkom o 30%, których data wodowania była w XX wieku  
c) ustaw warunek sprawdzający czy wiek postaci nie jest większy od 1000  

### WĄŻ LOKO

Po kilku dniach ciągłej walki z wiatrem, jedni zrobili się zieloni na twarzy i zaczęli farbować wodę, drudzy nadal trzymali się masztu coraz bardziej trzęsąc portkami, a cała reszta z Bjornem na czele dzielnie prowadziła łajbę. Aż tu nagle, ni z gruchy ni z pietruchy obok nich wynurzył się dziwny stwór. Długi był na 100 metrów, do węża bardzo podobny, ale na łbie miał potężnego irokeza. Bjorn spytał go: „Kim jesteś i gdzie znajdę jakiś ląd?”, po czym ten odpowiedział: „Loko mówią mi, a ląd wiele mil ssssstąd jesssst”, po czym zanurzył się ochlapując wszystkich i odpłynął w nieznane.

**Zadanie 4**  
a) Do postaci dodaj węża Loko, tylko nie wsadzaj go na statek  
b) Stwórz nową tabelę na podstawie tabeli `postac` (dokładnie takie same pola), nazwij ją `marynarz` - dodaj do tej tabeli wszystkie postacie które mają zdefiniowany statek  
c) dostosuj odpowiednio klucze główne i obce  

### SZTORM

Po rozmowie z wężem Loko na niebie zebrały się czarne chmury. Wtedy już cała załoga zaczęła panikować i miała pełne gacie. Jedynie Bjornowi pozostały resztki rozumu i krzyknął do załogi: „Czego się bardziej boicie – podmuchu wiaterku, czy oddechu teściowej?!” Wtedy wszyscy bez chwili namysłu ruszyli dalej. Wpłynęli w wielką burzę, miotało nimi jak szatan na lewo i prawo, aż w końcu fala zepchnęła ich na skałę i cała łódź poszła w drzazgi. Bjorn w ostatniej chwili złapał ocalałą deskę i próbował dostrzec resztę swojej załogi. Niestety, nikogo nie zobaczył. Jedynie w oddali słyszał słowa Drozda „BJORN come back, come back…”

**Zadanie 5**  
a) wysadź wszystkich ze statku  
b) uśmierć jednego wikinga  
c) zniszcz wszystkie statki  
d) usuń tabelę statek  
e) stwórz tabelę zwierz z polami id - klucz główny z autoinkrementacją, nazwa - ciąg znaków, wiek - liczba  
f) przekopiuj z tabeli postac wszystkie zwierzaki
