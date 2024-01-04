create database IDB_G13

use IDB_G13

create table Airlines(Airline_ID nvarchar(50) Primary Key,Airline nvarchar(50));

insert into Airlines (Airline_ID, Airline) values
('CA8760','Core Airways'),
('EA1709','Echo Airline'),
('PA2098','Peak Airways'),
('SA1865','Spark Airways')


create table Pilots(
staffID varchar(50) PRIMARY KEY,
first_name nvarchar(50),
last_name nvarchar(50),
Position nvarchar(50),
age int,
year_of_experience nvarchar(50),
flying_hours int,
salary int
);


insert into pilots(staffID,first_name,last_name,position,age,year_of_experience,flying_hours,salary) values
('1001', 'Mikael','Tinnason','CAPTAIN','42','16','21500','17000'),
('1002', 'Jason','Statham','CAPTAIN','45','17','24500','19000'),
('1003', 'Tom','Cruise','CAPTAIN','51','23','27000','23000'),
('1004', 'Steven','Smith','CO-CAPTAIN','30','5','8000','14000'),
('1005', 'David','Warner','CO-CAPTAIN','33','6','9200','15000'),
('1006', 'Tim','David','CAPTAIN','34','7','8400','15500'),
('1007', 'Aaron','Finch','CO-CAPTAIN','36','9','10000','16000')


create table address(
address_id nvarchar(50) PRIMARY KEY,
street nvarchar(50),
city nvarchar(50),
state nvarchar(50),
postal_code nvarchar(50),
country nvarchar(50)
);


insert into address (address_id,street,city,state,postal_code,country) values
('101', 'Jln Firma 2/2 Kawasan','Seri Kembangan','Selangor','43300','Malaysia'),
('102', 'Jalan OS,One South','Seri Kembangan','Selangor','43300','Malaysia'),
('103', 'Jln 7/4,TPM','Bukit Jalil','Kuala Lumpur','57000','Malaysia'),
('104', 'Zenopy Residence','Seri Kembangan','Selangor','43530','Malaysia'),
('105', 'Jln Sekama Kuching','Kuching','Sarawak','93300','Malaysia'),
('106', 'Jln 6/4','Kuching','Sarawak','93300','Malaysia')


create table flight_attendant(Attendant_ID varchar(50) PRIMARY KEY,
First_Name nvarchar(50),
Last_Name varchar(255),
Salary int,
Number int,
Position nvarchar(50),
address_id nvarchar(50) foreign key references address(address_id)
);

ALTER TABLE flight_attendant
ADD address_id nvarchar(50) foreign key references address(address_id)

insert into flight_attendant (Attendant_ID, First_Name,Last_Name,Salary,Number,Position,Address_id) values
('1', 'Yasir','Iqbal','10000','011389183','Air Host','103'),
('2', 'Nazifa','Nawar','9500','011389121','Air Hostress','102'),
('3', 'Yoshil','A/L','9000','012382183','Air Host','105')


create table Attendant(
id varchar(50) primary key,
staffID varchar(50) foreign key references pilots(staffID),
Attendant_ID varchar(50) foreign key references  flight_attendant(Attendant_ID)
);


insert into Attendant(id,staffID,Attendant_ID) values
('501','1001','1'),
('502','1002','2'),
('503','1003','3'),
('504','1004','2'),
('505','1005','3'),
('506','1006','1')


create table Flight(
Flight_Number nvarchar(50) Primary Key,
total_business_seat int,
total_eco_seat int,
date_of_dep date,
time_of_dep time,
date_of_arrival date,
time_of_arrival time,
origin_state nvarchar(50),
dest_state nvarchar(50),
staffID varchar(50) foreign key references Pilots(staffID),
airlines_ID nvarchar(50) foreign key references Airlines(Airline_ID)
);


insert into Flight (Flight_Number,total_eco_seat,total_business_seat,date_of_dep,time_of_dep,date_of_arrival,time_of_arrival,origin_state,dest_state,staffID,airlines_ID) values 
('SA-023','50','9','2022-03-13','11:15','2022-03-13','13:00','KL','Sabah','1001','SA1865'),
('EA-323','40','19','2022-03-13','13:30','2022-03-13','15:00','Sabah','KL','1002','EA1709'),
('PA-312','45','14','2022-03-13','08:45','2022-03-13','10:15','Pahang','Sarawak','1003', 'PA2098'),
('CA-161','38','21','2022-03-13','14:00','2022-03-13','15:30','Perak','Sabah','1005','CA8760'),
('EA-162','43','16','2022-03-13','10:15','2022-03-13','12:00','Negeri Sembilan','Sabah','1004', 'EA1709'),
('CA-028','36','23','2022-03-13','9:00','2022-03-13','11:00','Perak','KL','1006','CA8760')


create table Customer(
CustomerID int Primary Key,
first_name nvarchar(50),
lastname nvarchar(50),
email nvarchar(250),
number int,
address_id nvarchar(50) foreign key references address(address_id),
);


