import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@WebServlet(name = "FindFlightServlet")
public class FindFlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isFlexible = false;

        int passengers = _Functions.getInteger(request.getParameter("passenger_count"));
        double flyingClass = _Functions.getInteger(request.getParameter("class"));
        String[] dates_s = request.getParameterValues("date");
        ArrayList<java.sql.Date> dates = new ArrayList<>();

        if (dates_s != null){
            for (int i = 0; i < dates_s.length; i++){
                if (dates_s[i] != null && !dates_s[i].equals("")) {
                    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date date = null;
                    try {
                        date = sdf1.parse(dates_s[i]);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
                    dates.add(sqlStartDate);
                }
            }
        }


        int searchType = _Functions.getInteger(request.getParameter("search_type"));
        int scope = _Functions.getInteger(request.getParameter("flight_type"));

        String flex = (String)request.getParameter("isFlexible");
        if (flex != null && flex.equals("on"))
            isFlexible = true;

        String[] s = request.getParameterValues("airport");
        if (s == null)
            System.out.println("nll");


        _SearchQuery sq = new _SearchQuery(s ,
                 passengers, flyingClass, dates, searchType, scope, isFlexible);


        request.setAttribute("searchQuery", sq);

        System.out.println(sq);


        try {
                //Implement Different Types of Bookings.
            //searchType =2;
            Airport src = CustomerLevelTransaction.getAirportName(6);
            Airport dest = CustomerLevelTransaction.getAirportName(11);
            request.setAttribute("srcAirport",src);
            request.setAttribute("destAirport",dest);

                //One Way.
            ArrayList<FlightSearch> flightBlocks = new ArrayList<>();
                if(searchType==1) {
                    flightBlocks = CustomerLevelTransaction.searchFlights(6, 11, dates.get(0));
                }
                //It is a two way Flight.
                else if(searchType ==2){

                    ArrayList<FlightSearch> flightBlocks_going = CustomerLevelTransaction.searchFlights(6, 11, dates.get(0));
                    ArrayList<FlightSearch> flightBlocks_returning = CustomerLevelTransaction.searchFlights(6, 11, dates.get(1));

                    flightBlocks = CustomerLevelTransaction.mergeBlockList(flightBlocks_going,flightBlocks_returning);
                }
                else if(searchType==3){

                }
                else{
                    System.out.println(searchType);
                    //System.out.println(flightBlocks.size());
                }

                for (int i = 0; i < flightBlocks.size(); i++) {
                    flightBlocks.get(i).getTotalTravelTime();
                    System.out.println(flightBlocks.get(i).getFlightlegs().get(0).getArrival_time().toString());
                }

            request.setAttribute("flightBlocks", flightBlocks);

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/find-flights.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/");
    }
}
