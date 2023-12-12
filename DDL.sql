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

create sequence seq_schueler_sid
start 10
increment 10
--owned by schueler.sid
;

drop sequence seq_schueler_sid;

insert into SCHUELER values (nextval('seq_schueler_sid'), 'Max', 'Maier');

select * from schueler;

alter table schueler alter column sid set default nextval('seq_schueler_sid');  

insert into SCHUELER (vorname, nachname) values ('Hans', 'Huber');



