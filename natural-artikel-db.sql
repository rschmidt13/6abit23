drop table if exists rechnung cascade;
drop table if exists artikel cascade;
drop table if exists kategorie cascade;
drop table if exists kunde cascade;
 
--natural join beispiel
 
--
create table kunde (
  k_id int primary key,
  knr varchar,
  kname varchar,
  plz int
);

create table rechnung (
  r_id int primary key,
  rnr varchar,
  k_id int,
  datum date
);
 
create table artikel (
  a_id int primary key,
  aname varchar,
  r_id int,
  preis int,
  kat_id int
);
 
create table kategorie (
  --kat_id int primary key,
  id int primary key,  
  bezeichnung varchar
);

insert into kunde values (133, '100', 'Max', 1234);
insert into kunde values (161, '132', 'Maja', 2323);
insert into rechnung values (1, '01/2020', 133, to_date('13.01.2010', 'dd.mm.yyyy'));
insert into rechnung values (2, '08/2021', 161, '2021-06-15');
insert into artikel values (1, 'headset mono 1a', 1, 15, 130);
insert into artikel values (2, 'akg micro mono', 1, 65, 130);
insert into artikel values (3, 'akg micro mono', 2, 68.5, 130);
insert into artikel values (4, 'basf kasette 60min', 2, 12, 110);
insert into kategorie values (100, 'HiFi'), (110, 'LoFi'), (120, 'Stereo'), (130, 'Mono'), (140, 'Analog'), (150, 'Digital');

select * from artikel natural join rechnung;
select aname from artikel natural join rechnung where rnr = '01/2020';

-- With as - Zusatzaufgabe, ohne doppelte Artikellnamen
with Max as
(select k_id, kname from kunde where kname = 'Max'),
RMax as 
(select * from rechnung r join Max m on r.k_id = m.k_id),
AMax as 
(select * from artikel natural join RMax),
ABMax as
(select
	a_id,
	cast (
	case 
    when kname = 'Max' then 1
    else 0
	end
	as bool ) as bought
	, aname from AMax natural right join artikel),
ABCMax as
(select A.a_id, A.bought, A.aname from ABMax A, ABMax B where 
  A.aname = B.aname and A.a_id > B.a_id and A.bought = false or 
  A.aname = B.aname and A.a_id < B.a_id and B.bought = true)
select * from ABmax except select * from ABCMax;


select * from artikel natural right join rechnung;
select * from AMax;
select * from Artikel natural join rechnung natural join (select * from Kunde where kname = 'Max');

-- weitere übungsaufgabe, alle produktname und kategorien die sowohl max als auch maja gekauft haben.
-- rel. algebra im teams chat

-- aggregation
select aname, case WHEN preis > 40.25 THEN 'teuer' ELSE 'billig' end as preisklasse from artikel;
select max(preis) from artikel;
select preis, preis * 2 doppelpreis, aname from artikel;
select aname, sum(preis) from artikel;
select sum(preis), avg(preis)  from artikel;
select aname from artikel where preis < 40.25;
-- artikel und aggregation in der where condition mit subselect gelöst
select * from artikel where preis < all (select avg(preis) from artikel);

-- durchschnittspreis aller hifi produkte
select * from kategorie k ;
select * from artikel;
insert into artikel values (5, 'hifi 1', null, 110, 100);
insert into artikel values (6, 'hifi 2', null, 210, 100);

select * from kategorie k ;
select * from artikel;
select avg(preis) from artikel a join kategorie k on k.id = a.kat_id where k.bezeichnung = 'HiFi'; 

select * from artikel a join kategorie k on k.id = a.kat_id;

-- kategoriebezeichnung, anzahl und durschnittspreis der artikel pro kategorie (bezeichnung)
select bezeichnung, avg(preis), count(*) from artikel a join kategorie k on k.id = a.kat_id group by k.bezeichnung;
select bezeichnung, avg(preis), count(r_id) anz_rechnungen, count(*) anz_artikel from artikel a join kategorie k on k.id = a.kat_id group by k.bezeichnung;

-- Frage für nächste LV: Alle Lehrer, die noch keine Noten vergeben haben, Lehrer die die schlechtesten Beurteilungen geben
