CREATE PROCEDURE addEmployee(
	IN firstName VARCHAR(20), lastName VARCHAR(20), address VARCHAR(50), city VARCHAR(20), state CHAR(2), zipCode INT(5), phone BIGINT(10), SSN INT, startDate DATETIME, hourPay DOUBLE, manager tinyint(1), rating DOUBLE
)
	BEGIN
		INSERT INTO `Person`(`id`, `FirstName`, `LastName`, `Address`, `City_Town`, `State`, `ZipCode`, `Phone`)
		VALUES (NULL, firstName, lastName, address, city, state, zipCode, Phone);

		SET @person_id = LAST_INSERT_ID();

		INSERT INTO `Employees`(EmployeeID, person_id, SSN, StartDate, HourlyPay , isManager, Rating)
		VALUES (NULL, @person_id, SSN, startDate, hourPay, manager, rating);

	END;
