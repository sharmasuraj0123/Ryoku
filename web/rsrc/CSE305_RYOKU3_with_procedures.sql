-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2017 at 12:52 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CSE305_RYOKU`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`pranav`@`%` PROCEDURE `addCustomer` (IN `firstName` VARCHAR(20), `lastNmae` VARCHAR(20), `address` VARCHAR(50), `city` VARCHAR(20), `state` CHAR(2), `zipCode` INT(5), `phone` BIGINT(10), `email` VARCHAR(20), `date_d` DATETIME, `creditCardNum` BIGINT(16), `rating` DOUBLE)  BEGIN
	INSERT INTO Person VALUES
		(NULL, firstName, lastNmae, address, city , state, zipCode, phone);
	SET @last_id = LAST_INSERT_ID();
	INSERT INTO Customers VALUES
		(NULL, @last_id, email, date_d , creditCardNum, rating);
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `addEmployee` (IN `firstName` VARCHAR(20), `lastName` VARCHAR(20), `address` VARCHAR(50), `city` VARCHAR(20), `state` CHAR(2), `zipCode` INT(5), `phone` BIGINT(10), `SSN` INT, `startDate` DATETIME, `hourPay` DOUBLE, `manager` TINYINT(1), `rating` DOUBLE)  BEGIN
  INSERT
INTO
  `Person`(
    `id`,
    `FirstName`,
    `LastName`,
    `Address`,
    `City_Town`,
    `State`,
    `ZipCode`,
    `Phone`
  )
VALUES(
  NULL,
  firstName,
  lastName,
  address,
  city,
  state,
  zipCode,
  Phone
) ;
SET
  @person_id = LAST_INSERT_ID() ;
INSERT
INTO
  `Employees`(
    `EmployeeID`,
    `person_id`,
    `SSN`,
    `StartDate`,
    `HourlyPay`,
    `isManager`,
    `Rating`
  )
VALUES(
  NULL,
  @person_id,
  SSN,
  startDate,
  hourPay,
  manager,
  rating
) ;
  END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `addPassenger` (`reservation_id` INT, `mealPref` VARCHAR(20), `travelClass` ENUM('ECONOMY','BUSINESS','FIRST'), `seatPref` VARCHAR(20), `seatNum` CHAR(4), `firstName` VARCHAR(20), `lastNmae` VARCHAR(20), `address` VARCHAR(50), `city` VARCHAR(20), `state` CHAR(2), `zipCode` INT(5), `phone` BIGINT(10))  BEGIN
INSERT INTO `Person`(`id`, `FirstName`, `LastName`, `Address`, `City_Town`, `State`, `ZipCode`, `Phone`) VALUES (NULL, firstName, lastName, address, city, state, zipCode, Phone); 
SET @person_id = LAST_INSERT_ID();
INSERT INTO Passenger VALUES (NULL, @last_id, reservation_id, mealPref, travelClass , seatPref, seatNum);
SET @last_passenger_id = LAST_INSERT_ID();
UPDATE `Reservation` SET NumberOfPassengers = NumberOfPassengers+1 WHERE `Reservation`.`id` = @last_id;
INSERT INTO `ReservationPassenger` VALUES (@last_id, @last_passenger_id);

END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `addReservation` (IN `cust_id` INT, `date` DATE, `fare` DOUBLE, `book_fee` DOUBLE, `employee_id` INT, `rest` VARCHAR(20), `length_stay` INT, `advPurchase` INT)  BEGIN
INSERT INTO `Reservation`(`id`, `customer_id`, `date`, `total_fare`, `booking_fee`, `employee_id`, `fare_restrictions`, `lengthOfStay`, `advancePurchase` ) 
	VALUES (NULL, cust_id, date, fare, book_fee, employee_id, rest, length_stay, advPurchase );
	SET @reservation_id = LAST_INSERT_ID();
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `addReservationLeg` (`reservation_id` INT, `leg_Id` INT, `leg_Num` INT)  BEGIN
	INSERT INTO `ReservationLegs`(`reservation_id`, `legs_id`, `legNum` ) 
		VALUES (reservation_id, leg_Id, leg_Num ); 
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `deleteCustomer` (IN `custId` INT, `personId` INT)  BEGIN
	DELETE FROM `Customers` WHERE `Customers`.`AccountNumber` = custId;
	DELETE FROM `Person` WHERE `id` = personId;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `deleteEmployee` (IN `empID` INT)  BEGIN
	DELETE FROM `Employees` WHERE `EmployeeID` = 'empID';
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `editCustomer` (IN `firstName` VARCHAR(20), `lastNmae` VARCHAR(20), `address` VARCHAR(50), `city` VARCHAR(20), `state` CHAR(2), `zipCode` INT(5), `phone` BIGINT(10), `email` VARCHAR(20), `date_d` DATETIME, `creditCardNum` BIGINT(16), `rating` DOUBLE, `personId` INT, `custId` INT)  BEGIN
	UPDATE `Person` SET `FirstName` = firstName, `LastName` = lastNmae, `Address` = address,
		`Town_City` = city, `State` = state, `ZipCode` = zipCode, `Phone` = phone
	WHERE `Person`.`id` = personId;
	
	UPDATE `Customers` SET `EmailAddress` = email, `AccountCreationDate` = date_d, 
		`CreditCardNumber` = creditCardNum, `Rating` = rating
	WHERE `Customers`.`AccountNumber` = custId;

END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `editEmployee` (IN `empID` INT, `SSN` INT, `startDate` DATETIME, `hourPay` DOUBLE, `manager` TINYINT(1), `rating` DOUBLE)  BEGIN
	UPDATE `Employees` SET `SSN` = SSN, `StartDate` = startDate, `HourlyPay` = hourPay , 
             `isManager` = manager, `Rating` = rating
	WHERE `EmployeeID` = 'empID';
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `generateMailingList` ()  BEGIN
	SELECT Concat(FirstName, ' ', LastName) AS Name, EmailAddress 
FROM Person P, Customers C 
WHERE C.person_id = P.id;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getBestSellerFlight` ()  BEGIN
	SELECT Concat (F.airline, ' ', F.Flight_number) AS 'Flight', SUM(R.numberOfPassengers) AS 'Passengers' 
	FROM `Flights` F, `FlightLegs` L, `Reservation` R, `ReservationLegs` RL 
	WHERE R.id = RL.reservation_id AND RL.legs_id = L.id AND F.id = L.flight_id
	GROUP BY F.id
	ORDER BY SUM(R.numberOfPassengers) DESC;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getBidHistoryOnLeg` (IN `legNum` INT)  BEGIN
	SELECT 
	    CONCAT(`FirstName`, ' ' , `LastName`) AS Name,
	    R.id AS 'Reservation Number', R.total_fare AS 'Fare', 
	    RA.bid AS 'Bid', RL.legs_id, RA.approved
	FROM 
		`Person` P, `Customers` C, `Reservation` R, 
		`ReverseAuction` RA, `ReservationLegs` RL 
	WHERE
	    C.person_id = P.id AND
	    R.customer_id = C.AccountNumber AND 
	    RA.reservations_id = R.id AND 
	    RL.reservation_id = R.id AND 
	    RA.legNum = legNum;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getBidsByCustomerId` (IN `custId` INT)  BEGIN
