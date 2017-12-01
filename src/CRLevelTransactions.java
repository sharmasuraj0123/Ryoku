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










}
