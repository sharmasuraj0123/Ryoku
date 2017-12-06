import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUpCustomerServlet")
public class SignUpCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstname = request.getParameter("FirstName");
        String lastname  = request.getParameter("LastName");
        String email = request.getParameter("emailAddress");
        String password = request.getParameter("password");

        try{
            CRLevelTransactions.addCustomer(firstname,lastname,email,password);
        }catch (SQLException e) {
            System.out.print("ex 1");
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            System.out.print("ex 2");
            e.printStackTrace();
        }

        response.sendRedirect("my-account.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}