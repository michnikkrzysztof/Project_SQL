-- PROJEKT 1
-- 1. Stwórz Bazę "Sklep artykuły biurowe" (zastąpiłem odzież artykułammi biurowymi, bo na tym lepiej się znam)

CREATE DATABASE sklep_artykuly_biurowe;
USE sklep_artykuly_biurowe;

-- 2. Utwórz tabelę „Dostawca” 

CREATE TABLE dostawca (
Id_producenta VARCHAR(4) UNIQUE,
Nazwa_producenta VARCHAR(20) PRIMARY KEY,
Adres_producenta TEXT NOT NULL,
NIP_producenta CHAR(10),
Data_podpisania_umowy DATE NOT NULL
);

-- 3. Utwórz tabelę „Produkt” 

CREATE TABLE produkt (
Id_produktu VARCHAR (4) PRIMARY KEY,
Nazwa_producenta VARCHAR(20) NOT NULL,
Nazwa_produktu VARCHAR(50) NOT NULL,
Opis_produktu TEXT NOT NULL,
Cena_netto_zakupu decimal(10,2) NOT NULL,
Cena_brutto_zakupu decimal(10,2), CHECK (Cena_brutto_zakupu >= Cena_netto_zakupu),
Cena_netto_sprzedazy decimal(10,2) NOT NULL,
Cena_brutto_sprzedazy decimal(10,2), CHECK (Cena_brutto_sprzedazy >= Cena_netto_sprzedazy),
Procent_VAT_sprzedazy decimal(10,2) DEFAULT NULL
);

-- Utwórz tabelę „Zamówienie”

CREATE TABLE zamowienie (
Id_zamowienia VARCHAR(4) NOT NULL,
Id_klienta VARCHAR(4) NOT NULL,
Id_produktu VARCHAR(4) NOT NULL,
Data_zamowienia DATE NOT NULL
);

-- Utwórz tabelę „Klient”

CREATE TABLE klient (
Id_klienta VARCHAR(4) PRIMARY KEY,
Id_zamowienia VARCHAR(4),
Imie TEXT NOT NULL,
Nazwisko TEXT NOT NULL,
Adres VARCHAR(100) UNIQUE
);

/* 6. Każdą tabelę uzupełnij danymi wg:
Tabela „Dostawca” – 4 pozycje
Tabela „Produkt” – 20 pozycji
Tabela „Zamówienie” – 10 pozycji (stworzylem 42 pozycje, tak zeby do zadan bylo wiecej wynikow)
Tabela „Klient” – 10 pozycji
*/

INSERT INTO dostawca VALUES
('D001','Biuropol','Miodowa 14 38-821 Kraków',3816085427,20180218),
('D002','Altek','Jarominiaka 18 17-136 Piotrków Trybunalski',4890015396,20190114),
('D003','Pantak','Sosnowa 45 56-589 Zabrze',6787519645,20200830),
('D004','Pator','Hebanowa 12 94-918 Warszawa',3378133800,20171214);

