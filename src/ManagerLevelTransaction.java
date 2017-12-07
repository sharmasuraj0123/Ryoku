import java.sql.*;
import java.util.ArrayList;

public class ManagerLevelTransaction {


    public static Employees getEmployee(int p_id) throws SQLException, ClassNotFoundException{
        Employees current = null;
        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getEmployee(?)}");

        cStmt.setInt(1,p_id);
        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();

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
            int employeeId  = rs.getInt("EmployeeId");
            int SSN =rs.getInt("SSN");
            Timestamp startDate = rs.getTimestamp("StartDate");
            double hourlyPay = rs.getDouble("HourlyPay");
            int isManagercheck = rs.getInt("isManager");
            double ratings = rs.getDouble("Rating");

            boolean isManager;
            if(isManagercheck==0)
                isManager = false;
            else isManager = true;

            current = new Employees(id,firstName,lastName,email,password,
                    address,city,state,zipCode,phoneNumber,employeeId,
                    SSN,startDate,hourlyPay,isManager,ratings);

        }

        conn.close();
        return current;
    }

    public static ArrayList<Employees> getEmployeesList() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        ArrayList<Employees> cl = new ArrayList<>();
        CallableStatement cStmt = conn.prepareCall("{call getEmployeeList()}");


        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();

        if(hadResults)
            while (rs.next()) {
                int id = rs.getInt("person_id");
                String firstName = "" + rs.getString("FirstName");
                String lastName = "" + rs.getString("LastName");
                String email = "" + rs.getString("emailAddress");
                String password = "" + rs.getString("password");
                String address = "" + rs.getString("Address");
                String city = "" + rs.getString("City_Town");
                String state = "" + rs.getString("State");
                int zipCode = rs.getInt("ZipCode");
                long phoneNumber = rs.getLong("Phone");
                int eid = rs.getInt("EmployeeID");
                Timestamp startDate = rs.getTimestamp("StartDate");
                int SSN = rs.getInt("SSN");
                double hpay = rs.getDouble("HourlyPay");
                int isManager = rs.getInt("isManager");
                boolean mgr = false;
                if (isManager == 1)
                    mgr = true;
                double rating = rs.getDouble("Rating");

                Employees ne = new Employees(id, firstName, lastName, email, password, address, city, state, zipCode, phoneNumber, eid, SSN, startDate, hpay, mgr,rating);
                cl.add(ne);
            }
        conn.close();
        return cl;
    }

    public static void addEmployee(String firstName, String lastName, String email, String password, String address
            , String city, String state, int zipcode, int phoneNumber , int SSN ,
                                   double hrpay, int manager, double rating) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call addEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");


        Timestamp startdate = new Timestamp(System.currentTimeMillis());
        cStmt.setString(1,firstName);
        cStmt.setString(2,lastName);
        cStmt.setString(3,email);
        cStmt.setString(4,password);
        cStmt.setString(5,address);
        cStmt.setString(6,city);
        cStmt.setString(7,state);
        cStmt.setInt(8,zipcode);
        cStmt.setInt(9,phoneNumber);
        cStmt.setInt(10,SSN);
        cStmt.setTimestamp(11, startdate);
        cStmt.setDouble(12,hrpay);
        cStmt.setInt(13,manager);
        cStmt.setDouble(14,rating);


        boolean hadResults = cStmt.execute();

        conn.close();
    }


    public static void editEmployee(int empId,int person_id, String firstName, String lastName, String email, String password, String address
            , String city, String state, int zipcode, int phoneNumber , int SSN ,
                                    double hrpay, int manager, double rating) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call editEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");


        cStmt.setString(1,firstName);
        cStmt.setString(2,lastName);
        cStmt.setString(3,email);
        cStmt.setString(4,address);
        cStmt.setString(5,password);
        cStmt.setString(6,city);
        cStmt.setString(7,state);
        cStmt.setInt(8,zipcode);
        cStmt.setInt(9,phoneNumber);
        cStmt.setInt(10,SSN);
        cStmt.setDouble(11,hrpay);
        cStmt.setInt(12,manager);
        cStmt.setDouble(13,rating);
        cStmt.setInt(14,empId);
        cStmt.setInt(15,person_id);
        boolean hadResults = cStmt.execute();
        conn.close();
    }

    public static void deleteEmployee(int person_id, int empId) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call deleteEmployee(?,?)}");

        cStmt.setInt(1,person_id);
        cStmt.setInt(2,empId);

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

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();

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

            boolean hadResults = cStmt.execute();
            rs = cStmt.getResultSet();

        if(hadResults)
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
            newFlight.setBase_fare(rs.getInt("base_fare"));
            newFlight.setDeparture_status(rs.getTimestamp("departure_status"));
            newFlight.setArrival_status(rs.getTimestamp("arrival_status"));
            newFlight.setFlightId(rs.getInt("id"));
            newFlight.setTime();
            fl.add(newFlight);
        }
        conn.close();

        for (int i =0; i< fl.size();i++)
            fl.set(i, CustomerLevelTransaction.getMoreFlightdetails(fl.get(i)));
        return fl;
    }

    public static ArrayList<ReservationData> getReservationsByACustomer(int cust_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null;
        CallableStatement cStmt = conn.prepareCall("{call getReservationsByCustomerId(?)}");

        cStmt.setInt(1,cust_id);

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();

        ArrayList<ReservationData> rl = new ArrayList<>();
        if(hadResults)
            while (rs.next()) {
                ReservationData data = new ReservationData();

                data.setCustomer_id(rs.getInt("customer_id"));
                data.setReservation_id(rs.getInt("id"));
                data.setNumOfPassengers(rs.getInt("NumberOfPassengers"));
                data.setDateCreated(rs.getTimestamp("date"));
                data.setTotal_fare(rs.getDouble("total_fare"));
                data.setBooking_fee(rs.getDouble("booking_fee"));
                data.setEmployee_id(rs.getInt("employee_id"));
                data.setFare_restrictions(rs.getString("fare_restrictions"));
                data.setLengthOfstay(rs.getInt("lengthOfStay"));
                data.setAdvPurchases(rs.getString("advancePurchase"));

                rl.add(data);
            }
        conn.close();

        for (int i =0;i < rl.size();i++)
            rl.set(i,CustomerLevelTransaction.getReservationDetails(rl.get(i)));

        return rl;
    }

    public static  ArrayList<String> getCurrentReservationOfAFlight(int leg_id) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getCurrentReservationOfAFlight(?)}");

        cStmt.setInt(1,leg_id);

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();

        ArrayList<String> fs = new ArrayList<>();
        if(hadResults)
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
        rs = cStmt.getResultSet();
        ArrayList<String> fl = new ArrayList<>();
        if(hadResults)
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
        rs = cStmt.getResultSet();

        ArrayList<String> cl = new ArrayList<>();
        if(hadResults)
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
        rs = cStmt.getResultSet();

        ArrayList<String> cl = new ArrayList<>();
        if(hadResults)
        while (rs.next()) {
            String data = String.format(rs.getInt("customer_id")+"\t"+rs.getInt("Revenue_Generated"));
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
        rs = cStmt.getResultSet();

        boolean hadResults = cStmt.execute();

        ArrayList<String> cl = new ArrayList<>();
        if(hadResults)
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

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();
        String rep = null;

        if(hadResults){
            if(rs.next()) {
                int id = rs.getInt("id"); // 0
                //String firstName = "" + rs.getString("FirstName");
                //String lastName = "" + rs.getString("LastName");
                String email = "" + rs.getString("emailAddress"); // 1
                //String password = "" + rs.getString("password");
                String address = "" + rs.getString("Address"); // 2
                String city = "" + rs.getString("City_Town"); // 3
                String state = "" + rs.getString("State");  // 4
                int zipCode = rs.getInt("ZipCode");  // 5
                //long phoneNumber = rs.getLong("Phone");
                //int account_number = rs.getInt("AccountNumber");

                Timestamp dateCreated = rs.getTimestamp("StartDate"); // 6
                Date memberSince = new Date(dateCreated.getTime());

                double hrPay = rs.getDouble("HourlyPay");

                //long creditCardNumber = rs.getLong("CreditCardNumber");
                double rating = rs.getDouble("Rating"); // 7
                int totalSales = rs.getInt("total_sales_made");

                rep = String.format(email + "~" + address + "~" + city + "~" + state + "~" + zipCode + "~"
                        + memberSince + "~"+hrPay+"~" + rating+"~"+totalSales);
            }
        }
        conn.close();
        return rep;
    }

    public static String getMostSalesByCustomer() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs = null;
        CallableStatement cStmt = conn.prepareCall("{call getMostSalesByCustomer()}");

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();

        String rep = null;

        if(hadResults){
            if(rs.next()) {
                int id = rs.getInt("id"); // 0
                //String firstName = "" + rs.getString("FirstName");
                //String lastName = "" + rs.getString("LastName");
                String email = "" + rs.getString("emailAddress"); // 1
                //String password = "" + rs.getString("password");
                String address = "" + rs.getString("Address"); // 2
                String city = "" + rs.getString("City_Town"); // 3
                String state = "" + rs.getString("State");  // 4
                int zipCode = rs.getInt("ZipCode");  // 5
                //long phoneNumber = rs.getLong("Phone");
                //int account_number = rs.getInt("AccountNumber");

                Timestamp dateCreated = rs.getTimestamp("AccountCreationDate"); // 6
                Date memberSince = new Date(dateCreated.getTime());

                //long creditCardNumber = rs.getLong("CreditCardNumber");
                double rating = rs.getDouble("Ratings"); // 7
                int totalSales = rs.getInt("total_sales_made");

                rep = String.format(email + "~" + address + "~" + city + "~" + state + "~" + zipCode + "~"
                        + memberSince + "~" + rating+"~"+totalSales);
            }
        }


        conn.close();


        return rep;
    }

    public static ArrayList<String> getMostActiveFlight() throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs =null ;
        CallableStatement cStmt = conn.prepareCall("{call getMostActiveFlight()}");

        boolean hadResults = cStmt.execute();
        rs = cStmt.getResultSet();
        ArrayList<String> fl = new ArrayList<>();

        if(hadResults)
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
        rs = cStmt.getResultSet();

        ArrayList<String> pl = new ArrayList<>();
        if(hadResults)
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
        rs = cStmt.getResultSet();

        ArrayList<Flight> fl = new ArrayList<>();
        if(hadResults)
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
        rs = cStmt.getResultSet();

        ArrayList<Flight> fl = new ArrayList<>();
        if(hadResults)
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
        rs = cStmt.getResultSet();

        if(hadResults)
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