SELECT 
    CONCAT(`FirstName`, ' ' , `LastName`) AS Name,
    R.id AS 'Reservation Number', R.total_fare AS 'Fare', 
    RA.bid AS 'Bid', RL.legs_id, RA.approved
FROM 
	`Person` P, `Customers` C, `Reservation` R, 
	`ReverseAuction` RA, `ReservationLegs` RL 
WHERE
    C.person_id = P.id AND
    R.customer_id = C.AccountNumber AND 
    RA.reservations_id = R.id AND 
    RL.reservation_id = R.id AND 
    C.AccountNumber = custId;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getCurrentReservationOfACustomer` (IN `customer_id_in` INT(11))  BEGIN
SELECT
  `R.id`,
  `R.customer_id`,
  `R.NumberOfPassengers`,
  `R.date`,
  `R.total_fare`,
  `R.booking_fee`,
  `R.fare_restrictions`,
  `R.lengthOfStay`
FROM
  Reservation R
WHERE
  R.customer_id = customer_id_in
ORDER BY
  R.date DESC;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getCurrentReservationOfAFlight` (IN `leg_id_in` INT(11))  BEGIN
	
SELECT P.FirstName, P.LastName, R.id AS Reservation_Number, PS.seat_number, PS.seat_preference
FROM Reservation R, ReservationLegs RL, ReservationPassenger RP, Passenger PS, Person P
WHERE RL.legs_id = leg_id_in
	AND RL.reservation_id = R.id
    AND R.id = RP.reservation_id
    AND RP.passengers_id = PS.id
    AND PS.person_id = P.id;
    
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightsAtAirport` (IN `airportId` INT)  BEGIN
	SELECT F.airline, F.Flight_number, L.stopNum,A1.name AS DepartureAirport , A2.name AS ArrivalAirport, 
L.dept_timestamp, L.arrv_timestamp, F.days_Op from FLIGHTS F, FLIGHTLEGS L , AIRPORTS A1, AIRPORTS A2
	WHERE  	L.flight_id = F.id AND
			(L.departureAirport = A1.id AND L.arrivalAirport = A2.id) AND
 			(A1.id = airportId OR A2.id = airportId);
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightsBetween` (IN `dept_airport_id` INT, `arrival_airport_id` INT, `date_d` DATE)  BEGIN
	SELECT
		F.airline, F.flight_number, F.base_fare, F.days_Op, A.name, A2.name
	FROM
	  `Airports` A, `Airports` A2, `FlightLegs` FL, `FlightLegs` FL2, `Flights` F
	WHERE
	  A.id = FL.departureAirport AND A.id = dept_airport_id AND 
	  A2.id = FL2.arrivalAirport AND A2.id = arrival_airport_id AND 
	  FL.flight_id = FL2.flight_id AND F.id = FL.flight_id AND
	  FL.dept_timestamp <  FL2.arrv_timestamp AND 
          Date(FL.dept_timestamp) = date_d
	;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightsBetweenWithFlexibleDates` (IN `dept_airport_id` INT, `arrival_airport_id` INT, `DATE` DATE)  BEGIN
SELECT
  F.airline,
  F.flight_number,
  F.base_fare,
  F.days_Op,
  A.name,
  A2.name
FROM
  `Airports` A,
  `Airports` A2,
  `FlightLegs` FL,
  `FlightLegs` FL2,
  `Flights` F
WHERE
  A.id = FL.departureAirport AND A.id = dept_airport_id AND A2.id = FL2.arrivalAirport AND A2.id = arrival_airport_id AND FL.flight_id = FL2.flight_id AND F.id = FL.flight_id AND FL.dept_timestamp < FL2.arrv_timestamp AND DATE(FL.dept_timestamp) <= DATE_ADD(date_d,
  INTERVAL 3 DAY) AND DATE(FL.dept_timestamp) >= DATE_SUB(date_d,
  INTERVAL 3 DAY);
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightsDomesticOnly` (IN `dept_airport_id` INT, `arrival_airport_id` INT, `date` DATE)  BEGIN
	SELECT
		F.airline, F.flight_number, F.base_fare, F.days_Op, A.name, A2.name
	FROM
	  `Airports` A, `Airports` A2, `FlightLegs` FL, `FlightLegs` FL2, `Flights` F
	WHERE
	  A.id = FL.departureAirport AND A.id = dept_airport_id AND 
	  A2.id = FL2.arrivalAirport AND A2.id = arrival_airport_id AND 
	  FL.flight_id = FL2.flight_id AND F.id = FL.flight_id AND
	  FL.dept_timestamp <  FL2.arrv_timestamp AND 
          Date(FL.dept_timestamp) = date_d AND
          A.country = 'United States of America' AND
          A2.country = 'United States of America'
	;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightsOnTime` ()  BEGIN
	SELECT F.airline, F.Flight_number, A1.name AS 'Departs From', A2.name AS 'Arrives At', L.dept_timestamp, L.arrv_timestamp 
FROM FLIGHTS F, FLIGHTLEGS L , Airports A1, Airports A2 
WHERE  L.flight_id = F.id AND A1.id = L.departureAirport 
AND A2.id = L.arrivalAirport 
AND (L.dept_timestamp = L.departure_status AND L.arrv_timestamp = L.arrival_status);

END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightsThatAreDelayed` ()  BEGIN
	
	SELECT F.airline, F.Flight_number, A1.name AS 'Departs From', A2.name AS 'Arrives At', L.departure_status, L.arrival_status 
