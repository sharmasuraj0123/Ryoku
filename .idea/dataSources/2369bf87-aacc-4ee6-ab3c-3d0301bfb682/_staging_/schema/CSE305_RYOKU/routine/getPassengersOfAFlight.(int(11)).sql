CREATE PROCEDURE getPassengersOfAFlight(
  IN flight_id_in int(11)
)
  BEGIN
    SELECT P.FirstName, P.LastName, P.id , PS.seat_number
    FROM Reservation R, ReservationLegs RL, FlightLegs FL, Person P, Passenger PS, ReservationPassenger RP
    WHERE FL.flight_id = flight_id_in
          AND RL.legs_id = FL.flight_id
          AND R.id = RL.reservation_id
          AND RP.reservation_id = R.id
          AND RP.passengers_id = PS.id
          AND P.id = PS.person_id
    GROUP BY PS.person_id ;

  END ;