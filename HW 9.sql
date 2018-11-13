
-- using the sakila database
USE sakila

-- Looking at all data in table 'actor'
-- 1a
SELECT * FROM actor

-- Concatonate the first and last name columns as one column named "actor_name"
-- 1b
SELECT CONCAT(first_name, ',', last_name) AS ACTOR_NAME FROM actor

-- Select all info about any person in the actor table named Joe
-- 2a
SELECT * FROM actor WHERE first_name = "Joe"

-- Select all names from the actor table where the last name contained the letters GEN
-- 2b
SELECT * FROM actor WHERE last_name LIKE "%GEN%"

-- Select from the last_name and first_name columns in the actor table where last_name had LI in it
-- 2c
SELECT last_name, first_name
    FROM actor 
    WHERE last_name LIKE '%LI%';

-- Within the table country, select both the country name and country id from only the countries listed 
-- 2d
Select country_id, country
FROM country
Where country IN
("Afghanistan", "Bangladesh", "China");

-- Change the actor table to represent a new column named description
-- 3a

ALTER TABLE actor
ADD description BLOB;

-- Then take it away, using the "DROP COLUMN" function
-- 3b

ALTER TABLE actor
DROP COLUMN description


-- Looking for unique last names within the table "actor" and grouping by last name
-- 4a

select last_name, 
count(last_name)
FROM actor
Group by last_name;


-- Take that same list, and only grab last names that have been repeated at least twice
-- 4b
SELECT last_name, COUNT(last_name)
FROM actor
group by last_name
having count(last_name) > 1;


-- 4c
update actor
set first_name = "HARPO"
where actor_id = 172;




-- 4d

update actor 
set first_name = "GROUCHO"
where first_name = "HARPO";


-- had to trouble shoot, was getting an error code '1175' where,
-- it said I was using a safe update mode, used this query to negate that,
-- and then ran 4d with success.
SET SQL_SAFE_UPDATES = 0;


-- Use function to find a missing database element, this shows you that the table,
-- address is still availabe to run queries with because it exists within our sakila database
-- 5
show create table address

-- We use the staff and address tables to grab first names, last names and addresses
-- Then use an inner join on address defined by a on the two address id's associated with the address and staff tables
-- 6a 

select s.first_name as first_name,s.last_name as last_name,a.address
from staff as s
inner join address as a on s.address_id = a.address_id;

-- 6b
-- stumped on this question, have tried multiple ways to do it.. 

-- 6c 
-- aslo uses the same type of function formatting as 6b, 
-- stumped on how to use the 2005 portion of the question in my query (for both)

--

