use RailwayDB;

CREATE TABLE Pociagi ( 
    ID_pociagu INT IDENTITY PRIMARY KEY, 
    Nazwa_pociagu NVARCHAR(50) NOT NULL, 
    Liczba_wagonow INT NOT NULL, 
    Typ_pociagu NVARCHAR(50) NOT NULL
);
INSERT INTO Pociagi
VALUES 
    ('Krakus', 6, 'PKP Intercity'),
    ('Bryza', 3, 'Koleje œl¹skie'),
    ('Piast', 8, 'PKP Intercity'),
    ('Hetman', 3, 'PKP Intercity'),
    ('Regionalny', 3, 'Przewozy regionalne'),
    ('Œnie¿ka', 4, 'PKP Intercity');

CREATE TABLE Szczegoly_techniczne_pociagow (
    ID_pociagu INT IDENTITY PRIMARY KEY,        
    Producent NVARCHAR(100) NOT NULL,             
    Moc_silnika INT NOT NULL,                   
    Typ_silnika NVARCHAR(50) NOT NULL,           
    Rok_produkcji INT NOT NULL,                 
    FOREIGN KEY (ID_pociagu) REFERENCES Pociagi(ID_pociagu) 
);

INSERT INTO Szczegoly_techniczne_pociagow (Producent, Moc_silnika, Typ_silnika, Rok_produkcji)
VALUES
('Bombardier', 4000, 'Elektryczny', 2018),
('Siemens', 3000, 'Elektryczny', 2015),
('Pesa', 3200, 'Spalinowy', 2020),
('Alstom', 4200, 'Elektryczny', 2018),
('Stadler', 2800, 'Spalinowy', 2019),
('Pesa', 2900, 'Spalinowy', 2021);


CREATE TABLE Kursy_pociagow (
    ID_kursu INT IDENTITY PRIMARY KEY,
    ID_pociagu INT NOT NULL,
    Stacja_poczatkowa NVARCHAR(100) NOT NULL,
    Stacja_koncowa NVARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_pociagu) REFERENCES Pociagi(ID_pociagu)
);

INSERT INTO Kursy_pociagow (ID_pociagu, Stacja_poczatkowa, Stacja_koncowa) 
VALUES 
    (1, 'Warszawa-Zachodnia', 'Kraków-G³ówny'), 
    (1, 'Kraków-G³ówny', 'Warszawa-Zachodnia'),
    (2, 'Katowice', '¯ywiec'),
    (2, '¯ywiec', 'Katowice'),
    (3, 'Wroc³aw', 'Gdynia'),
    (3, 'Gdynia', 'Wroc³aw'),
    (4, 'Zamoœæ', 'Wroc³aw'),
    (4, 'Wroc³aw', 'Zamoœæ'),       
    (5,'Kraków-G³ówny', 'Sêdziszów'),
    (5, 'Sêdziszów', 'Kraków-G³ówny'),
    (6,'Warszawa Wschodnia', 'Jelenia Góra'),
    (6, 'Jelenia Góra', 'Warszawa Wschodnia');	

CREATE TABLE Rozklad (
    ID_rozkladu INT IDENTITY PRIMARY KEY,
    ID_kursu INT NOT NULL,
    Dzien_podrozy DATE NOT NULL,
    Czas_odjazdu TIME(0) NOT NULL,
    Czas_przyjazdu TIME(0) NOT NULL,
    Numer_peronu INT NOT NULL,
    Czas_trwania TIME(0),
    Odleg³oscKm INT,
    CenaCa³kowita DECIMAL(10,2), 
    FOREIGN KEY (ID_kursu) REFERENCES Kursy_pociagow(ID_kursu)
);



