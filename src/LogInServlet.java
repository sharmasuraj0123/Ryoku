import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LogInServlet")
public class LogInServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if((request.getParameter("action")!=null)&&	(request.getParameter("action").trim().equals("LOGOUT")))
        {
            System.out.print("1");
            HttpSession session=request.getSession();
            session.setAttribute("login","");
            response.sendRedirect("/");

            // put some code here to show error
            return;
        }

        String username =     request.getParameter("username");
        String password     = request.getParameter("password");

        HttpSession session = request.getSession();

        if (username.trim().equals("") || password.trim().equals(""))
        {
            response.sendRedirect("/");
        }
        else
        {

            try {

                // Get Connection
                Connection con = MySQLConnUtils.getMySQLConnection();

                String sql = "Select * from Person where emailAddress=? and password=?";

                java.sql.PreparedStatement ps = con.prepareStatement(sql);

                // add values to the prepared statement
                try {
                    ps.setString(1,username);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                ps.setString(2,password);

                // Execute SQL statement returns a ResultSet object.
                ResultSet rs = ps.executeQuery();

                // Fetch on the ResultSet
                // Move the cursor to the next record.
                if (rs.next()) {

                    // get the person id first
                    int pid = rs.getInt("id");

                    Customer curr_customer = CustomerLevelTransaction.getCustomer(pid);
                    Employees curr_employee = ManagerLevelTransaction.getEmployee(pid);

                    if(curr_customer == null && curr_employee == null){

                        // throw some error
                        System.out.print("1");

                    }else if(curr_customer != null){

                        // customer found
                        session.setAttribute("customer",curr_customer);
                        session.setAttribute("loggedin",true);
                        session.setAttribute("person_type",0);

                        response.sendRedirect("/");
                        System.out.print("2");

                    }else{

                        // employee found
                        session.setAttribute("employee",curr_employee);
                        session.setAttribute("loggedin",true);
                        session.setAttribute("person_type",1);

                        System.out.print("3");
                        response.sendRedirect("/my-account");
                    }

                }

                // Close connection.
                con.close();

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/log-in.jsp");
        dispatcher.forward(request, response);
    }
}
