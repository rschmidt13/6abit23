-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------
|----------------------------------------------DQL fuer RentaCar-------------------------------------------------------------------|
------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

--Abfragen zu Autovermieter:

--Zeige alle Autovermieter
select * from Autovermieter;

--Anzahl der Autovermieter insgesamt
select count(*) as AnzahlAutovermieter from Autovermieter;

--Liste aller Autovermieter, sortiert nach dem Vermieternamen
select AV_Name from Autovermieter order by AV_Name;

--Zeige wievele Autovermieter Sachbearbeiter beschäftigen
select AV_Name, count(*) as Anzahl_Sachbearbeiter from Autovermieter, sachbearbeiter where FK_AV_ID = AV_ID 
group by AV_Name;

-----------------------------------------------------------------------------------------------------------------------------------
--Abfragen zu Sachbearbeiter:
--Zeige alle Sachbearbeiter:
select * from sachbearbeiter;

--Anzahl der Sachbearbeiter insgesamt:
select count(*) as AnzahlSachbearbeiter from Sachbearbeiter;

--Liste aller Sachbearbeiter, sortiert nach dem Nachnamen:
select SB_Nachname,SB_Vorname from Sachbearbeiter order by SB_Nachname;

--Anzahl Fahrzeuge, für die ein Sachbearbeiter zustaendig ist:
select SB_Nachname, SB_Vorname, count(*) as AnzahlFahrzeuge from sachbearbeiter
join Fahrzeuge on SB_ID = FK_SB_ID
group by SB_Nachname,SB_Vorname;

--Liste von Sachbearbeitern mit den meisten zugeordneten Fahrzeugen:
select SB_Nachname,SB_Vorname, count(*) as AnzahlFahrzeuge from sachbearbeiter
join fahrzeuge on SB_ID = FK_SB_ID 
group by SB_Nachname, SB_Vorname
order by AnzahlFahrzeuge desc;
--limit 1;

--Liste der Sachbearbeiter, die für einen bestimmten Fahrzeugtyp zustaendig sind:
select SB_Nachname,SB_Vorname, FZ_Typ from sachbearbeiter
join Fahrzeuge on SB_ID = FK_SB_ID where FZ_Typ in ('Standardfahrzeug') or FZ_Typ in ('standardfahrzeug') 
order by SB_Nachname, SB_Vorname;

--Subselects zu Sachbearbeiter:
--Liste aller Sachbearbeiter, die für die Fahrzeuge mit dem höchsten Mietpreis zustaendig sind:
select SB_Nachname,SB_Vorname from Sachbearbeiter where SB_ID in (select FK_SB_ID from Fahrzeuge where FZ_Preis_pro_Tag =
(select MAX(FZ_Preis_pro_Tag) from Fahrzeuge));

-----------------------------------------------------------------------------------------------------------------------------------
--Abfragen zu Fahrzeuge:
--Zeige Liste aller Fahrzeuge:
select * from fahrzeuge;

--Anzahl an Fahrzeugen insgesamt:
select count(*) as AnzahlFahrzeuge from  fahrzeuge;

--Anzahl an Fahrzeugen die bereits vermietet werden:
select count(*) as AnzahlvermieteteFahrzeuge from vermietung;

--Liste an Fahrzeugen mit mehr als 500 PS Leistung:
select * from fahrzeuge f where fz_ps > 500;

--Fahrzeuge welche mehr als 199.99€ pro Tag Kosten:
select FZ_Markenname,FZ_Bezeichnung, FZ_Preis_pro_Tag from fahrzeuge
join vermietung on FZ_ID = FK_FZ_ID where FZ_Preis_pro_Tag > 199.99;
--------------------------------------------------------------------------------------------------------------------------------------
--Abfragen zu Versicherung:
--Zeige alle Versicherungen:
select * from versicherung;

--durchscnittliche Kosten pro Jahr für alle Versicherungen:
select AVG(Ver_Jahrespraemie) as Durchschnittsjahreskosten from versicherung;

--Alle Fahrzeuge die bei UNIQA-Vollkasko-Versichert sind:
select * from versicherung where Ver_polizzennr in (select Ver_polizzennr from Versicherung where Ver_Anstalt = 'UNIQA');

