import java.sql.*;
import java.util.ArrayList;
//import java.util.Date;

public class CustomerLevelTransaction {



    public static Customer getCustomer(int p_id) throws SQLException, ClassNotFoundException{
            Customer current_customer = null;
            Connection conn = ConnectionUtils.getConnection();
            ResultSet rs = null;
            CallableStatement cStmt = conn.prepareCall("{call getCustomer(?)}");

            cStmt.setInt(1,p_id);
            boolean hadResults = cStmt.execute();
            rs = cStmt.getResultSet();
        if(hadResults)
            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("FirstName");
                String lastName= rs.getString("LastName");
                String email= rs.getString("emailAddress");
                String password= rs.getString("password");
                String address= rs.getString("address");
                String city= rs.getString("City_town");
                String state= rs.getString("State");
                int zipCode = rs.getInt("ZipCode");
                long phoneNumber = rs.getLong("Phone");
                int accountNumber = rs.getInt("AccountNumber");
                Timestamp dateCreated = rs.getTimestamp("AccountCreationDate");
                long creditCardNumber = rs.getLong("CreditCardNumber");
                double ratings = rs.getDouble("Ratings");


                current_customer = new Customer(id,firstName,lastName,email,password,
                        address,city,state,zipCode,phoneNumber,accountNumber,
                        dateCreated,creditCardNumber,ratings);

            }

