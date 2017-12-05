import com.sun.tools.javac.code.Attribute;

import java.sql.*;
import java.util.ArrayList;

public class CRLevelTransactions {

    public static void addReservation(int cust_id, double fare,
                                      double book_fee, int emp_id, int length_stay, int advPurchase) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs;
        CallableStatement cStmt = conn.prepareCall("{call addReservation(?,?,?,?,?,?,?,?,?,?,?,?)}");


        Date reservationDate = new Date(System.currentTimeMillis());

        cStmt.setInt(1, cust_id);
        cStmt.setDate(2, reservationDate);
        cStmt.setDouble(3, book_fee);
        cStmt.setInt(4, emp_id);
        cStmt.setInt(5, length_stay);
        cStmt.setInt(6, advPurchase);

        try {
            boolean hadResults = cStmt.execute();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        conn.close();
    }

    public static void addCustomer(String firstName, String lastName, String address
            , String city, String state, int zipcode, long phoneNumber, String email, String password,
                                   long creditCardNum, double rating) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs;
        CallableStatement cStmt = conn.prepareCall("{call addCustomer(?,?,?,?,?,?,?,?,?,?,?,?)}");


        Timestamp startdate = new Timestamp(System.currentTimeMillis());
        cStmt.setString(1, firstName);
        cStmt.setString(2, lastName);
        cStmt.setString(3, address);
        cStmt.setString(4, city);
        cStmt.setString(5, state);
        cStmt.setInt(6, zipcode);
        cStmt.setLong(7, phoneNumber);
        cStmt.setString(8, email);
        cStmt.setString(9, password);
        cStmt.setTimestamp(10, startdate);
        cStmt.setLong(11, creditCardNum);
        cStmt.setDouble(12, rating);


        boolean hadResults = cStmt.execute();

        conn.close();
    }

    public static void editCustomer(String firstName, String lastName, String address
            , String city, String state, int zipcode, int phoneNumber, String email,
                                    int creditCardNum, double rating, int personId, int custId) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs;
        CallableStatement cStmt = conn.prepareCall("{call editCustomer(?,?,?,?,?,?,?,?,?,?,?)}");

        Timestamp startdate = new Timestamp(System.currentTimeMillis());
        cStmt.setString(1, firstName);
        cStmt.setString(2, lastName);
        cStmt.setString(3, address);
        cStmt.setString(4, city);
        cStmt.setString(5, state);
        cStmt.setInt(6, zipcode);
        cStmt.setInt(7, phoneNumber);
        cStmt.setString(8, email);
        cStmt.setTimestamp(9, startdate);
        cStmt.setInt(10, creditCardNum);
        cStmt.setDouble(11, rating);

        boolean hadResults = cStmt.execute();
        conn.close();
    }

    public static void deleteCustomer(int personId) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs;
        CallableStatement cStmt = conn.prepareCall("{call editCustomer(?)}");

        cStmt.setInt(7, personId);


        boolean hadResults = cStmt.execute();
        conn.close();

    }


    public static void addPassenger(int reservation_id, String mealPref,
                                    int TravelClass, String seatPref,
                                    String seatNum, String firstName, String lastName,
                                    String address
            , String city, String state, int zipcode, int phoneNumber) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs;
        CallableStatement cStmt = conn.prepareCall("{call addPassenger(?,?,?,?,?,?,?,?,?,?,?,?)}");

        cStmt.setInt(1, reservation_id);
        cStmt.setString(2, mealPref);
        cStmt.setString(3, "ECONOMY");
        cStmt.setString(4, seatPref);
        cStmt.setString(5, seatNum);
        cStmt.setString(6, firstName);
        cStmt.setString(7, lastName);
        cStmt.setString(8, address);
        cStmt.setString(9, city);
        cStmt.setString(10, state);
        cStmt.setInt(11, zipcode);
        cStmt.setInt(12, phoneNumber);


        boolean hadResults = cStmt.execute();
        conn.close();

    }


    public static ArrayList<String> generateMailingList() throws SQLException, ClassNotFoundException {


        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call generateMailingList()}");


        boolean hadResults = cStmt.execute();

        ArrayList<String> pl = new ArrayList<>();
        rs = cStmt.getResultSet();
        while (rs.next()) {
            String data = String.format(rs.getString("Name") + " " + rs.getString("EmailAddress"));
            pl.add(data);
        }
        conn.close();
        return pl;

    }

    public static ArrayList<Flight> getFlightSuggestionsForCustomer(int custId)
    throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        ArrayList<Flight> fl = new ArrayList<>();
        CallableStatement cStmt = conn.prepareCall("{call getFlightSuggestionsForCustomer(?)}");

        try {
            boolean hadResults = cStmt.execute();
            rs = cStmt.getResultSet();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }

        while (rs.next()) {
            Flight newFlight = new Flight();

            newFlight.setFlight_number(rs.getInt("Flight_number"));
            newFlight.setAirline(rs.getString("airline"));
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






}
