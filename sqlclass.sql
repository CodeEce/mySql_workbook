 select * from employees; 
 select * from emp_data;
 select distinct branch from employees;
 
 select ename,dept,salary from employees order by salary  asc;
 
 select ename,branch,dept,salary from employees where dept ='manager' or salary >40000;
 
 select ename,dept,salary from employees where branch = 'Tambaram' AND salary between 20000 AND 50000;
 
 insert into employees(ename,dateofbirth,dept,branch,salary) values
 ('Alice','2002-10-09','Analyst','Peungudi',28000),
  ('Divya','2000-12-04','Analyst','Guindy',28000),
 ('Avinash','2000-12-04','HR','Guindy',20000),
 ('Arya','2001-11-07','Developer','Sholinganallur',29000),
 ('Babu','2002-10-09','Admin','Peungudi',30000),
 ('Reena','2003-11-19','Testing','Guindy',19000),
 ('Arjun','2004-08-29','TechSupport','Veachery',15000),
 ('Sakthi','2005-05-25','HR','OMR',23000),
 ('Roopa','1990-04-17','Developer','Perungalathur',49000);
 insert into employees(ename,dept)values('Surya','Testing');
 
 select ename,dept,salary from employees where salary is null;
 select ename,dept,dateofbirth from employees where dateofbirth is not null;

update employees set salary = 30000 where ID = 8;
SET SQL_SAFE_UPDATES = 0;
update employees set salary = 55000 where dept ='Manager';

delete from employees where ename = 'Riya';

select min(salary) from employees;
select max(salary) from employees where dept = 'Admin';
select min(salary),dept from employees group by dept;

select count(ID) as '[Total employees]' from employees;
select count(ID) as Total_Employees from employees where dept ='HR';
select count(distinct dept) from employees;
select count(ID),dateofbirth from employees group by dateofbirth;

select sum(salary) from employees;
select sum(salary/83) as in_USD from employees;
select sum(salary) from employees where dept = 'HR';
select sum(salary),dept from employees group by dept;

select round(avg(salary),3) from employees;
select round(avg(salary),2) from employees where dept ='HR';
select * from employees where salary > (select avg(salary) from employees);
select avg(salary),dept from employees group by dept;
select avg(salary) from employees;

 select * from employees where ename Like 's%';
 select * from employees where branch like '%t';
 select * from employees where dept like '%ag%';
 select ename,branch from employees where branch like '_M_';
 -- select * from employees where ename like '[ae]%' ;
 select * from employees where dept like 'Analyst';
 
 select  * from employees limit 5;
 select ename from employees  order by ename desc limit 10;
 select * from employees where branch = 'OMR' limit 5;
 select * from employees order by dept limit 5;
 
-- JOINS -------------------------------------------------------------------------

create table activity(
student_id int primary key,
sports varchar(50)
);
insert into activity(student_id,sports)values(102,'Foot ball');
insert into activity(student_id,sports)values(103,'Tennis');
insert into activity(student_id,sports)values(105,'Hockey');
insert into activity(student_id,sports)values(108,'Cricket');
select * from students;

select e.Id,e.emp_ID,e.e_name,e.e_Designation,e.e_salary,b.branch_id,b.branch_name from emp_data e inner join branch b on e.branch_id = b.branch_id;
select employees.ename,customer.customer_name from employees inner join customer on employees.id = customer.customer_id ;

select a.student_id,s.name,s.age,a.sports from students s left join activity a on s.id=a.student_id;

select  a.student_id,s.name,s.age,a.sports from students s right join activity a on s.id=a.student_id;
 
-- select * from emp_data full join employees on emp_data.ID = employees.ID;
 
select * from students cross join activity on  students.id=activity.student_id;  
select * from students cross join activity;

-- GROUP BY AND HAVING ----------------------------------------------------------
select count(emp_ID),e_Designation from emp_data group by e_Designation;
select sum(e_salary) as sum_salary,e_Designation from emp_data  group by e_Designation having sum_salary > 50000 order by sum_salary asc;

select max(e.e_salary) as max_salary,b.branch_name
from emp_data as e inner join branch as b  on e.branch_ID = b.branch_ID 
group by branch_name having max_salary >25000 order by max_salary Desc;

-- INDEX ------------------------------------------------------
create index idx_designation on emp_data(e_designation);
select * from emp_data use index(idx_designation);

DROP INDEX idx_designation ON emp_data;
 
 -- VIEWS ----------------------------------------------
 create view empdata as
 select e_name,e_age,e_designation,e_salary from emp_data where id=5;
 select * from empdata;
 
 -- BETWEEN ------------------------------------------------
 
 select e_name from emp_data where e_name between 'hari' and 'swetha' order by e_name;
 select e_name,e_designation,e_salary from emp_data where e_salary between 30000 and 60000;
 
 -- SUBQUERIES -----------------------------------------------
 select e_name,e_designation,e_salary from emp_data where branch_ID=(select branch_id from branch where branch_id = 4);
 select * from emp_data where e_salary < (select avg(e_salary) from emp_data );
 
select id,name,age from students where not exists (select * from activity where students.id=activity.student_id);
select id,name,age from students where not exists (select * from activity where students.id=activity.student_id);

select id,name,age from students where id = any (select student_id from activity where student_id<105);
select name,age from students where id = all (select sports from activity where sports like 'c');

-- STORED PROCEDURE -------------------------------------------------
-- WITHOUT PARAMETER
DELIMITER $$
CREATE PROCEDURE GET_CUSTOMERDATA()
BEGIN
 SELECT CUSTOMER_NAME,ADDRESS,CITY FROM CUSTOMER;
 END $$
 CALL GET_CUSTOMERDATA();

-- WITH PARAMETER ---------
delimiter $$
create procedure get_studentdata(in stu_id int)
begin
 SELECT s.id , s.name, s.age, a.sports FROM 
 students s LEFT JOIN activity a 
 ON s.id = a.student_id 
 WHERE s.id = stu_id;
end $$
call get_studentdata(105);

DELIMITER $$
CREATE PROCEDURE get_total_students(OUT total_count INT)
BEGIN
    -- Calculate the total number of students and assign it to the OUT parameter
    SELECT COUNT(*) INTO total_count FROM students;
END $$
DELIMITER ;

SET @TOTAL_STU =0;
CALL get_total_students(@TOTAL_STU);
SELECT @TOTAL_STU;

DELIMITER $$

CREATE PROCEDURE get_employee_details(INOUT e_id INT, OUT emp_name VARCHAR(50), OUT emp_salary DECIMAL(10,2))
BEGIN
    -- Select multiple columns (name, salary) based on the emp_id
    SELECT e_name, e_salary INTO emp_name, emp_salary
    FROM emp_data
    WHERE id = e_id;
END $$
DELIMITER ;

set @e_id =7;
call get_employee_details(@e_id,@emp_name,@emp_salary);
select @e_id,@emp_name,@emp_salary;


drop procedure get_studentdata;
