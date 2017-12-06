public class Passenger extends Person {
    private int personId;
    private int reservationId;
    private int passenger_id;
    private String mealPref;
    private String travelClass;
    private String seatPref;
    private String seat_num;


    public Passenger(int id, String firstName, String lastName, String emailAddress, String password,
                     String address, String city, String state, int zipCode, long phoneNumber, int personId,
                     int reservationId, String mealPref, String travelClass, String seatPref, String seat_num) {

        super(id, firstName, lastName, emailAddress, password, address, city, state, zipCode, phoneNumber);
        this.personId = personId;
        this.reservationId = reservationId;
        this.mealPref = mealPref;
        this.travelClass = travelClass;
        this.seatPref = seatPref;
        this.seat_num = seat_num;
    }

    public Passenger(int personId, int reservationId,
                     String mealPref, String travelClass,
                     String seatPref, String seat_num) {
        this.personId = personId;
        this.reservationId = reservationId;
        this.mealPref = mealPref;
        this.travelClass = travelClass;
        this.seatPref = seatPref;
        this.seat_num = seat_num;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getMealPref() {
        return mealPref;
    }

    public void setMealPref(String mealPref) {
        this.mealPref = mealPref;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }

    public String getSeatPref() {
        return seatPref;
    }

    public void setSeatPref(String seatPref) {
        this.seatPref = seatPref;
    }

    public String getSeat_num() {
        return seat_num;
    }

    public void setSeat_num(String seat_num) {
        this.seat_num = seat_num;
    }

    public int getPassenger_id() {
        return passenger_id;
    }

    public void setPassenger_id(int passenger_id) {
        this.passenger_id = passenger_id;
    }

}
