-- My NOTE

-- CREATE DATABASE
show databases (MySQL)

create database udemy
--

-- DROP DATABASE
drop database hello_world_db
--

-- USE DATABASE
create database dog_Walking_app

use dog_walking_app

select database()

drop database dog_walking_app
--

-- CREATE TABLES
create table tablename(
	column_name data_type,
	column_name data_type
)

create table cats(
	name varchar(100),
	age int
)
--

-- SHOWING DATA (show)
show tables

show cloumns from cats

desc cats
--

-- DELETING TABLES
drop table <tablename>

drop table cats
--

-- DEFINE TABLES
create table pastries(
	[name] varchar(50),
	quantity int
)

select * from pastries

drop table pastries
--

-- INSERTING DATA
create table cats(
	[name] varchar(50),
	age int
)

insert into cats ([name], age)
values ('Blue', 1)

insert into cats (age, [name])
values (11, 'Draco')

select * from cats
--

-- SHOWING DATA (select)
select * from cats
--

-- MULTIPLE INSERT
insert into cats([name], age)
values('Peanut', 2),
('Butter', 4),
('Jelly', 7)

select * from cats
--

-- INSERT EXERCISES
create table people(
	first_name varchar(20),
	Last_name varchar(20),
	age int
)

insert into people (first_name, last_name, age)
values ('Tina', 'Belcher', 13)

insert into people (last_name, first_name, age)
values ('Belcher', 'Bob', 42)

insert into people (first_name, last_name, age)
values ('Linda', 'Belcher', 45),
('Philip', 'Frond', 38),
('Calvin', 'Fischoeder', 70)

select * from people

drop table people
--

-- SHOWING WARNING
show warnings
--

-- NOT NULL
create table cats2 (
	[name] varchar(100) not null,
	age int not null
)
--

-- DEFAULT VALUES
create table cats3 (
	[name] varchar(20) default 'no name provided',
	age int default 99
)

insert into cats3 (age)
values (13)

insert into cats3 ([name], age)
values ('Montana', NULL)

create table cats4 (
	[name] varchar(20) not null default 'unnamed',
	age int not null default 99
)
--

-- PRIMARY KEY
insert into cats ([name], age)
values ('Helena', 6)

select * from cats

create table unique_cats (
	cat_id int not null,
	[name] varchar(100),
	age int,
	primary key(cat_id)
)

insert into unique_cats(cat_id, [name], age)
values(1, 'Fred', 23)

insert into unique_cats(cat_id, [name], age)
values(2, 'Louise', 3)

select * from unique_cats

create table unique_cats2(
	cat_id int not null auto_increment, -- MySQL
	[name] varchar(100),
	age int,
	primary key(cat_id)
)

create table unique_cats2(
	cat_id int not null identity, -- SQL Server identity(5, 10) starts with 5 and it will increment by 5
	[name] varchar(100),
	age int,
	primary key(cat_id)
)

insert into unique_cats2([name], age)
values('Skippy', 4),
('Jiff', 3),
('Jiff', 3),
('Jiff', 3),
('Skippy', 4)

select * from unique_cats2
--

-- TABLE CONSTRAINTS EXERCISES
create table employees(
	id int primary key identity not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	middle_name varchar(255),
	age int not null,
	current_status varchar(255) default 'employed' not null
)

insert into employees(first_name, last_name, age)
values('Dora', 'Smith', 58)

select * from employees
--

-- PREPARING DATA
DROP TABLE cats

CREATE TABLE cats( 
     cat_id INT PRIMARY KEY IDENTITY NOT NULL, 
     [name] VARCHAR(100), 
     breed VARCHAR(100), 
     age INT
)

