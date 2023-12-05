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
(3, 'Gerti', 75),
(4, 'Heidi', 45);

delete from kundensegment;
insert into kundensegment values
(0, 'Baby', 12),
(12, 'Kind', 25),
(25, 'Jung', 50),
(50, 'Mittel', 100),
(100, 'Alt', null);

select * from Kunde;
select * from Kundensegment;

-- In welches Kundensegment fällt Gerti
