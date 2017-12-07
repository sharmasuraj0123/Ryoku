import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "AllFlightsServlet")
public class AllFlightsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (_Functions.isValidSession(request, 2)) {

            try {

                ArrayList<Flight> flights = ManagerLevelTransaction.listAllFlights();
                request.setAttribute("flights",flights);

                System.out.println("hello => "+flights.get(0));




                RequestDispatcher rd = request.getRequestDispatcher("/my-account-mgr-flights.jsp");
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
