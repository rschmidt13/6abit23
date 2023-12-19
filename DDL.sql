-- Projekt Klassenverwaltung
-- DDL Anweisungen

drop table if exists SCHUELER cascade;

CREATE TABLE SCHUELER (
	sid int primary key,
	vorname varchar(255),
	nachname varchar(255),
	gebdatum date
);

delete from schueler;
insert into SCHUELER values (1, 'Susi', 'Moser', '1919-06-01');
insert into SCHUELER values (10, 'Max', 'Moser', '1991-07-01');
insert into SCHUELER values (20, 'Franz', 'Moser', '1021-10-01');
insert into SCHUELER values (30, 'Hans', 'Moser', '1021-10-01');

select * from schueler s ;

-- sequence
create sequence seq_schueler_sid
start 30
increment 10
owned by schueler.sid
;

drop sequence seq_schueler_sid;

insert into SCHUELER values (nextval('seq_schueler_sid'), 'Max', 'Maier');

select * from schueler;

alter table schueler alter column sid set default nextval('seq_schueler_sid');  

insert into SCHUELER (vorname, nachname) values ('Hans', 'Huber');

-- domain
CREATE DOMAIN PLZ AS int
CONSTRAINT const1
CHECK ( VALUE >= 1000 AND VALUE <= 9999);

-- domain date

--SELECT REGEXP_MATCHES('31.12.2023','[0-3][0-9]\.[0-1][0-9]\.[0-2][0-9][0-9][0-9]');
--CREATE DOMAIN mydate AS char[10]
--CONSTRAINT mydate_fmt
--CHECK ( (REGEXP_MATCHES(cast(VALUE as varchar),'[0-3][0-9]\.[0-1][0-9]\.[0-2][0-9][0-9][0-9]')) );



alter table schueler add column postleitzahl plz;
insert into schueler (vorname, nachname, gebdatum, postleitzahl) values 
('VN1', 'NN1','1990-01-01', 6020);
select * from schueler;
insert into schueler (vorname, nachname, gebdatum, postleitzahl) values 
('VN2', 'NN2','1990-01-02', 20);

select * from schueler;
-- TODO
-- zusätzliche tabelle und view mit join

drop view schueler_public;
create view schueler_public as
  select sid, vorname, nachname from schueler;
 
insert into schueler_public values (30, 'Max','Muster');
 
select * from  schueler_public;
select * from schueler;

create table klasse (
  name text,
  schuljahr int,
  raum text,
  primary key (name, schuljahr)
);

insert into klasse values
('23abit', 2023, '206'),
('45abit', 2023, '205'),
('67abit', 2023, '204');

drop table schueler_klasse;
create table schueler_klasse (
	sid int references schueler,
	name text,
	schuljahr int,
	foreign key(name, schuljahr) references klasse,
	primary key (sid)
);

select * from schueler;
insert into schueler_klasse values
(1, '23abit', 2023),
(10, '23abit', 2023),
(20, '45abit', 2023),
(30, '45abit', 2023);

-- kartesisches produkt
select s.vorname, s.nachname, k.name from schueler s, schueler_klasse sk, klasse k
where s.sid = sk.sid and sk.name = k.name and sk.schuljahr = k.schuljahr;  

create view schuler_mit_klasse as 
select s.vorname, s.nachname, k.name from schueler s, schueler_klasse sk, klasse k
where s.sid = sk.sid and sk.name = k.name and sk.schuljahr = k.schuljahr;  

select * from schueler natural join schueler_klasse natural join klasse;

create table k_abt (
  kuerzel text primary key,
  abteilung text
);

select * from schuler_mit_klasse ;

insert into k_abt values
('23abit', 'Abendschule');

create view k_abt_natural as
  select kuerzel as name, abteilung from k_abt;
 
select * from k_abt_natural;

select * from schuler_mit_klasse smk join k_abt kabt on smk.name = kabt.kuerzel;
select * from schuler_mit_klasse natural join k_abt_natural;
