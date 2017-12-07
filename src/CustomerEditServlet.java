import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@WebServlet(name = "CustomerEditServlet")
public class CustomerEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request,1) || _Functions.isValidSession(request,2)){
            if (request.getParameter("updateUser").toString().equals("1")){

                int person_id = _Functions.getInteger("" + request.getParameter("person_id"));
                int customer_id = _Functions.getInteger("" + request.getParameter("customer_id"));
                String emailAddress = "" + request.getParameter("emailAddress");
                String password_old = "" + request.getParameter("password_old");
                String firstName = "" + request.getParameter("firstName");
                String lastName = "" + request.getParameter("lastName");
                int mobile = _Functions.getInteger("" + request.getParameter("mobile"));
                String address = "" + request.getParameter("address");
                String city = "" + request.getParameter("city");
                String state = "" + request.getParameter("state");
                int zipCode = _Functions.getInteger("" + request.getParameter("zipCode"));
                int creditCard = _Functions.getInteger("" + request.getParameter("creditCard"));

                try {
                    if (password_old.equals("")){
                        password_old = CustomerLevelTransaction.getCustomer(person_id).getPassword();
                    }

                    double rating = CustomerLevelTransaction.getCustomer(person_id).getRatings();
                    CRLevelTransactions.editCustomer(firstName, lastName,
                            address, city, state, zipCode, mobile, emailAddress, creditCard, rating, person_id, customer_id, password_old
                            );
                    response.sendRedirect("/my-account/customer/list");
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 1) || _Functions.isValidSession(request, 2)){

            int person_id = _Functions.getInteger(request.getParameter("id"));

            try {
                Customer customer = CustomerLevelTransaction.getCustomer(person_id);

                request.setAttribute("customer", customer);
                SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
                request.setAttribute("joinDate", dateFormat.format(customer.getDateCreated()));

                RequestDispatcher d = request.getServletContext().getRequestDispatcher("/my-account-cr-cust-edit.jsp");
                d.forward(request,response);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } else
            response.sendRedirect("/error401");
    }
}
