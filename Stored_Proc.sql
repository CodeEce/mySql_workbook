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