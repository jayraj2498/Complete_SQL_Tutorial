CREATE DATABASE your_database;





CREATE TABLE your_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    age INT
);



-- Create Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

-- Insert Data
INSERT INTO students (first_name, last_name, age)
 VALUES
   ('John', 'Doe', 20),
   ('Jane', 'Smith', 22),
   ('Bob', 'Johnson', 21);




select * from public.fuelconsumption

select * from FuelConsumption;
select * from students  ;


-- where query
-- ==============================================================
select city , grade , email 
from students 
where student_id = 1 ;   


-- update query
-- ==============================================================
update students 
set city= 'surat', grade='A', age=25 
where student_id= 6; 

-- or 

update family 
set f_name='undertaker' , age= 49 
where f_no=101 ;

-- delete query
-- =============================================================
delete from students 
where student_id= 10
asc student_id ;


alter table  :- used to add  delete , modify columns 
-- ============================================================

alter table customer 
add column customer_xyz varchar(50) not null ;

-- drop column 
-- =============================================================
alter table customer 
drop column customer_xyz ;

-- drop table
-- =============================================================  

-- modify columns 
-- =============================================================  

UPDATE family
SET address = 'Unknown'
WHERE address IS NULL;


-- distinct
-- ===========================================================
select distinct grade from students ;




-- select & where & operaters in sql 
-- ===========================================================
select first_name ,grade from students
where student_id= 1 ;

select first_name ,grade ,city ,score
from students 
where score >= 90 ;

select first_name ,grade ,city ,score
from students 
where score < 90 ;

-- where & order by & limit 
-- ==========================================================
select student_id,first_name , email 
from students 
where score < 90 and gender='Female' 
order by student_id  asc;

select student_id,first_name , email 
from students 
where score <90 and gender='Male' 
order by student_id  asc;

select student_id,first_name , email 
from students 
where score >=90 
order by  student_id  asc;

select student_id,first_name , email 
from students 
where score >=83 
order by  student_id  asc
limit 5;


-- function in sql( string function & aggregate function ) 
-- =========================================================
select upper(city)from students ;

select length(email) from students ;

select concat(first_name,last_name) , email from students;

select replace(last_name,'Reddy','gaikwad') from students ;

select replace(first_name,'Kriti','Pratiksha') from students ;

select concat(make , vehicleclass, enginesize ) from FuelConsumption ;

-- Aggregate function 
-- ===========================================================
select count(age) from students ;
select avg(age) from students ;
select max(score) from students ;
select sum(score) from students ; 

select min(enginesize) from FuelConsumption ;

select round(avg(co2emissions),2) from fuelconsumption ;




select * from students  ;
select * from FuelConsumption ;

select upper(make) from  FuelConsumption ;

select * from students	 ;

select upper(first_name),upper(last_name) from students ;
select length(first_name), first_name from students ;


select concat(first_name,last_name), first_name from students ;
select replace(first_name,'Jayraj','kiran') from students ;


select * from fuelconsumption;

select count(*) from fuelconsumption;

select sum(co2emissions) from fuelconsumption;

select max(co2emissions) from fuelconsumption;

select min(co2emissions) from fuelconsumption ;

select avg(co2emissions) from fuelconsumption ;

select round(avg(co2emissions),2)from fuelconsumption ;





-- -- IN Query 
-- =================================================================

select * from fuelconsumption 
where model in ('ILX','TSX','335i') ;


select make, model,enginesize ,vehicleclass 
from fuelconsumption 
where vehicleclass in ('TWO-SEATER','SPECIAL PURPOSE VEHICLE','FULL-SIZE')


select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass in ('TWO-SEATER','SPECIAL PURPOSE VEHICLE','FULL-SIZE')
order by co2emissions desc


select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass not	in ('TWO-SEATER','SPECIAL PURPOSE VEHICLE','FULL-SIZE')
order by co2emissions desc


select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass in ('TWO-SEATER')
order by co2emissions desc


