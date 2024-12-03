create table customer(
customer_id int,
customer_name varchar(100),
customer_address varchar(100),
city varchar(50),
state varchar(50),
ZIP_Code varchar(50)
);
insert into customer values(1,'Cathy Cook','4010 Speed Way','Tucson','AZ',85719);
insert into customer values(2,'James','4021 Lawrance Street','Texas','TZ',75719);
insert into customer values(3,'Cathy Marvel','1452 Greens Way','Sandiago','YZ',65719);
alter table customer change column customer_address address varchar(100);
alter table customer change column mobile_number mobile_number varchar(255);
 -- delete mobile_number from customer where mobile_number is null;
 update customer set mobile_number = 2545636545 where customer_name = 'Mary Smith';
 delete  from customer where ZIP_Code =85719;
 select * from customer where customer_ID>1;
 alter  table customer drop column mobile_number;
 truncate table customer;
select * from customer;
alter table student add column marks int;
insert into student values('vino',21,'ECE',78);
insert into student values('mano',21,'EEE',98);
insert into student values('margo',22,'ECE',77);
insert into student values('javith',25,'CSE',68);
insert into student values('roja',20,'CSE',68);
insert into student values('kavi',21,'IT',68);
insert into student values('arjun',25,'EEE',68);
insert into student values('harjith',28,'IT',68);
select * from student;
alter table student change column name sname varchar(120);
select max(marks),department from student where department = 'ECE';
select * from student order by marks desc;
select * from student order by sname asc;
select count(sname),department from student group by department;
alter table student add column lastname varchar(50);
update student set lastname ='martin' where sname = 'margo' ;
update student set lastname ='lee' where sname = 'javith' ;
update student set lastname ='jam' where sname = 'harjith' ;
alter table students add  primary key(id);
SET SQL_SAFE_UPDATES = 0;
update student set marks = 70 where sname='javith';
update student set marks = 60 where sname='roja';
update student set marks = 72 where sname='harjith';
select * from student order by lastname asc;
select * from student where department='IT' order by marks desc ;
select count(sname),department from student group by department;
select avg(marks),department from student group by department order by avg(marks) asc limit 1 offset 1 ;


select avg(marks),department from student  group by department having avg(marks)>60