FROM FLIGHTS F, FLIGHTLEGS L , Airports A1, Airports A2 
WHERE  L.flight_id = F.id AND A1.id = L.departureAirport 
AND A2.id = L.arrivalAirport 
AND (L.dept_timestamp < L.departure_status OR L.arrv_timestamp < L.arrival_status);

END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getFlightSuggestionsForCustomer` (IN `custId` INT)  BEGIN
SELECT F.airline, F.Flight_number,A1.name AS DepartureAirport , A2.name AS ArrivalAirport, L.dept_timestamp, L.arrv_timestamp, F.days_Op from `Flights` F, `FlightLegs` L , `Airports` A1, `Airports` A2, `Customers` C, `Reservation` R , `ReservationLegs` RL
	
WHERE 	L.flight_id = F.id AND 
		(L.departureAirport = A1.id AND L.arrivalAirport = A2.id) AND 
		R.id = RL.reservation_id AND 
		RL.legs_id = L.id AND 
		C.AccountNumber = R.customer_id AND 
		C.AccountNumber = custId;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getIternaryOFACustomer` (IN `customer_id_in` INT(11))  BEGIN

SELECT PS.reservations_id AS Reservation_Number, P.FirstName, P.LastName, PS.seat_number, PS.seat_preference, F.airline, F.flight_number, A1.name AS Departure_Airport, A2.name AS Arrival_Airport
FROM Reservation R, ReservationPassenger RP, Passenger PS, Person P, ReservationLegs RL, FlightLegs FL, Flights F, Airports A1, Airports A2
WHERE R.customer_id = customer_id_in
	AND RP.reservation_id = R.id
    AND RP.passengers_id = PS.id
    AND PS.person_id = P.id
    AND RL.reservation_id = R.id
    AND FL.id = RL.legs_id
    AND FL.id = F.id
    AND FL.departureAirport = A1.id
    AND FL.arrivalAirport = A2.id ;    
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getMostActiveFlight` ()  BEGIN
	SELECT CONCAT (F.airline, F.Flight_number), BIT_COUNT(F.days_Op) AS 'Days Operated in week' 
        FROM Flights 
        ORDER BY BIT_COUNT(F.days_Op) DESC;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getMostSalesByCustomer` ()  BEGIN
	SELECT P.FirstName, P.LastName, P.Phone, SUM(R.total_fare) AS total_sales_made
	FROM Reservation R, Customers C, Person P
	WHERE R.customer_id = C.AccountNumber AND P.id = C.person_id
	GROUP BY R.customer_id
	ORDER BY total_sales_made DESC
	LIMIT 1;

