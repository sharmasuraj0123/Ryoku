import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Flight implements Serializable {
    private String airline;
    private String airlineName;
    private int flight_number;
    private int stopNum;
    private String departureAirport;
    private String arrivalAirport;
    private Timestamp dept_time;
    private Timestamp arrival_time;
    private String dTime;
    private String aTime;
    private String d_date;
    private int daysOp;
    private int departAirport_Id;
    private int arriveAirport_id;
    private int flightId;
    private int legId;
    private int base_fare;
    private int hidden_fare;

    private Airport departureAirport_ob;
    private Airport arrivalAirport_ob;

    public String getdTime() {
        return dTime;
    }

    public void setdTime(String dTime) {
        this.dTime = dTime;
    }

    public String getaTime() {
        return aTime;
    }

    public void setaTime(String aTime) {
        this.aTime = aTime;
    }

    public String getD_date() {
        return d_date;
    }

    public void setD_date(String d_date) {
        this.d_date = d_date;
    }

    public Flight(int stopNum, Timestamp dept_time, Timestamp arrival_time, int departAirport_Id, int arriveAirport_id,
                  int flightId, int legId, int base_fare, int hidden_fare) {
        this.stopNum = stopNum;
        this.dept_time = dept_time;
        this.arrival_time = arrival_time;
        this.departAirport_Id = departAirport_Id;
        this.arriveAirport_id = arriveAirport_id;
        this.flightId = flightId;
        this.legId = legId;
        this.base_fare = base_fare;
        this.hidden_fare = hidden_fare;

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        this.dTime = sdf.format(dept_time.getTime());
        this.aTime = sdf.format(arrival_time.getTime());
        SimpleDateFormat sdf2 = new SimpleDateFormat("MMMMM dd, YYYY");
        this.d_date = sdf2.format(dept_time.getTime());
    }

    public Flight(){}

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public int getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(int flight_number) {
        this.flight_number = flight_number;
    }

    public int getStopNum() {
        return stopNum;
    }

    public void setStopNum(int stopNum) {
        this.stopNum = stopNum;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public Timestamp getDept_time() {
        return dept_time;
    }

    public void setDept_time(Timestamp dept_time) {
        this.dept_time = dept_time;
    }

    public Timestamp getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(Timestamp arrival_time) {
        this.arrival_time = arrival_time;
    }

    public int getDaysOp() {
        return daysOp;
    }

    public void setDaysOp(int daysOp) {
        this.daysOp = daysOp;
    }

    public int getDepartAirport_Id() {
        return departAirport_Id;
    }

    public void setDepartAirport_Id(int departAirport_Id) {
        this.departAirport_Id = departAirport_Id;
    }

    public int getArriveAirport_id() {
        return arriveAirport_id;
    }

    public void setArriveAirport_id(int arriveAirport_id) {
        this.arriveAirport_id = arriveAirport_id;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public int getLegId() {
        return legId;
    }

    public void setLegId(int legId) {
        this.legId = legId;
    }

    public int getBase_fare() {
        return base_fare;
    }

    public void setBase_fare(int base_fare) {
        this.base_fare = base_fare;
    }

    public int getHidden_fare() {
        return hidden_fare;
    }

    public void setHidden_fare(int hidden_fare) {
        this.hidden_fare = hidden_fare;
    }

    public String getAirlineName() {
        return airlineName;
    }

    public void setAirlineName(String airlineName) {
        this.airlineName = airlineName;
    }

    public Airport getDepartureAirport_ob() {
        return departureAirport_ob;
    }

    public void setDepartureAirport_ob(Airport departureAirport_ob) {
        this.departureAirport_ob = departureAirport_ob;
    }

    public Airport getArrivalAirport_ob() {
        return arrivalAirport_ob;
    }

    public void setArrivalAirport_ob(Airport arrivalAirport_ob) {
        this.arrivalAirport_ob = arrivalAirport_ob;
    }



    @Override
    public String toString() {
        return airline+flight_number+"\t"+
                stopNum+"\t"+ departAirport_Id+"\t"+arriveAirport_id+"\t"+dept_time+"\t"+arrival_time+"\t"+daysOp +"\n";
    }
}
