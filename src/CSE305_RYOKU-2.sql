-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2017 at 03:47 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CSE305_RYOKU`
--

-- --------------------------------------------------------

--
-- Table structure for table `Airlines`
--

CREATE TABLE `Airlines` (
  `ID` char(2) NOT NULL,
  `airline_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Airlines`
--

INSERT INTO `Airlines` (`ID`, `airline_name`) VALUES
('AA', 'American Airlines'),
('AB', 'Air Berlin'),
('AJ', 'Air Japan'),
('AM', 'Air Madagascar'),
('BA', 'British Airways'),
('DA', 'Delta Airlines'),
('JA', 'JetBlue Airways'),
('LU', 'Lufthansa'),
('SA', 'Southwest Airlines'),
('UA', 'United Airlines');

-- --------------------------------------------------------

--
-- Table structure for table `Airports`
--

CREATE TABLE `Airports` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Airports`
--

INSERT INTO `Airports` (`id`, `name`, `state`, `city`, `country`, `address`) VALUES
(1, 'Berlin Tegel', 'Berlin', 'Berlin', 'Germany', ' '),
(2, 'Chicago O\'Hare International', 'Illinois', 'Chicago', 'United States of America', ' '),
(3, 'Hartsfield-Jackson Atlanta Int', 'Georgia', 'Atlanta', 'United States of America', ' '),
(4, 'Ivato International', 'Antananarivo', 'Antananarivo', 'Madagascar', ' '),
(5, 'John F. Kennedy International', 'New York', 'New York', 'United States of America', ' '),
(6, 'LaGuardia', 'New York', 'New York', 'United States of America', ' '),
(7, 'Logan International	', 'Massachusetts', 'Boston', 'United States of America', ' '),
(8, 'London Heathrow', 'London', 'London', 'United Kingdom', ' '),
(9, 'Los Angeles International', 'California', 'Los Angeles', 'United States of America', ' '),
(10, 'San Francisco International', 'California', 'San Francisco', 'United States of America', ' '),
(11, 'Tokyo International', 'Tokyo', 'Tokyo', 'Japan', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `AccountNumber` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `AccountCreationDate` datetime NOT NULL,
  `CreditCardNumber` bigint(16) NOT NULL,
  `Ratings` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`AccountNumber`, `person_id`, `AccountCreationDate`, `CreditCardNumber`, `Ratings`) VALUES
(1, 1, '2017-10-23 00:00:00', 1234123412341234, 9.9),
(2, 2, '2017-10-23 00:00:00', 4331123412344321, 9.9),
(3, 8, '2017-10-23 00:00:00', 1234123412341234, 5),
(4, 9, '2017-10-23 00:00:00', 1234123412341234, 5),
(5, 10, '2017-10-23 00:00:00', 1234123412341234, 5),
(7, 18, '2017-12-04 20:13:59', 1010101010, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `EmployeeID` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `SSN` varchar(10) NOT NULL,
  `StartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `HourlyPay` double(6,2) NOT NULL,
  `isManager` tinyint(1) NOT NULL DEFAULT '0',
  `Rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`EmployeeID`, `person_id`, `SSN`, `StartDate`, `HourlyPay`, `isManager`, `Rating`) VALUES
(2, 3, '1234567890', '2017-10-24 00:47:01', 10.00, 0, 8.8),
(3, 4, '1234567890', '2017-10-24 00:47:01', 10.00, 0, 8.8),
(4, 5, '1234567890', '2017-10-24 00:47:01', 10.00, 1, 8.8),
(5, 6, '1234567890', '2017-10-24 00:47:01', 10.00, 1, 8.8),
(7, 7, '0987654321', '2017-10-24 00:47:01', 10.00, 0, 9.9),
(8, 14, '1111111111', '2017-12-01 07:34:03', 10.00, 1, 5.6),
(9, 15, '1111111111', '2017-12-01 08:30:21', 10.00, 1, 5.6),
(10, 16, '1111111111', '2017-12-05 00:24:12', 10.00, 1, 5.6);

-- --------------------------------------------------------

--
-- Table structure for table `FlightLegs`
--

