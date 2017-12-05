

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.*;

@WebServlet(name = "Registration")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get Connection
//        try {
//
//
//
//            // store the query
//            String firstName = request.getParameter("firstname");
//            String pass = request.getParameter("password");
//
//            //Employees.addEmployee(firstName,pass);
//
//            //Adding an Employee.
////            ManagerLevelTransaction.addEmployee("msdsdan", "ysdsdsdes"
////                    ,"qw","sd","sd",11790, 1111111111, 1111111111, 10,
////                    1,5.6);
//
////        } catch (ClassNotFoundException e) {
////            e.printStackTrace();
////        } catch (SQLException e) {
////            e.printStackTrace();
////        }
//
//    }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
