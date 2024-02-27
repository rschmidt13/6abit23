drop table if exists exam cascade;
drop table if exists student cascade;
drop table if exists teacher cascade;

CREATE TABLE teacher (
    account varchar(255) primary key,
    lastname varchar(255),
    firstname varchar(255),   
    birth_date date
);

CREATE TABLE student (
    account varchar(255) primary key,
    lastname varchar(255),
    firstname varchar(255),
    mnumber varchar(255),
    email varchar(255),
    telephone varchar(255)
);

CREATE TABLE exam (
    student varchar(255) references student(account) on delete set null on update cascade,
    teacher varchar(255) references teacher(account) on delete cascade,
    course varchar(255),
    year int,
    grade int,
    check(year > -1 and year <5050 and (teacher = 'a001' or teacher = 'b002' or teacher = 'b003')),
    constraint pk_exam primary key (course, year)
);

Insert into student (account, lastname, firstname, mnumber, email, telephone)
values 
('bef003', 'Berger', 'Franz', 'a2001', 'bef003@mail.at', '06641234'),
('hum002', 'Huber', 'Maria', 'a2104', 'hum002@mail.at', '06446456435'),
('bah12', 'Bacher', 'Heinz', 'a9904', 'bah13@mail.at', '0699234234'),
('grs005', 'Gruber', 'Steffi', 'a1908', 'grs005@mail.at', '06761231');

Insert into teacher (account, lastname, firstname, birth_date)
values 
('a001', 'Carson', 'Rachel', '1907-05-27'),
('b002', 'Euler', 'Leonhard', '1707-04-15'),
('b003', 'Shakespeare', 'William', '1564-04-23');

Insert into exam (student, teacher, course, year, grade)
values 
('bef003', 'a001', 'Biology', '2020', '1'),
('hum002', 'b002', 'Math','2019', 4),
('hum002', 'b003', 'English','2023', 2),
('bah12',  'a001', 'Biology','2022', -1),
('bah12',  'b003', 'English','2022', 3),
('grs005', 'b003', 'English','2021', 4),
('grs005', 'a001', 'Biology','2021', -1),
('grs005', 'b002', 'Math','2021', -1);

-- Geben Sie die Anzahl der, in der Datenbank gewarteten, Lehrer aus.
-- Gcount(*) (teacher)
select count(*) from teacher;

-- Anzahl der verschiedenen Vornamen von Schülern 
select count(distinct firstname) from student;
select * from student;
Insert into student (account, lastname, firstname, mnumber, email, telephone)
values ('beg003', 'Huber', 'Franz', 'a2008', 'beg003@mail.at', '06641244');

select * from extract (dow from (now()));
select * from extract (dow from (now() - '1 D'::interval));

create table stamps (
  stamp timestamp
); 

insert into stamps values (now() - '1 D'::interval);
insert into stamps values (now());
insert into stamps values (now() + '1 D'::interval);

select * from stamps;
select extract(dow from stamp) from stamps;
select to_char(stamp, 'dd.mm.yyyy') from stamps;
select * from to_date('06.02.2024', 'dd.mm.yyyy');

SELECT to_char(stamp, 'dd.mm.yyyy'), 
CASE
    WHEN extract(dow from stamp) = 1 THEN 'Montag'
    WHEN extract(dow from stamp) = 2 THEN 'Dienstag'
    WHEN extract(dow from stamp) = 3 THEN 'Mittwoch'
    WHEN extract(dow from stamp) = 4 THEN 'Donnerstag'
    WHEN extract(dow from stamp) = 5 THEN 'Freitag'
    WHEN extract(dow from stamp) = 6 THEN 'Samstag'
    ELSE 'Sonstag'
END
FROM stamps; 

create table intervals (
	jahre interval,
	datum date
);

insert into intervals values ('2 years'::interval, '2024-01-31');
select *, (jahre + datum)::date as sum from intervals;
select *, extract(year from jahre + datum) as sum from intervals;

--update exam set grade = null where student = 'grs005' and teacher = 'b002';
update exam set grade = -1 where teacher = 'b002';
select * from teacher;
select * from exam;
-- Aufgabe: An welchen Wochentagen wurden die Lehrer geboren?

-- Frage für nächste LV: 
-- Die Namen aller Lehrer, die noch keine Noten vergeben haben, 
select distinct(teacher) from exam
except
select distinct(teacher) from exam where grade > 0;

-- Lehrer (Nachname) die die schlechtesten Beurteilungen geben
select * from teacher, exam where account = teacher;
select teacher, avg(grade) from teacher, exam where account = teacher and grade > 0 group by teacher;
select teacher, avg(grade) from teacher, exam where account = teacher and grade > 0 group by teacher;
select lastname, teacher, avg(grade) from teacher, exam where account = teacher and grade > 0 group by teacher, lastname;
-- !!
select lastname, firstname, avg(grade) from teacher, exam where account = teacher and grade > 0 group by account;
select * from exam;
select course, count(*) from exam group by teacher;

select * from exam e join teacher t on e.teacher = t.account ;
select t.lastname, avg(grade) from exam e join teacher t on e.teacher = t.account where grade > 0 group by t.lastname;




select * from exam;
--insert into exam values ('');
update exam set grade = 5 where grade = -1;

 select teacher, course, count(*) from exam group by teacher; 
select teacher, course, count(*) from exam group by teacher, course;
select teacher, course, count(*) from exam group by teacher, course having count(*) >= 3;

select * from exam e join teacher t on e.teacher = t.account where grade > 0;
select t.lastname, avg(grade) from exam e join teacher t on e.teacher = t.account where grade > 0 
  group by t.lastname; --having(max(case when course = 'Biology' THEN 1 ELSE 0 end) = 0);
 
 select t.lastname, avg(grade) from exam e join teacher t on e.teacher = t.account where grade > 0 
  group by t.lastname having(sum(case when student = 'bah12' THEN 1 ELSE 0 end) > 0);
 
 
select * from exam;
select count(grade) from exam where grade > 0;
select count(distinct(grade)) from exam order by grade;
select grade, count(grade) from exam where grade > 0 group by grade having count(*) = 1;



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




