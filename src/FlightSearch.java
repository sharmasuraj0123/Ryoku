import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;

public class FlightSearch implements Serializable{
    private int numberOfpassengers;
    private ArrayList<Flight> flightlegs;
    private int price;
    private long totalTravelTime;
    private String day;
    private String hours;
    private String minutes;

    public FlightSearch() {
        flightlegs = new ArrayList<>();
        price =0;
    }

    public int getNumberOfpassengers() {
        return numberOfpassengers;
    }

    public void setNumberOfpassengers(int numberOfpassengers) {
        this.numberOfpassengers = numberOfpassengers;
    }

    public ArrayList<Flight> getFlightlegs() {
        return flightlegs;
    }

    public void setFlightlegs(ArrayList<Flight> flightlegs) {
        this.flightlegs = flightlegs;
    }

    public void addFlight(Flight newFlight){
        flightlegs.add(newFlight);
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void addPrice(int fare){
        price+=fare;
    }

    public void getTotalTravelTime() {

        Timestamp startTime  = flightlegs.get(0).getDept_time();
        Timestamp endTime  = flightlegs.get(flightlegs.size()-1).getArrival_time();
        long travelTime = endTime.getTime() - startTime.getTime();
        day = String.format(travelTime/(24 * 60 * 60 * 1000)+"");
        hours = String.format((travelTime/(60 * 60 * 1000))%24+"");
        minutes = String.format((travelTime/(60 * 1000))%60+"");
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getMinutes() {
        return minutes;
    }

    public void setMinutes(String minutes) {
        this.minutes = minutes;
    }

    public String printFlightLegs(){
        String rs = "";

        for (int i =0; i<flightlegs.size();i++){
            rs+= flightlegs.get(i).toString();
        }
        return rs;
    }

    @Override
    public String toString() {
        return printFlightLegs() + "Total price: " + price + "Transit Time :"+"\n\n";
    }
}
