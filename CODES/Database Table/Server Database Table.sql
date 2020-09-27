clear screen;

drop table Customer cascade constraints;
drop table Admin cascade constraints;
drop table RoomDetails cascade constraints;
drop table Reservation cascade constraints;
drop table Employee cascade constraints;
drop table Food cascade constraints;
drop table Bill cascade constraints;

create table Customer
(c_id number(2),
name varchar2(6),
mobile integer,
email varchar2(16),
date_of_birth date,
nationality varchar2(12),
city varchar2(10),
primary key(c_id));


create table Admin
(admin_id number(10),
name varchar2(6),
address varchar2(20),
email varchar2(20),
mobile_no integer,
primary key(admin_id));

create table RoomDetails
(roomNo number(20),
roomType varchar2(30),
roomRate integer,
review varchar2(20),
PRIMARY KEY(roomNo));

create table Reservation
(rsrv_no number(10),
c_id number(5),
roomNo number(20), 
checkin date,
checkout date,
PRIMARY KEY(rsrv_no),
Foreign KEY(c_id) references Customer(c_id),
Foreign KEY(roomNo) references RoomDetails(roomNo));

create table Employee
(Emp_id number(20),
name varchar2(6),
dutyHour varchar2(20),
roomNo number(20),
PRIMARY KEY(Emp_id));
Foreign KEY(roomNo) references RoomDetails(roomNo));

create table Food
(foodNo number(20),
type varchar2(20),
name varchar2(10),
rate integer,
PRIMARY KEY(foodNo));

create table Bill
(bill_id number(20),
c_id number(5),
roomNo number(20), 
amount integer,
paymentStatus varchar2(20),
PRIMARY KEY(bill_id),
Foreign KEY(c_id) references Customer(c_id),
Foreign KEY(roomNo) references RoomDetails(roomNo));


insert into Customer values(1, 'Laboni', 123, 'laboni@gmail.com', '9-Oct-1995', 'Bangladeshi', 'Chittagong');
insert into Customer values(2, 'James', 234, 'james@gmail.com', '11-jan-1990', 'American', 'Chittagong');
insert into Customer values(3, 'Prima', 345, 'prima@gmail.com', '14-Dec-1995', 'Bangladeshi', 'Sylhet');
insert into Customer values(4, 'Kavin', 456, 'kavin@gmail.com', '13-apr-1990', 'American', 'Sylhet');
insert into Customer values(5, 'Sharif', 567, 'sharif@gmail.com', '21-Dec-1991', 'Bangladeshi', 'Dhaka');

insert into Admin values(1, 'Laboni', '27-Azimpur', 'laboni@gmail.com', 298);
insert into Admin values(2, 'Prima', '99-Niketon', 'prima@gmail.com', 876);
insert into Admin values(3, 'Neaz', '20-Bakshibzar', 'neaz@gmail.com', 654);

insert into RoomDetails values(1, 'Standard', 8000, 'Excellent');
insert into RoomDetails values(2, 'Deluxe', 12000, 'Good');
insert into RoomDetails values(3, 'Superior-Deluxe', 14000, 'Excellent');
insert into RoomDetails values(4, 'Junior-Suite', 16000, 'Average');

insert into Reservation values(1, 2, 4, '1-Jan-2018', '6-Jan-2018');
insert into Reservation values(2, 4, 1, '3-March-2018', '6-March-2018');
insert into Reservation values(3, 2, 3, '7-April-2018', '15-April-2018');
insert into Reservation values(4, 5, 2, '10-June-2018', '15-June-2018');

insert into Employee values(1, 'Rahim', '8am-2pm', 2);
insert into Employee values(2, 'Karim', '2pm-8pm', 4);
insert into Employee values(3, 'Abul', '8pm-2am', 1);
insert into Employee values(4, 'Jabbar', '2am-8am', 3);

insert into Food values(1, 'Breakfast', 'Muffin', 200);
insert into Food values(2, 'Lunch', 'Steak', 1000);
insert into Food values(3, 'Lunch', 'Chicken', 300);
insert into Food values(4, 'Dinner', 'Beef', 400);

insert into Bill values(1, 2, 4, 10300, 'Done');
insert into Bill values(2, 4, 1, 25000, 'Done');
insert into Bill values(3, 2, 3, 15200, 'Done');
insert into Bill values(4, 5, 2, 30000, 'Not Done');

commit;

select * from Customer;
select * from Admin;
select * from RoomDetails;
select * from Reservation;
select * from Bill;
select * from Employee;
select * from Food;

