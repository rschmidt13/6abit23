-- Projekt Klassenverwaltung
-- DDL Anweisungen

drop table if exists SCHUELER cascade;

CREATE TABLE SCHUELER (
	sid int primary key,
	vorname varchar(255),
	nachname varchar(255),
	gebdatum date
);

insert into SCHUELER values (1, 'Susi', 'Moser');
insert into SCHUELER values (10, 'Susi2', 'Moser');
insert into SCHUELER values (20, 'Susi3', 'Moser');

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

alter table schueler add column postleitzahl plz;
insert into schueler (vorname, nachname, gebdatum, postleitzahl) values 
('VN1', 'NN1','1990-01-01', 6020);
select * from schueler;
insert into schueler (vorname, nachname, gebdatum, postleitzahl) values 
('VN2', 'NN2','1990-01-02', 20);

