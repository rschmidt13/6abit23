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

with Max as
(select k_id, kname from kunde where kname = 'Max'),
RMax as 
(select * from rechnung r join Max m on r.k_id = m.k_id),
AMax as 
(select * from artikel natural join RMax)
select
	cast (
	case 
    when kname = 'Max' then 1
    else 0
	end
	as bool )
	, aname from AMax natural right join artikel;
--select * from AMax natural right join artikel;

select * from artikel natural right join rechnung;
select * from AMax;



select * from Artikel natural join rechnung natural join (select * from Kunde where kname = 'Max');