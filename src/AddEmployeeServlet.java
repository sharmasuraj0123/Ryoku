import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newCustomer = request.getParameter("new_emp");
        if (newCustomer != null && newCustomer.equals("1")){

            String firstName = "" + request.getParameter("firstName");
            String lastName = "" + request.getParameter("lastName");
            String emailAddress = "" + request.getParameter("emailAddress");
            String password = "" + request.getParameter("password_old");

            int mobile = _Functions.getInteger(request.getParameter("mobile"));

            String address = "" + request.getParameter("address");
            String city = "" + request.getParameter("city");
            String state = "" + request.getParameter("state");
            int zipCode = _Functions.getInteger(request.getParameter("zipCode"));
            int ssn = _Functions.getInteger(request.getParameter("SSN"));
            double hourlyPay = Double.parseDouble("" + request.getParameter("hourlyPay"));
            int mgr = 0;
            if (request.getParameter("manager") != null && request.getParameter("manager").toString().equals("on"))
                mgr = 1;

            try {
                ManagerLevelTransaction.addEmployee(firstName,lastName, emailAddress, password, address, city
                , state, zipCode, mobile, ssn, hourlyPay, mgr,0);
                response.sendRedirect("/my-account/employee/list");
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 1) || _Functions.isValidSession(request,2)){

            RequestDispatcher ds = request.getServletContext().getRequestDispatcher("/my-account-mgr-add-employee.jsp");
            ds.forward(request,response);

        } else {
            response.sendRedirect("/error401");
        }
    }
}
