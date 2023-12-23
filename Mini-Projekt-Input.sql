-- DDL
drop table Adresse cascade;
drop table person cascade;
drop table kunde cascade;
drop table mitarbeiter cascade;
drop table Medium cascade;
drop table Film cascade;
drop table Video cascade;
drop table Verleih cascade;
drop table Rechnung cascade;
drop table rechnungsposition cascade; 
drop table bewertungen cascade;

create table Adresse
(
    A_ID int,
    Straße varchar(255) not null,
    Hausnummer varchar(10) not null,
    PLZ varchar(10) not null,
    Ort varchar(255) not null,
    primary key (A_ID)
   );
--isa (Variante2)
--create table Person
--(
--    P_ID int not null,
--    Vorname varchar(255) not null,
--    Nachname varchar(255) not null,
--    Geburtsdatum date not null,
--    Email varchar(255),
--    Telefonnummer varchar(255) not null,
--    A_ID int references Adresse(A_ID),
--    primary key (P_ID)
--   );

create table Kunde
(
    P_K_ID int,
    Vorname varchar(255) not null,
    Nachname varchar(255) not null,
    Geburtsdatum date not null,
    Email varchar(255),
    Telefonnummer varchar(255) not null,
    A_ID int references Adresse(A_ID),
    Registrierungsdatum date not null,
    Rabatt decimal(3,2) default 0.00,
    primary key (P_K_ID)
   );

create table Mitarbeiter
(	
	P_M_ID int,
    Vorname varchar(255) not null,
    Nachname varchar(255) not null,
    Geburtsdatum date not null,
    Email varchar(255),
    Telefonnummer varchar(255) not null,
    A_ID int references Adresse(A_ID),
    Eintrittsdatum date not null,
    Gehalt decimal(10,2) not null,
    Vorgesetzter int references Mitarbeiter(P_M_ID),
    primary key (P_M_ID)
    );
   
create table Film
(
	F_ID int,
    Titel varchar(255) not null,
    Erscheinungsjahr int,
    Laufzeit int not null,
    FSK int not null,
    Genre varchar(255) not null,
    Regisseur varchar(255),
    primary key (F_ID)
   );

create table Medium
(
    M_ID int,
    Typ varchar(255) not null,
    Info varchar(255),
    primary key (M_ID)
    );

create table Video
(
	V_ID serial primary key,
    F_ID int,
    M_ID int,
    Preis decimal(4,2) not null,
    constraint FK_F foreign key (F_ID) references Film(F_ID),
	constraint FK_M foreign key (M_ID) references Medium(M_ID),
	constraint PK_F_M unique (F_ID,M_ID)
	);


CREATE TABLE Verleih
(
    Verleih_ID serial,
    K_ID int references Kunde(P_K_ID) not null,
    M_ID int references Mitarbeiter(P_M_ID) not null,
    V_ID int references Video(V_ID) not null,
    Ausleihdatum date not null,
    Verleihstatus varchar(255) not null,
    CONSTRAINT PK primary key (Verleih_ID),
    CONSTRAINT U_D unique (V_ID, Ausleihdatum),
   	CONSTRAINT CK_Status_Werte CHECK (Verleihstatus IN ('Ausgeliehen', 'Verfügbar'))
   );


create Table Rechnung
(
    R_ID serial primary key,
    Rechnungsdatum date not null,
    Gesamtpreis decimal(7,2) 
   );
  

 CREATE TABLE Rechnungsposition
(
    RPnr serial unique not null,
    Verleih_ID int not null,
    Text varchar(255),
    Rückgabedatum date not null,
    Anzahl int,
    Gesamtpreis decimal(7,2),
    R_ID int,
	CONSTRAINT FK_Rechnungsposition_R FOREIGN KEY (R_ID) REFERENCES Rechnung (R_ID),
    CONSTRAINT PK_Rechnungsposition PRIMARY KEY (R_ID, RPnr),
    CONSTRAINT FK_Rechnungsposition_Verleih FOREIGN KEY (Verleih_ID) REFERENCES Verleih (Verleih_ID)
);

create table Bewertungen
(	
	B_ID serial primary key,
    F_ID int not null,
    K_ID int not null,
    Bewertung int not null,
    Kommentar varchar(255),
    constraint FK_V foreign key (F_ID) references Film(F_ID),
    constraint FK_K foreign key (K_ID) references Kunde(P_K_ID),
    constraint PK_F_K unique (F_ID,K_ID)
);
   


   
--DML