END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getMultiCityFlightsBetween` (IN `airport_id1` INT, `airport_id2` INT, `airport_id3` INT, `date_1` DATE, `date_2` DATE)  BEGIN
	SELECT
		F.airline, F.flight_number, F.base_fare, F.days_Op, A.name, A2.name, FL.dept_timestamp
	FROM
	  `Airports` A, `Airports` A2, `FlightLegs` FL, `FlightLegs` FL2, `Flights` F,
          `Airports` A3, `Airports` A4, `FlightLegs` FL3, `FlightLegs` FL4, `Flights` F2
        	WHERE
	  A.id = FL.departureAirport AND A.id = airport_id1 AND 
	  A2.id = FL2.arrivalAirport AND A2.id = airport_id2 AND
	  A3.id = FL3.departureAirport AND A3.id = airport_id2 AND 
	  A4.id = FL4.arrivalAirport AND A4.id = airport_id3 AND 
	  
	  FL.flight_id = FL2.flight_id AND F.id = FL.flight_id AND
	  FL3.flight_id = FL4.flight_id AND F3.id = FL3.flight_id AND
	  FL.dept_timestamp <  FL2.arrv_timestamp AND
	  FL3.dept_timestamp <  FL4.arrv_timestamp AND 
          Date(FL.dept_timestamp) = date_1 AND 
          Date(FL3.dept_timestamp) = date_2
	;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getPassengersOfAFlight` (IN `flight_id_in` INT(11))  BEGIN	
	SELECT P.FirstName, P.LastName, P.id
	FROM Reservation R, ReservationLegs RL, FlightLegs FL, Person P, Passenger PS, ReservationPassenger RP
	WHERE FL.flight_id = flight_id_in
		AND RL.legs_id = FL.flight_id
	    	AND R.id = RL.reservation_id
	    	AND RP.reservation_id = R.id
    		AND RP.passengers_id = PS.id
    		AND P.id = PS.person_id
	GROUP BY PS.person_id ;
    
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getReservationsByACustomer` (IN `customer_account_number` INT(11))  BEGIN	
     SELECT * FROM Reservation R where R.customer_id = customer_account_number;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getReturnFlightsBetween` (IN `dept_airport_id` INT, `arrival_airport_id` INT, `date_d` DATE, `date_r` DATE)  BEGIN
	SELECT
		F.airline, F.flight_number, F.base_fare, F.days_Op, A.name, A2.name
	FROM
	  `Airports` A, `Airports` A2, `FlightLegs` FL, `FlightLegs` FL2, `Flights` F,
          `Airports` A3, `Airports` A4, `FlightLegs` FL3, `FlightLegs` FL4, `Flights` F2
	WHERE
	  A.id = FL.departureAirport AND A.id = dept_airport_id AND 
	  A2.id = FL2.arrivalAirport AND A2.id = arrival_airport_id AND
	  A3.id = FL3.arrivalAirport AND A3.id = arrival_airport_id AND 
	  A4.id = FL4.departureAirport AND A4.id = dept_airport_id AND 
	  FL.flight_id = FL2.flight_id AND F.id = FL.flight_id AND
	  FL3.flight_id = FL4.flight_id AND F3.id = FL3.flight_id AND
	  FL.dept_timestamp <  FL2.arrv_timestamp AND
	  FL3.dept_timestamp <  FL4.arrv_timestamp AND 
          Date(FL.dept_timestamp) = date_d AND 
          Date(FL3.dept_timestamp) = date_r
	;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getRevenueByACustomer` (IN `customer_id_in` INT(11))  BEGIN
SELECT R.customer_id, SUM(R.total_fare) AS Total_Revenue_Generated, COUNT(R.id) AS Times_Flights_Booked
FROM Reservation R 
WHERE R.customer_id = customer_id_in    ;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getRevenueByAirport` (IN `airportId` INT)  BEGIN
	SELECT A.name, SUM(FL.base_fare * P.travel_class) FROM `FlightLegs` FL, `ReservationLegs` RL, `TravelClass` TC , `Reservation` R, `Passenger` P, `Airports` A , ReservationPassenger RP
	WHERE R.id = RL.reservation_id AND RL.legs_id = FL.id
	AND A.id = airportId AND
	RP.passengers_id = P.id AND RP.reservation_id = R.id AND
	TC.Name = P.travel_class AND
	(A.id = FL.departureAirport OR A.id = FL.arrivalAirport);


