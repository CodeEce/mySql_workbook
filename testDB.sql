create database testDB;
use testDB;
drop database testdb;

create database testDB;

create table emp_data(
ID int auto_increment primary key,
emp_ID varchar(255)  not null,
e_name varchar(30) not null,
e_Dob date not null,
e_age int ,
e_aadhar varchar(255) unique not null,
e_address varchar(255),
e_country varchar(255) default 'India',
e_mobileno varchar(255) unique not null,
e_Designation varchar(255),
e_salary int,
e_branch varchar(255),
check(e_age>=18)
);
insert into emp_data(emp_ID,e_name,e_Dob,e_age,e_aadhar,e_address,e_country,e_mobileno,e_Designation,e_salary,e_branch) 
values ('E102','Manojh kumar','1992-03-16',32,'127905874521','no:4,north street,madurai,606172','london',9994444878,'IT Analyst',50000,2);
insert into emp_data(emp_ID,e_name,e_Dob,e_age,e_aadhar,e_country,e_mobileno,e_Designation,e_salary,e_mail,e_address,e_branch) 
values ('E103','Harjith','2005-03-11',19,'127902574521','no:10,north street,kovai,606272','i',9994444878,'IT Analyst',50000,2);
insert into emp_data(emp_ID,e_name,e_Dob,e_age,e_aadhar,e_mobileno,e_Designation,e_salary,e_mail,e_address,branch_ID) values
('E103','Mathan','2005-03-11',19,'127902574515',9924544878,'Developer',48000,'santhosh12@gmail.com','no:10,east street,chennai,606282',1),
('E105','Viswa','2000-02-10',24,'127902574535',6924447878,'Admin',32000,'viswa34@gmail.com','no:12,west street,chennai,606282',2),
('E106','Swetha','2001-10-21',23,'127912574525',9724554878,'Assitant',20000,'swetha32@gmail.com','no:20,north street,chennai,606282',3),
('E107','Prakya','2005-11-22',19,'127902674525',8824444878,'Trainer',19000,'pra124@gmail.com','no:22,south street,cuddalore,606282',4),
('E108','Hari','2000-03-17',24,'227902574525',7224444878,'Developer',50000,'hari25@gmail.com','no:17,temple street,chennai,606282',3),
('E109','Karthik','2001-07-13',23,'327902574525',9924444928,'Manager',40000,'kat25@gmail.com','no:10,VOC street,madurai,606282',6),
('E110','Kavin','1992-06-16',32,'427912574525',9924244878,'Testing',34000,'vin24@gmail.com','no:42,KK street,chennai,606282',5),
('E111','Sandy','1998-05-14',26,'427902674525',9928444878,'TL',52000,'and25@gmail.com','no:11,VIP street,cuddalore,606282',4),
('E112','Jai','1990-04-10',34,'727902574585',7254444878,'Manager',62500,'jai36@gmail.com','no:22,4th Cross street,salem,606282',6),
('E113','Tharun','1994-03-11',26,'727902584525',9922154878,'HR',27800,'tha27@gmail.com','no:15,5th cross street,chennai,606282',1);

select * from emp_data;

alter table emp_data change column e_branch branch_ID int ;
update emp_data set branch_ID = 2 where ID = 2;
alter table emp_data add e_mail varchar(255);
update emp_data set e_mail ='vinoma1196@gmail.com' where ID = 1;
alter table emp_data drop e_address;
alter table emp_data  add e_address varchar(255);

create table branch(
branch_ID int primary key auto_increment,
branch_name varchar(255)
 );
 insert into branch(branch_name)values('salem');
 select * from branch;
 alter table emp_data add column branch_ID int;
 alter table emp_data add foreign key (branch_ID) references branch(branch_ID);
 














 