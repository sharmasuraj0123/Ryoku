CREATE PROCEDURE editEmployee( IN firstName VARCHAR(20), IN lastName VARCHAR(20),
                               IN email  VARCHAR(50), IN address VARCHAR(50), IN password VARCHAR(50),
                               IN city   VARCHAR(20), IN state CHAR(2), IN zipCode INT(5), IN phone BIGINT(10),
                               IN SSN    INT, IN startDate DATETIME, IN hourPay DOUBLE, IN manager TINYINT(1),
                               IN rating DOUBLE, IN empId  INT, IN personId INT)
  BEGIN
    UPDATE `Person` SET `FirstName` = firstName, `LastName` = lastName,emailAddress = email, password = password , Address = address,
      `City_Town` = city, `State` = state, `ZipCode` = zipCode, `Phone` = phone
    WHERE `Person`.`id` = personId;

    UPDATE `Employees` SET `SSN` = SSN, `StartDate` = startDate, `HourlyPay` = hourPay ,
      `isManager` = manager, `Rating` = rating
    WHERE `EmployeeID` = 'empID';

  END;
