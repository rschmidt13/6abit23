-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
|----------------------------------------------DDL fuer RentaCar---------------------------------------------------------|
-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
--Inserts Autovermieter:

--5 x verschiedene Autovermieter

insert into Autovermieter (AV_Name, AV_PLZ, AV_Ort, AV_Adresse) values ('Avis Autovermietung Salzburg', 5020, 'Salzburg', 'Innsbrucker Bundesstraße 95');
insert into Autovermieter (AV_Name, AV_PLZ, AV_Ort, AV_Adresse) values ('Sixt Autovermietung Salzburg', 5020, 'Salzburg', 'Sterneckstraße 55');
insert into Autovermieter (AV_Name, AV_PLZ, AV_Ort, AV_Adresse) values ('Europacar Salzburg', 5020, 'Salzburg', 'Sterneckstraße 38');
insert into Autovermieter (AV_Name, AV_PLZ, AV_Ort, AV_Adresse) values ('Hertz Autovermietung Salzburg', 5020, 'Salzburg', 'Sterneckstraße 19');
insert into Autovermieter (AV_Name, AV_PLZ, AV_Ort, AV_Adresse) values ('Buchbinder Autovermietung', 5020, 'Salzburg', 'Münchner Bundesstraße 10');

-------------------------------------------------------------------------------------------------------------------------
--Inserts Sachbearbeiter:

-- 3 x Sachbearbeiter Avis Autovermietung Salzburg
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Markus', 'Hauthaler', 06606622060, 'markus.hauthaler@avis.at', 3765220270, 1);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Konrad', 'Zuse', 06606622061, 'konrad.zuser@avis.at', 3765031185, 1);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Alexander', 'Dornbacher', 06606622062, 'alexander.dornbacher@avis.at', 3765050578, 1);

--3x Sachbearbeiter Sixt Autovermietung Salzburg
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Stefanie', 'Mueller', 06624040111, 'stefanie.mueller@sixtsbg.at', 6469021195, 2);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Leon', 'Marx', 06624040112, 'leon.marx@sixtsbg.at', 6469012080, 2);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Stefanie', 'Mueller', 06624040111, 'stefanie.mueller@sixtsbg.at', 6469021195, 2);

--3x Sachbearbeiter Europacar Salzburg
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Georg', 'Huber', 0665550550, 'georg.huber@eurocar.at', 6566090570, 3);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Hermine', 'Wintersteller', 0665550551, 'hermine.wintersteller@eurocar.at', 6566201080, 3);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Harald', 'Drazansky', 0665550552, 'harry.drazansky@eurocar.at', 6566120878, 3);

--3x Sachbearbeiter Hertz Autovermietung
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Lukas', 'Hertz', 06641010100, 'lukashertz@hertz.at', 3665120395, 4);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Sandra', 'Fischer', 06641010101, 'sandrafischer@hertz.at', 3665311289, 4);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Christoph', 'Hermannseder', 06641010102, 'christophhermannseder@hertz.at', 3665010193, 4);

--3x Sachbearbeiter Buchbinder Autovermietung
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Sebastian', 'Langascheck', 06507772700, 'sebsastian.langascheck@buchbinder.at', 4450120488, 5);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Gertrud', 'Pichler', 06507772701, 'gertrud.pichler@buchbinder.at', 4450030674, 5);
insert into sachbearbeiter (SB_Vorname, SB_Nachname, SB_Telefonnummer, SB_Email, SB_SVNr, FK_AV_ID)
values ('Willhelm', 'Portenkirchner', 06507772700, 'willhelm.portenkirchner@buchbinder.at', 4450140270, 5);



-------------------------------------------------------------------------------------------------------------------------

--Inserts Fahrzeuge:

--Pro Autovermieter 9 Fahrzeuge
--Pro Sachbearbeiter 3 Fahrzeuge = Summe 3x3x5
-------------------------------------------------------------------------------------------------------------------------
--Autovermieter Avis nur Luxusfahrzeuge:

--3xFahrzeuge von Autovermieter Avis-SB1
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(1,'luxusfahrzeug','Audi','RS6', 'rot',2022,700,15000,'S-100-SX',299.99,'Ja',1);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(2,'luxusfahrzeug','Rolls','Royce', 'diamantweiss',2020,600,5300,'S-101-SX',399.99,'Ja',1);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(3,'luxusfahrzeug','Lamborghini','Urus', 'giftgrün',2023,650,29000,'S-102-SX',349.99,'Ja',1);

