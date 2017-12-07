CREATE PROCEDURE searchFlights_direct(IN source_id INT, IN dest_id INT , IN date_d DATE)
  BEGIN
    SELECT * FROM FlightLegs F
    WHERE F.departureAirport = source_id AND F.arrivalAirport = dest_id
    AND  Date(F.dept_timestamp) = date_d
    AND FL.dept_timestamp <  FL2.arrv_timestamp;
  END;