CREATE TABLE `FlightLegs` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `departureAirport` int(11) NOT NULL,
  `arrivalAirport` int(11) NOT NULL,
  `dept_timestamp` datetime NOT NULL,
  `arrv_timestamp` datetime NOT NULL,
  `base_fare` decimal(10,0) NOT NULL,
  `hidden_fare` int(11) NOT NULL,
  `stopNum` int(11) NOT NULL,
  `departure_status` datetime NOT NULL,
  `arrival_status` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FlightLegs`
--

INSERT INTO `FlightLegs` (`id`, `flight_id`, `departureAirport`, `arrivalAirport`, `dept_timestamp`, `arrv_timestamp`, `base_fare`, `hidden_fare`, `stopNum`, `departure_status`, `arrival_status`) VALUES
(1, 1, 6, 9, '2011-01-05 11:00:00', '2011-01-05 09:00:00', '400', 600, 1, '2011-01-05 11:00:00', '2011-01-05 09:00:00'),
(2, 1, 9, 11, '2011-01-05 17:00:00', '2011-01-05 19:00:00', '600', 200, 2, '2011-01-05 17:00:00', '2011-01-05 19:00:00'),
(3, 1, 11, 9, '2011-01-06 10:00:00', '2011-01-06 07:30:00', '1000', 800, 3, '2011-01-06 11:00:00', '2011-01-06 07:30:00'),
(4, 2, 10, 7, '2011-01-10 14:00:00', '2011-01-10 12:00:00', '750', 600, 1, '2011-01-10 14:00:00', '2011-01-10 13:00:00'),
(5, 2, 7, 8, '2011-01-10 22:30:00', '2011-01-10 19:30:00', '1200', 1000, 2, '2011-01-10 22:30:00', '2011-01-10 19:30:00'),
(6, 2, 8, 10, '2011-01-11 08:00:00', '2011-01-11 05:00:00', '1200', 1000, 3, '2017-10-25 07:00:00', '2011-01-11 07:00:00'),
(7, 3, 5, 4, '2011-01-13 07:00:00', '2011-01-13 05:00:00', '600', 450, 1, '2011-01-13 09:00:00', '2011-01-13 05:00:00'),
(8, 3, 4, 5, '2011-01-14 03:00:00', '2011-01-13 23:00:00', '650', 500, 2, '2011-01-14 02:00:00', '2011-01-13 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Flights`
--