--3xFahrzeuge von Autovermieter Avis-SB2
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(4,'luxusfahrzeug','Audi','R8', 'weiß',2019,800,3000,'S-103-SX',299.99,'Ja',2);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(5,'luxusfahrzeug','Audi','R8', 'diamantweiss',2020,800,7200,'S-104-SX',299.99,'Ja',2);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(6,'luxusfahrzeug','Ferrari','LaFerrari', 'rot',2021,480,18000,'S-105-SX',349.99,'Ja',2);

--3xFahrzeuge von Autovermieter Avis-SB3
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(7,'luxusfahrzeug','McLarren','M20', 'grau',2022,750,15000,'S-106-SX',399.99,'Ja',3);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(8,'luxusfahrzeug','Nissan','GT', 'neonblau',2020,650,33000,'S-107-SX',349.99,'Ja',3);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(9,'luxusfahrzeug','Lamborghini','Huracan', 'gelb',2023,650,29000,'S-108-SX',349.99,'Ja',3);
----------------------------------------------------------------------------------------------------------------------------------

--Autovermieter2 Sixt vermietet nur Standardfahrzeuge:

--3xFahrzeuge von Autovermieter Sixt-SB4
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(10,'standardfahrzeug','Audi','A6', 'weiss',2020,140,51300,'S-200-ST',99.99,'Ja',4);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(11,'standardfahrzeug','Audi','A4', 'metallicschwarz',2020,140,4889,'S-201-ST',99.99,'Ja',4);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(12,'standardfahrzeug','VW','Golf 7', 'grau',2017,110,22120,'S-202-ST',79.99,'Ja',4);

--3xFahrzeuge von Autovermieter Sixt-SB5
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(13,'standardfahrzeug','Hyundai','i30', 'grau',2023,150,73335,'S-203-ST',69.99,'Ja',5);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(14,'standardfahrzeug','Ford','Focus', 'blau',2020,150,989,'S-204-ST',59.99,'Ja',5);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(15,'standardfahrzeug','VW','Golf 8', 'schwarz',2023,110,4400,'S-205-ST',99.99,'Ja',5);

--3xFahrzeuge von Autovermieter Sixt-SB6
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(16,'standardfahrzeug','VW','Passat', 'grau',2019,140,13300,'S-206-ST',79.99,'Ja',6);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(17,'standardfahrzeug','VW','Passat', 'metallicschwarz',2020,180,16469,'S-207-ST',89.99,'Ja',6);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(18,'standardfahrzeug','Audi','A4', 'grau',2018,140,24240,'S-208-ST',79.99,'Ja',6);
------------------------------------------------------------------------------------------------------------------------------------

--Autovermieter3 Europacar vermietet nur Standardfahrzeuge:

--3xFahrzeuge von Autovermieter Europacar-SB7
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(19,'standardfahrzeug','Seat','Ibiza', 'gelb',2019,110,9310,'S-000-EC',59.99,'Ja',7);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(20,'standardfahrzeug','Seat','Ibiza', 'blau',2019,110,93610,'S-001-EC',59.99,'Ja',7);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(21,'standardfahrzeug','Seat','Ibiza', 'rot',2019,110,1560,'S-002-EC',59.99,'Ja',7);

--3xFahrzeuge von Autovermieter Europacar-SB8
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(22,'standardfahrzeug','Skoda','Super B', 'weiß',2018,150,3310,'S-003-EC',39.99,'Ja',8);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(23,'standardfahrzeug','Skoda','Super B', 'weiss',2019,150,34610,'S-004-EC',89.99,'Ja',8);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(24,'standardfahrzeug','Skoda','Super B', 'weiß',2019,110,1560,'S-005-EC',39.99,'Ja',8);

--3xFahrzeuge von Autovermieter Europacar-SB9
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(25,'standardfahrzeug','VW','Polo', 'weiß',2018,90,3310,'S-006-EC',39.99,'Ja',9);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(26,'standardfahrzeug','VW','Polo', 'grau',2017,90,93610,'S-007-EC',39.99,'Ja',9);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(27,'standardfahrzeug','VW','Polo', 'rot',2019,90,63,'S-008-EC',39.99,'Ja',9);
-----------------------------------------------------------------------------------------------------------------------------------

--Autovermieter4 Hertz vermietet nur Luxusfahrzeuge:

