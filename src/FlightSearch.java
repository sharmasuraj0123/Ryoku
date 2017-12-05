import java.util.ArrayList;

public class FlightSearch {
    private int numberOfpassengers;
    private ArrayList<Flight> flightlegs;
    private int price;
    private int totalTravelTime;

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

    public int getTotalTravelTime() {
        return totalTravelTime;
    }

    public void setTotalTravelTime(int totalTravelTime) {
        this.totalTravelTime = totalTravelTime;
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
        return printFlightLegs() + "Total price: " + price +"\n\n";
    }
}
