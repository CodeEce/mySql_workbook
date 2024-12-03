-- DDL Commands;
-- DATABASE
select user();
show databases;
select database();
SELECT NOW();
SELECT 2 + 4 ,curdate();
create database master;
drop database master;
use tesdb;
show databases;
show columns from employees;
-- TABLES
create table employee(
id int,
ename varchar(100),
department varchar(100),
salary int
);
alter table employee rename to employees;                         -- rename the table

alter table employees add branch varchar(100);                     -- add new column
alter table employees add dob date after ename;                    -- add new column in specific position
alter table employees rename column dob to dateofbirth;            -- rename the column
alter table employees modify column salary decimal(5,2);           -- modify definition of the column
alter table employees change column department dept varchar(100);  -- change both column name and definition

truncate table employees;                                           -- delete all the records from table
drop table employees;
alter table employees drop column salary;                          -- remove column

select * from employee;
select * from employees;