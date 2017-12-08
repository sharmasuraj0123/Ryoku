CREATE PROCEDURE addReservation(IN cust_id            INT, IN date DATE, IN fare DOUBLE, IN book_fee DOUBLE,
                                IN employee_id        INT, IN rest VARCHAR(20), IN length_stay INT, IN advPurchase INT,
                                IN numberofPassengers INT , INOUT r_id INT)
  BEGIN
    INSERT INTO `Reservation`(`id`, `customer_id`,NumberOfPassengers, `date`, `total_fare`, `booking_fee`, `employee_id`, `fare_restrictions`, `lengthOfStay`, `advancePurchase` )
    VALUES (NULL, cust_id,numberofPassengers, date, fare, book_fee, employee_id, rest, length_stay, advPurchase );
    SET r_id = LAST_INSERT_ID();
  END;