END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getRevenueByCity` (IN `cityName` VARCHAR(20))  BEGIN
	SELECT A.name, SUM(FL.base_fare * P.travel_class) AS Revenue_Generated
       FROM `FlightLegs` FL, `ReservationLegs` RL, `TravelClass` TC , `Reservation` R, `Passenger` P, `Airports` A , ReservationPassenger RP
	WHERE R.id = RL.reservation_id AND RL.legs_id = FL.id
	AND A.city = cityName AND
	RP.passengers_id = P.id AND RP.reservation_id = R.id AND
	TC.Name = P.travel_class AND
	(A.id = FL.departureAirport OR A.id = FL.arrivalAirport);

END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getRevenueByFlight` (IN `flightId` INT)  BEGIN
	SELECT F.airline,F.flight_number, SUM(FL.base_fare * P.travel_class) 
	FROM `FlightLegs` FL, `ReservationLegs` RL, `TravelClass` TC , `Reservation` R, 
`Passenger` P,  `Flights` F , `ReservationPassenger` RP
	WHERE R.id = RL.reservation_id AND RL.legs_id = FL.id
	AND F.id = flightId AND
	RP.passengers_id = P.id AND RP.reservation_id = R.id AND
	TC.Name = P.travel_class AND
	F.id = FL.flight_id;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `getSalesReportOfAMonth` (IN `month_in` INT, `year_in` INT)  BEGIN
        SELECT CONCAT (`firstName`, `lastName`) AS EmployeeName, `total_fare`, `booking_fee`   
        FROM Reservation R, Employee E, Person P
        WHERE month(Rdate) = month_in and YEAR(R.date) = year_in AND 
        R.employee_id = E.id AND E.person_id = P.id;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `listAllFlights` ()  BEGIN
	SELECT 	F.airline, F.Flight_number, L.stopNo,  L.stopNum,A1.name AS DepartureAirport,
		A2.name AS ArrivalAirport, L.dept_timestamp, L.arrv_timestamp, F.days_Op
	FROM FLIGHTS F, FLIGHTLEGS L, AIRPORTS A1, AIRPORTS A2
	WHERE L.flight_id = F.id AND L.departureAirport = A1.id AND L.arrivalAirport = A2.id;
END$$

