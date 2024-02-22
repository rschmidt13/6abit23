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
<<first_block>>
declare
   film_count integer := 0;
   
begin 
   select count(*) into film_count
   from film;
   raise notice 'The number of films: %', film_count;
end first_block;
$$