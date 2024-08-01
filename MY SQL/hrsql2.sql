select employee_id,first_name,job_id,department_id from employees
 where department_id like '30' or employee_id like '40' or employee_id like '90';
 #21
select employee_id from job_history where employee_id group by employee_id having count(employee_id) >=2;
#22
select job_id,count(employee_id) as count,sum(salary) as sum,max(salary)-min(salary) as salary_difference 
from employees group by job_id;
#23
select job_id from job_history where end_date-start_date>300 group by job_id having count(employee_id)>=2;
#24
select country_id,count(city) as count from locations group by country_id; 
#25
select manager_id,count(employee_id) as count from employees group by employee_id;
#26
select * from jobs order by job_title desc;
#27
select first_name,last_name,hire_date from employees where job_id in ('sales_representatives' 'salesman');
#28
select department_id,avg(salary) as average_salary from employees where commission_pct is not null 
group by department_id;
#29
select department_id from employees group by department_id,manager_id having count(employee_id) >=4;
#30
select department_id from employees where commission_pct is not null group by department_id 
having count(commission_pct) > 10;
#31
select employee_id,max(end_date) as max from job_history 
where employee_id in ( select employee_id from job_history 
group by employee_id having count(employee_id) > 1) group by employee_id;
#32
select * from employees where salary between 7000 and 12000 and commission_pct is not null 
and department_id in (50);
#33
select job_id,avg(salary) as avg from employees group by job_id having avg(salary) > 8000;
#34
select job_title,max_salary-min_salary as salary_diferrence from jobs where max_salary between 12000 and 18000;
#35
select first_name,last_name from employees where first_name like 'd%'or last_name like 'd%';
#36
select * from jobs having min_salary > 9000;
#37
select * from employees where hire_date > '1987-09-07';
#38