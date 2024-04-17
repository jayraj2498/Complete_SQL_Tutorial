create database customer ;
show databases;
use customer;

-- # create customer info table 

create table customer_info(
id int auto_increment,
first_name varchar(20),
last_name  varchar(20),
salary integer,
primary key(id)
);
select * from customer_info;

insert into customer_info(first_name,last_name,salary)
values
('john', 'daniel', 30000),
('krish', 'naik', 40000),
('akash', 'dharti', 20000),
('agni','vayu', null);

select * from customer_info where salary is not null;

-- # update statement and replace null val 
update customer_info set salary=50000 where id=4;

delete from  customer_info where id=4;

-- #sql alter table 
-- # ADD column in existing table 
alter table customer_info add email varchar(20);
select * from customer_info; 
alter table customer_info add dob date ;

-- # alter the tabel modify the column 

alter table customer_info modify dob year;

desc customer_info;
-- # alter table drop col 

alter table customer_info drop column email


-- ### constraint ###

/* sql constriant = are use to specify any record in table constraint 
+can be used to limit the type of data that can go into the table (wheathe it have
null,unic,nonnull values)
+it ensure accuracy and reliability in the table and if any voilation in between 
+constraint the action is aborded (if their is mismatch in it the query wont executed)
+contraint can be column level and table level 

contraint 
1)Not null
2)Unique
3)priamry key
4)foreign key
5)check 



*/

use customer;

create table student (
id int not null,
first_name varchar(25) not null,
last_name  varchar(25) not null,
age int
);
desc student;

alter table student modify age int not null ;

create table person(
id int not null,
first_name varchar(20) not null,
last_name  varchar(20) not null,
age int not null,
unique(id)
);

insert into person values(1,'jayraj','sonawane',24);

select * from person 


================================================================================================================

/* sql constriant = are use to specify any record in table constraint 
+ can be used to limit the type of data that can go into the table (wheathe it have
null,unic,nonnull values)
+ it ensure accuracy and reliability in the table and if any voilation in between 
+ constraint the action is aborded (if their is mismatch in it the query wont executed)
+ contraint can be column level and table level 

contraint :
1)Not null
2)Unique
3)priamry key
4)foreign key
5)check contriant 
6)default constraint



*/

use customer;

create table student (
id int not null,
first_name varchar(25) not null,
last_name  varchar(25) not null,
age int
);
desc student;

alter table student modify age int not null ;

create table person(
id int not null,
first_name varchar(20) not null,
last_name  varchar(20) not null,
age int not null,
unique(id)
);

insert into person values(1,'akash1','jade1',25);

select * from person ;
# we are making first_name col unique
alter table person
add unique(first_name);
alter table person
add constraint uc_person unique(age,first_name);

alter table person
drop index uc_person ;

desc person ;
-- primary key -- 

create table person1(
id int not null,
first_name varchar(20) not null,
last_name  varchar(20) ,
age int,
constraint pk_person primary key(id,last_name)
);
desc person1;
# u csn drop that primary key also 
alter table person1
drop primary key ;
desc person1;
# add primary key for single column 
alter table person1
add primary key(id);
desc person1;

#new day 
create table person2(
id int not null,
first_name varchar(23) not null,
last_name  varchar(22) not null,
age int ,
primary key(id)
);
desc person2;
drop table person;

# foreinge key 

desc person;
show tables ;

create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int ,
salary int,
primary key(id) 
);

CREATE TABLE department (
    id INT NOT NULL,
    department_id INT NOT NULL,
    department_name VARCHAR(23) NOT NULL,
    PRIMARY KEY (department_id),
    CONSTRAINT fk_persondepartment FOREIGN KEY (id) REFERENCES person(id)
);
desc department;

DROP table department ;

CREATE TABLE department (
id int not null,
department_id int not null,
department_name varchar(20) not null,
primary key(department_id)
);
# can i make id as foreign key now ?,yes 
alter table department 
add foreign key(id) references person(id);

drop  table person ;
drop table department;

# check constrain 

create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int ,
salary int,
primary key(id) ,
check (salary<50000)
);
insert into person values (1,'jay','raj',20,60000);  # these will give error 
insert into person values (1,'jay','raj',20,40000);
select * from person ;

# default constrint 
drop table person;
create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
city_name varchar(20) default 'nashik'
);

desc person ;

#how can you drop deafult now?

alter table person
alter city_name drop default;


# crete index
=========================================================================================================================

/* CREATE INDEX  statement  in sql is to create indexes in table 
the indexes is used to retrive data through databases more quickly than other 
the user cannot see the index name  
   */
   
use customer ;
show tables;

select * from person;
# create index 

create index index_city_name
on person(city_name);
desc person;

drop table student; # use index func again 

create table student (
id int not null,
first_name varchar(20),
last_name varchar(20),
age int 
);
desc student;

