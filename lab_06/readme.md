# Bazy danych, informatyka, studia stacjonarne 2024/2025

## **Zadania**

### Skwarek
 
Po całym dniu leżenia nieprzytomnie na słońcu, Bjorn był czerwony jak rak. Po podniesieniu się, wiking zobaczył swój ukochany toporek i z wielką radością zaczął skakać i dziko tańczyć. Poczuł jednak, że wszystko go piecze, więc wskoczył do morza, przy czym rozniósł się charakterystyczny dźwięk „tsssss…”. Wtem nagle wynurzył się wąż Loko i ze zdziwieniem odparł: „eee to tylko wy, myśśśślałem, że to moja sssstara…”, po czym odpłynął. Bjornowi zrobiło się lżej po kąpieli i wrócił na ląd. 

**Zadanie 1**  

1. wyświetl średnią wagę wszystkich wikingów  
2. Wyświetl średnią wagę oraz liczbę kreatur dla każdego rodzaju  
3. wyświetl średni wiek dla każdego rodzaju kreatury  

**Podpowiedź:**  
1-3 funkcje agregujące,  
2. Group by,  
3. Można użyć funkcji YEAR  

### Dymek 

Bjorn z Drozdem wylegiwali się na hamaku w cieniu palm, gdy nagle pojawiły się dziwne chmury. Po chwili zastanowienia doszli do wniosku, że to musi być dym. Pochodził on drugiej strony wyspy. Przyjaciele i tak nie mieli nic do roboty, więc wzięli kokosy na drogę i ruszyli w kierunku dziwnego zjawiska. Były dwie opcje: pożar, który może ich zabić, lub wyspa jednak nie jest bezludna. 

**Zadanie 2**

1. Dla każdego rodzaju zasobu wyświetlić sumę wag tego zasobu.   
2. Dla każdej nazwy zasobu wyświetlić średnią wagę, jeśli ilość jest równa co najmniej 4 oraz jeśli ta suma wag jest większa od 10.  

3. Wyświetlić ile jest różnych nazw dla każdego rodzaju zasobu, jeśli minimalna liczba zasobu jest większa od 1. 

**Podpowiedź**

W każdym zadaniu występuje grupowanie, 2-3 zawiera HAVING

### Pieprz

Po kilku godzinach walki z krzakami, dotarli na wielkie pole. Podeszli bliżej i zobaczyli, że na krzakach rosną dziwne czarne kuleczki. Bjorn po miłych doświadczeniach z kokosami postanowił sprawdzić, jak to smakuje. Niestety zaczął kaszleć, prychać i kichać. Przypomniał sobie, że dodawał trochę tego do bigosu, ale nigdy tak naprawdę nie wiedział dlaczego. Oboje stali zamyśleni, a nagle Drozd wybuchnął śmiechem i krzyknął: „HA! Zwialiśmy tam, gdzie pieprz rośnie!”

**Zadanie 3**

1. Wyświetlić dla każdej kreatury ilości zasobów jakie niesie.  
2. Wyświetlić dla każdej kreatury nazwy zasobów jakie posiada.  
3. Wyświetlić kreatury, które nie posiadają żadnego ekwipunku.  

**Podpowiedź**

1. Połączenie kreatury i ekwipunku,  
2. połączenie trzech tabel  
3. LEFT JOIN lub podzapytanie  


### Dziadek

Gdy fascynacja pieprzem minęła, spostrzegli dym, do którego chcieli dojść. Znajdował się on na końcu wielkiego pola. Przeszli przez pieprzowe krzaki ciągle kichając, aż w końcu dotarli do małej chatki. Zapukali, a z domku wybiegł dziadek, który celował do nich z procy nabitej pieprzem. Starzec miał wielkie oczy i nos oraz czoło wjeżdżające na potylice (zakola :)). Po krótkiej rozmowie z nim dowiedzieli się, że on również uciekał wiele lat temu od swojej teściowej gdzie pieprz rośnie. Po kilku godzinach gadania, Bjorn zapytał dziadka z ciekawości, dlaczego ma takie wielkie oczy. Ten odparł mu na to, że musi dobrze widzieć intruzów na swoim polu. Bjorn z jeszcze większym zainteresowaniem zapytał: „A dlaczego masz taki duży nos?” – ten śmiejąc się odparł – „A to przez ciągłe kichanie od pieprzu.”

**Zadanie 4**

1. Wyświetlić nazwy wikingów, którzy urodzili się w latach 70-tych XVII wieku oraz nazwy zasobów, które posiadają (użyj natural joina jeśli się da).  
2. Wyświetlić nazwy 5 najmłodszych kreatur, które w ekwipunku posiadają jedzenie.  
3. Wypisz obok siebie nazwy kreatur, których numer idKreatury różni się o 5 (np. Bjorn - Astrid, Brutal - Ibra itd.).  

**Podpowiedź**

3. połączenie tabeli samej ze sobą


### Zła nowina

Cała trójka rozmawiała ze sobą do późnej nocy o wszystkim i niczym. Dziadek przypomniał sobie, że w ostatnim czasie na wyspie działo się coś dziwnego. Opowiadał im o tym jak wulkan zaczął sobie popierdywać, pogoda zrobiła się kapryśna jak baba, a pieprzowe krzaki zaczęły więdnąć. W tym momencie staruszek zaczął trząść się ze strachu i rozpoczął opowiadać o tym, jak szedł sobie w nocy do wychodka, a tu nagle zobaczył jakąś postać w krzakach, w której okularach odbijał się księżyc i przypomniał sobie o wieczorach, kiedy światło lampki odbijało się od szkieł teściowej w podobny sposób. Dziadek powiedział, że po tych wydarzeniach niebezpiecznie jest chodzić po nocy, więc zaproponował im żeby zostali na kilka kolejnych dni.

**Zadanie 5**

1. Dla każdego rodzaju kreatury wyświetlić średnią wagę zasobów, jaką posiadają w ekwipunku, jeśli kreatura nie jest małpą ani wężem i ilość ekwipunku jest poniżej 30.  
2. Dla każdego rodzaju kreatury wyświetlić nazwę, datę urodzenia i rodzaj najmłodszej i najstarszej kreatury.  

**Podpowiedź**
Drugie jest trudne :smiley:
