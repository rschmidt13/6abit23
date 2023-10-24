drop table if exists l cascade;
drop table if exists lv cascade;

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
  jahr int
);

insert into l values
(1, 'Max', 25, true),
(2, 'Fritz', 31, false),
(3, 'Gabi', 31, true),
(4, 'Moritz', 33, false);

insert into lv values 
(1, 'D', 4, 2022),
(1, 'E', 4, 2022),
(2, 'E', 6, 2022),
(3, 'D', 2, 2022);


select * from l;

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
