drop table if exists rechnung;
drop table if exists artikel;
drop table if exists kategorie;
drop table if exists kunde;

create table rechnung (
  id int primary key,
  rnr varchar,
  k_id int,
  datum date
);

create table artikel (
  id int primary key,
  name varchar,
  r_id int,
  preis int,
  kat_id int
);

create table kategorie (
  id int primary key,
  bezeichnung varchar
);

create table kunde (
  id int primary key,
  knr varchar,
  name varchar,
  plz int
);

<<<<<<< Updated upstream
-- K[id, knr, name, plz]
-- K[kid, knr, kname, plz]

-- R[id, rnr, k_id, datum]
-- R[rid, rnr, kid, datum]

-- A[id, name, r_id, preis, kat_id]
-- A[aid, aname, rid, preis, katid]

-- Kat[id, bez]
-- Kat[katid, bez]

=======
----------UEBEN----------fuer test-------------------------------------------------------------------------------------------------------------------
-------------------------SCHEMA----------------------------------------------------------------------------------------------------------------------

--bsp2 laut mitschrift
--Alle Rechnungen in dem der Artikel 'akg-m..' vorkommt

--K[id, knr, name, plz]
--R[id, rnr, k_id, datum]
--A[(a)id umbennenen, (a)name, r_id, preis, kat_id]
--Kat[(kat)id, bez]

---select zu basisoperatorvariante v1)

select rnr from artikel a, rechnung r where r.id = a.r_id and a.name = 'akg micro mono';
select rnr from artikel a join rechnung r on r.id = a.r_id where a.name = 'akg micro mono';


--bsp 3 UNION-Menge
--Alle Artikelnamen die Max oder Maya gekauft haben

select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 133
union 
select name from rechnung r, artikel a where r.id = a.rid and r.k_id = 161;

--2variante fuer union

select distinct(name) from rechnung r, artikel a
where r.id = a.r_id and r.k_id = 133 or r.id = a.r_id and r.k_id = 161; 

--Bsp4 MengenDifferenz Maxa nicht maja
--Alle Artikelnamen , die Max aber nicht Maja gekauft haben

select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 133
except
select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 161;

--2 variante
select distinct(name) from rechnung r join artikel a on r.id = a.r_id
where r.k_id = 133 and r.k_id != 161;


--Bsp5 Mengendifferenz = intersect
--haben wir nicht gemacht

--Bsp 6 Ein Beispiel mit join mit 3 Tabellen
--Wo man über alle 3 Tabellen durchmuss

--siehe mitschrift


--Bsp 7 mit natural join
--Alles umbenenen , dass FK und PK gleich heissen
--Und alles umbennen , dass andere Attribute unterschiedlich heissen

--siehe mitschrift
--K[id, knr, name, plz]
--K[kid, knr, kname, plz]

--R[id, rnr, k_id, datum]
--R[rid, rnr, k_id, datum]

--A[id, name, r_id, preis, kat_id]
--A[aid, aname,rid, preis, katid]

--Kat[id, bez]
--Kat[(kat)id, bez]

--relationale Algebra lösung siehe mitschrift
--------------------------------------------------------------------------------------------------------------------------
--V2 = HUE
--HUE--Datenbank so umbauen dass die gleiche abfrage wie in v1 ) Alle kategorien die Max gekaugt hat mit
--natural join funktionieren 
--------------------------------------------------------------------------------------------------------------------------
--eine select loesung mit thether join  v1

--alle kategorien, die Max gekauft hat
select kat.bezeichnung from kategorie kat
join artikel a on kat.id = a.kat_id
join rechnung r on a.r_id = r.id
join kunde k on r.k_id = k.id
where k.name = 'Max';


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
>>>>>>> Stashed changes
select * from rechnung;
select * from artikel;
select * from kategorie;
select * from kunde;

delete from rechnung;
delete from artikel;
delete from kategorie;
delete from kunde;

