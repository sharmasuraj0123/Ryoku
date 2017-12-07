import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConfirmReservation")
public class ConfirmReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("in-Progress").toString().equals("1")){

            Customer customer = (Customer) request.getSession().getAttribute("customer");
            Employees employee = (Employees) request.getSession().getAttribute("employee");

            FlightSearch flight_selected = (FlightSearch) request.getSession().getAttribute("flight_selected");

            String passenger_firstName[] = request.getParameterValues("passenger_firstName");
            String passenger_lastName[] = request.getParameterValues("passenger_lastName");

            String meal_preference[] = request.getParameterValues("meal_preference");
            String seat_preference[] = request.getParameterValues("seat_preference");

            //  reservation code



            //
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/my-account/trips");
            dispatcher.forward(request, response);

        } else {
            response.sendRedirect("/err");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/");
    }
}
