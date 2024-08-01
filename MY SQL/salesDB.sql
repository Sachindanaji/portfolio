create database if not exists salesdatawalmart;
create table if not exists sales ( 
invoice_id varchar (30) not null primary key,
branch varchar (5) not null,
city varchar (30) not null,
customer_type varchar (30) not null,
gender varchar (10) not null,
product_line varchar (100) not null,
unit_price decimal (10,2) not null,
quantity int not null,
vat float (6,  4) not null,
total decimal(12,  4) not null,
date datetime not null,
time time not null,
payment varchar (15) not null,
cogs decimal (10,  2) not null,
gross_margin_pct float (11, 9),
gross_income decimal (12,  4) not null,
rating float (2,  1)
);



--  -----------------------------------------------------------------------------------------------------
--  -------------------------------- feature engineering-------------------------------------------------

--  time_of_day

SELECT
    time,
    CASE
        WHEN CAST(time AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
        WHEN CAST(time AS TIME) BETWEEN '12:00:01' AND '16:00:00' THEN 'afternoon'
        ELSE 'evening'
    END AS time_of_day
FROM sales;

alter table sales add column time_of_day varchar (20);  
 
update sales 
set time_of_day = (case
        WHEN CAST(time AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
        WHEN CAST(time AS TIME) BETWEEN '12:00:01' AND '16:00:00' THEN 'afternoon'
        ELSE 'evening'
    END);

-- day_name
select 
    date, 
    dayname(date) as day_name
    from sales;
    
alter table sales add column day_name varchar (10);    

update sales
set day_name = dayname(date);

-- month_name

select 
    date,
    monthname(date)
    from sales;

alter table sales add column month_name varchar (10);

update sales 
set month_name = monthname(date);
--  -----------------------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------------------
-- ---------------------------------------generic--------------------------------------------------------

-- how many unique cities does the data have ?
select 
    distinct city
    from sales;
    
-- in which city is each branch ?
select distinct branch
from sales;

select 
    distinct city,branch from sales;
    
-- -------------------------------------------------------------------------------------------------------
-- ---------------------------------------product---------------------------------------------------------
-- how many unique product lines does the data have ?
select 
  count(distinct product_line)
    from sales;

-- what is the most common payment method ?
select 
 payment,
 count(payment)
 from sales
 group by payment 
order by payment desc;

-- whaat is the most salling product line ?
select 
product_line,
 count(product_line)
 from sales
 group by product_line
order by product_line desc;

-- what is the total revenue by month ?
select month_name as month,
sum(total) as total_revenue
from sales 
group by month_name
order by total_revenue desc;

-- what month had the largest COGS ?
select month_name as month,
sum(cogs) as cogs
from sales 
group by month_name
order by cogs desc;

-- what prroduct line had the largesst revenue ?
select product_line,
sum(total) as total_revenue 
from sales
group by product_line
order by total_revenue desc;

-- what is the city with the largest revenue ?
select branch,
 city,sum(total) as total_revenue from sales 
group by city, branch
order by total_revenue desc;

-- what product line had the largest vat ?
select product_line,
avg(vat) as avg_tax
from sales 
group by product_line
order by avg_tax desc;

 



-- which branch sold more products than average product sold ?
select branch, sum(quantity) as qty from sales 
group by branch 
having  sum(quantity) >(select avg(quantity) from sales);

-- what is the most common product line by gender ?
select gender,
product_line,
count(gender) as total_cnt
from sales 
group by gender, product_line
order by total_cnt desc;

-- what is the average rating of each product line ?
select round(avg(rating),2) as avg_rating, product_line
from sales 
group by product_line
order by avg_rating desc; 

-- ------------------------------------------------------------------------------------------------------
-- ---------------------------------------- sales -------------------------------------------------------

-- number of sales made in each time of the day per weekday ?
select 
    time_of_day,
    count(total) as total_sales 
    from sales
    where day_name = 'sunday'
    group by time_of_day
    order by total_sales desc;

-- which of the customer types brings the most revenue ?
select customer_type,
sum(total) as total_revenue
from sales
group by customer_type
order by total_revenue desc;

-- which city has the largest tax percent/VAT (value added tax) ?
select city, 
avg(vat) as vat 
from sales
group by city 
order by vat desc;

-- which customer type pays the most in vat ?
select customer_type,
avg(vat) as vat
from sales 
group by customer_type
order by vat desc;

-- --------------------------------------------------------------------------------------------------------
-- ---------------------------------- customer ------------------------------------------------------------

-- how many unique customer types does the data have ?
select distinct customer_type 
from sales;

-- how many unique payment method does the data have ?
select distinct payment
from sales;

-- what customer type buys the most?
select customer_type,
count(customer_type) as customer_count
from sales
group by customer_type;

-- what is the gender of most of the customers ?
select gender,
count(gender) as gender_count
from sales
group by gender
order by gender_count desc;

--  what is the gender distribution per branch ?
select gender,
count(gender) as gender_count
from sales
where branch = "c"
group by gender
order by gender_count desc;

-- which time of the day do customers give most ratings ?
select time_of_day,
avg(rating) as avg_rating from sales
group by time_of_day
order by avg_rating desc;

-- -- which time of the day do customers give most ratings per branch ?
select time_of_day,
avg(rating) as avg_rating 
from sales
where branch ='c'
group by time_of_day
order by avg_rating desc;

-- which day of the week has the best avg ratings ?
select day_name,
avg(rating) as avg_rating 
from sales 
group by day_name
order by avg_rating desc;

-- which day of the week has the best avg ratings per branch ?
select day_name,
avg(rating) as avg_rating 
from sales 
where branch = 'c'
group by day_name
order by avg_rating desc;