INSERT INTO produkt VALUES
('P001','Biuropol','Papier ksero A4','Format A4 Gramatura 80g',9.50,11.59,11.99,14.63,0.22),
('P002','Biuropol','Segregator','Segregator A4/7cm Idest/VauPe',3.70,4.51,6.03,7.36,0.22),
('P003','Biuropol','Obwoluta','Obwoluta A4 100szt.',4.40,5.37,7.50,9.15,0.22),
('P004','Biuropol','Skoroszyt plastikowy zawieszkowy','Skoroszyt plastikowy zawieszkowy A4 1szt.',0.50,0.61,0.96,1.17,0.22),
('P005','Biuropol','Płyn do mycia naczyń 900ml','Płyn do mycia naczyń o pojemnosci 900ml bardzo skutecznie usówa tłuszcz występuje w kilku zapachach',3.99,4.87,4.86,5.93,0.22),
('P006','Biuropol','Taśma pakowa brąz 48/66m','Taśma klejąca na kałczukowym kleju bardzo mocna odporna na warunki atmosferyczne szeroka 48mm długa 66m przeznaczona do zaklejania kartonów mocno klejąca',4.15,5.06,5.17,6.31,0.22),
('P007','Altek','Kalendarz biurkowy Udziałowiec 2022','Kalendarz biurkowy Udziałowiec 2022 130x210mm tygodniowy 28 kartek',4.18,5.10,5.52,6.73,0.22),
('P008','Altek','Długopis','Długopis Orange Original Fine, 0.8mm niebieski',2.20,2.68,3.00,3.66,0.22),
('P009','Altek','Ołówek','Ołówek Evolution Original 655, HB, z gumką, zielony',1.99,2.43,2.74,3.34,0.22),
('P010','Altek','Bibuła marszczona','Bibuła marszczona 200x50 cm 10 sztuk mix kolorów',21.20,25.86,24.18,29.50,0.22),
('P011','Altek','Blok biurowy','Blok biurowy w kratkę Interdruk Economy A5 50 kartek mix wzorów',3.02,3.68,3.80,4.64,0.22),
('P012','Altek','Herbata biała','Herbata biała smakowa w kopertach figowa z gruszką 20 sztuk x 1.5g',6.50,6.50,8.72,8.72,0),
('P013','Altek','Czekolada do picia','Czekolada do picia Milky w saszetkach 250g (10 szt x 25g)',12.20,12.20,14.49,14.49,0),
('P014','Pantak','Wino bezalkoholowe','Wino bezalkoholowe półsłodkie 750ml białe 0.75l',35.10,37.91,42.93,46.36,0.08),
('P015','Pantak','Zupa nudle','Zupa nudle pomidorowa łagodna 65g',2.00,2.16,2.54,2.74,0.08),
('P016','Pantak','Apteczka samochodowa','Apteczka samochodowa w wodoodpornej saszetce z wyposażeniem kolor czerwony',22.00,26.84,28.24,34.45,0.22),
('P017','Pantak','Maseczka medyczna EN14683-2019','Maseczka medyczna EN14683-2019 trójwarstwowa typ II 30 sztuk klips nosowy niebieski (c)',8.11,9.89,9.99,12.19,0.22),
('P018','Pator','Toner 70C2HK0','Oryginalny toner przeznaczony do drukarek laserowych',499.00,608.78,561.02,684.44,0.22),
('P019','Pator','Podstawka pod monitor','Podstawka pod monitor SmartFit TFT czarny',187.12,228.29,221.76,270.55,0.22),
('P020','Pator','Dysk zewnętrzny','Dysk zewnętrzny  1 TB, 2.5 USB 3.0 czarny',289.73,353.47,330.87,403.66,0.22);

INSERT INTO zamowienie VALUES
('Z001','K001','P003',20220103),
('Z001','K001','P004',20220103),
('Z001','K001','P005',20220103),
('Z001','K001','P006',20220103),
('Z002','K002','P011',20220104),
('Z002','K002','P012',20220104),
('Z002','K002','P013',20220104),
('Z003','K003','P019',20220103),
('Z003','K003','P020',20220103),
('Z004','K004','P009',20220105),
('Z004','K004','P010',20220105),
('Z004','K004','P011',20220105),
('Z004','K004','P012',20220105),
('Z004','K004','P013',20220105),
('Z005','K005','P004',20220107),
('Z005','K005','P005',20220107),
('Z005','K005','P006',20220107),
('Z005','K005','P007',20220107),
('Z005','K005','P008',20220107),
('Z005','K005','P009',20220107),
('Z005','K005','P010',20220107),
('Z005','K005','P011',20220107),
('Z006','K007','P017',20220102),
('Z006','K007','P018',20220102),
('Z007','K010','P001',20220103),
('Z007','K010','P002',20220103),
('Z007','K010','P003',20220103),
('Z008','K006','P003',20220107),
('Z008','K006','P004',20220107),
('Z008','K006','P005',20220107),
('Z008','K006','P006',20220107),
('Z008','K006','P007',20220107),
('Z009','K008','P009',20220104),
('Z009','K008','P010',20220104),
('Z009','K008','P011',20220104),
('Z010','K009','P001',20220105),
('Z010','K009','P005',20220105),
('Z010','K009','P009',20220105),
('Z010','K009','P011',20220105),
('Z010','K009','P015',20220105),
('Z010','K009','P018',20220105),
('Z010','K009','P020',20220105);