insert into kunde values (133, '100', 'Max', 1234);
insert into kunde values (161, '132', 'Maja', 2323);
insert into kunde values (171, '161', 'Mona', 4130);
insert into rechnung values (1, '01/2020', 133, to_date('13.01.2010', 'dd.mm.yyyy'));
insert into rechnung values (2, '08/2021', 161, '2021-06-15');
insert into rechnung values (3, '11/2023', 171, '2023-11-14');
insert into artikel values (1, 'headset mono 1a', 1, 15, 130);
insert into artikel values (2, 'akg micro mono', 1, 65, 130);
insert into artikel values (3, 'akg micro mono', 2, 68.5, 130);
insert into artikel values (4, 'basf kasette 60min', 2, 12, 110);
insert into artikel values (5, 'basf kasette 60min', 3, 12, 110);
insert into kategorie values (100, 'HiFi'), (110, 'LoFi'), (120, 'Stereo'), (130, 'Mono'), (140, 'Analog'), (150, 'Digital');

-- UE vom 21.11.2023
-- =====
select rnr from artikel a, rechnung r where r.id = a.r_id and a.name = 'akg micro mono';
select rnr from artikel a join rechnung r on r.id = a.r_id  
  where a.name = 'akg micro mono';

select a.r_id from artikel a where a.name = 'akg micro mono';
select rnr from rechnung r where r.id in (select a.r_id from artikel a where a.name = 'akg micro mono'); 
select rnr from rechnung r where r.id = any (select a.r_id from artikel a where a.name = 'akg micro mono'); 
select rnr from rechnung r where exists (select * from artikel a where a.name = 'akg micro mono' 
  and r.id = a.r_id);
 
-- max oder maja
select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 133
union
select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 161;

select distinct(name) from rechnung r, artikel a 
  where r.id = a.r_id and r.k_id = 133 or r.id = a.r_id and r.k_id = 161; -- and r.k_id = 161;

select distinct(name) from rechnung r join artikel a on r.id = a.r_id
  where r.k_id = 133 or r.k_id = 161; 

-- max nicht maja
select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 133
except
select name from rechnung r, artikel a where r.id = a.r_id and r.k_id = 161;

-- funktioniert nicht
select distinct(name) from rechnung r join artikel a on r.id = a.r_id
  where r.k_id = 133 and r.k_id != 161; 

select distinct(name), r.k_id  from rechnung r join artikel a on r.id = a.r_id;

-- alle kategorien, die Max gekauft hat
select distinct(kat.bezeichnung) from kategorie kat 
  join artikel a on kat.id = a.kat_id 
  join rechnung r on a.r_id = r.id 
  join kunde k on r.k_id = k.id
  where k.name = 'Max';

-- HUE vom 21.11.2023
-- Datenbank umbauen, dass natural Join ohne Umbenennung funktioniert
-- Dann Abfrage: "Alle kategorien, die Max gekauft hat" mit nat. Join
-- =====

 
 -- Alle Mono-Artikel

select * from artikel, kategorie;
select a.id, preis, bezeichnung from artikel a join kategorie k on a.kat_id = k.id where bezeichnung = 'Mono';

select * from kunde k join rechnung r on r.k_id = k.id;
--v2
select name, rnr from kunde k join rechnung r on r.k_id = k.id where plz = 2323;

select * from kunde where plz = 2323;
--v2
select k.name, r.rnr from rechnung as r join (select * from kunde where plz = 2323) as k on r.k_id = k.id;

-- Alle Rechnungen von Kunden aus 2323
select * from kunde, rechnung;

select * from rechnung r join (SELECT id as kid, knr, name, plz FROM kunde) k 
on k_id = kid;

select * from rechnung r join kunde k 
on r.k_id = k.id;

select name, rnr from rechnung r join (SELECT id as kid, knr, name, plz FROM kunde) k 
on k_id = kid where plz = 2323;

select * from rechnung r join (SELECT id as kid, knr, name, plz FROM kunde) k 
on k_id = kid; 

select * from (select id as kid, knr, name, plz from kunde)
natural join
(select id as rid, rnr, k_id as kid, datum from rechnung);

-- Hausübung: Umsetzung der Query mit Basisoperatoren
-- mit Basisoperatoren

select name, rnr from rechnung r, kunde k where k.plz = 2323 and k.id = r.k_id ;

-- Natural Join

drop table r;
drop table s;

create table r (
	a char, b char, c char, d char
);

create table s (
 	x char, y char, b char, d char
);

insert into r values ('0','1','2','3'), ('4','1','3','2');
insert into s values ('1','2','1','4'), ('3','4','1','3');

select * from r;

select * from r natural join s;
select * from s join r on s.b = r.b and s.d = r.d;
select r.*, s.x, s.y from s join r on s.b = r.b and s.d = r.d;



























