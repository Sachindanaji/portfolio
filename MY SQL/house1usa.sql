create database if not exists USAhouseprices;
create table if not exists house (
date datetime primary key not null,
price int not null,
bedrooms int not null,
bathrooms decimal (10, 2) not null,
sqft_living int not null,
sqft_lot int not null,
floors decimal (10, 2) not null,
waterfront int not null,
view int not null,
conditions int not null,
sqft_above int not null,
sqft_basement int not null,
yr_built int not null,
yr_renovated int not null,
street varchar (50) not null,
city varchar (25) not null,
statezip varchar (50) not null,
country varchar (25) not null
);

-- month name 
select 
    date,
    monthname(date) from house;
    
    alter table house add column month_name varchar (10);
    
update house 
set month_name =monthname(date);

-- day name 
select 
date,
dayname(date) from house;

alter table house add column day_name varchar (10);

update house 
set day_name = dayname(date);

-- -----------------------------------------------------------------------------------------------------

-- how many unique cities does the data have ?
select distinct city from house;

-- what month had the largest sale price ?
select month_name as month,sum(price) as sale_price 
from house
group by month_name
order by sale_price desc;

-- report those house sale price greater than 1000000 ?
select * from house 
where price > 1000000;

-- prepare a list of house sorted by country,steet,city and statezip
select country,street,city,statezip from house;

-- report the total house sale price for each months 
select month_name,
sum(price) as sale_price 
from house
group by month_name
order by sale_price desc;