clear screen;

drop table client cascade constraints;
drop table airport cascade constraints;
drop table country cascade constraints;
drop table booking cascade constraints;
drop table flight cascade constraints;
drop table schedule cascade constraints;
drop table aircraft cascade constraints;
drop table flight cascade constraints;

create table country(
 country varchar2(20),
 country_code int,
 Constraints pk3 PRIMARY KEY(country_code));
 


create table client(
 client_id int,
 fname varchar2(20),
 lname varchar2(20),
 phone varchar2(25),
 email varchar2(20),
 passport varchar2(20),
 country_code int,
 Constraints pk1 PRIMARY KEY (client_id),
 Constraints fk1 FOREIGN KEY (country_code)
 references country(country_code));


create table airport(
 name varchar2(30),
 city varchar2(20),
 country_code int,
 airport_code int, 
 Constraints pk2 PRIMARY KEY(airport_code),
 Constraints fk2 FOREIGN KEY (country_code)
 references country(country_code));

create table schedule(
 schedule_id int,
 origin varchar2(50),
 dest varchar2(50),
 a_time varchar2(20),
 d_time varchar2(20),
 Constraints pk5 PRIMARY KEY(schedule_id));

 create table aircraft(
 plane_id int,
 plane_name varchar2(45),
 first_class_sit int,
 business_class_sit int,
 economy_class_sit int, 
CONSTRAINTS pk6 PRIMARY KEY (plane_id)); 


create table booking(
 client_id int,
 schedule_id int,
 seat_id int,
 plane_id int,
 clas varchar2(20),
 priceUSD numeric(10,5),
 Constraints fk4 FOREIGN KEY (client_id) references client(client_id),
 Constraints fk_fc FOREIGN KEY (plane_id) references aircraft(plane_id),
 Constraints fk_fcall FOREIGN KEY (schedule_id) references schedule(schedule_id));

create table flight(
schedule_id int,
plane_id int,
first_class_price numeric(10,5),
business_class_price numeric(10,5),
economy_class_price numeric(10,5),
CONSTRAINTS fk_g FOREIGN KEY(schedule_id) references schedule(schedule_id),
CONSTRAINTS fk_g2 FOREIGN KEY(plane_id) references aircraft(plane_id));

insert into aircraft values (1,'A1B1',10,50,100);
insert into aircraft values (2,'A1B2',10,50,100);
insert into aircraft values (3,'A1B3',10,50,100);
insert into aircraft values (4,'A1B4',10,50,100);
insert into aircraft values (5,'A1B5',10,50,100);
insert into aircraft values (6,'A156',10,50,100);
insert into aircraft values (7,'A157',10,50,100);
insert into aircraft values (8,'A158',10,50,100);
insert into aircraft values (9,'A1B9',10,50,100);




 insert into country values('Bangladesh',88);
 insert into country values('Russia',22);
 insert into country values('UK',33);
 insert into country values('Sweden',44);
 insert into country values('Norway',55);
 insert into country values('France',66);
 insert into country values('Natherlands',77);
 insert into country values('Austria',99);
 
 
 
 
insert into client values(1,'Sofia','Neherin','++5132121216521','sofia@gmail.com','FA35878',22);
insert into client values(2,'Sakib','Ahmed','++5132121214511','sakib@gmail.com','FA93247',22);
insert into client values(3,'Shamit','Ahmed','++6574121216521','shamit@gmail.com','FA12458',22);
insert into client values(4,'Georgina','Székes ','++32819898989','georgina@gmail.com','FA647878',22);
insert into client values(5,'Ethan','Ecrin','++5132121216521','ethn@gmail.com','FA124378',22);
insert into client values(6,'Lokas','Defne','++5132121214511','lks@gmail.com','FA875947',22);
insert into client values(7,'Noah','Atkinson','++6574121216521','nh@gmail.com','FA254158',22);
insert into client values(8,'Luka','Modric','++32819898989','mod@gmail.com','FA576478',22);


insert into airport values('Shahjalal Airport', 'Sylhet',88,1);
insert into airport values('Bangabondhu Airport', 'Dhaka',88,2);
insert into airport values('Moscow Airport', 'Moscow',22,3);
insert into airport values('Pulkovo Airport', 'Petersburg',22,4);
insert into airport values('Oslo Airport', 'Oslo',55,5);
insert into airport values('Amsterdam Airport', 'Amsterdam',77,6);
insert into airport values('Paris Airport', 'Paris',66,7);
insert into airport values('London Airport', 'London',33,8);
insert into airport values('Stockholm Airport', 'Stockholm',44,9);



insert into schedule values(1, 'Moscow','Dhaka','05:30','22:3'); 
insert into schedule values(2, 'Moscow','Dhaka','08:00','22:30');
insert into schedule values(3, 'Moscow','Dhaka','05:30','22:00'); 
insert into schedule values(4, 'Moscow','Sylhet','08:00','22:30');
insert into schedule values(5, 'Moscow','Amsterdam','05:30','20:35'); 
insert into schedule values(6, 'Moscow','Paris','05:30','22:30');
insert into schedule values(7, 'Moscow','London','05:30','23:30');
insert into schedule values(8, 'Moscow','Stockholm','05:30','21:30');
insert into schedule values(9, 'Moscow','Petersburg','05:30','21:30');


insert into flight values(1,1,1000,700,499);
insert into flight values(2,2,1000,700,499);
insert into flight values(3,3,1000,700,499);
insert into flight values(4,4,1000,700,499);
insert into flight values(5,5,1000,700,499);
insert into flight values(6,6,1000,700,499);
insert into flight values(7,7,1000,700,499);
insert into flight values(8,8,1000,700,499);
insert into flight values(9,9,1000,700,499);


insert into booking values(1,1,1,1,'First Class',1000);
insert into booking values(2,1,2,1,'First Class',1000);
insert into booking values(3,1,3,1,'First Class',1000);
insert into booking values(4,6,1,2,'Economy Class',499);
insert into booking values(5,7,1,3,'Economy Class',499);
insert into booking values(6,8,1,4,'Economy Class',499);


select* from client;
select* from airport;
select* from country;
select* from booking;
select* from flight;
select* from schedule;
select* from aircraft;
select* from flight;
COMMIT;