create index index_age
on student(age);

create index index_age_first_name 
on student(age,first_name);

alter table student 
drop index index_age_first_name ;

alter table student 
drop index index_age;

desc student ;

# VIEW 
==========================================================================================================================
/* 	VIEW IS the virtual tabel based on result set on sql query 
ex
if you have big data 20column from that you require 5 col
so you by using viwe you create virtual table of 5 col 
in a view you can get any no of row, col 
*/
show tables;
drop table student ;

create table student(
student_id int auto_increment ,
first_name varchar(20) ,
last_name  varchar(20) ,
age int ,
primary key(student_id)
);

insert into student values (1,'jayraj','son',23),
						   (2,'akash','jade',12),
                           (3,'rush','sonar',24);

create table department (
student_id int auto_increment ,
department_name varchar(20) not null ,
foreign key(student_id) references student(student_id)
);
desc department;

insert into department values (1,'electrical') ,
							  (2,'computer') ,
                              (3,'mechenical') ;

select * from student ;
select * from department ;

select first_name, last_name , age from student inner join department 
using(student_id);

-- #now  we can create view here also by writing query 

create view student_info as 
select first_name, last_name , age from student inner join department 
using(student_id);

select * from student_info; # it is virtual table now u can use it where u want 

drop view student_info; 

-- #Q what type of query u can write inside the view 
-- # if it involves = aggregate fun, groupby, having , sub query , union , update state , 
-- #left/right outer join then it will not work 
-- # it work in innner join 


-- # join 
-- =======================================================================================================================
/*
inner join 
left join
right join
full join 
neutral join 
cross join 
sql join means retrive data from two or more database table 
these table is interlink with primary key , foreign key thaty we use to retrive data  
*/

use customer ;
show tables ;
select * from student;
insert into student values(5,'ramesh','patil',27);

select * from department ;

-- # innner join 
select * from department inner join student 
on department.student_id = student.student_id ;

-- # to get specify column 
select student.first_name, student.last_name,department.department_name, student.age
from department inner join student 
on department.student_id = student.student_id ;

-- # left join 
select * from student;

select student.first_name, student.last_name,student.age,department.department_name
from student left join department
on student.student_id= department.student_id;

-- # right join 
select student.first_name, student.last_name,student.age,department.department_name
from student right join department
on student.student_id= department.student_id;

-- # full outer join 
select student.first_name, student.last_name,student.age,department.department_name
from student left join department
on student.student_id= department.student_id
union 
select student.first_name, student.last_name,student.age,department.department_name
from student right join department
on student.student_id= department.student_id;

-- -- # cross join # all possible combination is given by cross join 

select student.first_name, student.last_name,student.age,department.department_name
from student cross join  department;

-- # Natural join it give all record with respect to department only 

select student.first_name, student.last_name,student.age,department.department_name
from student natural join  department;

-- jayraj	son	23	electrical       
-- akash	jade	12	computer
-- rush	sonar	24	mechenical

select * from department ;
select * from student  ;

-- # intreviwe Q 
/*  
what is diff bet inner & left join
diff bet left jion & full join
write query that will join all rows from two table , so tht all rows of table 1 in result
how to u combine/retrive data by using join from more than two table 
*/


-- ===================================================================================================
-- stored procedure 
/* 
my sql store procedure 
store procedure is the prepare sql query that can e save so that the query can be reuse over and over again
it can execute over and over again

in query if u executing and u retricve data so, except doing that u save that query in the stored procedure and  
and u can use it 
*/

show databases;
use customer;

select * from student ;# <-- for tht we use sotred procedure 

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_info`()
-- BEGIN
-- select * from student;
-- END                               now ur query is exicuted 

-- so call query -- 

call get_student_info(); 
-- #output 
-- 1	jayraj	son	23
-- 2	akash	jade	12
-- 3	rush	sonar	24
-- 4	om	dusane	20
-- 5	ramesh	patil	27

-- # we can give the parametre also 
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_info`()
-- BEGIN
-- select * from student where student.age=24; <===
-- END
call get_student_info(); 

-- # u can make the procedure parametarized by giving input 
-- 1) in 2) out 3) inout
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_info`(in age int) <====
-- BEGIN
-- select * from student where student.age=age;
-- END

call get_student_info(20); # input
-- output-- 
-- 4	om	dusane	20

-- # ex execute sotred procedure and return the value  by using OUT 

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_info`(out records int)
-- BEGIN
-- select  count(*) into records from student where student.age=23;
-- END

call get_student_info(@records);
select @records as total_rec ;
-- total_rec
-- 1