INSERT INTO Rozklad VALUES 
	(1, '2024-11-27', '07:00:00', '10:47:00', 2, '03:47:00', 316, 70),
	(2, '2024-11-28', '13:00:00', '16:47:00', 4, '03:47:00', 316, 70),
	(2, '2024-11-29', '13:00:00', '16:47:00', 4, '03:47:00', 316, 70),
	(3, '2024-11-28', '09:30:00', '11:32:00',  3, '02:32:00', NULL, NULL),
	(3, '2024-11-29', '09:30:00', '11:32:00',  3, '02:32:00', NULL, NULL),
	(5, '2024-11-29', '10:30:00', '14:30:00',  2, '04:00:00', 430, 120),
	(5, '2024-11-30', '10:30:00', '14:30:00', 2, '04:00:00', NULL, NULL),
	(6, '2024-12-05', '15:30:00', '19:30:00', 1, '04:00:00', 430, 120),
	(7, '2024-11-30', '11:00:00', '17:35:00',  1, '06:45:00', 545, 100),
        (7, '2024-12-01', '11:00:00', '17:35:00',  1, '06:45:00', 545, 100),	
	(8, '2024-12-02', '15:00:00', '22:45:00',  1, '06:45:00', 545, 100),
	(9, '2024-12-01', '15:22:00', '17:45:00',  3, '02:23:00', NULL, NULL),
	(10, '2024-12-01', '18:00:00', '20:23:00', 2, '02:23:00', 65, 20),
	(11, '2024-12-03', '15:00:00', '22:00:00', 1, '07:00:00', 595, 130),
	(11, '2024-12-04', '15:00:00', '22:00:00', 1, '07:00:00', 595, 130),
	(12, '2024-12-04', '08:00:00', '15:00:00', 5, '07:00:00', 595, 130),
	(12, '2024-12-05', '08:00:00', '15:00:00', 5, '07:00:00', 595, 130); 


CREATE TABLE Pasazerowie (
    ID_pasazera INT IDENTITY PRIMARY KEY,
    Imie NVARCHAR(100) NOT NULL,
    Nazwisko NVARCHAR(100) NOT NULL,
    Adres_email NVARCHAR(100) NOT NULL UNIQUE,
    Haslo NVARCHAR(50) NOT NULL
);

INSERT INTO Pasazerowie 
VALUES 
    ('Micha³','Wójcik', 'm.wojcik@wp.pl', 'haslo123'),
    ('Julia','Ma³ysz', 'j.malysz@wp.pl', 'haslo098'),
    ('Tomasz','Nowak', 't.nowak123@o2.pl', 'haslo231'),
    ('Anna','Mucha', 'anna.mucha@onet.pl', 'haslo999'),
    ('Mateusz','Kowalski', 'm.kowalski@onet.pl', 'haslo111'),
    ('Pawe³','Mickiewicz', 'p.mickiewicz@onet.pl', 'haslo122'),
    ('Monika', 'Kamiñska','monika.kaminska@example.com', 'haslo321'),
    ('£ukasz', 'Zieliñski','lukasz.zielinski@wp.com',  'haslo100'),
    ('Natalia', 'Szymañska','natalia.szymanska@example.com', 'haslo177'),
    ('Tomasz', 'WoŸniak','tomasz.wozniak@wp.com', 'haslo444'),
    ('Joanna', 'Koz³owska','joanna.kozlowska@example.com',  'haslo664'),
    ('Adrian','Kowalczyk', 'adrian.kowalczyk@wp.pl', 'haslo222'),
    ('Ewelina','Nowicka', 'ewelina.nowicka@onet.pl', 'haslo333'),
    ('Bartosz','Kaczmarek', 'bartosz.kaczmarek@example.com', 'haslo444'),
    ('Karolina','Lewandowska', 'karolina.lewandowska@wp.com', 'haslo555');
	

