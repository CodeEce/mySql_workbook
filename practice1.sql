create table students(
id int,
name varchar(255),
age int
);
alter table students add column grade varchar(255);
alter table students rename column FinalGrade to Final_Grade ;
insert into students (id,name,age,Final_Grade)values
(101,'SANAM',10,'A'),
(102,'POOJA',12,'C'),
(103,'NEHA',17,'B'),
(104,'AJAY',14,'B'),
(105,'MEENA',15,'C'),
(106,'RIYA',15,'A'),
(107,'LAILA',13,'C'),
(108,'SUNIL',15,'A'),
(109,'AKASH',16,'B'),
(110,'KABIL',18,'C');
UPDATE STUDENTS SET AGE =21 WHERE ID=101;
DELETE FROM students WHERE ID =101;
SELECT * FROM STUDENTS WHERE AGE>=15 ;
SELECT * FROM STUDENTS WHERE NAME='MEENA' OR NAME ='NEHA';
SELECT * FROM STUDENTS WHERE NAME IN ('MEENA','NEHA');
SELECT * FROM STUDENTS WHERE FINAL_GRADE = 'A' OR FINAL_GRADE = 'B' AND AGE>15;
SELECT *FROM STUDENTS WHERE AGE between 15 AND 20;
SELECT * FROM STUDENTS WHERE AGE<15;
SELECT * FROM STUDENTS WHERE FINAL_GRADE >'A';
SELECT count(*) AS STUDENT_COUNT FROM STUDENTS;
SELECT SUM(age) FROM STUDENTS WHERE FINAL_GRADE = 'A' OR FINAL_GRADE = 'B' ;
SELECT COUNT(*),FINAL_GRADE FROM STUDENTS group by FINAL_GRADE;
SELECT AVG(AGE),AGE FROM STUDENTS GROUP BY AGE;
SELECT COUNT(*),FINAL_GRADE FROM STUDENTS group by FINAL_GRADE ORDER BY COUNT(*)desc LIMIT 1;
SELECT AVG(AGE) FROM STUDENTS group by FINAL_GRADE HAVING avg(AGE)>=15;
SELECT COUNT(*),FINAL_GRADE FROM STUDENTS GROUP BY FINAL_GRADE HAVING COUNT(*)<3;
SELECT AVG(AGE),FINAL_GRADE FROM STUDENTS group by FINAL_GRADE having AVG(AGE) between 12 AND 18;
SELECT * FROM STUDENTS order by AGE ASC;
SELECT * FROM STUDENTS WHERE FINAL_GRADE = 'A' OR FINAL_GRADE ='B' ORDER BY AGE DESC;
SELECT * FROM STUDENTS ORDER BY FINAL_GRADE ASC;





select * from students;