--Liste aller Versicherungen dessen Deckungssumme mehr als 15 Mio. € beträgt
select * from versicherung where Ver_DeckungBis > 15000000.0;
------------------------------------------------------------------------------------------------------------------------------
--Abfragen zur Vermietung:
--Zeige alle vermieteten Fahrzeuge von Kunden:
select * from vermietung;

--Zeige die Vermietungen, bei denen das Mietende in der Vergangenheit liegt:
select * from vermietung where v_enddatum <  current_date;

--Zeige die Vermietungen an die bevorstehen:
select * from vermietung v where v_startdatum > current_date;

--Zeige die Fahrzeugmarken die am meisten gemietet wurden:
select FZ_Markenname, count(*) as AmmeistengemietetesFzg from vermietung
join fahrzeuge on FK_FZ_ID = FZ_ID 
group by FZ_Markenname
order by AmmeistengemietetesFzg desc;

--Zeige Gesamtkosten aufgrund des Preises_pro_Tag für jedes gemietete Fahrzeug sortiert nach höchsten Preis
select V_ID, V_Startdatum, V_Enddatum,fz_bezeichnung,FK_FZ_ID, FZ_Preis_pro_Tag, (V_Enddatum - V_Startdatum +1)* FZ_Preis_pro_Tag
as Gesamtkosten from Vermietung
join Fahrzeuge on Vermietung.FK_FZ_ID = Fahrzeuge.FZ_ID order by Gesamtkosten desc;



-------------------------------------------------------------------------------------------------------------------------------
--Abfragen zu Kunde:

-- Zeige alle Kunden
select * from kunde;

--Alle Kunden aus Salzburg:
select * from kunde where K_Ort = 'Salzburg' or k_plz = '5020';

--Liste der Kunden, die mehr als 2 Mietverträge abgeschlossen haben:
select K_ID, k_vorname, k_nachname, count(*) as Anzahl_Mietvertraege from kunde
join vermietung on K_ID = fk_k_id 
group by K_ID, K_Vorname, K_Nachname
having count(*) > 2;

--Liste der Kunden mit den meisten Mietvertraegen:
select * from Kunde where K_ID in (select FK_K_ID from vermietung where FK_FZ_ID in 
(select FZ_ID from fahrzeuge where FZ_Markenname = 'Super B' ));

--Gebe mir den Vor und Nachnamen von den Kunden die volljährig sind
select K_Vorname,K_Nachname from kunde k where k_geburtsdatum < (current_date - interval '18 years');

-------------------------------------------------------------------------------------------------------------------------------
--Abfragen zu Fuehrerschein:
--Zeige alle Fuehrerscheine:
select * from fuehrerschein;

--Liste der Kunden die einen gueltigen Fuehrerschein besitzen
select * from kunde where K_ID in (select FK_K_ID from fuehrerschein where FS_GueltigBis >=current_date);

--Anzahl der Kunden die einen Fuehrerschein besitzen:
select count(distinct fk_k_id) as Anzahl_Kunden_mit_gueltigen_FS from fuehrerschein;

--Liste der Kunden die einen Fuehrerschein besitzen, aber deren Gueltigkeitsdatum abgelaufen ist:
select * from kunde where K_ID in (select FK_K_ID from fuehrerschein where FS_GueltigBis < current_date);




---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

--ABFRAGEN ZUM MINI PROJEKT --6ABIT 09.01.2024

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

--1. KREUZPRODUKT:
select * from autovermieter;
select * from sachbearbeiter;
select * from autovermieter a, sachbearbeiter s;

--Gib mir den Vornamen und den Nachnamen von jedem Sachbearbeiter, welcher bei einem
--Autovermieter beschaeftigt ist

select av_id, av_name,sb_id, sb_vorname, sb_nachname from autovermieter a, sachbearbeiter s
where av_id = s.fk_av_id;
---------------------------------------------------------------------------------------------------------------------------------------

--2.THETA-JOIN:

--Welche Fahrzeuge  von welchem Kunden gemietet werden
--3 Tabellen: Vermietung, Fahrzeug und Kunde

select f.fz_bezeichnung, f.fz_markenname, k.k_vorname, k.k_nachname, v.v_id, v.v_startdatum,v.v_enddatum  from vermietung v 
join fahrzeuge f on f.fz_id = v.fk_fz_id 
join kunde k on k.k_id = v.fk_k_id;

----------------------------------------------------------------------------------------------------------------------------------------