--3xFahrzeuge von Autovermieter Hertz-SB10
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(28,'luxusfahrzeug','Bugatti','Veron', 'stratosblau',2020,1100,2672,'S-000-HZ',299.99,'Ja',10);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(29,'luxusfahrzeug','Bugatti','Chiron', 'perlweiß',2020,1100,17456,'S-999-HZ',299.99,'Ja',10);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(30,'luxusfahrzeug','Bugatti','Veron', 'türkis',2020,1100,9622,'S-333-HZ',299.99,'Ja',10);

--3xFahrzeuge von Autovermieter Hertz-SB11
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(31,'luxusfahrzeug','Mercedes-Benz','S-63-AMG-Coupe', 'matt-schwarz',2022,650,7672,'S-001-HZ',199.99,'Ja',11);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(32,'luxusfahrzeug','Ford','Mustang', 'gelb',2022,650,13456,'S-998-HZ',199.99,'Ja',11);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(33,'luxusfahrzeug','BMW','M4', 'weiss',2022,275,1062,'S-334-HZ',149.99,'Ja',11);

--3xFahrzeuge von Autovermieter Hertz-SB12
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(34,'luxusfahrzeug','Audi A6','Limousine ', 'matt-schwarz',2022,180,78637,'S-002-HZ',99.99,'Ja',12);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(35,'luxusfahrzeug','Audi A6','Limousine ', 'matt-schwarz',2022,180,43697,'S-002-HZ',99.99,'Ja',12);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(36,'luxusfahrzeug','Audi A6','Limousine ', 'matt-schwarz',2022,180,49757,'S-002-HZ',99.99,'Ja',12);
-----------------------------------------------------------------------------------------------------------------------------------

--Autovermieter5 Buchbinder vermietet Luxus und Standardfahrzeuge:

--3xFahrzeuge von Autovermieter Buchbinder-SB13
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(37,'standardfahrzeug','VW','Passat', 'matt-schwarz',2022,180,237,'S-000-BB',89.99,'Ja',13);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(38,'standardfahrzeug','VW','Passat', 'matt-schwarz',2022,180,8837,'S-001-BB',89.99,'Ja',13);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(39,'standardfahrzeug','VW','Passat', 'matt-schwarz',2022,180,4337,'S-002-BB',89.99,'Ja',13);

--3xFahrzeuge von Autovermieter Buchbinder-SB14
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(40,'standardfahrzeug','VW','Passat', 'grau',2022,180,3457,'S-003-BB',89.99,'Ja',14);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(41,'standardfahrzeug','VW','Passat', 'grau',2022,180,83837,'S-004-BB',89.99,'Ja',14);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(42,'standardfahrzeug','VW','Passat', 'grau',2022,180,44337,'S-005-BB',89.99,'Ja',14);

--3Fahrzeuge von Autovermieter Buchbinder-SB15
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(43,'luxusfahrzeug','Porsche','911','schwarz',2022,390,1197,'S-006-BB',189.99,'Ja',15);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(44,'luxusfahrzeug','Porsche','911','schwarz',2022,390,84497,'S-006-BB',189.99,'Ja',15);
insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(45,'luxusfahrzeug','Porsche','911','schwarz',2022,390,86197,'S-006-BB',189.99,'Ja',15);
-----------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------

--Inserts Luxusfahrzeug:

