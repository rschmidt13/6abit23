DROP TABLE if exists kunde;
drop table if exists kundensegment;

create table kunde (
  knr int primary key,
  name text,
  alter int
);

create table kundensegment (
  alter int primary key,
  typ text,
  naechster int,
  foreign key (naechster) references kundensegment
);

insert into kunde values 
(1, 'Ernst', 25),
(2, 'Franz', 100),
(3, 'Gerti', 51),
(4, 'Heidi', 45);

insert into kundensegment values
(0, '-', 2),
(2, 'Baby', 12),
(12, 'Kind', 25),
(25, 'Jung', 50),
(50, 'Mittel', 100),
(100, 'Alt', null);

select * from Kunde;
select * from Kundensegment;

-- Alle Kunden im Segment Mittel
select k.name, k.alter, so.alter altero, so.typ typo, su.alter alteru, su.typ typeu from kunde k 
-- finde alle ober und untergrenzen
 join segment so on k.alter < so.alter
 join segment su on k.alter >= su.alter
-- einschränkung auf zw. jung und mittel
where so.typ = 'Mittel' and su.typ = 'Jung'
;

-- In welches Kundensegment fällt Gerti

-- select * from kunde k
--select k.name, k.alter, so.alter altero, so.typ typo, su.alter alteru, su.typ typeu, so.alter - k.alter odiff, su.alter - k.alter udiff from kunde k 
select k.name, so.typ segment from kunde k 
-- finde alle ober und untergrenzen
 join kundensegment so on k.alter <= so.alter
 join kundensegment su on k.alter > su.alter
 where k.name = 'Gerti'
 order by so.alter - k.alter asc, su.alter - k.alter desc
 limit 1
;