INSERT INTO cats([name], breed, age) 
VALUES('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dumbledore', 'Maine Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 13),
('George Michael', 'Ragdoll', 9),
('Jackson', 'Sphynx', 7)

select * from cats
--

-- SELECTING DATA
SELECT * FROM cats

SELECT [name] FROM cats

SELECT age FROM cats

SELECT cat_id FROM cats

SELECT [name], age FROM cats

SELECT cat_id, [name], age FROM cats

SELECT age, breed, [name], cat_id FROM cats

SELECT cat_id, [name], age, breed FROM cats
--

-- WHERE
SELECT * FROM cats WHERE age=4

SELECT * FROM cats WHERE name='Egg'
--

-- SELECT EXERCISES
select cat_id from cats

select [name], breed from cats

select [name], age from cats where breed='Tabby'

select cat_id, age from cats where cat_id=age

SELECT * FROM cats WHERE cat_id=age
--

-- ALIASES
SELECT cat_id AS id, [name] FROM cats;
 
SELECT [name] AS 'cat name', breed AS 'kitty breed' FROM cats
--

-- UPDATE
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'

UPDATE cats SET age=14 WHERE name='Misty'
--

-- UPDATE EXERCISES
select * from cats

update cats set [name]='Jack'
where [name]='Jackson'

update cats set breed='British Shorthair'
where [name]='Ringo'

update cats set age=12
where breed='Maine Coon'
--

-- DELETE
DELETE FROM cats

DELETE FROM cats WHERE name='Egg'
--

-- DELETE EXERCISES
select * from cats

delete from cats where age=4

delete from cats where age=cat_id

delete from cats
--

-- RUN SQL FILES
CREATE TABLE cats
    (
        cat_id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(100),
        age INT,
        PRIMARY KEY(cat_id)
    );
 
mysql-ctl cli
 
use cat_app;
 
source first_file.sql
 
DESC cats;
 
 
 
INSERT INTO cats(name, age)
VALUES('Charlie', 17);
 
INSERT INTO cats(name, age)
VALUES('Connie', 10);
 
SELECT * FROM cats;
 
source testing/insert.sql
--

-- LOAD BOOK DATA
DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop;
USE book_shop; 
 
CREATE TABLE books 
	(
		book_id INT NOT NULL IDENTITY,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where Im Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

source book_data.sql 

DESC books;
SELECT * FROM books;
--

-- COMBINE DATA (CONCAT)
select author_fname, author_lname from books

select concat('Hello', 'World')

select concat(author_fname, ' ', author_lname) as full_name from books

select author_fname as 'First Name', author_lname as 'Last Name', concat(author_fname, ' ', author_lname) as 'Full Name' from books

select concat_ws(' - ', title, author_fname, author_lname) from books
--

-- SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);
 
SELECT SUBSTRING('Hello World', 1);
 
SELECT SUBSTRING('Hello World', -1, 11);
 
SELECT title FROM books;
 
SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);
 
SELECT SUBSTRING(title, 1, 10) FROM books;
 
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;
 
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') FROM books;
 
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title' FROM books;

select concat('0', SUBSTRING ('+6287882818232', 4, 14))
--

-- REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@');
 
SELECT REPLACE('Hello World', 'l', '7');
 
SELECT REPLACE('Hello World', 'o', '0');
 
SELECT REPLACE('HellO World', 'o', '*');
 
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;
 
SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) FROM books;
 
SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string' FROM books;
--

-- REVERSE
SELECT REVERSE('Hello World');
 
SELECT REVERSE('meow meow');
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
--

-- CHAR LENGTH = LEN
SELECT CHAR_LENGTH('Hello World');
 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

SELECT len('Hello World');
 
SELECT author_lname, len(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', len(author_lname), ' characters long') FROM books;
--

-- UPPER AND LOWER
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;
--

-- STRING EXERCISES
select reverse(upper('Why does my cat look at me with such hatred?'))

select replace(concat('I', ' ', 'like', ' ', 'cats'), ' ', ' - ')

select replace(title, ' ', '->') as title from books

select author_lname as forwards, reverse(author_lname) as backwards from books

select upper(concat(author_fname, ' ', author_lname)) as 'full name in caps' from books

select concat(title, ' was released in ', released_year) as blurb from books 

select title, len(title) as 'character count' from books

select concat(substring(title, 1, 10), '...') as 'short title', concat(author_lname, ', ', author_fname) as author, concat(stock_quantity, ' in stock') as quantity
from books
--

-- SEED DATA
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367)

select title from books
--

-- DISTINCT
SELECT author_lname FROM books;
 
SELECT DISTINCT author_lname FROM books;
 
SELECT author_fname, author_lname FROM books;
 
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
 
SELECT DISTINCT author_fname, author_lname FROM books;
--

-- ORDER BY
SELECT author_lname FROM books;
 
SELECT author_lname FROM books ORDER BY author_lname;
 
SELECT title FROM books;
 
SELECT title FROM books ORDER BY title;
SELECT author_lname FROM books ORDER BY author_lname DESC;
 
SELECT released_year FROM books;
 
SELECT released_year FROM books ORDER BY released_year;
 
SELECT released_year FROM books ORDER BY released_year DESC;
 
SELECT released_year FROM books ORDER BY released_year ASC;
 
SELECT title, released_year, pages FROM books ORDER BY released_year;
 
