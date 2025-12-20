create database project;

use project;

create table Airlines (airline_id int primary key auto_increment,
					   airline_name varchar(30) not null,
                       iata_code varchar(5) unique not null,
                       country varchar(30) not null,
                       founded_year int not null,
                       status enum('active','inactive') default 'active');
                       
                       
insert into Airlines (airline_name,iata_code,country,founded_year,status) values
('Air India', 'AI', 'India', 1946, 'active'),
('IndiGo', '6E', 'India', 2006, 'active'),
('SpiceJet', 'SG', 'India', 2005, 'active'),
('Vistara', 'UK', 'India', 2013, 'active'),
('AirAsia', 'AK', 'Malaysia', 1993, 'active'),
('Emirates', 'EK', 'UAE', 1985, 'active'),
('Qatar Airways', 'QR', 'Qatar', 1993, 'active'),
('Singapore Airlines', 'SQ', 'Singapore', 1972, 'active'),
('British Airways', 'BA', 'UK', 1974, 'active'),
('Lufthansa', 'LH', 'Germany', 1953, 'active'),
('Air France', 'AF', 'France', 1933, 'active'),
('Thai Airways', 'TG', 'Thailand', 1960, 'active'),
('Cathay Pacific', 'CX', 'Hong Kong', 1946, 'active'),
('Japan Airlines', 'JL', 'Japan', 1951, 'active'),
('Qantas', 'QF', 'Australia', 1920, 'active');


create table Airports (airport_id int primary key auto_increment,
					   airport_name varchar(30) not null,
                       city varchar(30) not null,
                       country varchar(30) not null,
                       iata_code varchar(5) unique not null,
                       terminals varchar(30) not null);
                       
                       
insert into Airports (airport_name ,city,country,iata_code,terminals) values
('Delhi Airport', 'Delhi', 'India', 'DEL', '3'),
('Mumbai Airport', 'Mumbai', 'India', 'BOM', '2'),
('Bangalore Airport', 'Bangalore', 'India', 'BLR', '1'),
('Dubai Airport', 'Dubai', 'UAE', 'DXB', '3'),
('Singapore Changi', 'Singapore', 'Singapore', 'SIN', '4'),
('Heathrow', 'London', 'UK', 'LHR', '5'),
('Charles de Gaulle', 'Paris', 'France', 'CDG', '3'),
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA', '2'),
('Bangkok Airport', 'Bangkok', 'Thailand', 'BKK', '4'),
('Sydney Airport', 'Sydney', 'Australia', 'SYD', '3'),
('Tokyo Haneda', 'Tokyo', 'Japan', 'HND', '3'),
('Hong Kong Airport', 'Hong Kong', 'China', 'HKG', '2'),
('Doha Airport', 'Doha', 'Qatar', 'DOH', '1'),
('New York JFK', 'New York', 'USA', 'JFK', '6'),
('Dubai World Central', 'Dubai', 'UAE', 'DWC', '2');


create table Flights (flight_id int primary key auto_increment,
					   flight_number varchar(30) not null,
                       airline_id int not null,
                       from_airport int not null,
                       to_airport int not null,
                       departure_time time not null,
                       foreign key (airline_id) references Airlines(airline_id),
					   foreign key(from_airport) references Airports(airport_id),
                       foreign key(to_airport) references Airports(airport_id));
                       
                       
insert into Flights (flight_number,airline_id,from_airport,to_airport,departure_time) values
('AI101', 1, 1, 4, '08:00'),
('6E202', 2, 2, 3, '10:30'),
('SG303', 3, 3, 1, '14:15'),
('UK404', 4, 1, 5, '18:45'),
('EK505', 6, 4, 6, '22:00'),
('AK606', 5, 5, 2, '06:30'),
('QR707', 7, 6, 7, '12:00'),
('SQ808', 8, 7, 8, '15:45'),
('BA909', 9, 8, 9, '09:30'),
('LH101', 10, 9, 10, '20:15'),
('AF202', 11, 10, 11, '07:20'),
('TG303', 12, 11, 12, '13:40'),
('CX404', 13, 12, 13, '16:50'),
('JL505', 14, 13, 14, '19:25'),
('QF606', 15, 14, 15, '23:10');

create table Passengers (passenger_id int primary key auto_increment,
					   first_name varchar(30) not null,
                       last_name varchar(30) not null,
                       passport_no varchar(30) unique not null,
                       nationality varchar(30) not null,
                       email varchar(30) unique not null);
                       
                       