select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass in ('SPECIAL PURPOSE VEHICLE')
order by co2emissions desc


select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass = 'FULL-SIZE'
order by co2emissions desc


-- between Query operator 
-- ====================================================================

select * from fuelconsumption 
where co2emissions between 196 and 240 



select * from fuelconsumption 
where co2emissions not between 196 and 300



-- group by in sql 
-- =================================================================
select  age , max(score) as max_score_with_age 
from students
group by age ;


select * from students ;
select * from FuelConsumption ;

select age , count(grade) as col_name 
from students 
group by age ;

select make , round(avg(co2emissions),2) as Brand_co2emission
from fuelconsumption 
group by make ;

select model, count(vehicleclass ) as model_class 
from fuelconsumption 
group by model

select vehicleclass , count(model) as year_relese_car 
from fuelconsumption 
group by vehicleclass ;

select make , count(model) as year_relese_car 
from fuelconsumption 
group by make  ;

select vehicleclass ,max(cylinders) as count_of_cylinders_class 
from fuelconsumption 
group by vehicleclass;


select make , max(co2emissions) as max_co2_emmission_by_brand 
from fuelconsumption 
group by make ;


SELECT make, MAX(co2emissions) AS max_co2_emission_by_brand
FROM fuelconsumption
GROUP BY make
ORDER BY max_co2_emission_by_brand DESC
limit 10 ;
 
 
select make ,avg(enginesize) as count_class_vehi
from  fuelconsumption
group by make
order by count_class_vehi asc 
;


SELECT make, sum(co2emissions) AS max_co2_emission_by_brand
FROM fuelconsumption
GROUP BY make
ORDER BY max_co2_emission_by_brand DESC
limit 10 ;
 
select * from FuelConsumption;
select * from students ;

ALTER TABLE students
ADD COLUMN score INT;

select age,count(score) as name_score
from students
group by age ;

-- -------
-- Having 
-- --------
select first_name , max(score) as brave_student 
from students 
group by first_name 
having max(score)>90 ;


select make, min(co2emissions) as good_engine 
from FuelConsumption 
group by make 
having min(co2emissions)<150 
order by good_engine  asc;



-- =====practise on ipl data set========


select * from ipl_ball_by_ball_2008_2022 ;



select batter , count(batsman_run=4) as top_runs_by_bat 
from ipl_ball_by_ball_2008_2022  
group by batter 
order by top_runs_by_bat desc;


select bowler , count(iswicket_delivery) as top_wicket_getter 
from  ipl_ball_by_ball_2008_2022   
group by bowler 
order by top_wicket_getter desc ;

  

select * from ipl_matches_2008_2022 ;


select count(player_of_match) from ipl_matches_2008_2022 ;

select max(venue) from ipl_matches_2008_2022 ;

select winning_team from ipl_matches_2008_2022
where winning_team =' Gujarat Titans ' ;



select * from ipl_matches_2008_2022 ;

match_date;

select extract(month from match_date)as match_month , match_date 
from  ipl_matches_2008_2022 ;

select extract(year from match_date) as match_year , match_date 
from  ipl_matches_2008_2022 ;

select extract( day from match_date) as match_day  , match_date
from ipl_matches_2008_2022 ;

select extract( dow from match_date) as day_of_week   , match_date
from ipl_matches_2008_2022 ;

select extract (doy from match_date) as day_of_year , match_date 
from  ipl_matches_2008_2022 ;


select extract (quarter from match_date) as quarter_of_year , match_date 
from ipl_matches_2008_2022
order by quarter_of_year asc;


show timezone ;

select NOW() ;

select timeofday();



-- joint in SQL 
-- ===================================================================================================


select * from public.courses ;

select * from public.students ;


--- inner join 
select * 
from courses 
inner join students  
on students.student_id = courses.course_id

select * 
from students as s  
inner join  courses as c 
on s.student_id = c.course_id