SELECT title, pages FROM books ORDER BY released_year;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 2;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 3;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 1;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 1 DESC;
 
SELECT author_lname, title
FROM books ORDER BY 2;
 
SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;
--

-- LIMIT
SELECT title FROM books --LIMIT 3; --MySQL
SELECT TOP 3 title FROM books --SQL Server
 
SELECT title FROM books --LIMIT 1;
 
SELECT title FROM books --LIMIT 10;
 
SELECT * FROM books --LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 14;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 0,5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 0,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 1,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC --LIMIT 10,1;
 
SELECT title FROM books --LIMIT 5;
 
SELECT title FROM books --LIMIT 5, 123219476457;
 
SELECT title FROM books --LIMIT 5, 50;
--

-- LIKE
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
 
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
 
SELECT title FROM books WHERE  title LIKE 'the';
 
SELECT title FROM books WHERE  title LIKE '%the';
 
SELECT title FROM books WHERE title LIKE '%the%';

SELECT title, stock_quantity FROM books;
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
 
SELECT title FROM books;
 
SELECT title FROM books WHERE title LIKE '%\%%'
 
SELECT title FROM books WHERE title LIKE '%\_%'
--

-- SELECTIONS EXERCISES
select title from books
where title like '%stories%'

select title, pages from books 
order by pages desc --limit 1

select concat(title, ' - ', released_year) as summary from books
order by released_year desc --limit 3 

select title, author_lname from books
where author_lname like '% %'

select title, released_year, stock_quantity from books
order by stock_quantity --limit 3

select title, author_lname from books
order by author_lname, title

select concat('MY FAVORITE AUTHOR IS ', upper(author_fname), ' ', upper(author_lname), ' !') as yell from books
order by author_lname
--

-- COUNT
SELECT COUNT(*) FROM books;
 
SELECT COUNT(author_fname) FROM books;
 
SELECT COUNT(DISTINCT author_fname) FROM books;
 
SELECT COUNT(DISTINCT author_lname) FROM books;
 
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
 
SELECT title FROM books WHERE title LIKE '%the%';
 
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
--

-- GROUP BY
SELECT title, author_lname FROM books;
 
SELECT title, author_lname FROM books
GROUP BY author_lname;
 
SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname;
 
 
SELECT title, author_fname, author_lname FROM books;
 
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
 
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
 
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
 
SELECT released_year FROM books;
 
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
 
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;
--

-- MIN and MAX
SELECT MIN(released_year) 
FROM books;
 
SELECT MIN(released_year) FROM books;
 
SELECT MIN(pages) FROM books;
 
SELECT MAX(pages) 
FROM books;
 
SELECT MAX(released_year) 
FROM books;
 
SELECT MAX(pages), title
FROM books;

SELECT author_fname, 
       author_lname, 
       Min(released_year) 
FROM   books 
GROUP  BY author_lname, 
          author_fname;
 
SELECT
  author_fname,
  author_lname,
  Max(pages)
FROM books
GROUP BY author_lname,
         author_fname;
 
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;
--

-- SUBQUERIES
SELECT * FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 
 
SELECT title, pages FROM books 
WHERE pages = (SELECT Max(pages) 
                FROM books); 
 
SELECT title, pages FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 
 
SELECT * FROM books 
ORDER BY pages ASC --LIMIT 1;
 
SELECT title, pages FROM books 
ORDER BY pages ASC --LIMIT 1;
 
SELECT * FROM books 
ORDER BY pages DESC --LIMIT 1;
--

-- SUM
SELECT SUM(pages)
FROM books;
 
SELECT SUM(released_year) FROM books;
 
SELECT author_fname,
       author_lname,
       Sum(pages)
FROM books
GROUP BY
    author_lname,
    author_fname;
 
SELECT author_fname,
       author_lname,
       Sum(released_year)
FROM books
GROUP BY
    author_lname,
    author_fname;
--

-- AVG
SELECT AVG(released_year) 
FROM books;
 
SELECT AVG(pages) 
FROM books;
 
SELECT AVG(stock_quantity) 
FROM books 
GROUP BY released_year;
 
SELECT released_year, AVG(stock_quantity) 
FROM books 
GROUP BY released_year;
 
SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;
--

-- AGGREGATE FUNCTIONS EXERCISES
select count(book_id) from books

select released_year, count(book_id) from books
group by released_year

select sum(stock_quantity) from books

select concat(author_fname, ' ', author_lname) as fullname, avg(released_year) from books
group by author_lname, author_fname

