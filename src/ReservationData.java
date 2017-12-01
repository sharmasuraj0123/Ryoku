import java.sql.Timestamp;

public class ReservationData {
    private int reservation_id;
    private int customer_id;
    private int numOfPassengers;
    private Timestamp dateCreated;
    private double total_fare;
    private double booking_fee;
    private int employee_id;
    private String Fare_restrictions;
    private int lengthOfstay;
    private String advPurchases;

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
}