CREATE TABLE Rezerwacje_biletow(
    ID_rezerwacji INT IDENTITY PRIMARY KEY,
    ID_pasazera INT NOT NULL,
    ID_rozkladu INT NOT NULL,
    Cena DECIMAL(10, 2) NOT NULL,
    Data_rezerwacji DATE NOT NULL,
    Dzien_podrozy DATE NOT NULL,  -- Dodana nowa kolumna na dzieñ podró¿y
    Stacja_poczatkowa NVARCHAR(100) NOT NULL,
    Czas_wyjazdu TIME(0) NOT NULL,   -- Zmieniony typ na TIME
    Stacja_koncowa NVARCHAR(100) NOT NULL,
    Czas_przyjazdu TIME(0) NOT NULL, -- Zmieniony typ na TIME
    Czas_trwania TIME(0),
    Odleglosc INT NOT NULL,
    Numer_wagonu INT,
    Numer_miejsca INT,
    Znizka_procentowa INT,
    Typ_znizki NVARCHAR(100),
    Status_rezerwacji NVARCHAR(50),
    FOREIGN KEY (ID_rozkladu) REFERENCES Rozklad(ID_rozkladu),
    FOREIGN KEY (ID_pasazera) REFERENCES Pasazerowie(ID_pasazera)
);

INSERT INTO Rezerwacje_biletow
VALUES
	(1, 4, 35.60, '2024-11-27', '2024-11-28','Katowice', '09:30:00', 'Tychy','10:38:00', '01:08:00',99, NULL, NULL, NULL, NULL, 'Anulowano'),
(2, 6, 29.90, '2024-11-27', '2024-11-29','Wroc³aw', '10:30:00', 'Poznañ','13:44:00', '03:14:00', 120, 8, 35, 51, 'Zni¿ka dla studentów', 'Zarezerwowano'), 
(4, 2, 38.15, '2024-11-27', '2024-11-28', 'Kraków-G³ówny', '13:00:00','Warszawa-Zachodnia', '17:55:00', '04:55:00', 316, 12, 88, 51, 'Zni¿ka dla studentów', 'Zarezerwowano'), 
(3, 10, 40.00, '2024-11-28', '2024-11-30', 'Rzeszów-G³ówny','15:10:00', 'Katowice','16:22:00', '01:12:00',  145, 1, 22, NULL, NULL, 'Zarezerwowano'),
(5, 14, 130.00, '2024-11-28', '2024-12-03','Warszawa-Wschodnia', '15:00:00', 'Jelenia Góra','22:00:00', '07:00:00',595, 1, 16, NULL, NULL, 'Zarezerwowano'),

(6, 17, 61.2, '2024-11-29', '2024-11-30','Wroc³aw', '10:30:00', 'Gdynia','14:30:00', '04:00:00', 430, 4, 22, 51, 'Zni¿ka dla studentów', 'Anulowano'), 

(9, 11, 51.00, '2024-11-29', '2024-12-02', 'Wroc³aw', '15:00:00','Zamoœæ', '22:35:00', '06:35:00', 545, 11, 56, 51, 'Zni¿ka dla studentów', 'Zarezerwowano'), 
(8, 13, 20.00, '2024-11-29', '2024-12-01', 'Sêdziszów','18:00:00', 'Kraków-G³ówny','02:23:00', '02:23:00',  65, NULL, NULL, NULL, NULL, 'Zarezerwowano'),
	(6, 6, 120, '2024-11-29', '2024-11-30','Wroc³aw', '10:30:00', 'Gdynia','15:30:00', '04:00:00', 430, 3, 34, NULL, NULL, 'Zarezerwowano'),
 (10, 17, 130.00, '2024-11-29', '2024-12-05', 'Jelenia Góra', '08:00:00', 'Warszawa Wschodnia','15:00:00', '08:00:00', 595, 5, 11,NULL,NULL, 'Zarezerwowano'),