CREATE TABLE `Flights` (
  `id` int(11) NOT NULL,
  `airline` char(2) NOT NULL,
  `flight_number` int(11) NOT NULL,
  `base_fare` decimal(10,0) NOT NULL,
  `hidden_fare` int(11) NOT NULL,
  `numOfSeats` int(11) NOT NULL,
  `numOfStops` int(11) NOT NULL,
  `days_Op` bit(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Flights`
--

INSERT INTO `Flights` (`id`, `airline`, `flight_number`, `base_fare`, `hidden_fare`, `numOfSeats`, `numOfStops`, `days_Op`) VALUES
(1, 'AA', 111, '600', 400, 100, 3, b'1010100'),
(2, 'JA', 111, '600', 400, 150, 3, b'1111111'),
(3, 'AM', 1337, '900', 600, 33, 2, b'0000011');

-- --------------------------------------------------------

--
-- Table structure for table `LegsSeatsTaken`
--

CREATE TABLE `LegsSeatsTaken` (
  `FlightLeg_id` int(11) NOT NULL,
  `seat_number` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LegsSeatsTaken`
--

INSERT INTO `LegsSeatsTaken` (`FlightLeg_id`, `seat_number`) VALUES
(1, '33F'),
(2, '33F'),
(4, '13A'),
(7, '1A');

-- --------------------------------------------------------

--
-- Table structure for table `Meals`
--

CREATE TABLE `Meals` (
  `Name` char(25) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Meals`
--

INSERT INTO `Meals` (`Name`, `Description`) VALUES
('Chips', 'Just Chips'),
('Fish and Chips', 'Chips with Fish'),
('Sushi', 'Sushi');

-- --------------------------------------------------------

--
-- Table structure for table `Passenger`
--

CREATE TABLE `Passenger` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `reservations_id` int(11) NOT NULL,
  `meal_preference` char(25) DEFAULT NULL,
  `travel_class` enum('ECONOMY','BUSINESS','FIRST','') NOT NULL DEFAULT 'ECONOMY',
  `seat_preference` varchar(20) NOT NULL,
  `seat_number` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Passenger`
--

INSERT INTO `Passenger` (`id`, `person_id`, `reservations_id`, `meal_preference`, `travel_class`, `seat_preference`, `seat_number`) VALUES
(3, 9, 1, 'Chips', 'ECONOMY', 'AISLE', '33F'),
(4, 8, 2, 'Fish and Chips', 'FIRST', 'AISLE', '13A'),
(5, 10, 3, 'Sushi', 'FIRST', 'AISLE', '1A'),
(8, 13, 2, 'Chips', 'ECONOMY', 'AISLE', '33G');

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE `Person` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `emailAddress` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `City_Town` varchar(20) NOT NULL,
  `State` char(2) NOT NULL,
  `ZipCode` int(5) NOT NULL,
  `Phone` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`id`, `FirstName`, `LastName`, `emailAddress`, `password`, `Address`, `City_Town`, `State`, `ZipCode`, `Phone`) VALUES
(1, 'Pranav', 'Sethi', 'test1@roku.com', '1234', '300 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(2, 'Aditya', 'Potdar', 'test2@roku.com', '1234', '450 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(3, 'Suraj', 'Sharma', 'test3@roku.com', '1234', '100 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(4, 'Pranav2', 'Sethi2', 'test4@roku.com', '1234', '300 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(5, 'Aditya2', 'Potdar2', 'test5@roku.com', '1234', '450 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(6, 'Suraj2', 'Sharma2', 'test6@roku.com', '1234', '100 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(7, 'John', 'Doe', 'test7@roku.com', '1234', '1 Street', 'New York', 'NY', 11700, 9999999999),
(8, 'Jane', 'Smith', 'test8@roku.com', '1234', '100 Nicolls Rd', 'Stony Brook', 'NY', 17790, 5555555555),
(9, 'John', 'Doee', 'test9@roku.com', '1234', '123 N Fake Street', 'New York', 'NY', 10001, 1231231234),
(10, 'Rick ', 'Astley', 'test12@roku.com', '1234', '1337 Internet Lane', 'Los Angelles', 'CA', 90001, 3141592653),
(13, 'new', 'Doe', 'test221@roku.com', '1234', '1 Street', 'New York', 'NY', 11700, 3999999999),
(14, 'man', 'yes', 'test1k@roku.com', '1234', 'qw', 'sd', 'sd', 11790, 1111111111),
(15, 'msdsdan', 'ysdsdsdes', 'test16@roku.com', '1234', 'qw', 'sd', 'sd', 11790, 1111111111),
(16, 'maewn', 'yes', 'yello@hi', '1234', 'qw', 'sd', 'sd', 11790, 1111111111),
(18, 'test', 'sd', '21', 'sa@sk', '1234', 'ew', 'NY', 11790, 1111111111);

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `NumberOfPassengers` int(5) NOT NULL,
  `date` datetime NOT NULL,
  `total_fare` decimal(10,0) NOT NULL,
  `booking_fee` decimal(10,0) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `fare_restrictions` varchar(20) NOT NULL,
  `lengthOfStay` int(11) DEFAULT NULL,
  `advancePurchase` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`id`, `customer_id`, `NumberOfPassengers`, `date`, `total_fare`, `booking_fee`, `employee_id`, `fare_restrictions`, `lengthOfStay`, `advancePurchase`) VALUES
(1, 4, 1, '2017-10-24 00:00:00', '1200', '120', 2, 'RESTRICTED', NULL, NULL),
(2, 3, 2, '2017-10-24 00:00:00', '500', '50', 3, 'RESTRICTED', NULL, NULL),
(3, 5, 1, '2017-10-24 00:00:00', '3333', '333', 2, 'FLEXIBLE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ReservationLegs`
--

CREATE TABLE `ReservationLegs` (
  `reservation_id` int(11) NOT NULL,
  `legs_id` int(11) NOT NULL,
  `legNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReservationLegs`
--

INSERT INTO `ReservationLegs` (`reservation_id`, `legs_id`, `legNum`) VALUES
(2, 5, 1),
(3, 7, 1),
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ReservationPassenger`
--

CREATE TABLE `ReservationPassenger` (
  `reservation_id` int(11) NOT NULL,
  `passengers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReservationPassenger`
--

INSERT INTO `ReservationPassenger` (`reservation_id`, `passengers_id`) VALUES
(1, 3),
(2, 4),
(2, 8),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ReverseAuction`
--

CREATE TABLE `ReverseAuction` (
  `id` int(11) NOT NULL,
  `reservations_id` int(11) NOT NULL,
  `bid` decimal(10,0) NOT NULL,
  `legNum` int(11) NOT NULL,
  `approved` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReverseAuction`
--

INSERT INTO `ReverseAuction` (`id`, `reservations_id`, `bid`, `legNum`, `approved`) VALUES
(2, 1, '400', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TravelClass`
--

CREATE TABLE `TravelClass` (
  `Name` enum('ECONOMY','BUSINESS','FIRST','') NOT NULL DEFAULT 'ECONOMY'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TravelClass`
--

INSERT INTO `TravelClass` (`Name`) VALUES
('ECONOMY'),
('BUSINESS'),
('FIRST');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Airlines`
--
ALTER TABLE `Airlines`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `Airports`
--
ALTER TABLE `Airports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`AccountNumber`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `FlightLegs`
--
ALTER TABLE `FlightLegs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `departureAirport` (`departureAirport`),
  ADD KEY `arrivalAirport` (`arrivalAirport`);

--
-- Indexes for table `Flights`
--
ALTER TABLE `Flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline` (`airline`);

--
-- Indexes for table `LegsSeatsTaken`
--
ALTER TABLE `LegsSeatsTaken`
  ADD KEY `FlightLeg_id` (`FlightLeg_id`);

--
-- Indexes for table `Meals`
--
ALTER TABLE `Meals`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id` (`person_id`),
  ADD UNIQUE KEY `person_id_2` (`person_id`),
  ADD KEY `meal_preference` (`meal_preference`),
  ADD KEY `travel_class` (`travel_class`),
  ADD KEY `reservations_id` (`reservations_id`);

--
-- Indexes for table `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailAddress` (`emailAddress`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `employee_id_2` (`employee_id`),
  ADD KEY `customer_id_2` (`customer_id`);

--
-- Indexes for table `ReservationLegs`
--
ALTER TABLE `ReservationLegs`
  ADD PRIMARY KEY (`reservation_id`,`legs_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `legs_id` (`legs_id`),
  ADD KEY `legNum` (`legNum`);

--
-- Indexes for table `ReservationPassenger`
--
ALTER TABLE `ReservationPassenger`
  ADD PRIMARY KEY (`reservation_id`,`passengers_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `passengers_id` (`passengers_id`);

--
-- Indexes for table `ReverseAuction`
--
ALTER TABLE `ReverseAuction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_id` (`reservations_id`),
  ADD KEY `legNum` (`legNum`);

--
-- Indexes for table `TravelClass`
--
ALTER TABLE `TravelClass`
  ADD PRIMARY KEY (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Airports`
--
ALTER TABLE `Airports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `AccountNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `FlightLegs`
--
ALTER TABLE `FlightLegs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Flights`
--
ALTER TABLE `Flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Passenger`
--
ALTER TABLE `Passenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Person`
--
ALTER TABLE `Person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ReverseAuction`
--
ALTER TABLE `ReverseAuction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customers`
--
ALTER TABLE `Customers`
  ADD CONSTRAINT `Cperson_id_ON_Pid` FOREIGN KEY (`person_id`) REFERENCES `Person` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `Eperson_id_ON_Pid` FOREIGN KEY (`person_id`) REFERENCES `Person` (`id`);

--
-- Constraints for table `FlightLegs`
--
ALTER TABLE `FlightLegs`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`flight_id`) REFERENCES `Flights` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`departureAirport`) REFERENCES `Airports` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`arrivalAirport`) REFERENCES `Airports` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `LegsSeatsTaken`
--
ALTER TABLE `LegsSeatsTaken`
  ADD CONSTRAINT `ff1` FOREIGN KEY (`FlightLeg_id`) REFERENCES `FlightLegs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD CONSTRAINT `Pfk2` FOREIGN KEY (`meal_preference`) REFERENCES `Meals` (`Name`),
  ADD CONSTRAINT `R1` FOREIGN KEY (`travel_class`) REFERENCES `TravelClass` (`Name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `person_id_on_Pid` FOREIGN KEY (`person_id`) REFERENCES `Person` (`id`),
  ADD CONSTRAINT `reservations_fk` FOREIGN KEY (`reservations_id`) REFERENCES `Reservation` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `R2` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`AccountNumber`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ReservationLegs`
--
ALTER TABLE `ReservationLegs`
  ADD CONSTRAINT `RL1` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `RL2` FOREIGN KEY (`legs_id`) REFERENCES `FlightLegs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ReservationPassenger`
--
ALTER TABLE `ReservationPassenger`
  ADD CONSTRAINT `RP_passenger_id` FOREIGN KEY (`passengers_id`) REFERENCES `Passenger` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `RP_reservations_id` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ReverseAuction`
--
ALTER TABLE `ReverseAuction`
  ADD CONSTRAINT `ff` FOREIGN KEY (`reservations_id`) REFERENCES `Reservation` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
