import java.sql.*;
import java.util.ArrayList;

public class ManagerLevelTransaction {


    public static void addEmployee(String firstName, String lastName, String email, String password, String address
            , String city, String state, int zipcode, int phoneNumber , int SSN ,
                                   double hrpay, int manager, double rating) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call addEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");


        Timestamp startdate = new Timestamp(System.currentTimeMillis());
        cStmt.setString(1,firstName);
        cStmt.setString(2,lastName);
        cStmt.setString(3,address);
        cStmt.setString(4,city);
        cStmt.setString(5,state);
        cStmt.setInt(6,zipcode);
        cStmt.setInt(7,phoneNumber);
        cStmt.setInt(8,SSN);
        cStmt.setTimestamp(9, startdate);
        cStmt.setDouble(10,hrpay);
        cStmt.setInt(11,manager);
        cStmt.setDouble(12,rating);
        cStmt.setString(13,email);
        cStmt.setString(14,password);

        boolean hadResults = cStmt.execute();

        conn.close();
    }

    public static void editEmployee(int empId, int SSN, Timestamp startdate,
                                    double hrpay, int manager, double rating) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call editEmployee(?,?,?,?,?,?)}");

        cStmt.setInt(1,empId);
        cStmt.setInt(2,SSN);
        cStmt.setTimestamp(3, startdate);
        cStmt.setDouble(4,hrpay);
        cStmt.setInt(5,manager);
        cStmt.setDouble(6,rating);

        boolean hadResults = cStmt.execute();
        conn.close();
    }

    public static void deleteEmployee(int id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call deleteEmployee(?)}");

        cStmt.setInt(1,id);

        boolean hadResults = cStmt.execute();
        conn.close();

    }


    public static ArrayList<String> getSalesReportOfAMonth(int month , int year) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getSalesReportOfAMonth(?,?)}");
        ArrayList<String> el = new ArrayList<>();
        cStmt.setInt(1,month);
        cStmt.setInt(2,year);

        try {
            boolean hadResults = cStmt.execute();
            rs = cStmt.getResultSet();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }

        while (rs.next()) {
            String newEntry = String.format(rs.getString("EmployeeName")+"\t"+ rs.getInt("TotalRevenue")
                    +"\t"+rs.getInt("FEES"));
            el.add(newEntry);
        }
        conn.close();

        return el;

    }

    public static ArrayList<Flight> listAllFlights() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        ArrayList<Flight> fl = new ArrayList<>();
        CallableStatement cStmt = conn.prepareCall("{call listAllFlights()}");

        try {
            boolean hadResults = cStmt.execute();
            rs = cStmt.getResultSet();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }

        while (rs.next()) {
            Flight newFlight = new Flight();

            newFlight.setAirline(rs.getString("airline"));
            newFlight.setFlight_number(rs.getInt("Flight_number"));
            newFlight.setStopNum(rs.getInt("stopNum"));
            newFlight.setDepartureAirport((rs.getString("DepartureAirport")));
            newFlight.setArrivalAirport(rs.getString("ArrivalAirport"));
            newFlight.setArrival_time(rs.getTimestamp("arrv_timestamp"));
            newFlight.setDept_time(rs.getTimestamp("dept_timestamp"));
            newFlight.setDaysOp(rs.getInt("days_Op"));
            fl.add(newFlight);
        }

        conn.close();
        return fl;
    }

    public static ArrayList<ReservationData> getReservationsByACustomer(int cust_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null;
        CallableStatement cStmt = conn.prepareCall("{call getReservationsByACustomer(?)}");

        cStmt.setInt(1,cust_id);

        boolean hadResults = cStmt.execute();

        ArrayList<ReservationData> rl = new ArrayList<>();
        while (rs.next()) {
            ReservationData data = new ReservationData();

            data.setCustomer_id(rs.getInt("customer_id"));
            data.setReservation_id(rs.getInt("id"));
            data.setNumOfPassengers(rs.getInt("NumberOfPassengers"));
            data.setDateCreated(rs.getTimestamp("date"));
            data.setTotal_fare(rs.getDouble("total_fare"));
            data.setBooking_fee(rs.getDouble("booking_fee"));
            data.setEmployee_id(rs.getInt("employee_id"));
            data.setFare_restrictions(rs.getString("fare_restriction"));
            data.setLengthOfstay(rs.getInt("lengthOfStay"));
            data.setAdvPurchases(rs.getString("advancePurchases"));

            rl.add(data);
        }
        conn.close();
        return rl;
    }

    public static  ArrayList<String> getCurrentReservationOfAFlight(int leg_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getCurrentReservationOfAFlight(?)}");

        cStmt.setInt(1,leg_id);

        boolean hadResults = cStmt.execute();

        ArrayList<String> fs = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getString("FirstName")+"\t"+rs.getString("LastName")+"\t"
                    + rs.getInt("ReservationNumber")
                    +"\t"+rs.getInt("seat_number") +"\t"+rs.getString("seat_preference"));
            fs.add(data);
        }
        conn.close();
        return fs;
    }

    public static ArrayList<String> getRevenueByFlight(int flight_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null ;
        CallableStatement cStmt = conn.prepareCall("{call getRevenueByFlight(?)}");

        cStmt.setInt(1,flight_id);

        boolean hadResults = cStmt.execute();

        ArrayList<String> fl = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getString("airline")  + rs.getInt("flight_number")
                    +"\t"+rs.getInt("Revenue_Generated"));
            fl.add(data);
        }
        conn.close();
        return fl;
    }

    public static ArrayList<String> getRevenueByCity(String city) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getRevenueByCity(?)}");

        cStmt.setString(1,city);

        boolean hadResults = cStmt.execute();

        ArrayList<String> cl = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getString("city")
                    +"\t"+rs.getInt("Revenue_Generated"));
            cl.add(data);
        }
        conn.close();
        return cl;
    }

    public static ArrayList<String> getRevenueByACustomer(int cust_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null;
        CallableStatement cStmt = conn.prepareCall("{call getRevenueByACustomer(?)}");

        cStmt.setInt(1,cust_id);

        boolean hadResults = cStmt.execute();

        ArrayList<String> cl = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getInt("customer_id")+"\t"+rs.getString("city")
                    +"\t"+rs.getInt("Revenue_Generated"));
            cl.add(data);
        }
        conn.close();
        return cl;
    }

    public static ArrayList<String> getRevenueByAirport(int airport_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null;
        CallableStatement cStmt = conn.prepareCall("{call getRevenueByAirport(?)}");

        cStmt.setInt(1,airport_id);

        boolean hadResults = cStmt.execute();

        ArrayList<String> cl = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getInt("name")
                    +"\t"+rs.getInt("SUM(FL.base_fare * P.travel_class)"));
            cl.add(data);
        }
        conn.close();
        return cl;
    }

    public static String listMostSalesByCustRep() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call listMostSalesByCustRep()}");

        try {
            boolean hadResults = cStmt.execute();

        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        String rep = String.format(rs.getString("FirstName")+" "+ rs.getString("LastName")
                +"\t"+rs.getInt("total_sales_made"));
        conn.close();
        return rep;
    }

    public static String getMostSalesByCustomer() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getMostSalesByCustomer()}");

        boolean hadResults = cStmt.execute();

        String rep = String.format(rs.getString("FirstName")+" "+ rs.getString("LastName")
                +"\t"+rs.getInt("total_sales_made"));
        conn.close();
        return rep;
    }

    public static ArrayList<String> getMostActiveFlight() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null ;
        CallableStatement cStmt = conn.prepareCall("{call getMostActiveFlight()}");

        boolean hadResults = cStmt.execute();

        ArrayList<String> fl = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getString("CONCAT (F.airline, F.Flight_number)")
                    +"\t"+rs.getInt("Days Operated in week"));
            fl.add(data);
        }
        conn.close();
        return fl;
    }

    public static ArrayList<String> getPassengersOfAFlight(int flight_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null;
        CallableStatement cStmt = conn.prepareCall("{call getPassengersOfAFlight(?)}");

        cStmt.setInt(1,flight_id);


        boolean hadResults = cStmt.execute();


        ArrayList<String> pl = new ArrayList<>();
        while (rs.next()) {
            String data = String.format(rs.getString("FirstName")+" "+ rs.getString("LastName")
                    +"\t"+rs.getInt("id") +"\t"+rs.getInt("seat_number"));
            pl.add(data);
        }
        conn.close();
        return pl;
    }

    public static ArrayList<Flight> getFlightsAtAirport(int airport_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getFlightsAtAirport(?)}");

        cStmt.setInt(1,airport_id);


        boolean hadResults = cStmt.execute();

        ArrayList<Flight> fl = new ArrayList<>();
        while (rs.next()) {
            Flight newFlight = new Flight();

            newFlight.setAirline(rs.getString("airline"));
            newFlight.setFlight_number(rs.getInt("Flight_number"));
            newFlight.setStopNum(rs.getInt("stopNum"));
            newFlight.setDepartureAirport((rs.getString("DepartureAirport")));
            newFlight.setArrivalAirport(rs.getString("ArrivalAirport"));
            newFlight.setDept_time(rs.getTimestamp("dept_timestamp"));
            newFlight.setArrival_time(rs.getTimestamp("arrv_timestamp"));
            newFlight.setDaysOp(rs.getInt("days_Op"));
            fl.add(newFlight);
        }

        conn.close();
        return fl;
    }

    public static ArrayList<Flight> getFlightsOnTime() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getFlightsOnTime()}");


        boolean hadResults = cStmt.execute();

        ArrayList<Flight> fl = new ArrayList<>();
        while (rs.next()) {
            Flight newFlight = new Flight();

            newFlight.setFlight_number(rs.getInt("Flight_number"));
            newFlight.setAirline(rs.getString("airline"));
            newFlight.setStopNum(rs.getInt("stopNum"));
            newFlight.setDepartureAirport((rs.getString("DepartureAirport")));
            newFlight.setArrivalAirport(rs.getString("ArrivalAirport"));
            newFlight.setDept_time(rs.getTimestamp("dept_timestamp"));
            newFlight.setArrival_time(rs.getTimestamp("arrv_timestamp"));
            newFlight.setDaysOp(rs.getInt("days_Op"));
            fl.add(newFlight);
        }

        conn.close();
        return fl;
    }

    public static ArrayList<Flight> getFlightsThatAreDelayed() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null;
        CallableStatement cStmt = conn.prepareCall("{call getFlightsThatAreDelayed()}");


        boolean hadResults = cStmt.execute();
        ArrayList<Flight> fl = new ArrayList<>();
        while (rs.next()) {
            Flight newFlight = new Flight();

            newFlight.setAirline(rs.getString("airline"));
            newFlight.setStopNum(rs.getInt("stopNum"));
            newFlight.setFlight_number(rs.getInt("Flight_number"));
            newFlight.setDepartureAirport((rs.getString("DepartureAirport")));
            newFlight.setArrivalAirport(rs.getString("ArrivalAirport"));
            newFlight.setDept_time(rs.getTimestamp("dept_timestamp"));
            newFlight.setArrival_time(rs.getTimestamp("arrv_timestamp"));
            newFlight.setDaysOp(rs.getInt("days_Op"));
            fl.add(newFlight);
        }
        conn.close();
        return fl;
    }

}
