import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GetReservationByFlightServlet")
public class GetReservationByFlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (_Functions.isValidSession(request, 2) || _Functions.isValidSession(request, 1))

            try {

                // add check here later skrr
                int leg_id = Integer.parseInt(request.getQueryString());

                ArrayList<ReservationData> reservations = ManagerLevelTransaction.getReservationsByAFlight(leg_id);

                System.out.print("     yup yup  "+reservations.size());

//                for (int  l=0; l<reservations.size();l++) {
//                    ArrayList<FlightSearch> fs = reservations.get(l).getFlights();
//                    for (int i = 0; i < fs.size(); i++) {
//                        for (int j = 0; j < fs.get(i).getFlightlegs().size(); j++) {
//                            fs.get(i).getFlightlegs().set(j, CustomerLevelTransaction.getMoreFlightdetails(fs.get(i).getFlightlegs().get(j)));
//                        }
//                        fs.get(i).getTotalTravelTime();
//                    }
//                }


                request.setAttribute("reservations", reservations);
                System.out.print("num of reservations +>"+reservations.size());
                RequestDispatcher rd = request.getRequestDispatcher("/my-account-mgr-reservation-flight.jsp");
                rd.forward(request,response);


            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } else {
            response.sendRedirect("/error403");
        }
    }
}
