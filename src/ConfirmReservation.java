import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ConfirmReservation")
public class ConfirmReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("in-progress").toString().equals("1")){

            Customer customer = (Customer) request.getSession().getAttribute("customer");
            Employees employee = (Employees) request.getSession().getAttribute("employee");

            FlightSearch flight_selected = (FlightSearch) request.getSession().getAttribute("flight_selected");
            ArrayList<Flight> flightLegs = flight_selected.getFlightlegs();

            String passenger_firstName[] = request.getParameterValues("passenger_firstName");
            String passenger_lastName[] = request.getParameterValues("passenger_lastName");

            String meal_preference[] = request.getParameterValues("meal_preference");
            String seat_preference[] = request.getParameterValues("seat_preference");


            System.out.println(flight_selected);
            //  reservation code


            try {
                //Add it to the Reservation Table
               int r_id =  CRLevelTransactions.addReservation(customer.getAccountNumber(),flight_selected.getPrice(),flight_selected.getPrice()/10
                ,3,passenger_firstName.length,Integer.parseInt(flight_selected.getDay()),5);

                //Add it to the Reservation Legs Table. (Add the Flight legs to the reservation)
                for (int i =0;i <flightLegs.size();i++){
                    CRLevelTransactions.addReservationLeg(r_id,flightLegs.get(i).getLegId(),i+1);
                }


                //Add it to the Passenger Table. (Add the Passengers to the reservation)
                for (int i =0;i <passenger_firstName.length;i++){
                    CRLevelTransactions.addPassenger(r_id,meal_preference[i],"FIRST","AISLE","33A",
                            passenger_firstName[i],passenger_lastName[i]);
                }





            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

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