-- inserts Adressen


INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (1, 'Musterstraße', '1', '12345', 'Musterstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (2, 'Hauptstraße', '10', '54321', 'Stadtbeispiel');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (3, 'Am Park', '5', '98765', 'Parkstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (4, 'Bahnhofstraße', '12', '67890', 'Zentralstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (5, 'Marktplatz', '3', '45678', 'Handelsstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (6, 'Bergstraße', '8', '54321', 'Bergstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (7, 'Seestraße', '15', '87654', 'Seestadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (8, 'Gartenweg', '6', '23456', 'Gartenstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (9, 'Schlossallee', '2', '34567', 'Schlossstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (10, 'Feldweg', '7', '78901', 'Feldstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (11, 'Dorfstraße', '4', '56789', 'Dorfstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (12, 'Industriestraße', '9', '90123', 'Industriestadt');



-- inserts Kunden

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (1, 'Max', 'Mustermann', '1990-01-15', 'max.mustermann@example.com', '123456789', 1, '2022-03-01', 0.10);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (2, 'Maria', 'Musterfrau', '1985-07-25', 'maria.musterfrau@example.com', '987654321', 2, '2021-11-18', 0.05);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (3, 'John', 'Doe', '1995-04-02', 'john.doe@example.com', '456789123', 3, '2023-01-10', 0.15);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (4, 'Laura', 'Schmidt', '1988-09-12', 'laura.schmidt@example.com', '321654987', 4, '2022-07-22', 0.20);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (5, 'Thomas', 'Müller', '1993-12-28', 'thomas.mueller@example.com', '789654123', 1, '2023-05-05', 0.10);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (6, 'Julia', 'Schneider', '1991-06-20', 'julia.schneider@example.com', '456123789', 1, '2021-09-09', 0.05);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (7, 'Michael', 'Becker', '1987-03-08', 'michael.becker@example.com', '789123456', 1, '2022-02-14', 0.10);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (8, 'Anna', 'Wagner', '1990-11-05', 'anna.wagner@example.com', '321987654', 2, '2023-04-30', 0.15);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (9, 'Daniel', 'Hoffmann', '1986-02-17', 'daniel.hoffmann@example.com', '654321789', 2, '2022-11-07', 0.20);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (10, 'Lisa', 'Schulz', '1994-08-23', 'lisa.schulz@example.com', '987123654', 3, '2021-12-12', 0.10);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (11, 'Markus', 'Koch', '1989-05-09', 'markus.koch@example.com', '654789123', 4, '2023-02-28', 0.05);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (12, 'Sophie', 'Schmidt', '1992-10-18', 'sophie.schmidt@example.com', '321789654', 5, '2022-08-17', 0.15);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (13, 'Sebastian', 'Meyer', '1997-01-03', 'sebastian.meyer@example.com', '789321654', 6, '2021-10-25', 0.20);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (14, 'Laura', 'Schulz', '1985-07-30', 'laura.schulz@example.com', '123789456', 7, '2023-05-15', 0.10);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (15, 'Alexander', 'Wolf', '1990-04-22', 'alexander.wolf@example.com', '456789321', 8, '2022-03-08', 0.05);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (16, 'Emma', 'Schneider', '1987-09-10', 'emma.schneider@example.com', '789321456', 9, '2021-11-30', 0.15);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (17, 'David', 'Becker', '1993-12-18', 'david.becker@example.com', '321654789', 10, '2022-07-12', 0.20);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (18, 'Sophia', 'Wagner', '1991-05-28', 'sophia.wagner@example.com', '654987321', 11, '2023-04-22', 0.10);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (19, 'Paul', 'Hoffmann', '1988-03-12', 'paul.hoffmann@example.com', '987321654', 12, '2022-12-05', 0.05);

INSERT INTO Kunde (P_K_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Registrierungsdatum, Rabatt)
VALUES (20, 'Emma', 'Schulz', '1995-11-05', 'emma.schulz@example.com', '321654987', 12, '2023-05-01', 0.10);




-- inserts Mitarbeiter


INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (1, 'Max', 'Mustermann', '1980-01-01', 'max.mustermann@example.com', '123456789', 1, '2020-01-01', 5000.00, NULL);

INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (2, 'Anna', 'Schmidt', '1985-05-10', 'anna.schmidt@example.com', '987654321', 4, '2021-03-15', 4000.00, 1);

INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (3, 'Peter', 'Müller', '1992-09-20', 'peter.müller@example.com', '456789123', 4, '2022-06-01', 3500.00, 1);

INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (4, 'Julia', 'Fischer', '1990-07-15', 'julia.fischer@example.com', '789123456', 6, '2023-02-10', 4500.00, 1);

INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (5, 'Michael', 'Keller', '1988-12-05', 'michael.keller@example.com', '321654987', 8, '2022-11-20', 3800.00, 1);



-- inserts Medium


INSERT INTO Medium (M_ID, Typ, Info)
VALUES (1, 'DVD', 'Dolby Digital 5.1');

INSERT INTO Medium (M_ID, Typ, Info)
VALUES (2, 'Blu-Ray', 'Dolby Digital 7.1');

INSERT INTO Medium (M_ID, Typ, Info)
VALUES (3, 'VHS', 'Dolby Digital 2.0');



--inserts Film


INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (1, 'Inception', 2010, 148, 12, 'Action', 'Christopher Nolan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (2, 'The Shawshank Redemption', 1994, 142, 16, 'Drama', 'Frank Darabont');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (3, 'Pulp Fiction', 1994, 154, 18, 'Crime', 'Quentin Tarantino');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (4, 'The Dark Knight', 2008, 152, 12, 'Action', 'Christopher Nolan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (5, 'Fight Club', 1999, 139, 18, 'Drama', 'David Fincher');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (6, 'Forrest Gump', 1994, 142, 12, 'Drama', 'Robert Zemeckis');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (7, 'The Matrix', 1999, 136, 16, 'Action', 'Lana Wachowski, Lilly Wachowski');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (8, 'Interstellar', 2014, 169, 12, 'Sci-Fi', 'Christopher Nolan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (9, 'The Godfather', 1972, 175, 16, 'Crime', 'Francis Ford Coppola');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (10, 'Inglourious Basterds', 2009, 153, 16, 'War', 'Quentin Tarantino');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (11, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 178, 12, 'Fantasy', 'Peter Jackson');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (12, 'The Lion King', 1994, 88, 0, 'Animation', NULL);

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (13, 'The Avengers', 2012, 143, 12, 'Action', 'Joss Whedon');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (14, 'Gladiator', 2000, 155, 16, 'Action', 'Ridley Scott');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (15, 'Titanic', 1997, 194, 12, 'Drama', 'James Cameron');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (16, 'The Sixth Sense', 1999, 107, 16, 'Mystery', 'M. Night Shyamalan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (17, 'The Silence of the Lambs', 1991, 118, 18, 'Crime', 'Jonathan Demme');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (18, 'The Shining', 1980, 144, 16, 'Horror', 'Stanley Kubrick');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (19, 'The Departed', 2006, 151, 16, 'Crime', 'Martin Scorsese');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (20, 'Jaws', 1975, 124, 16, 'Thriller', 'Steven Spielberg');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (21, 'Jurassic Park', 1993, 127, 12, 'Adventure', 'Steven Spielberg');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (22, 'The Dark Knight Rises', 2012, 164, 12, 'Action', 'Christopher Nolan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (23, 'The Prestige', 2006, 130, 12, 'Drama', 'Christopher Nolan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (24, 'Back to the Future', 1985, 116, 12, 'Adventure', 'Robert Zemeckis');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (25, 'The Green Mile', 1999, 189, 16, 'Drama', 'Frank Darabont');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (26, 'Die Hard', 1988, 132, 18, 'Action', 'John McTiernan');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (27, 'The Godfather: Part II', 1974, 202, 16, 'Crime', 'Francis Ford Coppola');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (28, 'The Social Network', 2010, 120, 12, 'Drama', 'David Fincher');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (29, 'Blade Runner', 1982, 117, 16, 'Sci-Fi', 'Ridley Scott');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (30, 'E.T. the Extra-Terrestrial', 1982, 115, 6, 'Sci-Fi', 'Steven Spielberg');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (31, 'Goodfellas', 1990, 146, 16, 'Crime', 'Martin Scorsese');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (32, 'Raiders of the Lost Ark', 1981, 115, 12, 'Adventure', 'Steven Spielberg');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (33, 'The Terminator', 1984, 107, 18, 'Sci-Fi', 'James Cameron');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (34, 'The Princess Bride', 1987, 98, 6, 'Adventure', 'Rob Reiner');

INSERT INTO Film (F_ID, Titel, Erscheinungsjahr, Laufzeit, FSK, Genre, Regisseur)
VALUES (35, 'Casablanca', 1942, 102, 12, 'Romance', 'Michael Curtiz');



-- Einträge für die Tabelle "Video" mit unterschiedlichen Varianten


INSERT INTO Video (F_ID, M_ID, Preis)
SELECT F_ID, M_ID, 
       CASE
           WHEN M_ID = 2 THEN ROUND((RANDOM() * 5 + 15)::numeric, 2) -- Blu-Ray (teuerste)
           WHEN M_ID = 3 THEN ROUND((RANDOM() * 1 + 1)::numeric, 2) -- VHS (günstigste)
           ELSE ROUND((RANDOM() * 5 + 5)::numeric, 2) -- DVDs und andere Medien
       END AS Preis
FROM generate_series(1, 35) AS F_ID, generate_series(1, 3) AS M_ID;

select * from video;



-- inserts Verleih



INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (1, 1, 1, '2021-12-01', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (2, 2, 2, '2021-12-02','Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (3, 2, 3, '2021-12-02','Ausgeliehen');  

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (4, 2, 3, '2021-12-03', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (3, 2, 3, '2021-12-04','Ausgeliehen');  

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (6, 5, 6, '2021-12-04', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (6, 5, 19, '2021-12-03', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (20, 2, 95, '2021-12-03', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (17, 3, 4, '2021-12-03', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (19, 1, 5, '2021-12-03', 'Ausgeliehen');

INSERT INTO Verleih (K_ID, M_ID, V_ID, Ausleihdatum, Verleihstatus)
VALUES (2, 2, 22, '2021-12-02','Ausgeliehen');

select * from verleih v ;




-- Beispiel-Inserts für die Tabelle "Rechnung" mit Gesamtpreis aus den Rechnungspositionen


INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-01',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-02',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-03',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-04',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-05',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-06',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-07',NULL);
INSERT INTO Rechnung (Rechnungsdatum, Gesamtpreis) VALUES ('2023-05-08',NULL);



-- inserts Rechnungposition


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (1, 'Position ', '2023-05-01', 1);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (2, 'Position ', '2023-05-02', 2);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (11, 'Position ', '2023-05-04', 2);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (3, 'Position ', '2023-05-05', 3);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (5, 'Position ', '2023-05-06', 3);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (4, 'Position', '2023-05-07', 4);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (6, 'Position ', '2023-05-08', 6);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (7, 'Position ', '2023-05-08', 6);


INSERT INTO Rechnungsposition (Verleih_ID, Text, Rückgabedatum, R_ID)
VALUES (9, 'Position ', '2023-05-08', 7);




-- inserts Bewertung

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (1, 1, 5, 'Super Film!');

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (2, 2, 4, 'Guter Film!');

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (3, 3, 3, 'Ganz okay!');

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (4, 4, 2, 'Schlechter Film!');

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (5, 5, 1, 'Sehr schlechter Film!');

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (6, 6, 5, 'Super Film!');

INSERT INTO Bewertungen (F_ID,K_ID, Bewertung, Kommentar)
VALUES (6, 12, 1, 'Nicht Gut');


--Abfragen

select * from film f ;
select * from medium m ;
select * from mitarbeiter m ;
select * from kunde k  ;
select * from adresse a ;
select * from video ;
select * from verleih v ;
select * from rechnung r ;
select * from rechnungsposition r ;
select * from bewertungen ;

-- update von Tabellen

-- Dauer des Verleihs
UPDATE Rechnungsposition
SET Anzahl = DATE_PART('day', Rückgabedatum - (SELECT Ausleihdatum FROM Verleih WHERE Verleih_ID = rechnungsposition.verleih_id)::timestamp);

-- Berechnet den Preis
update rechnungsposition 
set Gesamtpreis = Anzahl * (SELECT Preis FROM Video WHERE V_ID = (SELECT V_ID FROM Verleih WHERE Verleih_ID = rechnungsposition.verleih_id));

-- Berücksichtigt Rabatt
UPDATE Rechnungsposition
SET Gesamtpreis = Gesamtpreis * (1 - (SELECT Rabatt FROM Kunde WHERE P_K_ID = (SELECT K_ID FROM Verleih WHERE Verleih_ID = Rechnungsposition.Verleih_ID)))
WHERE R_ID IN (SELECT R_ID FROM Rechnung);

-- Summiert alle Rechnugsposition eines Kunden zur Gesamtsumme
update rechnung 
SET Gesamtpreis = (SELECT SUM(Gesamtpreis) FROM Rechnungsposition WHERE R_ID = rechnung.R_ID);
