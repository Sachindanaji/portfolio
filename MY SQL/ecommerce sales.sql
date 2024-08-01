create database if not exists ecommercesalesanalysis;
create table sales (
product_id int primary key not null,
product_name varchar (50) not null,
category varchar (50) not null,
price decimal (10, 2) not null,
review_score decimal (10, 2) not null,
review_count int not null,
sales_month_1 int not null,
sales_month_2 int not null,
sales_month_3 int not null,
sales_month_4 int not null,
sales_month_5 int not null,
sales_month_6 int not null,
sales_month_7 int not null,
sales_month_8 int not null,
sales_month_9 int not null,
sales_month_10 int not null,
sales_month_11 int not null,
sales_month_12 int not null );

--  ------------------------------------------------------------------------------------------------------


