CREATE PROCEDURE searchFlights_oneStop(IN source_id INT, IN dest_id INT , IN date_d DATE)
  BEGIN
    SELECT * FROM FlightLegs F1, FlightLegs F2
    WHERE F1.arrivalAirport = F2.departureAirport AND
          F2.arrivalAirport = dest_id AND f1.departureAirport =source_id
          AND  Date(F1.dept_timestamp) = date_d
          AND F1.arrv_timestamp <  F2.dept_timestamp;
  END;