DROP TABLE IF EXISTS film CASCADE;

create table film (
	film_id int primary key,
	title varchar(255),
	length int
);

insert into film values (1, 'the big lebowski', 118);
insert into film values (2, 'into the wild', 152);
insert into film values (3, 'fargo', 90);

select count(*) from film;

SELECT 'That''s my first sql script';
--SELECT $$That's my first sql script$$;

do 
$$
<<first_block>>
declare
   film_count integer := 0; 
begin 
   select count(*) into film_count
   from film;
   raise notice 'The number of films: %', film_count;
   raise notice 'The number of films +1: %', film_count+1;
end first_block;
$$


create function find_film_by_id(
   id int
) returns film 
-- hier SQL nicht PL/SQL!
language sql
as 
  'select * from film 
   where film_id = id';
  
select find_film_by_id(1);
  
-- call function 
select find_film_by_id(2);
