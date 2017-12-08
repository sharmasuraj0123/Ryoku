import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "BookFlightServlet")
public class BookFlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("person_type") != null){
            request.getSession().setAttribute("flight_num_index_selected", request.getParameter("flight_selected_position"));

            ArrayList<FlightSearch> flight_search_data = (ArrayList<FlightSearch>) request.getSession().getAttribute("flights_inSession");
//            request.getSession().setAttribute("flights_inSession", null);

            Integer index = _Functions.getInteger(request.getParameter("flight_selected_position"));
            FlightSearch flight_selected = flight_search_data.get(index.intValue());

            request.getSession().setAttribute("flight_selected", flight_selected);

            Customer customer = (Customer) request.getSession().getAttribute("customer");
            Employees employee = (Employees) request.getSession().getAttribute("employee");

            if (customer != null){
                request.setAttribute("customer_data", customer);
            } else if (employee != null){
                request.setAttribute("employee_data", employee);
            }

            System.out.println("Flight Data: " + flight_selected.toString());

            request.setAttribute("class", request.getParameter("class"));
            request.setAttribute("passenger_count", request.getParameter("passenger_count"));

            if (request.getParameter("bid") != null && request.getParameter("bid").toString().equals("1")){
                double price = Double.parseDouble(request.getParameter("bid_price"));
                request.setAttribute("bid_price",  price);
            }

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/book-flight.jsp");
            dispatcher.forward(request, response);


        } else {
            response.sendRedirect("/log-in");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/err");
    }
}