select concat(author_fname, ' ', author_lname) as author_fullname, title from books
where pages = (select max(pages) from books)

select released_year as year, count(book_id) as '# books', avg(pages) as 'avg pages' from books
group by released_year
--

-- CHAR AND VARCHAR
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
 
INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
 
INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
 
SELECT * FROM dogs;
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
 
SELECT * FROM dogs;
--

-- DECIMAL
CREATE TABLE items(price DECIMAL(5,2));
 
INSERT INTO items(price) VALUES(7);
 
INSERT INTO items(price) VALUES(7987654);
 
INSERT INTO items(price) VALUES(34.88);
 
INSERT INTO items(price) VALUES(298.9999);
 
INSERT INTO items(price) VALUES(1.9999);
 
SELECT * FROM items;
--

-- FLOAT AND DOUBLE
CREATE TABLE thingies (price FLOAT);
 
INSERT INTO thingies(price) VALUES (88.45);
 
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877.45);
 
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877665544.45);
 
SELECT * FROM thingies;
--

-- DATE, TIME, AND DATETIME
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43');
 
SELECT * FROM people;
--

-- CURDATE, CURTIME, AND NOW
--

-- CURDATE, CURTIME, AND NOW (SQL SERVER)
SELECT 'CURRENT_TIMESTAMP  ', CURRENT_TIMESTAMP;
SELECT 'CURRENT_TIMESTAMP  ', CONVERT (time, CURRENT_TIMESTAMP); 

SELECT 'GETDATE()          ', GETDATE();  -- now
SELECT 'GETDATE()          ', CONVERT (time, GETDATE()); 

SELECT 'GETUTCDATE()       ', GETUTCDATE();  
SELECT 'GETUTCDATE()       ', CONVERT (time, GETUTCDATE()); 
--

-- FORMATTING DATES
SELECT name, birthdate FROM people;
 
SELECT name, DAY(birthdate) FROM people;
 
SELECT name, birthdate, DAY(birthdate) FROM people;
 
SELECT name, birthdate, DAYNAME(birthdate) FROM people; --MySQL
SELECT name, birthdate, datename(weekday, day(birthdate)) FROM people;
-- or
SELECT name, birthdate, datename(dw, day(birthdate)) FROM people; --SQL Server
 
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people; --MySQL
SELECT name, birthdate, datepart(weekday, day(birthdate)) FROM people; --SQL Server
 
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
 
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
 
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
 
SELECT name, birthdt, MONTH(birthdt) FROM people;
 
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
 
SELECT name, birthtime, HOUR(birthtime) FROM people;
 
SELECT name, birthtime, MINUTE(birthtime) FROM people;
 
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
--

-- DATE MATH
SELECT * FROM people;
 
SELECT DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT birthdt FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
 
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
 
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
--

-- TIMESTAMPS
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);
--

-- DATA TYPES EXERCISES
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;
--

-- NOT EQUAL
SELECT title FROM books WHERE released_year = 2017;
 
SELECT title FROM books WHERE released_year != 2017;
 
SELECT title, author_lname FROM books;
 
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
 
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';
--

-- NOT LIKE
SELECT title FROM books WHERE title LIKE 'W';
 
SELECT title FROM books WHERE title LIKE 'W%';
 
SELECT title FROM books WHERE title LIKE '%W%';
 
SELECT title FROM books WHERE title LIKE 'W%';
 
SELECT title FROM books WHERE title NOT LIKE 'W%';
--

-- GREATER THAN
SELECT title, released_year FROM books ORDER BY released_year;
 
SELECT title, released_year FROM books 
WHERE released_year > 2000 ORDER BY released_year;
 
SELECT title, released_year FROM books 
WHERE released_year >= 2000 ORDER BY released_year;
 
SELECT title, stock_quantity FROM books;
 
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
 
SELECT 99 > 1;
 
SELECT 99 > 567;
 
100 > 5
-- true
 
-15 > 15
-- false
 
9 > -10
-- true
 
1 > 1
-- false
 
'a' > 'b'
-- false
 
'A' > 'a'
-- false
 
'A' >=  'a'
-- true
 
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
 
SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
 
SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';
--

-- LESS THAN
 SELECT title, released_year FROM books;
 
SELECT title, released_year FROM books
WHERE released_year < 2000;
 
SELECT title, released_year FROM books
WHERE released_year <= 2000;
 
SELECT 3 < -10;
-- false
 
SELECT -10 < -9;
-- true
 
SELECT 42 <= 42;
-- true
 
