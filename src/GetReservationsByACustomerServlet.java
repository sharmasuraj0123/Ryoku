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

                // add check here later skrr
                int cust_id = Integer.parseInt(request.getQueryString());

                ArrayList<ReservationData> reservations = ManagerLevelTransaction.getReservationsByACustomer(cust_id);
                request.setAttribute("reservations", reservations);

                System.out.print("num of reservations +>"+reservations.size());

                RequestDispatcher rd = request.getRequestDispatcher("/my-account-mgr-reservation-cust.jsp");
                rd.forward(request,response);

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