--Alle Luxusfahrzeuge in der Luxusfahrzeugtabelle => Summe 9+9+3=21
--Luxusfahrzeuge von Autovermieter Avis(1-9) / SB(1-3):
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (1,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (2,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (3,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (4,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (5,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (6,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (7,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (8,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (9,'luxusfahrzeug');

--Luxusfahrzeuge von Autovermieter Hertz(28-36)/ SB(10-12):
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (28,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (29,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (30,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (31,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (32,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (33,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (34,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (35,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (36,'luxusfahrzeug');

--Luxusfahrzeuge von Autovermieter Buchbinder(43-45) / SB(15):
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (43,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (44,'luxusfahrzeug');
insert into luxusfahrzeug (LUX_FZ_ID,LUX_FZ_Typ) values (45,'luxusfahrzeug');


-----------------------------------------------------------------------------------------------------------------------------------

--Inserts Standardfahrzeug:

--Alle Standardfahrzeuge in der Standardfahrzeugtabekke => Summe 9+9+6=24
--Standardfahrzeuge von Autovermieter Sixt(10-18) /SB(4-6):
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (10,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (11,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (12,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (13,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (14,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (15,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (16,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (17,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (18,'standardfahrzeug');

--Standardfahrzeuge von Autovermieter Europacar(19-27)/SB(7-9):
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (19,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (20,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (21,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (22,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (23,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (24,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (25,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (26,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (27,'standardfahrzeug');

--Standardfahrzeuge von Autovermieter Buchbinder(37-42)/SB(13-14):
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (37,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (38,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (39,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (40,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (41,'standardfahrzeug');
insert into standardfahrzeug (STD_FZ_ID,STD_FZ_Typ) values (42,'standardfahrzeug');


-----------------------------------------------------------------------------------------------------------------------------------

--Inserts Versicherung:

--Luxusfahrzeuge von Autovermieter1-Avis (1-9):
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200100','UNIQA',20000000.0,2400,'Vollkasko',1);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200101','UNIQA',20000000.0,3500,'Vollkasko',2);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200102','UNIQA',20000000.0,3000,'Vollkasko',3);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200103','UNIQA',20000000.0,2800,'Vollkasko',4);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200104','UNIQA',20000000.0,2800,'Vollkasko',5);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200105','UNIQA',20000000.0,4000,'Vollkasko',6);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200106','UNIQA',20000000.0,2400,'Vollkasko',7);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200107','UNIQA',20000000.0,3500,'Vollkasko',8);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('U-2023-100200108','UNIQA',20000000.0,3000,'Vollkasko',9);

--Nur Standardfahrzeuge von Autovermieter2-Sixt(10-18):
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-100','Generali',15000000.0,1400,'Vollkasko',10);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-101','Generali',15000000.0,1750,'Vollkasko',11);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-102','Generali',15000000.0,3000,'Vollkasko',12);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-103','Generali',15000000.0,1350,'Vollkasko',13);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-104','Generali',15000000.0,1650,'Vollkasko',14);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-105','Generali',15000000.0,1700,'Vollkasko',15);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-106','Generali',15000000.0,1400,'Vollkasko',16);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-107','Generali',15000000,1560,'Vollkasko',17);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('GEN-2023-111-222-108','Generali',20000000.0,1750,'Vollkasko',18);

--Nur Standardfahrzeuge von Autovermieter3-Europacar(19-27):
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-991-366-101','Wuestenrot',15000000.0,1350,'Vollkasko',19);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-991-367-101','Wuestenrot',15000000.0,1350,'Vollkasko',20);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-991-368-102','Wuestenrot',15000000.0,1350,'Vollkasko',21);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-992-460-103','Wuestenrot',15000000.0,1500,'Vollkasko',22);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-992-461-104','Wuestenrot',15000000.0,1500,'Vollkasko',23);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-992-462-105','Wuestenrot',15000000.0,1500,'Vollkasko',24);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-993-563-101','Wuestenrot',15000000.0,1290,'Vollkasko',25);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-993-563-102','Wuestenrot',15000000.0,1290,'Vollkasko',26);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('WR-2023-993-563-103','Wuestenrot',20000000.0,1290,'Vollkasko',27);

--Nur Luxusfahrzeuge von Autovermieter4-Hertz(28-36):
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-220','Allianz',20000000.0,3800,'Vollkasko',28);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-221','Allianz',20000000.0,3800,'Vollkasko',29);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-222','Allianz',20000000.0,3800,'Vollkasko',30);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-223','Allianz',20000000.0,2650,'Vollkasko',31);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-224','Allianz',20000000.0,2550,'Vollkasko',32);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-225','Allianz',20000000.0,2300,'Vollkasko',33);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-226','Allianz',20000000.0,2880,'Vollkasko',34);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-227','Allianz',20000000.0,2880,'Vollkasko',35);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('ALZ-2023-333-545-228','Allianz',20000000.0,2880,'Vollkasko',36);

--6xStandardfahrzeuge und 3xLuxusfahrzeuge von Autovermieter5-Buchbinder->(37-42) und (43-45):
--6xStandardfahrzeuge von Buchbinder(37-42):
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('MKI-2023-400-244-400','Muki',15000000.0,2440,'Vollkasko',37);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('MKI-2023-400-244-401','Muki',15000000.0,2440,'Vollkasko',38);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('MKI-2023-400-244-402','Muki',15000000.0,2440,'Vollkasko',39);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('MKI-2023-400-244-403','Muki',15000000.0,2440,'Vollkasko',40);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('MKI-2023-400-244-404','Muki',15000000.0,2440,'Vollkasko',41);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('MKI-2023-400-244-405','Muki',15000000.0,2440,'Vollkasko',42);

--3xLuxusfahrzeuge von Buchbinder(43-45):
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('HDI-2023-500-200-377','HDI-Versicherung',20000000.0,3320,'Vollkasko',43);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('HDI-2023-500-200-378','HDI-Versicherung',20000000.0,3320,'Vollkasko',44);
insert into versicherung (Ver_PolizzenNr,Ver_Anstalt,Ver_DeckungBis,Ver_Jahrespraemie, Ver_Art, FK_FZ_ID)
values ('HDI-2023-500-200-379','HDI-Versicherung',20000000.0,3320,'Vollkasko',45);


-----------------------------------------------------------------------------------------------------------------------------------

--Inserts Kunde:
--Ein Kunde muss mindestens 18 Jahre alt sein und einen Führerscheinbesitzen
--Insgesamt 20 xKunden erstellt

insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Maximillian','Steiner','1995-07-03','06606122862','m.steiner@gmx.at',5531,'Eben im Pongau','Edthof 53');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Luise','Gernolds','1996-07-08','06606122754','luise.g96r@outlook.at',5400,'Hallein','Davisstraße 29');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Arnold','Schwarzenegger','1950-10-27','06643364049','terminator@california.us',8010,'Graz','Hollywoodweg 1');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Gerald','Hoerhan','1970-01-01','06609963056','gerhard.h@gmail.com',1050,'Wien','Am Praterstern 10');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Walter','Rettenwender','1975-04-04','06506122864','walter.rettenwender@gmx.at',5020,'Salzburg','Peilsteinerstraße 12');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Simon','Kowalsky','1997-05-12','06629923023','simon.97@hotmail.com',5531,'Eben im Pongau','Edthof 52');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Joseph','Stadler','1994-03-06','06641231231','sepp.stadler@sbg.at',5531,'Eben im Pongau','Alleeweg 7');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Paul','Eichberger','1975-11-11','06609746765','paul.eichberger@sbg.at',5083,'Groedig','Moosstraße 54');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Friedrich','Nietsche','1938-12-07','06641123201','friedl.nietsche@sbg.at',5083,'Groedig','Hauptstraße 36');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Lothar','Schaefer','1980-06-10','06601020801','lothar.schaefer@htl-salzburg.ac.at',5111,'Bürmoos','Zeltweg 4');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Robert','Deniro','1965-04-07','06622266181','robert.deniro@hollywood.us',5020,'Salzburg','Gaswerkgasse 7');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Christian','Doppler','2001-02-24','06604124862','christian.doppler@uniklinikum-sbg.at',6067,'Absam','Weizengasse 73');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Willibald','Gernoldsteiner','2002-02-23','06605122362','willi.gernoldsteiner@gmail.com',6067,'Absam','Juliusplatz 52');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Siegfried','Holzner','1978-05-27','0650612472','siggi.holzner@hotmail.com',6050,'Hall in Tirol','Gebirgsweg 45');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Marius','Aichberger','1995-01-12','06606123843','marius.aichberger@gmail.com',6050,'Hall in Tirol','Hallstattweg 45');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Thomas','Eppenschwandtner','1965-12-03','06606122862','m.steiner@gmx.at',4043,'Linz','Galoppgasse 345');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Daniel','Lindner','1983-07-16','06606123862','d.lindner@outlook.com',4043,'Linz','Baumrindenstraße 34');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Rebecca','Traninger','1999-09-18','06644422981','becca.traninger@gmx.at',5023,'Koppl','Stierweg 33');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Waltraud','Gschwandtner','1959-04-28','06641249432','waltraud.gschwandtner@hotmail.com',5023,'Koppl','Bambuszapfen 3');
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Sieglinde','Mahlknecht','1977-02-28','06506177894','sieglinde.mahlknecht@gmail.com',1050,'Wien','Mariahilferstraße 1');

--DEMO fuer check - volljaehrigkeit
insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Sieglinde','Mahllllknecht','2020-02-28','06106177894','sieglinde.mahlkllllnecht@gmail.com',1050,'Wien','Mariahilferstraße 1');

--demo fuer fuehrerschein  abgelaufen fuer sql abfrage 

insert into Kunde (K_Vorname,K_Nachname, K_Geburtsdatum,K_Telefonnummer,K_Email, K_PLZ, K_Ort, K_Adresse)
values ('Siggi','DEMOfuehrerschein','2004-02-28','06106177894','sieglinde.demo@gmail.com',1050,'Wien','Mariahilferstraße 1');

select * from kunde;


-----------------------------------------------------------------------------------------------------------------------------------

--Inserts Vermietung:

insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-13','2023-06-20',2,2);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-13','2023-06-20',3,3);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-14','2023-06-21',4,4);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-14','2023-06-21',5,5);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-15','2023-06-21',6,6);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-15','2023-06-21',7,7);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-16','2023-06-23',8,8);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-16','2023-06-23',9,9);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-17','2023-06-18',10,10);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-17','2023-06-18',11,20);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-18','2023-06-25',12,19);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-18','2023-06-25',13,18);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-25','2023-07-01',14,17);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-25','2023-07-01',15,18);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-25','2023-06-26',16,16);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-25','2023-06-27',17,15);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-26','2023-06-07',18,14);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-30','2023-07-06',19,13);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-06-30','2023-07-06',20,12);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',45,2);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',30,3);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',17,9);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',40,12);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',13,18);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-02','2023-07-08',10,10);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',12,19);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',38,6);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',37,5);
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',7,7);

