

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

        //Adding an Employee.
//        ManagerLevelTransaction.addEmployee("maewn", "yes","yello@hi","1234",
//        "qw","sd","sd",11790, 1111111111, 1111111111, 10,
//                1,5.6);

        CRLevelTransactions.addCustomer("test","sd","21","ew",
                "NY",11790,1111111111,"sa@sk","1234"
        ,1010101010,7.0);

       ArrayList<String> fl =  ManagerLevelTransaction.getSalesReportOfAMonth(10,2017);

       for (int i = 0; i<fl.size();i++)
           System.out.println(fl.get(i).toString());
    }


}