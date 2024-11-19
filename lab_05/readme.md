# Bazy danych, informatyka, studia stacjonarne 2024/2025

## Lab 5.

## **Zadania**

### Rozbitek

Bjorn wyrzucony przez morskie fale, leżał nieprzytomny na plaży. Obudziło go stukanie Drozda w jego hełm. Otworzył oczy i ujrzał przyjaciela, który powiedział do niego „Stary, Tobie to dać stery …” Bjorn nie pamiętał nic z tego, co się wydarzyło poprzedniego dnia. Drozd opowiedział mu o całym zdarzeniu, bo w momencie gdy opuścił załogę, aby szukać najbliższego lądu, wracał na statek, żeby powiedzieć wikingom o swoim odkryciu i wtedy zobaczył, jak rozbijają się o skałę.

**Zadanie 1**

1. Skopiuj tabele 'kreatura','zasob','ekwipunek' z bazy 'wikingowie' do swojej bazy.
2. Wypisz wszystkie rekordy z tabeli 'zasob'.
3. Wypisz wszystkie rekordy z tabeli 'zasob' gdzie typ to jedzenie.
4. Wypisz 'idZasobu', 'ilosc', dla kreatur o id 1,3,5.

_Podpowiedź_
1. CREATE AS SELECT
4. Zobacz dostępną opcję określenia warunku za pomocą 'IN'


### Kokos?

Wygląd wyspy, na której się znaleźli zdziwił ich, ponieważ była ona całkiem inna niż te w miejscu ich zamieszkania. Bjorn poczuł, że coś go kłuje w plecy. Wyglądało to jak duża, brązowa włochata kulka. Nie wiedział co to jest, ale pomyślał, że jak będzie z tym chodzić i do tego czegoś mówić, to w końcu coś się wykluje. Na chwilę zapominając o tym, co znalazł, zaczął wzywać pomoc. Po kilku godzinach nadal nikt go nie usłyszał, dlatego ze złości wziął swoje „jajo” i rzucił nim o palmę. Magiczna kulka rozpadła się, ale uderzenie było tak silne, że z palmy spadło kilka nowych. Bjorn podniósł rozbitą kulkę. Pięknie pachniała, więc spróbował ją zjeść. Postanowił, że nazwie to kokos i zrozumiał, że dzięki nim będzie miał pożywienia na wiele dni.

**Zadanie 2**  

1. Wyświetl kreatury, które nie są wiedźmą i dźwigają co najmniej 50kg.
2. Wyświetl zasoby, które ważą pomiędzy 2 a 5 kg.
3. Wyświetl kreatury, których nazwa zawiera 'or' i które dźwigają między 30kg a 70kg.

### Hamak

Bjorn stwierdził, że nie ma zamiaru już spać na kokosach, więc udał się do dżungli, aby znaleźć gałęzie i liany na hamak. Nagle przypomniał sobie, że zgubił swój topór, więc zębami twardymi niczym skała łamiąca statek utnie potrzebne mu materiały. Długo się męczył, poprosił też drozda o pomoc w dziobaniu drewna i w końcu udało się. Bjorn rozwiesił sobie hamak między dwiema palmami i zasypiając myślał o tym, co go czeka jutro.

**Zadanie 3**

1. Wyświetl zasoby, które zostały pozyskane w miesiącach lipcu i sierpniu.
2. Wyświetl zasoby, które mają zdefiniowany rodzaj od najlżejszego do najcięższego.
3. Wyświetl 5 najstarszych kreatur.

_Podpowiedź_
1. Spróbuj wykorzystać funkcję MONTH


### Złota rybka

Dobrobyt uderzył Bjornowi do głowy i jak już ma ekskluzywny hamak, to przecież nie będzie się żywić samymi kokosami. Postanowił więc ponownie udać się do dżungli, aby znaleźć coś, z czego mógłby wykonać wędkę. Pełen doświadczenia z poprzedniego dnia uwinął się z tym raz dwa . Wrócił na swoją plażę, ale złowić rybę nie było wcale tak łatwo. Na początku mu nie szło, ciągle łowił stare deski, buty i staniki. Aż w końcu po podniesieniu wędki przeżył szok. Jego oczom ukazała się złota rybka. Powiedziała, że może spełnić jego 3 życzenia. Bjorn nie mógł uwierzyć, więc odparł: „No to zrób tak, żeby Drozd miał różowy ogon”. Przez chwilę nic się nie działo, aż tu bach! Różowe pióra! Bjorn pomyślał, że ja może mieć wszystko co chce, to mógłby odzyskać swój toporek. Rybka go wysłuchała, broń spadła z nieba i uderzyła go w łeb, tym samym powalając go na ziemię. Drozd pochylił się nad nim i szyderczym głosem powiedział : „HA! To za te pióra!”

**Zadanie 4**

1. Wyświetl unikalne rodzaje zasobów.
2. Wyświetl jako jedną kolumnę nazwę i rodzaj kreatury (w postaci: nazwa - rodzaj), gdzie rodzaj rozpoczyna się od 'wi'.
3. Wyświetl zasoby z całkowitą wagą danego zasobu (ilość * waga) dla zasobów pozyskanych w latach 2000-2007.

### Twardy sen

W czasie, gdy Bjorn leżał jak zabity, rybka wykorzystała okazję i uciekła. Drozd strasznie wkurzył się na swojego towarzysza i tym razem postanowił go nie budzić i pozostawił go leżącego na plaży w pełnym słońcu, żeby smażył się jak kotlet na patelni.

**Zadanie 5**

1. Zakładając, że każdy rodzaj jedzenia to 30% odpadu, wyświetl masę właściwego jedzenia (netto) oraz wagę odpadków.
2. Wyświetl zasoby, które nie mają rodzaju.
3. Wyświetl wszystkie unikalne rodzaje zasobów, których nazwa zaczyna się od 'Ba' lub kończy się na 'os'. Dane posortuj alfabetycznie.