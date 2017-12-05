import java.sql.*;
import java.util.ArrayList;

public class CustomerLevelTransaction {



public static Customer getCustomer(int p_id) throws SQLException, ClassNotFoundException{
    Customer current_customer = null;
    Connection conn = ConnectionUtils.getConnection();
    ResultSet rs = null;
    CallableStatement cStmt = conn.prepareCall("{call getCustomer(?)}");

    cStmt.setInt(1,p_id);
    boolean hadResults = cStmt.execute();

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







}
