import java.sql.Timestamp;
import java.util.ArrayList;

public class ReservationData {
    private int reservation_id;
    private int customer_id;
    private Customer customer;
    private int numOfPassengers;
    private Timestamp dateCreated;
    private double total_fare;
    private double booking_fee;
    private int employee_id;
    private Employees CR;
    private String Fare_restrictions;
    private int lengthOfstay;
    private String advPurchases;
    private ArrayList<Passenger> pasengerList;
    private ArrayList<FlightSearch> Flights;
    public ReservationData() {
        Flights = new ArrayList<>();
        pasengerList = new ArrayList<>();
    }

    public ReservationData(int reservation_id, int customer_id, int numOfPassengers, Timestamp dateCreated,
                           double total_fare, double booking_fee, int employee_id, String fare_restrictions,
                           int lengthOfstay, String advPurchases) {
        this.reservation_id = reservation_id;
        this.customer_id = customer_id;
        this.numOfPassengers = numOfPassengers;
        this.dateCreated = dateCreated;
        this.total_fare = total_fare;
        this.booking_fee = booking_fee;
        this.employee_id = employee_id;
        Fare_restrictions = fare_restrictions;
        this.lengthOfstay = lengthOfstay;
        this.advPurchases = advPurchases;
        Flights = new ArrayList<>();
        pasengerList = new ArrayList<>();
    }

    public int getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getNumOfPassengers() {
        return numOfPassengers;
    }

    public void setNumOfPassengers(int numOfPassengers) {
        this.numOfPassengers = numOfPassengers;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }


    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getFare_restrictions() {
        return Fare_restrictions;
    }

    public void setFare_restrictions(String fare_restrictions) {
        Fare_restrictions = fare_restrictions;
    }

    public int getLengthOfstay() {
        return lengthOfstay;
    }

    public void setLengthOfstay(int lengthOfstay) {
        this.lengthOfstay = lengthOfstay;
    }

    public String getAdvPurchases() {
        return advPurchases;
    }

    public void setAdvPurchases(String advPurchases) {
        this.advPurchases = advPurchases;
    }

    public double getTotal_fare() {
        return total_fare;
    }

    public void setTotal_fare(double total_fare) {
        this.total_fare = total_fare;
    }

    public double getBooking_fee() {
        return booking_fee;
    }

    public void setBooking_fee(double booking_fee) {
        this.booking_fee = booking_fee;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employees getCR() {
        return CR;
    }

    public void setCR(Employees CR) {
        this.CR = CR;
    }

    public ArrayList<Passenger> getPasengerList() {
        return pasengerList;
    }

    public void setPasengerList(ArrayList<Passenger> pasengerList) {
        this.pasengerList = pasengerList;
    }

    public void addFlightSearch(FlightSearch newFlightSearch){
        Flights.add(newFlightSearch);
    }

    public ArrayList<FlightSearch> getFlights() {
        return Flights;
    }

    public void setFlights(ArrayList<FlightSearch> flights) {
        Flights = flights;
    }
}
