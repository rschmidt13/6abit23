-------------------------------------------------------------------------------------------------------------------------
|----------------------------------------------DDL fuer RentaCar---------------------------------------------------------|
-------------------------------------------------------------------------------------------------------------------------
--DROP TABLES:

drop table if exists Fuehrerschein cascade;
drop table if exists Vermietung cascade;
drop table if exists Kunde cascade;
drop table if exists Standardfahrzeug cascade;
drop table if exists Luxusfahrzeug cascade;
drop table if exists Fahrzeuge cascade;
drop table if exists Versicherung cascade;
drop table if exists Sachbearbeiter cascade;
drop table if exists Autovermieter cascade;

-------------------------------------------------------------------------------------------------------------------------

--CREATE TABLE Autovermieter:

create table Autovermieter(
    AV_ID serial primary key,
    AV_Name varchar(255),
    AV_PLZ int,
    AV_Ort varchar(255),
    AV_Adresse varchar(255)
);


--CREATE TABLE Sachbearbeiter:

create table Sachbearbeiter(
    SB_ID serial primary key,--technischer schluessel
    SB_Vorname varchar(255),
    SB_Nachname varchar(255),
    SB_Telefonnummer decimal(11,0),
    SB_Email varchar(255),
    SB_SVNr decimal(10,0),
    FK_AV_ID int references Autovermieter(AV_ID) on update cascade, --on delete cascade,
    constraint PK_SB unique (FK_AV_ID,SB_ID) --fachlicher schluessel
);

--CREATE TABLE Fahrzeuge:

create table Fahrzeuge(
    FZ_ID int not null,--schluesselkandidat
    FZ_Typ varchar(255) not null,--schluesselkandidat 
    FZ_Bezeichnung varchar(255),
    FZ_Markenname varchar(255),
    FZ_Farbe varchar(255),
    FZ_Baujahr int,
    FZ_PS int,
    FZ_Kilometerstand int,
    FZ_Kennzeichen varchar(255),
    FZ_Preis_pro_Tag float,
    FZ_Verfuegbar varchar(255),
    FK_SB_ID int references Sachbearbeiter(SB_ID) on update cascade, --on delete cascade,
    constraint PK_FZ unique (FK_SB_ID,FZ_ID), --technischer schlüssel
    constraint CHK_FZ_Typ check (FZ_Typ = 'Luxusfahrzeug' or FZ_Typ = 'luxusfahrzeug' or FZ_Typ = 'Standardfahrzeug' or FZ_Typ = 'standardfahrzeug' or FZ_Typ = 'Standard' or FZ_Typ = 'Luxus'),
    constraint CHK_FZ_Verfuegbar check (FZ_Verfuegbar = 'Ja' or FZ_Verfuegbar = 'JA'),
    primary key (FZ_ID, FZ_Typ) --fachlicher schluessel
);

--is a disjunkt Umsetzung zwischen Fahrzeuge - Luxusfahrzeug/Standardfahrzeug über (FZ_ID,FZ_Typ)

--CREATE TABLE Luxusfahrzeug:

create table Luxusfahrzeug(
    LUX_FZ_ID int not null,
    LUX_FZ_Typ varchar(255) not null,
    constraint FK_LUX_FZ foreign key (LUX_FZ_ID, LUX_FZ_Typ) references Fahrzeuge(FZ_ID, FZ_Typ) on delete cascade, --on update cascade
    constraint PK_LUX_FZ primary key (LUX_FZ_ID, LUX_FZ_Typ),--primary key vererbt von Fahrzeuge
    constraint CHK_LUX_FZ check (LUX_FZ_Typ = 'Luxusfahrzeug' or LUX_FZ_Typ= 'luxusfahrzeug')
);

--CREATE TABLE Standardfahrzeug:

create table Standardfahrzeug(
    STD_FZ_ID int unique not null,
    STD_FZ_Typ varchar(255) not null,
    constraint FK_STD_FZ foreign key (STD_FZ_ID, STD_FZ_Typ) references Fahrzeuge(FZ_ID, FZ_Typ) on delete cascade, --on update cascade
    constraint PK_STD_FZ primary key (STD_FZ_ID, STD_FZ_Typ),--primary key vererbt von Fahrzeuge
    constraint CHK_STD_FZ check (STD_FZ_Typ = 'Standardfahrzeug' OR STD_FZ_Typ = 'standardfahrzeug' or STD_FZ_Typ = 'Standard')
);

--CREATE TABLE Versicherung:

create table Versicherung(
    Ver_PolizzenNr varchar(255) primary key,
    Ver_Anstalt varchar(255),
    Ver_DeckungBis float,
    Ver_Jahrespraemie float,
    Ver_Art varchar(255),
    FK_FZ_ID int unique not null,
    constraint FK_Ver_FZ foreign key (FK_FZ_ID) references Fahrzeuge (FZ_ID) on delete cascade --on update cascade
);


--CREATE TABLE Vermietung(M:N-Aufloesung):

create table Vermietung(
    V_ID serial primary key,--faclicher schluessel
    V_Startdatum date not null,
    V_Enddatum date not null, 
    FK_FZ_ID int references Fahrzeuge(FZ_ID) on update cascade, --on delete cascade,
    FK_K_ID int references Kunde(K_ID) on update cascade, --on delete cascade,
    constraint PK_V unique (FK_FZ_ID, FK_K_ID,V_Startdatum,V_Enddatum),--T.S. + Ausleihschutz: Kunde kann nicht gleiches Auto zur selben Zeit ausleihen 
    constraint FZ_Autoschutz unique (FK_FZ_ID, V_Startdatum, V_Enddatum), --Autoschutz: Auto kann nicht zur selben Zeit an mehrere Kunden ausgeliehen werden
    constraint FZ_Autoschutz2 unique (FK_K_ID, V_Startdatum, V_Enddatum)--Kunde kann kein Auto für die Dauer der Vermietung nochmals mieten
);

alter table vermietung add constraint FZ_Autoschutz3 unique (V_Startdatum,FK_FZ_ID,FK_K_ID);--Ein Auto kann nicht vom selben Kunden am gleichen Tag gemietet werden
alter table vermietung add constraint FZ_Autoschutz4 unique (V_Enddatum,FK_FZ_ID,FK_K_ID);--Ein Auto kann nicht vom selben Kunden am gleichen Tag gemietet werden


--CREATE TABLE Kunde:

create table Kunde(
    K_ID serial primary key,
    K_Vorname varchar(255),
    K_Nachname varchar(255),
    K_Geburtsdatum date,
    K_Telefonnummer varchar(255),
    K_Email varchar(255),
    K_PLZ int,
    K_Ort varchar(255),
    K_Adresse varchar(255)
    constraint CHK_Volljaehrig check (K_Geburtsdatum < (current_date - interval '18 years')) -- Volljaehrigkeit ueberpruefen
);

--CREATE TABLE Fuehrerschein:

create table Fuehrerschein(
  FS_Nr int unique not null,
  FS_Ausstellungsdatum date,
  FS_Gueltigbis date,
  FS_AusstellendeBehoerde varchar(255),
  FK_K_ID int references Kunde(K_ID) on delete cascade, --on update cascade,
  constraint PK_FS primary key (FK_K_ID, FS_Nr)
);

--alter table Fuehrerschein add constraint CHK_Gueltigkeit check (FS_Gueltigbis != current_date); -- muss spaeter noch eingebaut werden

-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
