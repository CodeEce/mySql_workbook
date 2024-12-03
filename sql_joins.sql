-- ---------------------------------------- TYPES OF JOINS---------------------------
-- INNER JOIN
-- LEFT JOIN  
-- RIGHT JOIN 
-- FULL JOIN  ( UNION OR UNION ALL )
-- CROSS JOIN 
-- SELF JOIN
CREATE database JOINS;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);
CREATE TABLE employees_1 (
    employee_id INT ,
    employee_name VARCHAR(50),
    department_id INT
);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES
    (1, 'Alice', 101),
    (2, 'Bob', 102),
    (3, 'Charlie', 103),
    (5,'George',105);
INSERT INTO employees_1 (employee_id, employee_name, department_id)
VALUES
    (1, 'Alice', 101),
    (2, 'Bob', 102),
    (4, 'Charlie', 103),
     (5, 'James', 104),
    (6,'George',105);
INSERT INTO departments (department_id, department_name)
VALUES
    (101, 'HR'),
    (102, 'IT'),
    (104, 'Marketing'),
    (105,'Trainer'),
    (106,'Medical');
    
-- INNER JOIN
SELECT employees.employee_id,employees.employee_name,departments.department_name
FROM employees INNER JOIN departments 
ON employees.department_id = departments.department_id;

-- LEFT JOIN 
SELECT employees.employee_id,employees.employee_name,departments.department_name
FROM employees LEFT JOIN departments 
ON employees.department_id = departments.department_id;   

-- RIGHT JOIN
SELECT employees.employee_id,employees.employee_name,departments.department_name
FROM employees RIGHT JOIN departments 
ON employees.department_id = departments.department_id; 

-- FULL JOIN
SELECT employees.employee_id,employees_1.employee_name
FROM employees LEFT JOIN employees_1 
ON employees.employee_id = employees_1.employee_id  
UNION 
SELECT employees.employee_id,employees_1.employee_name
FROM employees RIGHT JOIN employees_1 
ON employees.employee_id = employees_1.employee_id;

SELECT employees.employee_id,employees_1.employee_name
FROM employees LEFT JOIN employees_1 
ON employees.employee_id = employees_1.employee_id  
UNION ALL
SELECT employees.employee_id,employees_1.employee_name
FROM employees RIGHT JOIN employees_1 
ON employees.employee_id = employees_1.employee_id order by employee_id;

-- CROSS JOIN
SELECT employees.employee_id,employees_1.employee_name
FROM employees CROSS JOIN employees_1 order by employee_id;

-- SELF JOIN

CREATE TABLE RELATION(
ID INT,
P_NAME varchar(50),
AGE INT,
PARENT_ID INT
);  
    
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(1,'Alex',75);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(2,'Rose',52,1);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(3,'Julie',45,7);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(4,'John',48,1);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(5,'Max',12,2);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(6,'Alina',20,4);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(7,'Henry',68,8);
INSERT INTO RELATION(id,p_name,age) VALUES(8,'Mary',88);
INSERT INTO RELATION (id,p_name,age,parent_id) VALUES(9,'Jack',42,7);
INSERT INTO RELATION(id,p_name,age,parent_id) VALUES(10,'George',12,9);
select * from relation;
    
select p.id,p.p_name as Parent_Name,p.age,c.P_name as child_Name,c.age,c.parent_id from relation p,relation c where p.id=c.parent_id;    
    
select * from employees Except select * from  employees_1;      -- use left join with where 
select * from employees intersect select * from  employees_1;  -- use inner join

    
    
    