insert into Passengers (first_name ,last_name,passport_no,nationality,email) values
('Rohan', 'Sharma', 'A12345678', 'Indian', 'rohan@email.com'),
('Priya', 'Patel', 'B87654321', 'Indian', 'priya@email.com'),
('Ahmed', 'Khan', 'C11223344', 'Indian', 'ahmed@email.com'),
('John', 'Smith', 'D55667788', 'American', 'john@email.com'),
('Maria', 'Garcia', 'E99887766', 'Spanish', 'maria@email.com'),
('Chen', 'Wei', 'F44556677', 'Chinese', 'chen@email.com'),
('David', 'Brown', 'G33445566', 'British', 'david@email.com'),
('Anna', 'Muller', 'H77889900', 'German', 'anna@email.com'),
('Pierre', 'Dubois', 'I11223399', 'French', 'pierre@email.com'),
('Yuki', 'Tanaka', 'J44558877', 'Japanese', 'yuki@email.com'),
('Wei', 'Zhang', 'K99663322', 'Chinese', 'wei@email.com'),
('Emma', 'Wilson', 'L55447788', 'Canadian', 'emma@email.com'),
('Mohammed', 'Ali', 'M88776655', 'Egyptian', 'mohammed@email.com'),
('Sofia', 'Rossi', 'N22334455', 'Italian', 'sofia@email.com'),
('James', 'Taylor', 'O66778899', 'Australian', 'james@email.com');

create table Booking (booking_id int primary key auto_increment,
					   passenger_id int not null,
                       flight_id int not null,
                       seat_number varchar(30) not null,
                       booking_date date not null,
                       status enum('confirmed','pending','cancelled'),
                       foreign key(passenger_id) references Passengers(passenger_id),
                       foreign key(flight_id) references Flights(flight_id));
                       
                       
insert into Booking (passenger_id,flight_id,seat_number,booking_date,status) values
(1, 1, '12A', '2024-01-15', 'confirmed'),
(2, 2, '08B', '2024-01-16', 'confirmed'),
(3, 3, '15C', '2024-01-17', 'pending'),
(4, 4, '22D', '2024-01-18', 'confirmed'),
(5, 5, '05A', '2024-01-19', 'cancelled'),
(6, 6, '18F', '2024-01-20', 'confirmed'),
(7, 7, '10E', '2024-01-21', 'confirmed'),
(8, 8, '25B', '2024-01-22', 'pending'),
(9, 9, '30C', '2024-01-23', 'confirmed'),
(10, 10, '14D', '2024-01-24', 'confirmed'),
(11, 11, '07A', '2024-01-25', 'cancelled'),
(12, 12, '19F', '2024-01-26', 'confirmed'),
(13, 13, '21E', '2024-01-27', 'confirmed'),
(14, 14, '11B', '2024-01-28', 'pending'),
(15, 15, '28C', '2024-01-29', 'confirmed');

create table Crew (crew_id int primary key auto_increment,
					   first_name varchar(30) not null,
                       last_name varchar(30) not null,
                       position varchar(20)  not null,
                       airline_id int not null,
                       base_airport int not null ,
                       foreign key(airline_id) references Airlines(airline_id),
                       foreign key(base_airport) references Airports(airport_id));
                       
                       
insert into Crew (first_name,last_name,position,airline_id,base_airport) values
('Raj', 'Kumar', 'Pilot', 1, 1),
('Anjali', 'Singh', 'Co-Pilot', 2, 2),
('Vikram', 'Joshi', 'Flight Attendant', 3, 3),
('Sneha', 'Reddy', 'Flight Attendant', 4, 1),
('Arjun', 'Malhotra', 'Pilot', 6, 4),
('Neha', 'Verma', 'Co-Pilot', 5, 5),
('Michael', 'Brown', 'Pilot', 7, 6),
('Sarah', 'Wilson', 'Flight Attendant', 8, 7),
('James', 'Taylor', 'Co-Pilot', 9, 8),
('Emma', 'Johnson', 'Flight Attendant', 10, 9),
('David', 'Miller', 'Pilot', 11, 10),
('Lisa', 'Anderson', 'Co-Pilot', 12, 11),
('Robert', 'Davis', 'Flight Attendant', 13, 12),
('Maria', 'Garcia', 'Pilot', 14, 13),
('Kenji', 'Yamamoto', 'Co-Pilot', 15, 14);

create table Aircrafts (aircraft_id int primary key auto_increment,
					   aircraft_type varchar(30) not null,
					   registration  varchar(30) not null,
                       airline_id int not null,
                       capacity int not null,
                       status enum('active','inactive') default 'active',
                       foreign key(airline_id) references Airlines(airline_id));
                       
                       
insert into Aircrafts (aircraft_type,registration,airline_id,capacity,status) values
('Boeing 737', 'VT-ABC', 1, 180, 'active'),
('Airbus A320', 'VT-DEF', 2, 180, 'active'),
('Boeing 737', 'VT-GHI', 3, 189, 'active'),
('Airbus A321', 'VT-JKL', 4, 220, 'active'),
('Airbus A380', 'A6-EMR', 6, 517, 'active'),
('Airbus A320', '9M-AAA', 5, 180, 'active'),
('Boeing 777', 'A7-BAC', 7, 396, 'active'),
('Airbus A350', '9V-SMA', 8, 253, 'active'),
('Boeing 787', 'G-ZBKB', 9, 214, 'active'),
('Airbus A330', 'D-AIKF', 10, 255, 'active'),
('Boeing 777', 'F-GSQJ', 11, 310, 'active'),
('Airbus A380', 'HS-TUA', 12, 507, 'active'),
('Boeing 777', 'B-KQB', 13, 280, 'active'),
('Boeing 787', 'JA821J', 14, 186, 'active'),
('Boeing 737', 'VH-VQA', 15, 174, 'active');

