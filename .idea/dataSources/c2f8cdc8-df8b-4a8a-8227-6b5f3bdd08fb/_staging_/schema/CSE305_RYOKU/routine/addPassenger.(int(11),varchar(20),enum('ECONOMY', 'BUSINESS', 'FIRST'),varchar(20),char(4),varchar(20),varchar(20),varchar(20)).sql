CREATE PROCEDURE addPassenger(IN reservation_id INT, IN mealPref VARCHAR(256),
                              IN travelClass    ENUM ('ECONOMY', 'BUSINESS', 'FIRST'), IN seatPref VARCHAR(20),
                              IN seatNum        CHAR(4), IN firstName VARCHAR(20), IN lastName VARCHAR(20),
                              IN data           VARCHAR(256))
  BEGIN
    INSERT INTO Person VALUES (NULL,firstName, lastName, data, "", "", "" ,"NA", 1, 0000000000);
    SET @person_id = LAST_INSERT_ID();
    INSERT INTO Passenger VALUES (NULL, @person_id, reservation_id, mealPref, travelClass , seatPref, seatNum);
    SET @last_passenger_id = LAST_INSERT_ID();
    UPDATE `Reservation` SET NumberOfPassengers = NumberOfPassengers+1 WHERE `Reservation`.`id` = @last_passenger_id;
    INSERT INTO `ReservationPassenger` VALUES (reservation_id, @last_passenger_id);

    END;