            conn.close();
            return current_customer;
    }


    /**
     *
     * @param source
     * @param dest
     *
     * @return
     * This method is to return the Flight Search Blocks between Source Airport and destination.
     * It Searches in three steps First the direct Then one Stop and Then 2 Stops.
     */
    public static ArrayList<FlightSearch> searchFlights (int source, int dest , Date date)throws SQLException, ClassNotFoundException{

        ArrayList<FlightSearch> fs = new ArrayList<>();
        FlightSearch flightBlock;
        Flight newflight;

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;


        //Execute The Statement For direct Flights
        CallableStatement cStmt = conn.prepareCall("{call searchFlights_direct(?,?,?)}");
        cStmt.setInt(1,source);
        cStmt.setInt(2,dest);
        cStmt.setDate(3, (java.sql.Date) date);
        boolean hadResults = cStmt.execute();

        rs = cStmt.getResultSet();
        if(hadResults)
            while (rs.next()) {

                flightBlock = new FlightSearch();

                int leg_id = rs.getInt("id");
                int flight_id = rs.getInt("flight_id");
                int departureAirport = rs.getInt("departureAirport");
                int arrivalAirport = rs.getInt("arrivalAirport");
                Timestamp dept_timestamp = rs.getTimestamp("dept_timestamp");
                Timestamp arrv_timestamp = rs.getTimestamp("arrv_timestamp");
                int base_fare = rs.getInt("base_fare");
                int hidden_fare = rs.getInt("hidden_fare");
                int stopNum = rs.getInt("stopNum");

                newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                        leg_id,base_fare,hidden_fare);

                flightBlock.addFlight(newflight);
                flightBlock.setPrice(base_fare);
                fs.add(flightBlock);
            }


        //Execute The Statement For two Flights
        CallableStatement cStmt2 = conn.prepareCall("{call searchFlights_oneStop(?,?,?)}");
        cStmt2.setInt(1,source);
        cStmt2.setInt(2,dest);
        cStmt2.setDate(3, (java.sql.Date) date);
        hadResults = cStmt2.execute();
        rs = cStmt2.getResultSet();
        if(hadResults)
            while (rs.next()) {

                flightBlock = new FlightSearch();

                //Add First Flight & The Base Fare
                int leg_id = rs.getInt(1);
                int flight_id = rs.getInt(2);
                int departureAirport = rs.getInt(3);
                int arrivalAirport = rs.getInt(4);
                Timestamp dept_timestamp = rs.getTimestamp(5);
                Timestamp arrv_timestamp = rs.getTimestamp(6);
                int base_fare = rs.getInt(7);
                int hidden_fare = rs.getInt(8);
                int stopNum = rs.getInt(9);
                newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                        leg_id,base_fare,hidden_fare);
                flightBlock.addFlight(newflight);
                flightBlock.addPrice(base_fare);



                //Add Second Flight & The Base Fare
                leg_id = rs.getInt(12);
                flight_id = rs.getInt(13);
                departureAirport = rs.getInt(14);
                arrivalAirport = rs.getInt(15);
                dept_timestamp = rs.getTimestamp(16);
                arrv_timestamp = rs.getTimestamp(17);
                base_fare = rs.getInt(18);
                hidden_fare = rs.getInt(19);
                stopNum = rs.getInt(20);
                newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                        leg_id,base_fare,hidden_fare);
                flightBlock.addFlight(newflight);
                flightBlock.addPrice(base_fare);

                fs.add(flightBlock);
            }



        CallableStatement cStmt3 = conn.prepareCall("{call searchFlights_twoStop(?,?,?)}");
        cStmt3.setInt(1,source);
        cStmt3.setInt(2,dest);
        cStmt3.setDate(3, (java.sql.Date) date);
        hadResults = cStmt3.execute();
        rs = cStmt3.getResultSet();
        if(hadResults)
            while (rs.next()) {

                flightBlock = new FlightSearch();

                //Add First Flight & The Base Fare
                int leg_id = rs.getInt(1);
                int flight_id = rs.getInt(2);
                int departureAirport = rs.getInt(3);
                int arrivalAirport = rs.getInt(4);
                Timestamp dept_timestamp = rs.getTimestamp(5);
                Timestamp arrv_timestamp = rs.getTimestamp(6);
                int base_fare = rs.getInt(7);
                int hidden_fare = rs.getInt(8);
                int stopNum = rs.getInt(9);
                newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                        leg_id,base_fare,hidden_fare);
                flightBlock.addFlight(newflight);
                flightBlock.addPrice(base_fare);



                //Add Second Flight & The Base Fare
                leg_id = rs.getInt(12);
                flight_id = rs.getInt(13);
                departureAirport = rs.getInt(14);
                arrivalAirport = rs.getInt(15);
                dept_timestamp = rs.getTimestamp(16);
                arrv_timestamp = rs.getTimestamp(17);
                base_fare = rs.getInt(18);
                hidden_fare = rs.getInt(19);
                stopNum = rs.getInt(20);
                newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                        leg_id,base_fare,hidden_fare);
                flightBlock.addFlight(newflight);
                flightBlock.addPrice(base_fare);


                //Add Third Flight & The Base Fare
                leg_id = rs.getInt(23);
                flight_id = rs.getInt(24);
                departureAirport = rs.getInt(25);
                arrivalAirport = rs.getInt(26);
                dept_timestamp = rs.getTimestamp(27);
                arrv_timestamp = rs.getTimestamp(28);
                base_fare = rs.getInt(29);
                hidden_fare = rs.getInt(30);
                stopNum = rs.getInt(31);
                newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                        leg_id,base_fare,hidden_fare);
                flightBlock.addFlight(newflight);
                flightBlock.addPrice(base_fare);

                fs.add(flightBlock);
            }
        conn.close();

        for (int i=0; i<fs.size();i++) {
            for (int j = 0; j < fs.get(i).getFlightlegs().size(); j++)
                fs.get(i).getFlightlegs().set(j, getMoreFlightdetails(fs.get(i).getFlightlegs().get(j)));
            fs.get(i).getTotalTravelTime();
        }
        return fs;
    }



    public static Flight getMoreFlightdetails(Flight f) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;

        CallableStatement cStmt = conn.prepareCall("SELECT * FROM `Flights` F  WHERE F.id = ?");
        cStmt.setInt(1,f.getFlightId());
        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();
        if(hadResults)
            while (rs.next()) {

                f.setAirline(rs.getString(2));
                f.setDaysOp(rs.getInt("days_Op"));
                f.setFlight_number(rs.getInt(3));
            }
        conn.close();
        //Return the Airports.
        f.setDepartureAirport_ob(getAirportName(f.getDepartAirport_Id()));
        f.setArrivalAirport_ob(getAirportName(f.getArriveAirport_id()));
        f.setAirlineName(getAirlineName(f.getAirline()));
        return f;

    }


    public static Airport getAirportName(int airport_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        Airport airport = null;

        CallableStatement cStmt = conn.prepareCall("SELECT * FROM Airports A  WHERE A.id = ?");
        cStmt.setInt(1,airport_id);
        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();
        if(hadResults) {
            while (rs.next()) {
                String name = rs.getString("name");
                String city = rs.getString("city");
                String state = rs.getString("state");
                String country = rs.getString("country");

                airport = new Airport(airport_id, name, state, city, country);
            }
        }

        conn.close();
        return airport;

    }

    public static String getAirlineName(String  airline) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        String airlinename =null;

        CallableStatement cStmt = conn.prepareCall("SELECT * FROM Airlines A  WHERE A.id = ?");

        cStmt.setString(1,airline);

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();
        if(hadResults) {
            while (rs.next()) {
                airlinename = rs.getString("airline_name");
            }
        }

        conn.close();
        return airlinename;


    }



    public static ReservationData getReservationDetails(ReservationData r) throws SQLException, ClassNotFoundException {


        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;

        //Get all the FlightLegs
        CallableStatement cStmt = conn.prepareCall("{call getFlightsOfAReservation(?)}");
        cStmt.setInt(1,r.getReservation_id());
        boolean hadResults = cStmt.execute();

        rs = cStmt.getResultSet();
        FlightSearch flightBlock = new FlightSearch();
                if(hadResults){
                    while (rs.next()) {
                        int leg_id = rs.getInt("id");
                        int flight_id = rs.getInt("flight_id");
                        int departureAirport = rs.getInt("departureAirport");
                        int arrivalAirport = rs.getInt("arrivalAirport");
                        Timestamp dept_timestamp = rs.getTimestamp("dept_timestamp");
                        Timestamp arrv_timestamp = rs.getTimestamp("arrv_timestamp");
                        int base_fare = rs.getInt("base_fare");
                        int hidden_fare = rs.getInt("hidden_fare");
                        int stopNum = rs.getInt("stopNum");

                        Flight newflight = new Flight(stopNum,dept_timestamp,arrv_timestamp,departureAirport,arrivalAirport,flight_id,
                                leg_id,base_fare,hidden_fare);

                        flightBlock.addFlight(newflight);
                        flightBlock.addPrice(base_fare);
                    }
                r.addFlightSearch(flightBlock);
                }


        //Get All Passenger Details
        CallableStatement cStmt2 = conn.prepareCall("{call getPassengersOfAReservation(?)}");
        cStmt2.setInt(1,r.getReservation_id());
       hadResults = cStmt2.execute();
       rs = cStmt2.getResultSet();
       ArrayList<Passenger> passengerList = new ArrayList<>();
       Passenger newpass;
        if(hadResults) {
            while (rs.next()) {

                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                int person_id = rs.getInt(1);
                int reservation_id = rs.getInt("reservations_id");
                String mealPref = rs.getString("meal_preference");
                String travelClass = rs.getString("travel_class");
                String seatPref = rs.getString("seat_preference");
                String seatNum = rs.getString("seat_number");

                newpass = new Passenger(person_id, firstName, lastName, person_id, reservation_id, mealPref, travelClass, seatPref, seatNum);
                passengerList.add(newpass);
            }
            r.setPasengerList(passengerList);
        }

        conn.close();
        return r;
    }


    public FlightSearch mergeFlightBlock(FlightSearch a , FlightSearch b){
        FlightSearch newList = a;

        newList.addPrice(b.getPrice());
        for (int i =0; i<b.getFlightlegs().size();i++){
            //Flight newFlight  =
        }
        return a;
    }


}