--3.NATURAL JOIN:

--Gib mir die Vornamen und Nachnamen aller Sachbearbeiter, welche nur für AUDIS zuständig sind

select s.sb_id, s.sb_vorname, s.sb_nachname, f.fz_bezeichnung, f.fz_markenname, f.fz_farbe  from sachbearbeiter s 
natural join 
(select fk_sb_id as sb_id, f.fz_bezeichnung,f.fz_markenname, f.fz_farbe  from fahrzeuge f) as f
where f.fz_bezeichnung = 'Audi';
------------------------------------------------------------------------------------------------------------------------------------------

--4.Unterabfrage SUBSELECT:

--Alle Fahrzeuge die bei UNIQA-Vollkasko-Versichert sind:
select * from versicherung where Ver_polizzennr in (select Ver_polizzennr from Versicherung where Ver_Anstalt = 'UNIQA');

------------------------------------------------------------------------------------------------------------------------------------------

--5. MENGENVEREINIGUNG UNION

--Wichtig Schemagleichheit herstellen d.h. gleiche Datentypen und gleich viele Attribute

--Gib mir den Vornamen und Nachnamen aller Personen, aus Sachbearbeiter und Kunden

select s.sb_vorname, s.sb_nachname from sachbearbeiter s 
union
select k.k_vorname, k.k_nachname  from kunde k;




------------------------------------------------------------------------------------------------------------------------------------------

--6. MENGENDIFFERENZ EXCEPT

-- Wichtig Schemagleichheit herstellen d.h. gleiche Datentypen und gleich viele Attribute

--Gib mir den Vornamen und den Nachnamen aller Personen die keine Kunden sind

select s.sb_vorname, s.sb_nachname from sachbearbeiter s
except
select k.k_vorname, k.k_nachname from kunde k;



-------------------------------------------------------------------------------------------------------------------------------------------

-- 7. VIEW in Kombination mit einem Natural Join

--Erstellung einer Virtuellen Tabelle mit den Namen fahrzeug_versicherung
--natural join der Tabelle Versicherung zu Fahrzeug




create view fahrzeug_versicherung as
select f.fz_id, f.fz_bezeichnung, f.fz_kennzeichen, v.ver_polizzennr, v.ver_anstalt from fahrzeuge f
natural join
(select fk_fz_id as fz_id, v.ver_polizzennr, v.ver_anstalt  from versicherung v ) as v;



--Eigene Ergebnistabellen über subselects erstellt und in Klammer versehen und mit natural join verbunden

-- view anzeigen lassen
select * from fahrzeug_versicherung;

--abfrage von view
select fz_kennzeichen from fahrzeug_versicherung;



--drop view {name}  zum löschen der view
drop view fahrzeug_versicherung;
---------------------------------------------------------------------------------------------------------------------------------
--8. SEQUENZEN 

--Eine SEQUENZ FUER FAHRZEUG-ID fz_id erstellen

create sequence seq_fahrzeuge_fz_id
start 46
increment 1
owned by fahrzeuge.fz_id 
;

alter table fahrzeuge alter column fz_id set default nextval('seq_fahrzeuge_fz_id');

insert into fahrzeuge (FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
('luxusfahrzeug','VW-California','VW','giftgruen',2022,390,86199,'S-006-BB',100,'Ja',15);

insert into fahrzeuge (FZ_ID, FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
(47,'luxusfahrzeug','Porsche','911','schwarz',2022,390,86200,'S-006-BB',189.99,'Ja',15);

insert into fahrzeuge (FZ_Typ, fz_bezeichnung, FZ_Markenname, FZ_Farbe, FZ_Baujahr, FZ_PS, fz_kilometerstand, fz_kennzeichen,
fz_preis_pro_tag, fz_verfuegbar,fk_sb_id) values 
('luxusfahrzeug','Porsche','911','schwarz',2022,390,86197,'S-006-BB',189.99,'Ja',15);
select * from fahrzeuge 
order by fz_id desc;


delete from fahrzeuge where fz_id = 47;

alter table fahrzeuge alter column fz_farbe set default 'giftgelb';

select * from nextval('seq_fahrzeuge_fz_id');
--sequence löschen
--zuerst defualt dropen
alter table fahrzeuge alter column fz_id drop default;

drop sequence seq_fahrzeuge_fz_id;
