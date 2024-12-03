# Bazy danych, informatyka, studia stacjonarne 2024/2025

## Zadania 

### Spisek

Po kilku dniach mieszkania z dziadkiem, Bjorn wyszedł pozwiedzać trochę okolicę. Usłyszał
jakieś dziwne głosy, krzyki i ryki, które brzmiały znajomo. Nie zastanawiał się długo co to mogło być, tylko od razu uciekł do ich kryjówki. Opowiedział towarzyszom o tym co się stało. Drozda nagle olśniło. Poskładał wszystkie fakty w całość i okazało się, że bardzo prawdopodobnie teściowe mają spisek i próbują odnaleźć zięciów.


**Zadanie 1**

1. Przekopiuj jeszcze raz z bazy wikingowie rekordy z tabeli kreatura, przekopiuj dodatkowo
tabele: `uczestnicy`, `etapy_wyprawy`, `sektor`, `wyprawa`, wraz z danymi.
2. Wypisz nazwy kreatur, które nie uczestniczyły w żadnej wyprawie.
3. Dla każdej wyprawy wypisać jej nazwę oraz sumę ilości ekwipunku, jaka została zabrana przez
uczestników tej wyprawy.

_Podpowiedź_

2. Złączenie zewnętrzne lub podzapytanie
3. do połączenia co najmniej 3 tabele

### Trudna decyzja

Mężczyznom nawet nie przyszło do głowy, żeby spotkać się z treściową. Mówili jaka to ona
zła, jak im życie zmarnowała i najchętniej wymazaliby ją z pamięci. W chatce czuli się bezpiecznie i nie chcieli jej opuszczać. Drozd nie mógł już tego słuchać i starał się namówić ich, aby jednak stawili jej czoła. Zapytał, czy zamierzają żyć w ciągłym strachu, czy iść do niej, załatwić sprawę po męsku. Ostatecznie, po namowach Drozda podjęli decyzję o podróży.

**Zadanie 2**

1. Dla każdej wyprawy wypisz jej nazwę, liczbę uczestników, oraz nazwy tych uczestników w
jednej linii.
2. Wypisz kolejne etaty wszystkich wypraw wraz z nazwami sektorów, sortując najpierw według
daty początku wyprawy, a następnie według kolejności występowania etapów. W każdym
etapie określ nazwę kierownika danej wyprawy.

_Podpowiedź_

1. użyj funkcji `GROUP_CONCAT` do zebrania nazw w jednej linii


### Misterny plan

Przyjaciele nie wiedząc co robić, siedzieli zamyśleni przy stole. Po chwili Drozd wskoczył na
stół i powiedział: „Gdy teściowa zły humor ma, to wtedy bigos na nic się zda”. Następnie opowiedział, jak można zwabić, ją pięknym zwierzęcym futrem.

**Zadanie 3**

1. Wypisać ile razy dany sektor był odwiedzany podczas wszystkich wypraw (nazwa sektora,
ilość odwiedzin). Jeśli nie był odwiedzony ani razu, wpisz zero.
2. W zależności od ilości wypraw, w jakich brała udział dana kreatura wypisz: nazwa kreatury,
'brał udział w wyprawie' - gdy liczba > 0, 'nie brał udziału w wyprawie', gdy równa zero.

_Podpowiedź_
1. można wykorzystać funkcję `ifnull`

### Pułapka

W końcu po wielu namysłach, postanowili wyruszyć w stronę pieczary teściowej. Bjorn
zakłopotany myślą o spotkaniu ze staruszką, powiedział do Drozda: „Ani mi się śni rozmawiać z nią gdy jest na wolności!” Pomyśleli, że mogliby ją schwytać, więc zaczęli szukać potrzebnych
materiałów.

**Zadanie 4**

1. Dla każdej wyprawy wypisz jej nazwę oraz sumę liczby znaków, które zostały użyte przy
pisaniu dziennika, jeśli ta liczba znaków jest mniejsza od 400.
2. Dla każdej wyprawy podaj średnią wagę zasobów, jakie były niesione przez uczestników tej
wyprawy.

_Podpowiedź_

1. Użyj funkcji `length`, grupowania wraz z opcją `having`.
2. podziel sumę wagi*ilość przez liczbę uczestników wyprawy.

### Tchórz

Na niebie były już gwiazdy, gdy dotarli pod pieczarę teściowej. Rozejrzeli się i na szczęście nie było jej w środku. Ukryli się w krzakach, aby przemyśleć dokładnie plan działania. Dziadziuś zaczął dygotać ze strachu i oznajmił im, że nie może iść z nimi dalej, tłumacząc to tym, że mógłby dostać zawału na widok teściowej. W ramach przeprosin podarował Bjornowi swoją procę z pieprzem. Drozd także postanowił opuścić przyjaciela mówiąc, że tylko on może pokonać teściową. Dał mu swoje różowe pióro na szczęście i życzył powodzenia.

**Zadanie 5**

1. Wypisać nazwę kreatury oraz ile miała dni (wiek w dniach) w momencie rozpoczęcia
wyprawy, dla wypraw, które przechodziły przez chatkę dziadka.

_Podpowiedź_
1. użyć funkcji `datediff` do policzenia dni
