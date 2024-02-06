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
