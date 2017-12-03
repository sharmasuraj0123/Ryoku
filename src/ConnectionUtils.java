

import java.sql.*;
import java.util.ArrayList;

public class ConnectionUtils {

    public static Connection getConnection()
            throws ClassNotFoundException, SQLException {

        return MySQLConnUtils.getMySQLConnection();

    }

    public static void closeQuietly(Connection conn) {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }

    public static void rollbackQuietly(Connection conn) {
        try {
            conn.rollback();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) throws SQLException,
            ClassNotFoundException {

//        //Adding an Employee.
//        //Person.addEmployee("man", "yes"
//        ,"qw","sd","sd",11790, 1111111111, 1111111111, 10,
//                1,5.6);s

       ArrayList<String> fl =  ManagerLevelTransaction.getSalesReportOfAMonth(10,2017);

       for (int i = 0; i<fl.size();i++)
           System.out.println(fl.get(i).toString());
    }


}