select student_name , age ,course_name ,score
from students as s 
inner join courses as c 
on s.student_id = c.course_id    



-- left join 

select * 
from students as s 
left join courses as c 
on s.student_id = c.course_id    


select student_name , age ,course_name ,score
from students as s 
left join courses as c 
on s.student_id = c.course_id    


-- Right join 

select *
from students as s 
right join courses as c
on s.student_id = c.course_id    

select student_name , age ,course_name ,score
from students as s 
right join courses as c
on s.student_id = c.course_id    


--- full outer join 

select * from 
students as s 
full outer join courses as c 
on s.student_id = c.course_id    


select student_name , age ,course_name ,score from 
students as s 
full outer join courses as c 
on s.student_id = c.course_id    

-- self join 

select * from students as s
join students as t 
on s.student_id = t.student_id ;


select s.student_name , s.gender ,s.city , t.student_name as teaching_coach 
from students as s
join students as t 
on s.student_id = t.student_id ;

-- ====================================================================================================



--- union  & union all 
--- U can combine 2 and more than 2 table in union but it will give u all unique value 
-- but the condition for it it should have same number of col and data type to join that both table column 




-- ==================================================================================================

SUB Query (Nested Query)   1) where 
		           2) from 
			   3) select 													


select * from fuelconsumption ;
select * from students ;

select avg(score)
from students 


select first_name, score 
from students 
where score > 85.11

-- where 
---------
select first_name, score 
from students 
where score >(select avg(score)
               from students )
order by score desc



select avg(co2emissions)
from fuelconsumption ;
--256

select make, vehicleclass ,enginesize , co2emissions 
from fuelconsumption 
where co2emissions  > 256 
order by co2emissions desc ;

select make , vehicleclass , enginesize , model, co2emissions 
from fuelconsumption 
where co2emissions > (select avg(co2emissions)
                       from fuelconsumption)
order by co2emissions desc ;



-- from 
------------

select max(marks) 
from (select * from student 
	where city='mumbai' ) as city name 


-- select
--------------------
select (select max(marks) from student) as city_name 
from student 

-- ==========================================================================================================================


-- IN QUery 



-- ========================================================================================================================
select * from students ; 
select * from courses ;



select student_id , student_name ,city 
from students 
where student_id in (select student_id from courses) ; 

-- exist query 

select student_name
from students as s 
where exists ( select  student_id , score 
			    from courses as c 
			     where s.student_id = c.student_id 
			      and score >= 90 )




			
SELECT student_name, city
FROM students as s
WHERE EXISTS (
    SELECT course_name, score
    FROM courses as c
    WHERE s.student_id = c.course_id
    AND score > 90
);


SELECT s.student_name, s.city
FROM students AS s
JOIN courses AS c
ON s.student_id = c.course_id
WHERE c.score > 90;

select * from fuelconsumption 
where model in ('ILX','TSX','335i') ;


select make, model,enginesize ,vehicleclass 
from fuelconsumption 
where vehicleclass in ('TWO-SEATER','SPECIAL PURPOSE VEHICLE','FULL-SIZE')


select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass in ('TWO-SEATER','SPECIAL PURPOSE VEHICLE','FULL-SIZE')
order by co2emissions desc


-- ========================================================================================================================


-- WINDOW FUNCTION IN SQL 
-- window function 
-- aggregate function =sum ,min, max, avg , 
-- rank function = rank , dense_rank(), percent_rank()
-- analyatic function = first_value , last_value , lead, lag 



-- aggregate function  example