(11, 9, 51.00, '2024-11-30', '2024-11-30', 'Zamoœæ', '11:00:00', 'Wroc³aw','17:35:00', '08:00:00', 545, 1, 41,51,'Zni¿ka dla studentów', 'Zarezerwowano'),


 (12, 10, 51.00, '2024-11-30', '2024-12-01', 'Zamoœæ', '11:00:00', 'Wroc³aw','17:35:00', '08:00:00', 545, 2, 21,51,'Zni¿ka dla studentów', 'Zarezerwowano'),


 (13, 12, 20.00, '2024-11-30', '2024-12-01', 'Kraków-G³ówny', '15:22:00', 'Sêdziszów','17:45:00', '02:23:00', 65, NULL, NULL,NULL,NULL, 'Zarezerwowano'),


(14, 14, 130.00, '2024-12-01', '2024-12-03', 'Warszawa Wschodnia', '15:00:00', 'Jelenia Góra','22:00:00', '07:00:00', 595, 5, 33,NULL,NULL, 'Zarezerwowano'),
(3, 14, 130.00, '2024-12-01', '2024-12-03', 'Warszawa Wschodnia', '15:00:00', 'Jelenia Góra','22:00:00', '07:00:00', 595, 4, 22,NULL,NULL, 'Anulowano');


CREATE TABLE Platnosci (
    ID_platnosci INT IDENTITY PRIMARY KEY,
    ID_rezerwacji INT NOT NULL,
    Kwota DECIMAL(10,2) NOT NULL,
    Metoda_platnosci NVARCHAR(50) NOT NULL, 
    Data_platnosci DATE NOT NULL,
    FOREIGN KEY (ID_rezerwacji) REFERENCES Rezerwacje_biletow(ID_rezerwacji)
);

INSERT INTO Platnosci 
VALUES 
(1,35.60, 'Blik', '2024-11-27'), 
(2,29.90, 'P³atnoœæ przelewem', '2024-11-27'), 
(3,38.15, 'Blik', '2024-11-27'),
(4,40.00, 'P³atnoœæ przelewem', '2024-11-28'),
(5,130.00, 'Blik', '2024-11-28'),
(6,61.2, 'BLIK', '2024-11-29'),
(7,51.00, 'Blik', '2024-11-29'),
(8,20.00, 'P³atnoœæ przelewem', '2024-11-29'),
(9,120, 'Blik', '2024-11-29'),
(10,130, 'P³atnoœæ przelewem', '2024-11-29'),
(11,51.00, 'Blik', '2024-11-30'),
(12,51.00, 'P³atnoœæ przelewem', '2024-11-30'),
(13,20.00, 'Blik', '2024-11-30'),
(14,13.00, 'Blik', '2024-12-01');


CREATE TABLE Anulowanie_biletu (
    ID_anulowania INT IDENTITY PRIMARY KEY, 
    ID_rezerwacji INT NOT NULL,                
    Powód_anulowania NVARCHAR(255),   
    Data_anulowania DATE NOT NULL,        
    Zwrot_kwoty DECIMAL(10, 2) NOT NULL,     
    Status_zwrotu NVARCHAR(50),                
    FOREIGN KEY (ID_rezerwacji) REFERENCES Rezerwacje_biletow(ID_rezerwacji) 
);

INSERT INTO Anulowanie_biletu 
VALUES 
 (1, 'Zmiana planów podró¿y', '2024-11-28', 32.04, 'Zatwierdzony'),
 (6, 'Zmiana planów podró¿y', '2024-11-30', 61.2, 'Zatwierdzony'),
 (15, 'Zmiana planów podró¿y', '2024-12-02', 130.00, 'Zatwierdzony');



select rb.ID_rezerwacji, rb.ID_rozkladu, rb.Stacja_poczatkowa, rb.Stacja_koncowa, r.Odleg³oscKm, r.CenaCa³kowita
from Rezerwacje_biletow rb 
join Rozklad r on rb.ID_rozkladu = r.ID_rozkladu

update Rozklad
set Odleg³oscKm = 35
where ID_rozkladu = 4

update Rozklad
set Odleg³oscKm = 65
where ID_rozkladu = 12