SELECT 'h' < 'p';
-- true
 
SELECT 'Q' <= 'q';
-- true
--

-- AND
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers';
 
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010;
 
SELECT  
    title, 
    author_lname, 
    released_year FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010;
 
SELECT 1 < 5 && 7 = 9;
-- false
 
SELECT -10 > -20 && 0 <= 0;
-- true
 
SELECT -40 <= 0 AND 10 > 40;
--false
 
SELECT 54 <= 54 && 'a' = 'A';
-- true
 
SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';
--

-- OR
SELECT 
    title, 
    author_lname, 
    released_year 
FROM books
WHERE author_lname='Eggers' || released_year > 2010;
 
 
SELECT 40 <= 100 || -2 > 0;
-- true
 
SELECT 10 > 5 || 5 = 5;
-- true
 
SELECT 'a' = 5 || 3000 > 2000;
-- true
 
SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
OR     stock_quantity > 100;
--

-- BETWEEN
SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
 
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;
 
SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;
 
SELECT CAST('2017-05-02' AS DATETIME);
 
show databases;
 
use new_testing_db;
 
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
 
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
--

-- IN and NOT IN
SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
 
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);
 
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
 
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;
--

-- CASE STATEMENTS
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 
--

-- LOGICAL OPERATOR EXERCISES
select * from books
where released_year < 1980

select * from books
where author_lname in ('Eggers', 'Chabon')

select * from books
where author_lname = 'Lahiri'
and
released_year > 2000

select * from books
where pages between 100 and 200

select * from books
where author_lname like 'C%'
or
author_lname like 'S%'

select title, author_lname,
	case
		when title like '%stories%' then 'Short Stories'
		when title like 'Just Kids' or title like '%A Heartbreaking Work%' then 'Memoir'
		else 'Novel'
	end as TYPE
from books

SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;

-- FOREIGN KEY
-- Creating the customers and orders tables
CREATE TABLE customers(
    id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT IDENTITY PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

-- Inserting some customers and orders
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- This INSERT fails because of our fk constraint.  No user with id: 98
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);
--

-- CROSS JOIN
-- Finding Orders Placed By George: 2 Step Process
SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;

-- Finding Orders Placed By George: Using a subquery
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );

-- Cross Join Craziness
SELECT * FROM customers, orders;
--

-- INNER JOIN
-- implicit inner join
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;
    
-- explicit inner join
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT *
FROM orders
JOIN customers
    ON customers.id = orders.customer_id;

-- arbitrary join - meaningless, but still possible 
SELECT * FROM customers
JOIN orders ON customers.id = orders.id;
--

-- LEFT JOIN
-- Getting Fancier (Inner Joins Still)
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
ORDER BY order_date;
SELECT 
    first_name, 
    last_name, 
    SUM(amount) AS total_spent
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;

-- Left join
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id; 

SELECT 
    first_name, 
    last_name,
    ISNULL(SUM(amount), 0) AS total_spent -- ISNULL --> SQL Server, IFNULL --> MySQL
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id, first_name, last_name
ORDER BY total_spent;
--

-- RIGHT JOIN
-- OUR FIRST RIGHT JOIN (seems the same as a left join?)
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;

-- ALTERING OUR SCHEMA to allow for a better example (optional)
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);

-- INSERTING NEW DATA (no longer bound by foreign key constraint)
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
 
INSERT INTO orders (order_date, amount, customer_id) VALUES
('2017/11/05', 23.45, 45),
(CURDATE(), 777.77, 109);

-- A more complex right join
SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') as last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;
--

-- ON DELETE CASCADE
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
 
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);
 
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
--

-- JOIN EXERCISES
create table students(
	id int identity primary key,
	first_name varchar(100)
)

create table papers(
	title varchar(100),
	grade int,
	student_id int foreign key references students(id) on delete cascade
)

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name, title, grade from students
join papers on students.id = student_id
group by first_name, title, grade
order by grade desc

select first_name, title, grade from students
left join papers on students.id = student_id
group by first_name, title, grade

select first_name, isnull(title, 'Missing'), isnull(grade, 0) from students
left join papers on students.id = student_id
group by first_name, title, grade

select first_name, avg(grade) as average from students
left join papers on students.id = student_id
group by first_name
order by average desc

select first_name, isnull(avg(grade), 0) as average,
	case
		when avg(grade) >= 75 then 'PASSING'
		else 'FAILING'
	end as passing_status
from students
left join papers on students.id = student_id
group by first_name
order by average desc
