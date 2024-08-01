select * from countries;
select * from departments;
select * from employees;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;
select concat(first_name,last_name) as fullname,salary from employees where salary < 6000;
#1
select first_name,last_name,department_id,salary from employees where salary > 8000;
#2
select first_name,last_name,department_id from employees where last_name ='mcewen';
#3
select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,
department_id from employees where employee_id is null;
#4
select * from departments where department_name = 'marketing';
#5
select concat(first_name,last_name) as fullname,hire_date,salary,department_id from employees 
where first_name not like '%m%' order by department_id; 
#6
select * from employees where salary between 8000 and 12000 and commission_pct is not null or
 department_id not in (40,120,70) and hire_date >'1987/06/05'; 
 #7
select concat(first_name,last_name) as fullname,salary from employees where commission_pct is not null;
#8
select concat(first_name,last_name) as fullname,concat(email,phone_number) as contact_details,salary 
from employees where salary between 9000 and 17000;
#9
select first_name,last_name,salary from employees where first_name like '%m';
#10
select concat(first_name,last_name) as fullname,salary from employees 
where salary not between 7000 and 15000 order by fullname;
#11
select concat(first_name,last_name) as fullname, job_id, hire_date from employees 
where hire_date between '2007-11-05' and '2009-07-05';
#12
select concat(first_name,last_name) as fullname,department_id from employees 
where department_id like 70 or department_id like 90;
#13
select concat(first_name,last_name) as fullname,salary,manager_id from employees where manager_id is not null;
#14
select * from employees where hire_date < '2002-06-21';
#15
select first_name,last_name,email,manager_id from employees where manager_id in (120,103,145);
#16
select * from employees where first_name like '%d%'or first_name like '%s%'or first_name like '%n%' 
order by salary desc;
#17
select concat(first_name,last_name) as fullname,hire_date,commission_pct,concat(email,phone_number) 
as contact_details,salary from employees where salary > 11000 or phone_number like '______3%';
#18
 select first_name,last_name,department_id from employees where first_name like '__s%';
 #19
 select employee_id,first_name,job_id,department_id from employees where department_id not like '50' or 
 department_id not like '30' or department_id not like '80';
 #20
 