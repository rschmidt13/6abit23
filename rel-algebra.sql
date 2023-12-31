-- Bsp 1
drop table if exists l cascade;
drop table if exists lv cascade;
drop table if exists s cascade;

create table L (
  id int,
  name text,
  ALTER int,
  pendler bool  
);

create table LV (
  id int,
  fach char,
  stunden int,
  jahr int,
  sid int
);

create table S (
  sid int,
  typ int,
  name text
);

insert into l values
(1, 'Max', 25, true),
(2, 'Fritz', 31, false),
(3, 'Gabi', 31, true),
(4, 'Moritz', 33, false);

insert into lv values 
(1, 'D', 4, 2022, 1),
(1, 'E', 4, 2022, 2),
(2, 'E', 6, 2022, 1),
(3, 'D', 2, 2022, 3);

insert into S values
(1, 1, 'HTL Spenglergasse'),
(2, 1, 'HTL Salzburg'),
(3, 2, 'BORG Braunau')
;

select l.name, s.name from l, lv, s where l.id = lv.id and s.sid = lv.sid;
select l.name, s.name from l, (select * from s, lv where s.sid = lv.sid) as lv where l.id = lv.id;
select l.name, lvs.name from l, (select * from s, lv where s.sid = lv.sid) as lvs where l.id = lvs.id; 

select * from s, lv;
select * from s, lv where s.sid = lv.sid;

select l.name, s.sname from l natural join lv natural join (select sid, name as sname from s) as s;
select * from l natural join lv natural join (select sid, name as sname from s);
select * from l natural join lv natural join s;

select sid from s where name = 'HTL Spenglergasse';
select * from lv where sid = (select sid from s where name = 'HTL Spenglergasse');
select * from lv where sid = (select sid from s where name = 'HTL Spenglergasse') and stunden > 4;

select * from lv;
select sid from s where name = 'HTL Spenglergasse' or name = 'HTL Salzburg'; 
select * from lv where sid in (select sid from s where name = 'HTL Spenglergasse' or name = 'HTL Salzburg');
select * from lv where sid in (select sid from s where name = 'HTL Spenglergasse' or name = 'HTL Salzburg') and stunden > 4;

-- in rel. alg., als kreuzprodukt, join

-- die Namen aller Lehrer die Englisch unterichten

-- 1. als Sub-select:

SELECT name
FROM L
WHERE id IN (
    SELECT id
    FROM LV
    WHERE fach = 'E'
);

-- 2. als Kreuzprodukt:

select l.name from l,lv
where l.id = lv.id and lv.fach = 'E';

-- Bsp 2
drop table if exists lehrer cascade;
drop table if exists schueler cascade;

create table lehrer (
  name text,
  alter int
);


create table schueler (
  name text,
  alter int
);

insert into lehrer values ('Max', 20), ('Franz', 21), ('Ernst', 22), ('Heinz', 23);
insert into schueler values ('Max', 20), ('Franz', 22), ('Susi', 22), ('Heinz', 24);

-- union mengenvereinigung
-- except mengendifferenz
-- intersect mengendurchschnitt

select * from lehrer 
intersect
select * from schueler;

select name from lehrer except
  (select name from lehrer except select name from schueler);

-- aufgabe bitte mit elementaren operatoren lösen!
drop table if exists a cascade;
drop table if exists b cascade; 
 
create table A (
  x int,
  y int,
  z int
);

insert into a values 
(0,1,1),
(0,0,0),
(1,0,0);

create table B (
  u int,
  v int,
  w int
);

insert into B values 
(0,1,0),
(0,1,1),
(1,0,0);

-- join
select * from A join b on y = u;
-- basisoperatoren
select * from a,b where y = u ;

select * from a,b;



