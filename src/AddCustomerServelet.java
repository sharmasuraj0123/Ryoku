import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddCustomerServelet")
public class AddCustomerServelet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newCustomer = request.getParameter("new_cust");
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
            long cc = _Functions.getInteger(request.getParameter("creditCard"));

            try {
                CRLevelTransactions.addCustomer(firstName, lastName, address,
                        city, state, zipCode, mobile, emailAddress, password,  cc, 0);
                response.sendRedirect("/my-account/customer/list");
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 1) || _Functions.isValidSession(request,2)){

            RequestDispatcher ds = request.getServletContext().getRequestDispatcher("/my-account-cr-add-customer.jsp");
            ds.forward(request,response);

        } else {
            response.sendRedirect("/error401");
        }
    }
}