-- # ex execute sotred procedure and return the value  by using IN ,OUT 
-- get_student_infoget_student_infoCREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_info`(inout records int, in age int )
-- BEGIN
-- select  count(*) into records from student where student.age=age;
-- END

call get_student_info(@records,23);
select @records as total_rec ;

-- total_rec
-- 1


-- =========================================================================================================================

-- # interview preparation Question and answer 
create database company;
use company;
-- DROP DATABASE IF EXISTS company;
-- DROP TABLE Employee;
-- DROP TABLE bonus;
-- DROP TABLE designation;


-- # create employe table 
CREATE TABLE Employee (
  empid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  salary INT,
  joining_date DATETIME,
  department_name VARCHAR(20)
);

desc Employee;
select * from Employee;

-- # create bonus table 

CREATE TABLE bonus (
  emp_ref_id INT,
  bonus_amt INT,
  bonus_date DATETIME,
  FOREIGN KEY (emp_ref_id) REFERENCES Employee(empid) ON DELETE CASCADE
);

desc bonus;

-- ## create employe designation table 

CREATE TABLE designation (
  emp_ref_id INT,
  designation VARCHAR(20),
  designation_date DATETIME,
  FOREIGN KEY (emp_ref_id) REFERENCES Employee(empid) ON DELETE CASCADE
);


desc designation; 

INSERT INTO Employee
VALUES
  (0001, 'krish', 'naik', 50000, '14-12-11 09:00:00', 'development'),
  (0002, 'sudhanshu', 'pawr', 60000, '14-12-11 09:00:00', 'development'),
  (0003, 'saket', 'patil', 70000, '15-12-11 09:00:00', 'hr'),
  (0004, 'darun', 'wagh', 70000, '15-12-11 09:00:00', 'hr'),
  (0005, 'sathish', 'dvre', 30000, '17-12-11 09:00:00', 'account'),
  (0006, 'shaktiman', 'naik', 50000, '17-12-11 09:00:00', 'account');

select * from  Employee;

INSERT INTO bonus
VALUES
  (0001,  50000, '14-12-11 09:00:00'),
  (0002,  50000, '14-12-11 09:00:00'),
  (0003,  50000, '15-12-11 09:00:00'),
  (0001,  50000, '15-12-11 09:00:00'),
  (0004,  35000, '17-12-11 09:00:00'),
  (0005,  70000, '17-12-11 09:00:00'),
  (0001,  80000, '17-12-11 09:00:00'),
  (0002,  85000, '17-12-11 09:00:00');
  
select * from bonus;

insert into designation 
values
(0001, 'manager', '16-02-05 09:00:00'),
(0002, 'executive', '16-06-11 09:00:00'),
(0003, 'executive' ,'16-06-11 09:00:00');

select * from  designation ;


-- ================================================================================================
use company;
select * from Employee;
select * from bonus;
select * from  designation; 

-- # write the query where to retrive all details where firstname is employe 
-- # in table is startwith k

select * from Employee where first_name like 'k%';
-- # is endwith h
select * from Employee where first_name like '%h';
-- # is inbetween s 
select * from Employee where first_name like '%s%';


-- # 2.wite the query print all the detaile of employe whose salary
-- # between 10000 to 35000 
-- # fetch all empname  
select first_name , last_name from Employee
 where salary between 10000 and 50000;
-- # concat their name 

select concat(first_name,'',last_name) as emp_name ,salary
from Employee where empid in 
(select empid from Employee where salary between  10000 and 50000);

-- # 3. retrive details of employe who have join on specific date 
select * from Employee where joining_date="2017-12-11 09:00:00" ;

-- # dec 2014 
select * from Employee 
where year(joining_date)=2014 and month(joining_date)=12;

-- # 4. query to fetch number of employee in every department 
select count(*) , department_name from employee group by department_name;

-- # particular department 
select * from employee where department_name="hr" ;

-- # intermeadiate 
-- #5. details of employee who are also executive 
select * from employee ;
select * from designation ;

select employee.first_name , designation.designation
from employee
inner join 
designation
on employee.empid = designation.emp_ref_id 
and designation.designation='executive';



select employee.first_name ,employee.last_name ,designation.designation from 
employee
inner join 
designation
on employee.empid  = designation.emp_ref_id
where designation.designation ="manager";

select employee.first_name ,employee.last_name ,designation.designation from 
employee
inner join 
designation
on employee.empid  = designation.emp_ref_id
and designation.designation in ("manager");

-- # query to clone new table from another table 

create table clone_emp like employee ;

select * from clone_emp;  # now these new table is have same col like employee but not col value
desc clone_emp ;

-- # query to show top n salary of employee 

select * from employee order by salary desc limit 2;

-- #or 
select  first_name, salary from employee 
order by salary desc limit 2;

-- ## complexity 

#8. query determine to 4th highest salary
-- 4th = n-1,1
-- 4-1,1
-- 3,1

select empid,first_name ,salary from employee 
order by salary  desc limit 3,1 ;