--DEMO  --T.S. + Ausleihschutz: Kunde kann nicht gleiches Auto zur selben Zeit ausleihen
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',7,7);

--DEMO Autoschutz: Auto kann nicht zur selben Zeit an mehrere Kunden ausgeliehen werden
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',7,8);

--DEMO Autoschutz2: --Kunde kann kein anderes Auto für die Dauer der Vermietung eines anderen Fahrzeugs nochmals mieten
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-07',8,7);

--DEMO Autoschutz3+Autoschutz4: Kunde kann kein bereits gemietetes Auto für die Dauer der Vermietung nochmals mieten
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-02','2023-07-07',7,7);

insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-01','2023-07-08',7,7);

--zusatzliche Constraint ueberlegung notwendig --muss noch optimiert werden!
---Weitere Ueberlegung notwendig wenn bereits gemietets Fahrzeug von anderen Kunden mit anderen Datums erstellt wird
insert into vermietung (V_Startdatum,V_Enddatum, FK_FZ_ID, FK_K_ID)
values ('2023-07-02','2023-07-08',7,8);

delete from vermietung where v_startdatum = '2023-07-02' and v_enddatum = '2023-07-08';


select * from vermietung v;

-----------------------------------------------------------------------------------------------------------------------------------

--Inserts Führerschein:
--Ein Führerschein gehört zu genau einem Kunden
--Ein gültiger Führerschein ist Voraussetzung zum Mieten von Fahrzeugen

insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389965,'2014-12-10','2029-12-09','BH-Salzburg',1);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389966,'2013-12-10','2023-12-09','BH-Salzburg',2);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389967,'2009-12-10','2029-12-09','BH-Salzburg',3);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389968,'2014-12-10','2025-12-09','BH-Salzburg',4);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389969,'2013-12-10','2029-12-09','BH-Salzburg',5);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389707,'1997-12-10','2029-12-09','BH-Salzburg',6);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389955,'1998-12-10','2029-12-09','BH-Salzburg',7);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389944,'2012-12-10','2032-12-09','BH-Salzburg',8);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389933,'2016-12-10','2034-12-09','BH-Salzburg',9);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389922,'2015-12-10','2030-12-09','BH-Salzburg',10);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389911,'2019-12-10','2034-12-09','BH-Salzburg',11);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389900,'2018-12-10','2032-12-09','BH-Salzburg',12);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389999,'2014-11-10','2029-12-12','BH-Salzburg',13);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389998,'2014-12-10','2029-11-12','BH-Salzburg',14);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389918,'2016-12-10','2029-10-12','BH-Salzburg',15);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389929,'2013-12-10','2024-12-31','BH-Salzburg',16);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389931,'2009-12-10','2024-12-31','BH-Salzburg',17);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389948,'2010-12-10','2025-12-31','BH-Salzburg',18);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389949,'2014-12-10','2029-12-31','BH-Salzburg',19);
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14389950,'2014-12-10','2029-12-31','BH-Salzburg',20);

--demo ungueltiger fuehrerschein --> hier koentte man einen constraint einbinden, fuer ungueltige(abgelaufene) fuehrerscheine
insert into Fuehrerschein (FS_Nr, fs_ausstellungsdatum, FS_Gueltigbis, FS_AusstellendeBehoerde, FK_K_ID)
values (14399951,'2014-12-10','2019-12-31','BH-Salzburg',23);

select * from fuehrerschein f ;

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------