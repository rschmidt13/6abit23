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
insert into rechnung values (1, '01/2020', 133, to_date('13.01.2010', 'dd.mm.yyyy'));
insert into rechnung values (2, '08/2021', 161, '2021-06-15');
insert into artikel values (1, 'headset mono 1a', 1, 15, 130);
insert into artikel values (2, 'akg micro mono', 1, 65, 130);
insert into artikel values (3, 'akg micro mono', 2, 68.5, 130);
insert into artikel values (4, 'basf kasette 60min', 2, 12, 110);
insert into kategorie values (100, 'HiFi'), (110, 'LoFi'), (120, 'Stereo'), (130, 'Mono'), (140, 'Analog'), (150, 'Digital');

--
select * from artikel, kategorie;
select a.id, preis, bezeichnung from artikel a join kategorie k on a.kat_id = k.id where bezeichnung = 'Mono';

select * from kunde k join rechnung r on r.k_id = k.id;
--v2
select name, rnr from kunde k join rechnung r on r.k_id = k.id where plz = 2323;

select * from kunde where plz = 2323;
--v2
select k.name, r.rnr from rechnung as r join (select * from kunde where plz = 2323) as k on r.k_id = k.id;

-- nochmal mit join

select * from kunde, rechnung;

select * from rechnung r join (SELECT id as kid, knr, name, plz FROM kunde) k 
on k_id = kid;

select * from rechnung r join kunde k 
on r.k_id = k.id;

select name, rnr from rechnung r join (SELECT id as kid, knr, name, plz FROM kunde) k 
on k_id = kid where plz = 2323;

-- Hausübung: Umsetzung der Query mit Basisoperatoren
-- mit Basisoperatoren

select name, rnr from rechnung r, kunde k where k.plz = 2323 and k.id = r.k_id ;




