create table Flights_Schedule (schedule_id int primary key auto_increment,
					   flight_id int not null,
					   day_of_week  varchar(30) not null,
                       departure_time time not null,
                       arrival_time time not null,
                       status enum('active','inactive') default 'active',
                       foreign key(flight_id) references Flights(flight_id));
                       
                       
insert into Flights_Schedule (flight_id,day_of_week,departure_time,arrival_time,status) values
(1, 'Monday', '08:00', '11:00', 'active'),
(2, 'Tuesday', '10:30', '12:30', 'active'),
(3, 'Wednesday', '14:15', '16:15', 'active'),
(4, 'Thursday', '18:45', '22:45', 'active'),
(5, 'Friday', '22:00', '06:00', 'active'),
(6, 'Saturday', '06:30', '10:00', 'active'),
(7, 'Sunday', '12:00', '18:30', 'active'),
(8, 'Monday', '15:45', '22:15', 'active'),
(9, 'Tuesday', '09:30', '14:00', 'active'),
(10, 'Wednesday', '20:15', '04:45', 'active'),
(11, 'Thursday', '07:20', '12:40', 'active'),
(12, 'Friday', '13:40', '19:10', 'active'),
(13, 'Saturday', '16:50', '22:20', 'active'),
(14, 'Sunday', '19:25', '01:55', 'active'),
(15, 'Monday', '23:10', '07:40', 'active');

create table Maintenance (maintenance_id int primary key auto_increment,
					   aircraft_id int not null,
					   maintenance_type  varchar(30) not null,
                       date date not null,
                       cost int not null,
                       status enum('completed','in Progress','pending'),
                       foreign key(aircraft_id) references Aircrafts(aircraft_id));
                       
                       
insert into Maintenance (aircraft_id,maintenance_type,date,cost,status) values
(1, 'Regular Check', '2024-01-10', 50000, 'completed'),
(2, 'Engine Repair', '2024-01-12', 200000, 'in Progress'),
(3, 'Regular Check', '2024-01-15', 45000, 'completed'),
(4, 'Software Update', '2024-01-18', 75000, 'pending'),
(5, 'Regular Check', '2024-01-20', 150000, 'pending'),
(6, 'Paint Job', '2024-01-22', 100000, 'completed'),
(7, 'Engine Overhaul', '2024-01-25', 300000, 'in Progress'),
(8, 'Regular Check', '2024-01-28', 60000, 'completed'),
(9, 'Avionics Update', '2024-02-01', 120000, 'pending'),
(10, 'Regular Check', '2024-02-05', 55000, 'completed'),
(11, 'Tire Replacement', '2024-02-08', 80000, 'in Progress'),
(12, 'Regular Check', '2024-02-12', 90000, 'completed'),
(13, 'Interior Upgrade', '2024-02-15', 250000, 'pending'),
(14, 'Regular Check', '2024-02-18', 70000, 'completed'),
(15, 'Brake System', '2024-02-22', 180000, 'in Progress');

create table Crew_Assignment (assignment_id int primary key auto_increment,
					   crew_id int not null,
					   flight_id  int not null,
                       role varchar(30) not null,
                       date date not null,
                       status enum('scheduled') default'scheduled',
                       foreign key(crew_id) references Crew(crew_id),
                       foreign key(flight_id) references Flights(flight_id));
                       
                       
insert into Crew_Assignment (crew_id,flight_id,role,date,status) values
(1, 1, 'Captain', '2024-01-25', 'scheduled'),
(2, 2, 'First Officer', '2024-01-26', 'scheduled'),
(3, 3, 'Senior Crew', '2024-01-27', 'scheduled'),
(4, 4, 'Crew Member', '2024-01-28', 'scheduled'),
(5, 5, 'Captain', '2024-01-29', 'scheduled'),
(6, 6, 'First Officer', '2024-01-30', 'scheduled'),
(7, 7, 'Captain', '2024-02-01', 'scheduled'),
(8, 8, 'Flight Attendant', '2024-02-02', 'scheduled'),
(9, 9, 'First Officer', '2024-02-03', 'scheduled'),
(10, 10, 'Captain', '2024-02-04', 'scheduled'),
(11, 11, 'Senior Crew', '2024-02-05', 'scheduled'),
(12, 12, 'First Officer', '2024-02-06', 'scheduled'),
(13, 13, 'Crew Member', '2024-02-07', 'scheduled'),
(14, 14, 'Captain', '2024-02-08', 'scheduled'),
(15, 15, 'First Officer', '2024-02-09', 'scheduled');

select * from Airlines;
select * from Airports;
select * from Flights;
select * from Passengers;
select * from Booking;
select * from Crew;
select * from Aircrafts;
select * from Flights_Schedule;
select * from Maintenance;
select * from Crew_Assignment;

    





