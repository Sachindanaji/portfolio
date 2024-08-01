create database if  not exists mobileanalysis;
create table mobiles (
Phone_name varchar (255)primary key not null,
brands varchar (50) not null,
price int not null,
internal_storage varchar (50) not null,
Operating_System_Type varchar (50) not null,
USB_Type varchar (50) not null,
5G_Availability varchar (50) not null,
Selfie_Camera varchar (25) not null,
RAM_Storage varchar (10) not null,
Country_of_Origin varchar (50) not null,
Battery_Capacity varchar (100) not null,
Price_Range varchar (100) not null,
Battery_Capacity_Range varchar (255) not null,
Total_Mobile int not null );

-- -------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------

-- check mobile features and price list 
select phone_name,price 
from mobiles;

-- find out the price of 5 most expensive mobiles
select * from mobiles
order by price desc
limit 5;

-- find out the price of 5 most cheapest mobiles
select * from mobiles 
order by price 
limit 5;

-- list of top 3 samsung phones with price and all features
select * from mobiles
where brands = "samsung"
order by price desc 
limit 3;

-- must have android phone list then top 10 high price android phones
select * from mobiles 
where Operating_System_Type = "android"
order by price desc
limit 10;

-- must have android phone list then top 5 lower price android phones
select * from mobiles
where Operating_System_Type ="android"
order by price 
limit 5;

-- must have windows phone list then top 3 high price windows phones
select * from mobiles
where Operating_System_Type = "windows"
order by price desc
limit 3;

--  must have windows phone list then top 3 lower price windows phones
select * from mobiles
where Operating_System_Type = "windows"
order by price 
limit 3;

-- which phone support 5g network 
select * from mobiles 
where 5G_Availability = "yes";

-- total price of all mobile is to be found with brand name
select brands,
sum(price) as total_price 
from mobiles
group by brands;

-- list of india country of origin phones with all features 
select phone_name,country_of_origin
from mobiles
where Country_of_Origin = "india";

-- which mobile phone price greater than 150000
select * from mobiles
where price > 150000;

-- list of top 5 oneplus phones with price and all features
select * from mobiles
where brands = 'oneplus'
order by price desc
limit 5;

-- list of top 10 redmi phones with price and all features
select * from mobiles
where brands = 'redmi'
order by price desc
limit 10;

-- list of top 4 vivo phones with price and all features
select * from mobiles
where brands = 'vivo'
order by price desc
limit 4;

