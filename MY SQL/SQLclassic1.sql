select country,state,city from offices;
#1
select count(employeeNumber) from employees;
#2
select sum(amount) as total_of_payments from payments;
#3
select * from productlines where productLine like '%cars%';
#4
select * from payments where paymentDate like '2004-10-28';
#5
select *from payments where amount > '100000';
#6
select productname,productline from products;
#7
select count(productline) from products;
#8
select min(amount) from payments; 
#9
select * from payments where amount > (select avg(amount) * 2 from payments);
#10
select avg(msrp-buyprice)/buyprice*100 as average_percentage_markup from products group by buyPrice;
#11
select count(productcode) from products;
#12
select customername,city from customers where salesRepEmployeeNumber is not null;
#13
select ordernumber,sum(quantityordered*priceEach) as total from orderdetails group by orderNumber having total >5000;
#15
select concat(firstname,lastname) as employee_name,jobTitle from employees where jobTitle regexp'vp' or 'manager';
#14

select c.customername,e.firstname,e.lastname from customers c join employees e on c.salesrepemployeenumber = e.employeenumber;
#1
select sum(amount) from payments p join customers c on p.customerNumber = c.customerNumber where customerName = 'atelier_graphique';
#2
select paymentdate,sum(amount) from payments group by paymentDate;
#3
select p.productname,p.productcode from products p where not exists (select * from orderdetails o where p.productcode = o.productcode);
#4
select c.customername,sum(amount) from customers c join payments p on c.customernumber = p.customernumber group by c.customerName;
#5
select count(ordernumber) from orders o join customers c on o.customernumber = c.customernumber and customerName = 'herkku_gifts';
#6
select firstname,lastname from employees join offices using (officecode) where city = 'boston';
#7
select customernumber,amount from payments where amount >100000 order by amount desc;
#8
select sum(quantityordered * priceeach) as value from orderdetails join orders using (ordernumber) where status ='on_hold';
#9
select customername,count(ordernumber) from orders join customers using (customernumber) where status = 'on_hold' group by customerName;
#10

select orderdate,productname from orderdetails join orders using (ordernumber) join products using (productcode) order by orderDate;
#1
select orderdate from orderdetails join products using (productcode) join orders using (ordernumber) where productname ='1940 ford pickup truck' order by orderDate desc;
#2
select customername,ordernumber,format(quantityordered * priceeach) as total from customers
join orders using (customernumber) join orderdetails using (ordernumber) group by orderNumber 
having sum(quantityOrdered * priceeach)>25000;
#3 wrong
select * from products p where not exists (select *from orderdetails o where p.productcode = o.productcode 
and o.ordernumber = o.ordernumber);
#4 
select distinct(productname), priceeach,msrp from orderdetails join products using (productcode)  
where priceEach < .8*msrp;
#5
select distinct (productname) from products join orderdetails using (productcode) 
where priceEach >= 2*buyPrice order by productName;
#6
select distinct (productname) from orders join orderdetails using ( ordernumber) join products using (productcode) 
where dayname(orderdate) = "monday";
#7
select productname, format(quantityinstoc) as quantity_in_stock from orderdetails join orders using (productcode)
where status ='on_hold';
#8

select * from products where lower(productname) regexp 'ford';
#1
select * from products where lower(productname) regexp 'ship%';
#2
select country, count(customername) from customers where country regexp ('denmark','norway','sweden') group by country; 
#3 wroung
select * from products where productCode between s700_1000 and s700_1499;
#4 wrong
select * from customers where customerName like (0-9);
#5
select * from employees where firstname like 'daine';