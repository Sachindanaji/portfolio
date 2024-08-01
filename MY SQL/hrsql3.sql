select e.first_name,e.last_name,j.start_date,j.end_date from employees e
join job_history j on e.employee_id=j.employee_id;
#1
select e.first_name,e.last_name,e.department_id,d.department_name from employees e
 join departments d on e.department_id=d.department_id;
 #2
select e.first_name,e.last_name,d.department_name,l.city,l.state_province from  employees e
join departments d on e.department_id=d.department_id 
join locations l on d.location_id=l.location_id;
#3
select e.first_name,e.last_name,d.department_id,d.department_name from employees e 
join departments d on e.department_id=d.department_id and e.department_id in (80,40);
#4
select e.first_name,e.last_name,d.department_name,l.city,l.state_province from employees e 
join departments d on e.department_id = d.department_id 
join locations l on d.location_id = l.location_id 
where e.first_name like '%z%';
#5
select e.first_name,e.last_name,d.department_id,d.department_name from employees e 
right join departments d on e.department_id = d.department_id;
#6
select e.first_name,e.last_name,e.salary from employees e 
join employees s on e.salary < s.salary and s.employee_id =182; 
#7
select e.first_name as employee_name,m.first_name from employees e 
join employees m on e.employee_id = m.employee_id;
#8
select d.department_name, l.city, l.state_province from departments d 
join locations l on d.location_id = l.location_id;
#9
select e.first_name, e.last_name, e.department_id, d.department_name from employees e 
left outer join departments d on e.department_id = d.department_id;
#10
select e.first_name as employee_name, m.first_name as manager from employees e
left outer join employees m on e.employee_id = m.employee_id;customers
#11
select e.first_name, e.last_name, e.department_id from employees e 
join employees s on e.department_id = s.department_id
and s.last_name = 'taylor';
#12
select job_title, department_name, concat(last_name, last_name) as employee_name, start_date from job_history 
join jobs using (job_id)
join departments using (department_id)
join employees using(employee_id)
where start_date >= '1993-01-01' and start_date <='1997-08-31';
#13
select j.job_title, concat(e.first_name,e.last_name) as employee_name, j.max_salary-j.min_salary as salary_diferrence from jobs j
join employees e using (job_id);
#14
select department_name,avg(salary),count(commission_pct) from departments
join employees using (department_id) group by department_name;
#15
select job_title,concat(first_name,last_name) as employee_name,max_salary-min_salary as salary_diferrence from jobs
join employees using (job_id)
where department_id = 80;
#16
select country_name,city,department_name from countries join locations using (country_id)
join departments using (location_id);
#17
select d.department_name, concat(e.first_name,e.last_name) as name_of_manager from departments d 
join employees e on d.manager_id = e.manager_id;
#18
select j.job_title,avg(e.salary) from jobs j join employees e on j.job_id = e.job_id group by job_title;
#19
select j.employee_id, j.start_date, j.end_date, e.job_id, e.department_id from job_history j 
join employees e on j.employee_id = e.employee_id
where e.salary >= 12000;
#20
select country_name, city, count(department_id) from countries join locations using (country_id)
join departments using (location_id)  where department_id in (select department_id from employees group by department_id having count(department_id)>=2)
group by country_name,city;
#21
select department_name, concat(first_name,last_name) as manager_name,city from departments 
join employees using (department_id) join locations using (location_id);
#22
select employee_id, job_title, end_date-start_date as number_of_days from job_history join jobs using (job_id)
where department_id = 80 ;
#23
select concat(first_name,last_name) as employee_name,salary from employees join departments using (department_id)
join locations using (location_id) where city like 'london'; 
#24
select concat(first_name,last_name) as employee_name, job_title,start_date,end_date, employee_id from employees join jobs using (job_id) join job_history using (employee_id)
 where commission_pct is not null;
 #25
 select d.department_name,count(e.employee_id) as no_of_employee,e.department_id from departments d 
 join employees e on d.department_id = e.department_id group by department_id;
 #26
 select concat(first_name,last_name) as employee_name,employee_id,country_name from employees 
 join departments using (department_id) join locations using (location_id) join countries using (country_id);
 #27