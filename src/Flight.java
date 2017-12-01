import java.sql.Timestamp;

public class Flight {
    String airline;
    int Flight_number;
    int stopNum;
    String departureAirport;
    String arrivalAirport;
    Timestamp dept_time;
    Timestamp arrival_time;
    int daysOp;


    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public int getFlight_number() {
        return Flight_number;
    }

    public void setFlight_number(int flight_number) {
        Flight_number = flight_number;
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

    @Override
    public String toString() {
        return airline+Flight_number+"\t"+
                stopNum+"\t"+ departureAirport+"\t"+arrivalAirport+"\t"+dept_time+"\t"+arrival_time+"\t"+daysOp;
    }
}
