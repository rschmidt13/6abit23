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


