clear screen;

drop table Customer2 cascade constraints;
drop table Admin2 cascade constraints;
drop table RoomDetails2 cascade constraints;
drop table Reservation2 cascade constraints;
drop table Employee2 cascade constraints;
drop table Food2 cascade constraints;
drop table Bill2 cascade constraints;

create table Customer2
(c_id number(2),
name varchar2(6),
mobile integer,
email varchar2(16),
date_of_birth date,
nationality varchar2(12),
city varchar2(10),
primary key(c_id));


create table Admin2
(admin_id number(10),
name varchar2(6),
address varchar2(20),
email varchar2(20),
mobile_no integer,
primary key(admin_id));

create table RoomDetails2
(roomNo number(20),
roomType varchar2(30),
roomRate integer,
review varchar2(20),
PRIMARY KEY(roomNo));

create table Reservation2
(rsrv_no number(10),
c_id number(5),
roomNo number(20), 
checkin date,
checkout date,
PRIMARY KEY(rsrv_no),
Foreign KEY(c_id) references Customer(c_id),
Foreign KEY(roomNo) references RoomDetails(roomNo));

create table Employee2
(Emp_id number(20),
name varchar2(6),
dutyHour varchar2(20),
roomNo number(20),
PRIMARY KEY(Emp_id));
Foreign KEY(roomNo) references RoomDetails(roomNo));

create table Food2
(foodNo number(20),
type varchar2(20),
name varchar2(10),
rate integer,
PRIMARY KEY(foodNo));

create table Bill2
(bill_id number(20),
c_id number(5),
roomNo number(20), 
amount integer,
paymentStatus varchar2(20),
PRIMARY KEY(bill_id),
Foreign KEY(c_id) references Customer(c_id),
Foreign KEY(roomNo) references RoomDetails(roomNo));

commit;

select * from Customer2;
select * from Admin2;
select * from RoomDetails2;
select * from Reservation2;
select * from Bill2;
select * from Employee2;
select * from Food2;
