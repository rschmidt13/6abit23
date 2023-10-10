-- Schulprojekt

drop schema if exists Schulprojekt cascade;
create schema if not exists Schulprojekt;
set search_path to Schulprojekt;

drop table if exists Projekt cascade;

create table Projekt(
	ID serial primary key,
	Projektname varchar(50),
	Fachgebiet varchar (50)
);