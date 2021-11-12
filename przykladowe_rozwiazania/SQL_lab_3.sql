Lekcja 1

zadanie 1
pkt.1

CREATE TABLE postac (
id_postaci int(11) PRIMARY KEY auto_increment,
nazwa varchar(40),
rodzaj enum('wiking','ptak','kobieta'),
data_ur date,
wiek int(3) unsigned
);

pkt.2

INSERT INTO postac VALUES(default,'Bjorn','wiking','1650-12-10',130);
# default powoduje wpisanie wartości domyślnej a w przypadku pola auto_increment kolejnej wartości z sekwencji
lub 

INSERT INTO postac(nazwa,rodzaj,data_ur,wiek) VALUES ('Drozd','ptak','1699-10-02',81);
# tutaj okreslamy kolejne kolumny, dla których wartości są wstawianie, więc pomijając id_postaci, który posiada atrybut auto_increment wybierana jest wartość default więc kolejny numer z sekwencji

pkt.3

UPDATE postac SET wiek=88 WHERE nazwa='Tesciowa';


Zadanie 2
pkt.1
CREATE TABLE walizka (
id_walizki int(11) PRIMARY KEY auto_increment,
pojemnosc int(4) unsigned,
kolor enum('rozowy','czerwony','teczowy','zolty'),
id_wlasciciela int(11),
FOREIGN KEY(id_wlasciciela) REFERENCES postac(id_postaci) ON DELETE CASCADE
);

pkt.2
ALTER TABLE walizka ALTER COLUMN kolor SET DEFAULT 'rozowy';

pkt.3

Tutaj INSERT INTO ...

Zadanie 3
pkt.1
#zwróć uwagę na postać polecenia PRIMARY KEY

CREATE TABLE izba (
adres_budynku varchar(50),
nazwa_izby varchar(50),
metraz int(4) unsigned,
wlasciciel int(11),
PRIMARY KEY(adres_budynku, nazwa_izby),
FOREIGN KEY(wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL
);

pkt.2
ALTER TABLE izba ADD COLUMN kolor_izby varchar(50) DEFAULT 'czarny' AFTER metraz;

pkt.3
Ponownie INSERT INTO...

Zadanie 4
Pkt.1

Tutaj oczywiście CREATE TABLE...
Kilka uwag. Pole typu YEAR (dla rok_produkcji) to pole przestarzałego typu i nie będzie w stanie przechować zadanej tutaj wartości domyślnej - 1654.
Poczytaj w internecie o typie pola YEAR dla bazy MySQL. Typ można zmienić na int(4), który się tutaj lepiej nada.

Pkt.2
INSERT INTO...

Zadanie 5
pkt.1
INSERT INTO...

pkt.2
CREATE TABLE...

pkt.3
INSERT INTO...

pkt.4
ALTER TABLE postac ADD COLUMN funkcja varchar;

pkt.5
UPDATE...

pkt.6
ALTER TABLE postac ADD COLUMN statek varchar(255);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);

pkt.7
UPDATE...

pkt.8
DELETE FROM izba WHERE nazwa_izby='Spizarnia';

pkt.9
DROP TABLE izba;