insert into Customer (CustomerID, first_name, LastName, email, number, address_id) values
('1','David', 'James','david@outlook.com','0124244245','101'),
('2','Jackson', 'Bird', 'jackb@gmail.com', '012753245','102'),
('3','Ali', 'Ahmad','aliahmad@gmail.com', '0132644431','104'),
('4','Mitchel', 'Starc', 'mitchel@yahoo.com','01523231731', '105'),
('5','Mathew', 'Wade', 'mathew23@gmail.com', '0123432341','103'),
('6','Ben', 'Zaher','benz@mail.com', '015234173', '105')


create table booking(
BookingNumber nvarchar(50) Primary Key,
booking_date date,
biz_seats int,
economy_seats int,
total_booked_seats int,
total_price decimal(10,2),
booking_state nvarchar(50),
CustomerID int foreign key references Customer(CustomerID ),
Flight_Number nvarchar(50) foreign key references Flight(flight_number)
);



insert into Booking (BookingNumber,booking_date,biz_seats,economy_seats,total_booked_seats,total_price,booking_state,CustomerID,Flight_Number) Values
('BN101','2022-03-02','4','3','7','3900','Johr Bahru','5','CA-028'),
('BN102','2022-03-02','0','0','0','0','KL','1','CA-161'),
('BN103','2022-03-03','2','1','3','1300','Selangor','3','EA-162'),
('BN104','2022-03-05','1','1','2','800','Sabah','2','EA-323'),
('BN105','2022-03-07','2','2','4','2000','Sarawak','4','PA-312'),
('BN106','2022-03-09','1','3','4','1600','Selangor','6','SA-023')


create table Seats(
seat_ID nvarchar(50) Primary Key,
seat_no nvarchar(50),
Flight_Number nvarchar(50) foreign key references Flight(flight_number)
);


insert into Seats (seat_no,seat_ID,flight_number)  values
('1', 'A1','SA-023'), 
('2', 'A2','CA-028'), 
('3', 'A3','CA-161'), 
('4', 'A4','SA-023'), 
('5', 'A5','PA-312'), 
('6', 'A6','EA-323'), 
('7', 'A7','EA-162'),
('8', 'A8','EA-323'),
('9', 'B1','CA-161'), 
('10', 'B2','CA-028'), 
('11', 'B3','EA-323'), 
('12', 'B4','CA-161'), 
('13', 'B5','PA-312'), 
('14', 'B6','PA-312'), 
('15', 'B7','EA-323'), 
('16', 'B8','CA-161'), 
('17', 'C1','CA-161'), 
('18', 'C2','PA-312'), 
('19', 'C3','CA-028'), 
('20', 'C4','PA-312'), 
('21', 'C5','PA-312'), 
('22', 'C6','CA-161'), 
('23', 'C7','PA-312'), 
('24', 'C8','CA-028'), 
('25', 'D1','SA-023'), 
('26', 'D2','EA-162'), 
('27', 'D3','EA-323'),
('28', 'D4','PA-312'),
('29', 'D5','PA-312'), 
('30', 'D6','PA-312'), 
('31', 'D7','EA-162'), 
('32', 'D8','EA-323'), 
('33', 'E1','PA-312'), 
('34', 'E2','CA-161'), 
('35', 'E3','EA-323'), 
('36', 'E4','CA-028'), 
('37', 'E5','CA-028'), 
('38', 'E6','EA-323'), 
('39', 'E7','EA-162'), 
('40', 'E8','CA-028'), 
('41', 'F1','EA-323'), 
('42', 'F2','SA-023'), 
('43', 'F3','CA-161'), 
('44', 'F4','EA-162'), 
('45', 'F5','EA-323'), 
('46', 'F6','EA-162'), 
('47', 'F7','EA-323'),
('48', 'F8','SA-023'),
('49', 'G1','EA-323'),
('50', 'G2','CA-028'),
('51', 'G3','EA-323'), 
('52', 'G4','EA-323'), 
('53', 'G5','SA-023'), 
('54', 'G6','EA-323'), 
('55', 'G7','CA-161'), 
('56', 'G8','CA-028'), 
('57', 'H1','EA-162'),
('58', 'H2','CA-161'),
('59', 'H3','CA-028')



Use IDB_G13

--Student 1

--1.	Display the average of salary for pilots who have reached or exceeded 20,000 flying hours.
--2.	List the first name, last name, age, and experience of pilots who have piloted the flight for Spark Airways. Select first_name, last_name, age, year_of_experience from pilots with 
--3.	Find the Airline with the most number of flights.



--Q1
select AVG(salary) from Pilots where flying_hours>20000;


--Q2
Select first_name, last_name, age, year_of_experience from pilots where staffID=
(select staffID from Flight where airlines_ID=
(select Airline_ID from Airlines where Airline='Spark Airways'))


--Q3
Select max(flying_hours) from Pilots;



--Query

select count(dest_state)  from Flight where dest_state='KL'