CREATE DEFINER=`pranav`@`%` PROCEDURE `listMostSalesByCustRep` ()  BEGIN
	SELECT P.FirstName, P.LastName, P.Phone, SUM(R.total_fare) AS total_sales_made
	FROM Reservation R, Employees E, Person P
	WHERE R.Employee_id = E.EmployeeID AND P.id = E.person_id
	GROUP BY R.employee_id
	ORDER BY total_sales_made DESC
	LIMIT 1;
END$$

DELIMITER ;

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
  `EmailAddress` varchar(255) NOT NULL,
  `AccountCreationDate` datetime NOT NULL,
  `CreditCardNumber` bigint(16) NOT NULL,
  `Ratings` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`AccountNumber`, `person_id`, `EmailAddress`, `AccountCreationDate`, `CreditCardNumber`, `Ratings`) VALUES
(1, 1, 'pranav.sethi@stonybrook.edu', '2017-10-23 00:00:00', 1234123412341234, 9.9),
(2, 2, 'adi.edi@gmail.com', '2017-10-23 00:00:00', 4331123412344321, 9.9),
(3, 8, 'awesomejane@ftw.com', '2017-10-23 00:00:00', 1234123412341234, 5),
(4, 9, 'jdoe@woot.com', '2017-10-23 00:00:00', 1234123412341234, 5),
(5, 10, 'rickroller@rolld.com', '2017-10-23 00:00:00', 1234123412341234, 5);

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
(7, 7, '0987654321', '2017-10-24 00:47:01', 10.00, 0, 9.9);

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
(1, 1, 6, 9, '2011-01-05 11:00:00', '2011-01-05 09:00:00', '400', 600, 1, '2017-10-25 00:00:00', '2017-10-25 00:00:00'),
(2, 1, 9, 11, '2011-01-05 17:00:00', '2011-01-05 19:00:00', '600', 200, 2, '2017-10-25 00:00:00', '2017-10-25 00:00:00'),
(3, 1, 11, 9, '2011-01-06 10:00:00', '2011-01-06 07:30:00', '1000', 800, 3, '2017-10-25 00:00:00', '2017-10-25 00:00:00'),
(4, 2, 10, 7, '2011-01-10 14:00:00', '2011-01-10 12:00:00', '750', 600, 1, '2011-01-10 14:00:00', '2011-01-10 13:00:00'),
(5, 2, 7, 8, '2011-01-10 22:30:00', '2011-01-10 19:30:00', '1200', 1000, 2, '2011-01-10 22:30:00', '2011-01-10 19:30:00'),
(6, 2, 8, 10, '2011-01-11 08:00:00', '2011-01-11 05:00:00', '1200', 1000, 3, '2017-10-25 07:00:00', '2011-01-11 07:00:00'),
(7, 3, 5, 4, '2011-01-13 07:00:00', '2011-01-13 05:00:00', '600', 450, 1, '2017-10-25 04:20:00', '2011-01-13 05:00:00'),
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
  `Address` varchar(50) NOT NULL,
  `City_Town` varchar(20) NOT NULL,
  `State` char(2) NOT NULL,
  `ZipCode` int(5) NOT NULL,
  `Phone` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`id`, `FirstName`, `LastName`, `Address`, `City_Town`, `State`, `ZipCode`, `Phone`) VALUES
(1, 'Pranav', 'Sethi', '300 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(2, 'Aditya', 'Potdar', '450 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(3, 'Suraj', 'Sharma', '100 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(4, 'Pranav2', 'Sethi2', '300 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(5, 'Aditya2', 'Potdar2', '450 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(6, 'Suraj2', 'Sharma2', '100 Circle Rd', 'Stony Brook', 'NY', 11790, 1234567890),
(7, 'John', 'Doe', '1 Street', 'New York', 'NY', 11700, 9999999999),
(8, 'Jane', 'Smith', '100 Nicolls Rd', 'Stony Brook', 'NY', 17790, 5555555555),
(9, 'John', 'Doee', '123 N Fake Street', 'New York', 'NY', 10001, 1231231234),
(10, 'Rick ', 'Astley', '1337 Internet Lane', 'Los Angelles', 'CA', 90001, 3141592653),
(13, 'new', 'Doe', '1 Street', 'New York', 'NY', 11700, 3999999999);

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
(2, 1, '400', 1, 1),
(3, 1, '450', 1, NULL);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `AccountNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ReverseAuction`
--
ALTER TABLE `ReverseAuction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