INSERT INTO klient VALUES
('K001','Z001','Marcin','Sikorski','Nowobielawska 3 50-524 Wrocław'),
('K002','Z002','Ryszard','Jóźwiak','Kasztanowa 18/4 07-005 Olsztyn'),
('K003','Z003','Natalia','Czaja','Hebanowa 13 47-519 Żory'),
('K004','Z004','Otylia','Kowalczyk','Łąkowa 24/9 86-465 Białystok'),
('K005','Z005','Zbigniew','Błaszczyk','Urocza 1 40-976 Włocławek'),
('K006','Z008','Ewelina','Milewska','Szkolna 12/12 63-764 Leszno'),
('K007','Z006','Bolesław','Jankowski','Niecała 54 90-317 Mysłowice'),
('K008','Z009','Benedykt','Zieliński','Zimowa 14 21-564 Legnica'),
('K009','Z010','Nadia','Wieczorek','Chabrowa 87 61-975 Gorzów Wielkopolski'),
('K010','Z007','Dawid','Kowalczyk','Leśna 14/45 99-650 Bydgoszcz');

/*7. Połącz kolumny ze Sobą aby tabele ze sobą się Komunikowały

Produkt – Dostawca
Produkt – Zamówienie (zmienilem polaczenie na Zamowienie-Produkt), w Zamowieniach nie ustawialem Primary Key, bo Id_zamowienia bylo
przypisane do roznych produktow zamowionych przez tego samego klienta
Zamówienie - Klient*/

ALTER TABLE produkt
ADD FOREIGN KEY (Nazwa_producenta) REFERENCES dostawca (Nazwa_producenta);

ALTER TABLE zamowienie
ADD FOREIGN KEY (Id_produktu) REFERENCES produkt (Id_produktu);

ALTER TABLE zamowienie
ADD FOREIGN KEY (Id_klienta) REFERENCES klient (Id_klienta);

-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od dostawcy który znajduje się na pozycji 1 w tabeli „Dostawca”

SELECT p.Nazwa_produktu,d.*
FROM produkt p 
INNER JOIN dostawca d 
ON p.Nazwa_producenta LIKE d.Nazwa_producenta AND Id_producenta = (SELECT MIN(Id_producenta) FROM dostawca);

-- 9. Posortuj te produkty po Nazwie od A-B

SELECT p.Nazwa_produktu,d.*
FROM produkt p 
INNER JOIN dostawca d 
ON p.Nazwa_producenta LIKE d.Nazwa_producenta AND Id_producenta = (SELECT MIN(Id_producenta) FROM dostawca)
ORDER BY Nazwa_produktu;

-- 10. Wylicz średnią cenę za produktu od tego dostawcy
SELECT d.Nazwa_producenta, ROUND(AVG(p.Cena_netto_zakupu),2) AS 'ŚREDNIA CENA ZAKUPU'
FROM dostawca d
INNER JOIN produkt p
ON p.Nazwa_producenta LIKE d.Nazwa_producenta AND Id_producenta = (SELECT MIN(Id_producenta) FROM dostawca);

/* 11. Wyświetl dwie grupy produktów tego dostawcy:
Połowa najtańszych to grupa: „Tanie”
Pozostałe to grupa: „Drogie”*/

-- 1. SPOSÓB - ŚREDNIA JEST ZNANA Z POPRZEDNIEGO ZADANIA

