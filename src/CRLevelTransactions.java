import java.sql.*;

public class CRLevelTransactions {

    public static void addReservation(int cust_id, double fare,
                                      double book_fee,int emp_id, int length_stay, int advPurchase) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call addReservation(?,?,?,?,?,?,?,?,?,?,?,?)}");


        Date reservationDate = new Date (System.currentTimeMillis());

        cStmt.setInt(1,cust_id);
        cStmt.setDate(2,reservationDate);
        cStmt.setDouble(3,book_fee);
        cStmt.setInt(4,emp_id);
        cStmt.setInt(5,length_stay);
        cStmt.setInt(6,advPurchase);

        try {
            boolean hadResults = cStmt.execute();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        conn.close();
    }

    public static void addCustomer(String firstName, String lastName, String address
            , String city, String state, int zipcode, int phoneNumber , String email,
                                    int creditCardNum, double rating) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call addCustomer(?,?,?,?,?,?,?,?,?,?,?)}");


        Timestamp startdate = new Timestamp(System.currentTimeMillis());
        cStmt.setString(1,firstName);
        cStmt.setString(2,lastName);
        cStmt.setString(3,address);
        cStmt.setString(4,city);
        cStmt.setString(5,state);
        cStmt.setInt(6,zipcode);
        cStmt.setInt(7,phoneNumber);
        cStmt.setString(8,email);
        cStmt.setTimestamp(9, startdate);
        cStmt.setInt(10,creditCardNum);
        cStmt.setDouble(11,rating);

        boolean hadResults = cStmt.execute();

        conn.close();
    }

    public static void editCustomer(String firstName, String lastName, String address
            , String city, String state, int zipcode, int phoneNumber , String email,
                                    int creditCardNum, double rating, int personId, int custId) throws SQLException, ClassNotFoundException {

        Connection conn = ConnectionUtils.getConnection();
        ResultSet rs ;
        CallableStatement cStmt = conn.prepareCall("{call editCustomer(?,?,?,?,?,?)}");

        Timestamp startdate = new Timestamp(System.currentTimeMillis());
        cStmt.setString(1,firstName);
        cStmt.setString(2,lastName);
        cStmt.setString(3,address);
        cStmt.setString(4,city);
        cStmt.setString(5,state);
        cStmt.setInt(6,zipcode);
        cStmt.setInt(7,phoneNumber);
        cStmt.setString(8,email);
        cStmt.setTimestamp(9, startdate);
        cStmt.setInt(10,creditCardNum);
        cStmt.setDouble(11,rating);

        boolean hadResults = cStmt.execute();
        conn.close();
    }










}
