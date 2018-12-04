clear screen;

drop table client cascade constraints;
drop table airport cascade constraints;
drop table country cascade constraints;
drop table booking cascade constraints;
drop table flight cascade constraints;
drop table schedule cascade constraints;


create table country(
 country varchar2(20),
 country_code int,
 Constraint pk3 PRIMARY KEY(country_code));


create table client(
 client_id int,
 fname varchar2(20),
 lname varchar2(20),
 phone varchar2(25),
 email varchar2(20),
 passport varchar2(20),
 country_code int,
 Constraint pk1 PRIMARY KEY (client_id),
 Constraint fk1 FOREIGN KEY (country_code)
 references country(country_code));


create table airport(
 name varchar2(30),
 city varchar2(20),
 country_code int,
 airport_code int, 
 Constraint pk2 PRIMARY KEY(airport_code),
 Constraint fk2 FOREIGN KEY (country_code)
 references country(country_code));

create table schedule(
 schedule_id int,
 origin varchar2(50),
 dest varchar2(50),
 a_time varchar2(20),
 d_time varchar2(20),
 tot_day int,
 Constraint pk5 PRIMARY KEY(schedule_id));


create table flight(
 flight_call int,
 schedule_id int,
 Constraints pk4 PRIMARY KEY(flight_call),
Constraint fk5 FOREIGN KEY (schedule_id)
 references schedule(schedule_id));



create table booking(
 client_id int,
 schedule_id int,
 seat_id int,
 Constraint fk4 FOREIGN KEY (client_id)
 references client(client_id),
 Constraint fk_fcall FOREIGN KEY (schedule_id)
 references schedule(schedule_id));


 insert into country values('Bangladesh',88);
 insert into country values('Russia',22);
 insert into country values('UK',33);
 insert into country values('Sweden',44);
 insert into country values('Norway',55);
 insert into country values('France',66);
 insert into country values('Natherlands',77);
 insert into country values('Austria',88);
 

insert into client values(1,'Nahid','Mahmood','0181216521','nhd@gmail.com','BA21478',88);
insert into client values(2,'Tanjina','Nipu','017416521','npu@gmail.com','BA68778',88);
insert into client values(3,'Amit','Niloy','01819898989','nly@gmail.com','BA5678',88);
insert into client values(4,'Az','Shurid','01815618989','az@gmail.com','BA3278',88);
insert into client values(5,'Rafi','Rakin','0181216521','rafi@gmail.com','BA23878',88);
insert into client values(6,'Wasif','Ashraf','017416521','wasu@gmail.com','BA77578',88);
insert into client values(7,'Mahir','Sadat','01819898989','rain@gmail.com','BA74428',88);
insert into client values(8,'Muhammad','Naqi','01815618989','naqi@gmail.com','BA12478',88);

insert into airport values('Shahjalal Airport', 'Sylhet',88,1);
insert into airport values('Bangabondhu Airport', 'Dhaka',88,2);
insert into airport values('Moscow Airport', 'Moscow',22,3);
insert into airport values('Pulkovo Airport', 'Petersburg',22,4);
insert into airport values('Oslo Airport', 'Oslo',55,5);
insert into airport values('Amsterdam Airport', 'Amsterdam',77,6);
insert into airport values('Paris Airport', 'Paris',66,7);
insert into airport values('London Airport', 'London',33,8);
insert into airport values('Stockholm Airport', 'Stockholm',44,9);


insert into schedule values(1, 'Dhaka','Moscow','08:00','22:30',2);
insert into schedule values(2, 'Dhaka','Moscow','05:30','22:30',3);
insert into schedule values(3, 'Dhaka','Moscow','00:30','22:30',4); 
insert into schedule values(4, 'Dhaka','Stockholm','08:00','22:30',2);
insert into schedule values(5, 'Dhaka','Petersburg','05:30','22:3',3); 
insert into schedule values(6, 'Dhaka','Amsterdam','08:00','22:30',3);
insert into schedule values(7, 'Dhaka','Sylhet','15:00','16.00',1);
insert into schedule values(8, 'Dhaka','Sylhet','8:30','9.30',1);



insert into booking values(1,1,50);
insert into booking values(2,5,50);
insert into booking values(3,6,10);
insert into booking values(4,2,10);
insert into booking values(5,8,12);



select* from client;
select* from airport;
select* from country;
select* from booking;
select* from flight;
select* from schedule;
COMMIT;