SELECT Nazwa_producenta,Nazwa_produktu,Cena_netto_zakupu,
   CASE
       WHEN Cena_netto_zakupu >= 4.37 THEN 'DROGIE'
       ELSE 'TANIE' 
   END AS CENA FROM produkt WHERE Nazwa_producenta LIKE 'Biuropol'
   ORDER BY CENA;
-- 2. W DWÓCH KROKACH MOŻNA WYZNACZYĆ WARTOŚCI, KTÓRE FAKTYCZNIE PODZIELĄ WYNIK NA PÓŁ

Select COUNT(*) FROM produkt WHERE Nazwa_producenta = 'Biuropol';
Select Nazwa_producenta,Nazwa_produktu,Cena_netto_zakupu FROM produkt WHERE Nazwa_producenta = 'Biuropol'
ORDER BY Cena_netto_zakupu LIMIT 3;

SELECT Nazwa_producenta,Nazwa_produktu,Cena_netto_zakupu,
   CASE
       WHEN Cena_netto_zakupu > 3.99 THEN 'DROGIE'
       ELSE 'TANIE' 
   END AS CENA FROM produkt WHERE Nazwa_producenta LIKE 'Biuropol'
   ORDER BY CENA;

-- 3. AUTOMATYCZNE WYLICZENIE ŚREDNIEJ I PODZIELENIE NA "TANIE" I "DROGIE"

SELECT Nazwa_producenta,Nazwa_produktu,Cena_netto_zakupu,
   CASE
       WHEN Cena_netto_zakupu >= (SELECT ROUND(AVG(p.Cena_netto_zakupu),2) AS 'ŚREDNIA CENA ZAKUPU'
									FROM dostawca d
									INNER JOIN produkt p
									ON p.Nazwa_producenta LIKE d.Nazwa_producenta AND Id_producenta = (SELECT MIN(Id_producenta) FROM dostawca))
       THEN 'DROGIE'
       ELSE 'TANIE' 
   END AS CENA FROM produkt WHERE Nazwa_producenta LIKE 'Biuropol'
   ORDER BY CENA;

-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę

SELECT p.Nazwa_produktu
FROM produkt p
INNER JOIN zamowienie z
ON p.id_produktu = z.id_produktu
GROUP BY p.id_produktu;

-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji

SELECT p.Nazwa_produktu
FROM produkt p
INNER JOIN zamowienie z
ON p.id_produktu = z.id_produktu
GROUP BY p.id_produktu
LIMIT 5;

-- 14. Policz łączną wartość wszystkich zamówień

SELECT SUM(Cena_brutto_sprzedazy)
FROM produkt p
INNER JOIN zamowienie z
ON p.id_produktu = z.id_produktu;

-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego

SELECT p.Nazwa_produktu,z.*
FROM produkt p
INNER JOIN zamowienie z
ON p.id_produktu = z.id_produktu
ORDER BY Data_zamowienia DESC;

-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych

SELECT * FROM produkt 
WHERE (Id_produktu OR Nazwa_producenta OR Nazwa_produktu OR Opis_produktu
OR Cena_netto_zakupu OR Cena_brutto_zakupu OR Cena_netto_sprzedazy OR Cena_brutto_sprzedazy or Procent_VAT_sprzedazy) IS NULL;

-- 17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną

SELECT COUNT(z.Id_produktu) AS 'Ilosc zamowien',p.Nazwa_produktu,p.Cena_netto_sprzedazy
FROM zamowienie z
INNER JOIN produkt p
ON z.Id_produktu = p.Id_produktu
GROUP BY z.Id_produktu
ORDER BY COUNT(z.Id_produktu) DESC
LIMIT 1;

-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień

SELECT Data_zamowienia,COUNT(DISTINCT Id_zamowienia) AS 'Ilosc zamowien'
FROM zamowienie
GROUP BY Data_zamowienia
ORDER BY COUNT(DISTINCT Id_zamowienia) DESC
LIMIT 1;

