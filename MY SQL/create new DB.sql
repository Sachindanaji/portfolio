create database dharwadhubbalitutor;
create table students (
student_id int,
lastname varchar (255),
firstname varchar (255),
address varchar (255),
city varchar (255) 
);
create table fees_details (
name varchar(255),
paid_fee int,
pending_fees  int,
total_fees int);
alter table student add e_mail varchar (255);
drop table student;
alter table students 
rename column student to student_id;
truncate table student;
insert into students (student_id,lastname,firstname,address,city,e_mail) values('1','d a','sachin','anaji','moodi','sachinanaji8@gmail.com');
select * from student;

alter table students modify column student_id int not null;
create table student (
student_id int primary key auto_increment,
lastname varchar (255),
firstname varchar (255),
address varchar (255),
city varchar (255) check (city="moodi")
);
alter table fees_details 
add student_id int;
alter table fees_details 
add foreign key (student_id) references student (student_id);
insert into student (lastname,firstname,address,city,e_mail) 
values('d a','sachin','anaji','dharwad','sachinanaji8@gmail.com');
insert into student (student_id,lastname,firstname,address,city,e_mail) 
values('1','d a','sachin','anaji','moodi','sachinanaji8@gmail.com');
insert into student ( lastname,firstname,address,city,e_mail)
values('u.k','prajwal','kamaganni','tilavalli','prajwaluk9747@gmail.com'),
('n k','sujan','kamaganni','moodi','sujannk123@gmail.com');     
insert into student (lastname,firstname,address,city,e_mail) 
values('m a','mahendra','anaji','moodi','mahendrama08@gmail.com')



