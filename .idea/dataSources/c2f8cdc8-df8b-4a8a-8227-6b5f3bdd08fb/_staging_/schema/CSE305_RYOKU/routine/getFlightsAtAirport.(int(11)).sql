CREATE PROCEDURE getFlightsAtAirport(IN airportId INT)
  BEGIN
    SELECT F.airline, F.Flight_number, L.stopNum,A1.name AS DepartureAirport , A2.name AS ArrivalAirport,
      L.dept_timestamp, L.arrv_timestamp, F.days_Op from FLIGHTS F, FLIGHTLEGS L , AIRPORTS A1, AIRPORTS A2
    WHERE  	L.flight_id = F.id AND
             (L.departureAirport = A1.id AND L.arrivalAirport = A2.id) AND
             (A1.id = airportId OR A2.id = airportId);
    END;