SELECT 
 
  make,co2emissions,
  SUM(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "total",
  AVG(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "avg",
  COUNT(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "count",
  MIN(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "minimum",
  MAX(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "maximum"
FROM fuelconsumption;



SELECT 
  *,
  SUM(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "total",
  AVG(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "avg",
  COUNT(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "count",
  MIN(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "minimum",
  MAX(co2emissions) OVER (PARTITION BY make ORDER BY co2emissions) AS "maximum"
FROM fuelconsumption;


--
-- rank function --
============================================


select nwe_id 
row_number() over ( order by newid) as 'row_number' 
rank()
dense_rank()
percent_rank()





-- analytic function ,( first_value, last_value , lead, lag)
============================================================================
select * from public.students

SELECT
  score,
  LEAD(score, 1) OVER (ORDER BY score) AS "lead_by_1",
  LAG(score, 1) OVER (ORDER BY score) AS "lag_by_1"
FROM students;




----- 
--- case statment ---
======================================================================================

select student_id, first_name , score , 
case
	when score > 94 then 'brillient_student' 
	when score > 90 then  'scoller student'
	else 'average student'
end as student_rank
from students ;


	
select * from public.fuelconsumption ;
select max(co2emissions) from fuelconsumption ;  -488
select min(co2emissions) from fuelconsumption  - 108 
select avg(co2emissions) from fuelconsumption  - 256 



select make , model ,co2emissions , 
case 
	when co2emissions > 400 then 'most_polluted_car'
	when co2emissions > 200 then 'avg_polluted_car'
	else 'adjustable_engine'
end as car_engine_for_nature
from fuelconsumption ;


select * from public.fuelconsumption

select make, co2emissions ,
case 
	when co2emissions > 400 then 'harmful engine'
	when co2emissions > 200 then 'avg_harmful engine'
	else 'not_harmful_engine'
end as "engine_status_for_nature"
from fuelconsumption ;

select * from public.students 

select first_name grade ,score ,
case 
	when score >90 then 'brave_student'
	when score >80 then 'good_student'
	else 'avg_student' 
end as "stuent_ranks"
from students ;

SELECT * FROM fuelconsumption;

SELECT * FROM fuelconsumption LIMIT 100;





 --- case expression ---

---- case expression ---- 
========================================================================================

select first_name grade ,score ,
case score 
	when 95 then 'top_rank_student'
	when 78 then 'low_rank_student'
	else 'avg_student'
end as "student_rank_b_score"
from students ;




-- common table expression -- 
========================================================================================================s
select * From student 

with t1 as( select roll, marks, name 
   		from student ) 

select * from t1 



---

with my_table as(
    select * , 
	avg(score) over(order by c.course_id) as "avg_score",
	count(student_id)over(order by s.student_id) as "count"
	
	from courses as c 
	inner join students as s 
	on c.course_id = s.student_id
)
SELECT * FROM my_table;

---

with my_table_again as(
select * ,
	count(course_id) over( order by c.course_id) as "count_NO",
	avg(score)over (order by c.course_id) as "avg_table" ,
	avg(age)over(order by s.student_id) as "avg_age_std" 
	
	from students as s
	inner join courses as c 
	on  s.student_id=  c.course_id 
)
select * from  my_table_again ;





---
 8.Fetch the total no of sports played in each olympic games.


with t1 
as
(select distinct games, sport 
from olympics_history),
t2 
as
(select games , count(sport) as no_of_sport
from t1
group by games)

select * from t2
order by games asc

---


6.--Identify the sport which was played in all summer olympics.

with t1 as
          	(select count(distinct games) as total_games
          	from olympics_history where season = 'Summer'),
          t2 as
          	(select distinct games, sport
          	from olympics_history where season = 'Summer'),
          t3 as
          	(select sport, count(games) as no_of_games
          	from t2
          	group by sport)
      select *
      from t3
      join t1 on t1.total_games = t3.no_of_games; 







-- view clause 
-- ====================================================================================

-- view clause is same as with clause 



select * from student 


crete view t1 as (select rollno, marks, name 
				from student )

select * from t1






-- cascasding foreign key 
-- ==========================================================================================

create table stuedent (
	id int primary key ,
	name varchar(20) ,
	age int ,
	foreign key(course_id)  refrence  course(id) 
	on update cascade 
	on delete cascade )


-- if u want to make a chnage in foreighn key the changes will reflect in primary key viceversa by using cascade 




