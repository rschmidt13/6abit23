drop schema if exists onlinemagazin cascade;
create  schema onlinemagazin;

set search_path to onlinemagazin;



--- Tabellen werden erstellt


create table if not exists Artikel
( ArtikelID bigserial primary key not null unique,
  AutorID bigserial not null,
  Titel text not null,
  VDATUm date,
  visibility bool,
  isPremium bool
);

create table if not exists Autoren
( AutorID bigserial primary key not null unique,
  Nachname text not null,
  Vorname text not null,
  Geburtstag date not null,
  Sozialversicherungsnummer int not null unique,
  Emailadresse text,
  Adresse text
);


create table if not exists Abonennten
( KundenID bigserial primary key not null unique,
  Nachname text not null,
  Vorname text not null,
  Geburtstag date not null,
  Emailadresse text,
  Adresse text
);


create table if not exists Abrechnung
( AutorID bigserial,
  ArtikelID bigserial,
  Betrag decimal,
  isPaidout boolean not null,
  Auszahlungsdatum date,
  constraint FK_AutorenID FOREIGN key (AutorID) references Autoren(AutorID),
  constraint FK_ArtikelID foreign key (ArtikelID) references Artikel(ArtikelID),
  primary key (AutorID,ArtikelID)
);

create table if not exists Abonnements
( 
  AboID bigserial unique,
  KundenID bigserial,
  Betrag decimal,
  isPaid boolean not null,
  Abo_von date not null,
  abo_bis date default null,
  constraint FK_KundenID FOREIGN key (KundenID) references Abonennten(KundenID) on delete cascade on update cascade,
  primary key (AboID,KundenID,Abo_von)
 
  );
 
 
 create table if not exists Leseberechtigung
( 
  AboID bigserial,
  ArtikelID bigserial,
  isallowd bool,
  constraint FK_ABOID FOREIGN key (AboID) references Abonnements(AboID) on delete cascade on update cascade,
  constraint FK_ArtikelID FOREIGN key (ArtikelID) references Artikel(ArtikelID) on delete cascade on update cascade,
  primary key (AboID,ArtikelID)
  );


 -- Bereinigung der Tabellen
 
delete from onlinemagazin.abonennten;
delete from onlinemagazin.abonnements; 
delete from onlinemagazin.abrechnung;
delete from onlinemagazin.artikel;
delete from onlinemagazin.autoren;
delete from onlinemagazin.leseberechtigung;
 

-- Inserts
-- Abonnenten

insert into onlinemagazin.abonennten values (default,'Löschke', 'Simon',to_date('01.10.2000', 'dd.mm.yyyy'),'andythiel4485@daniel.org','50918 Arch Corners');
insert into onlinemagazin.abonennten values (default,'Ceasar', 'Klein',to_date('01.10.2001', 'dd.mm.yyyy'),'ilenecruickshank@buckridge.name','841 Columbus Springs');
insert into onlinemagazin.abonennten values (default,'Grady', 'Jon',to_date('01.11.2000', 'dd.mm.yyyy'),'odaleffler@powlowski.com','Müllheim');
insert into onlinemagazin.abonennten values (default,'Parisian', 'Harold',to_date('01.09.2000', 'dd.mm.yyyy'),'jens@jens.org','50918 Arch Corners');

--Autoren

insert into onlinemagazin.autoren values (default,'Löschke', 'Thomas',to_date('01.10.2000', 'dd.mm.yyyy'),123456,'andythiel4485@daniel.org','50918 Arch Corners');
insert into onlinemagazin.autoren values (default,'Ceasar', 'Jens',to_date('01.10.2001', 'dd.mm.yyyy'),7891011,'ilenecruickshank@buckridge.name','841 Columbus Springs');
insert into onlinemagazin.autoren values (default,'Grady', 'Paul',to_date('01.11.2000', 'dd.mm.yyyy'),121314,'odaleffler@powlowski.com','Neuenburg');
insert into onlinemagazin.autoren values (default,'Parisian', 'Theresa',to_date('01.09.2000', 'dd.mm.yyyy'),151617,'test@test.org','50918 Arch Corners');

-- Artikel

insert into onlinemagazin.artikel values(default, 1, 'Iusto Voluptates Delectus', to_date('11.11.2019','dd.mm.yyyy'),null,false);
insert into onlinemagazin.artikel values(default, 1, 'Facilis In', to_date('11.11.2019','dd.mm.yyyy'),true,false);
insert into onlinemagazin.artikel values(default, 3, 'Iusto Voluptates Delectus 2', to_date('12.11.2019','dd.mm.yyyy'),false,false);
insert into onlinemagazin.artikel values(default, 2, 'Explicabo Asperiores Qui Harum', to_date('12.11.2022','dd.mm.yyyy'),true,true);

-- Abos

insert into onlinemagazin.abonnements  values (default, 1 ,10.00, true,to_date('01.01.2023','dd.mm.yyyy'));
insert into onlinemagazin.abonnements  values (default, 3 ,10.00, true,to_date('01.01.2023','dd.mm.yyyy'));
insert into onlinemagazin.abonnements  values (default, 2 ,10.00, true,to_date('01.01.2023','dd.mm.yyyy'));


-- Leseberechtigung

insert into onlinemagazin.leseberechtigung values (1,2,true);
insert into onlinemagazin.leseberechtigung values (2,2,true);
insert into onlinemagazin.leseberechtigung values (2,1,false);



-- Abrechnung

select * from abrechnung a;

insert into onlinemagazin.abrechnung values (1,1,123.00, false, null);
insert into onlinemagazin.abrechnung values (4,1,123.00, false, null);
insert into onlinemagazin.abrechnung values (3,4,123.00, true, to_date('11.09.2023','dd.mm.yyyy'));


select a.ispaidout, au.nachname, au.vorname  from abrechnung a,autoren au where a.ispaidout = true and a.autorid = au.autorid ;



 







