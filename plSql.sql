drop table if exists film cascade;
drop table if exists actor cascade;

create table film (
	film_id int primary key,
	title varchar(255),
	length int
);

drop table if exists actor cascade;
create table actor (
	actor_id int primary key,
	first_name varchar(255),
	last_name varchar(255),
	last_update timestamp without time zone
);

insert into film values (1, 'the big lebowski', 118);
insert into film values (2, 'into the wild', 152);
insert into film values (3, 'fargo', 90);

-- CURRENT_TIME with timestamp
insert into actor values (1, 'Jeff', 'Bridges', now());
insert into actor values (2, 'Emile', 'Hirsch', now() - INTERVAL '300 DAY');
insert into actor values (3, 'Frances', 'McDormand', now() - INTERVAL '300 DAY'); 

do 
$$
--<<first_block>>
declare
   film_count integer := 0;
   now_ timestamp = now();
   user_ text = 'SMIR';
begin 
   select count(*) into film_count
   from film;
   raise notice 'The number of films: % scanned at: % from user: %', film_count, now_, user_;
end ---first_block;
$$


create or replace function film_name(in id__ int)
  returns varchar 
  language plpgsql
as
--do 
$$
declare
  title_ film.title%type;
--  id_ int = 2;
begin 
  select title from film where film_id = id__ into title_;
  raise notice 'The title of film % is: %', id__, title_;
  --return 'Film with ' || id__ || ' has title ' || title_;
  return title_;
end;
$$

select film_name(1);

-- my_add(a int, b int)
--> a + b


create or replace function add_percent(price int, percentage int)
  returns decimal 
  language plpgsql
as
--do 
$$
declare
  priced decimal;
begin 
  priced = price;
  return priced + priced/100*percentage;
end;
$$

select add_percent(film_id, 20) from film;
select add_percent(film_id, 19) from film;

-- Todo
-- Die Namen aller Filme ausgeben
select film_name(film_id) from film;

-- Ganze Tabelle als Parameter übergeben


create or replace function ltitle(in id__ int)
  returns varchar 
  language plpgsql
as
--do 
$$
declare
  --film_ film%ROWTYPE;
  film_ record;
begin 
  --select * from film where film_id = id__ into film_;
  select * from film into film_ where film_id = id__;
  raise notice 'length: %, title: %', film_.length, film_.title;
  return film_.title || ' (' || film_.length || ' )';
end;
$$

select ltitle(film_id) from film; 
select 'film: ' || title from film;
select $$film: $$ || title from film;

---
do $$
	declare
	rec record;
	--rec film%rowtype;
begin
	for rec in select title, length
		from film 
		where length > 100
		order by length
	loop
		raise notice 'film: % (%)', rec.title, rec.length;
	end loop;
end;
$$
language plpgsql;

select * from film where length > 100 order by length;

select 1;
select 1::char;
--select cast('a' as int);

select upper('datenbanKEn-uNd-InFORMationSSYsteme');
select lower('datenbanKEn-uNd-InFORMationSSYsteme');


drop function if exists my_lower;

create table alphabet (
  key char primary key,
  value char
);

insert into alphabet values
('a', 'a'),
('A', 'a'),
('b', 'b'),
('B', 'b');



create or replace function my_lower(word varchar)
returns varchar
language plpgsql
as $$
declare
    c char;
    cl char;
	chars char[];
    ret varchar;
    
begin
	ret = '';
    chars = regexp_split_to_array(word, '');		
	FOREACH c in array chars LOOP
		--raise notice 'current char: %', c;
		select value from alphabet where key = c into cl;
		ret = ret || cl;
    END LOOP;
    return ret;
end; $$


select my_lower('BbaA');

select 'a' || 'b';
select * from film;
select my_lower(title) from film;