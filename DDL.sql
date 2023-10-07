-- Projekt Klassenverwaltung
-- DDL Anweisungen

drop schema if exists Schule_2023 cascade;
create schema if not exists Schule_2023;
set search_path to Schule_2023;

drop table if exists Schueler cascade;
create table Schueler(
	MNr serial primary key,
	Vorname varchar(25),
	Nachname varchar(25),
	Geb_Datum date
);
