import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GetReservationsByACustomerServlet")
public class GetReservationsByACustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (_Functions.isValidSession(request, 2) || _Functions.isValidSession(request, 1)) {

            try {

                int cust_id = (int)request.getAttribute("custID");

                ArrayList<ReservationData> reservations = ManagerLevelTransaction.getReservationsByACustomer(cust_id);
//                request.setAttribute("flights",flights);
//
//                System.out.println("hello => "+flights.size());
//
//                RequestDispatcher rd = request.getRequestDispatcher("/my-account-mgr-flights.jsp");
//                rd.forward(request,response);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } else {
            response.sendRedirect("/error403");
        }
    }
}
