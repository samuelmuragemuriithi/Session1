--SUBQUERY
SELECT ename,hire_date,salary
FROM Employment 
WHERE hire_date>='01-JAN-00'
and  salary=( select max(salAry)FROM Employment );


SELECT ename,hire_date,salary
FROM Employment
WHERE salary=(SELECT MAX(salary) FROM Employment) AND  hire_date> =DATE '2000-01-01' ;

INSERT INTO Employment VALUES( 5,'suzie',2,'01-JAN-00',65000);

--GROUPBY
SELECT dname,  MAX(salary)
FROM Employment e join dept1 d on d.did=e.did
GROUP BY dname;

SELECT dname,  MAX(salary)
FROM Employment e , dept1 d
WHERE d.did=e.did
GROUP BY dname;

--AGRAGATE FUNCTION
SELECT AVG(salary) "Average"
FROM Employment 
WHERE hire_date>'01-JAN-05'; 

SELECT COUNT(*)"COUNT",AVG(salary) "Average",MAX(salary)"SALARY"
FROM Employment ;

SELECT MAX(SALARY)
FROM EMPLOYMENT;
--HAVING
SELECT did
FROM Employment
GROUP BY did
HAVING COUNT(*)>2;

select did, count(*)
from Employment
where hire_date > date '2004-1-1'
group by did
having count(*) >= 2;

SELECT did
FROM Employment
GROUP BY did 
HAVING AVG(salary)>65000;

--JOIN
SELECT dname, AVG(salary)
FROM Employment e join dept1 d on e.did=d.did
GROUP BY dname;

SELECT AVG(salary)
FROM Employment
WHERE did=2;

--INSERT VALUES FROM ANOTHER TABLE
create table new_emp(eid int primary key);
insert into new_emp
select eid
from Employment
where hire_date > date '2005-12-3';

SELECT *
FROM new_emp;

--UPDATE 
update Employment
set salary = salary + 1000
where ename = 'jeff';

update Employment
set salary = salary - 1000
where ename = 'jeff';

---DELETE FUNCTION
DELETE  FROM  Employment
WHERE hire_date=  date '2005-6-1';


--Return name of employees whose name start with j
select ename
from Employment
where ename like 'j%';

select ename
from Employment
where ename like '%e%';

-- add 1 year
select hire_date, hire_date + interval '1'year as hiredateplus1year
from Employment;
--- add 3 months
select hire_date, hire_date + interval '3'month 
from Employment;
-- add 1 year 3 months
select hire_date, hire_date + interval '1-3' year to month 
from Employment;

--Interval day to second data type
drop table emp2;
create table Emp2(eid int, hiredate date, lastlogin timestamp);
insert into Emp2 values (1, date '2002-1-1', timestamp '2006-1-1 09:00:30.00');
-- 1 day
select lastlogin, lastlogin + interval '1' day 
from emp2;
-- 1 hour 
select lastlogin, lastlogin + interval '1' hour
from emp2;
-- 1 minute
select lastlogin, lastlogin + interval '1' minute
from emp2;
-- 1 second
select lastlogin, lastlogin + interval '1' second
from emp2;

select lastlogin,lastlogin+interval '6' month
from emp2;
select lastlogin,lastlogin+interval '7' day
from emp2;
select lastlogin,lastlogin+interval '2:30' hour TO MINUTE
from emp2;


select *
from emp2;

SELECT
    * FROM dept1;

SELECT
    * FROM Employment;