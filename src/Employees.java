

import java.sql.*;


public class Employees extends Person {
    private int employeeId;
    private int person_id;
    private int SSN;
    private Timestamp startDate;
    private int hourlyPay;
    boolean isManager;
    int rating;

    public Employees(){
        super();
    }

    public Employees(int id, String firstName, String lastName,
                        String password, String address, String city, String state,
                            int zipCode, int phoneNumber, int employeeId, int person_id, int SSN,
                                Timestamp startDate, int hourlyPay, boolean isManager, int rating) {

        super(id, firstName, lastName, password, address, city, state, zipCode, phoneNumber);
        this.employeeId = employeeId;
        this.person_id = person_id;
        this.SSN = SSN;
        this.startDate = startDate;
        this.hourlyPay = hourlyPay;
        this.isManager = isManager;
        this.rating = rating;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getPerson_id() {
        return person_id;
    }

    public void setPerson_id(int person_id) {
        this.person_id = person_id;
    }

    public int getSSN() {
        return SSN;
    }

    public void setSSN(int SSN) {
        this.SSN = SSN;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public int getHourlyPay() {
        return hourlyPay;
    }

    public void setHourlyPay(int hourlyPay) {
        this.hourlyPay = hourlyPay;
    }

    public boolean isManager() {
        return isManager;
    }

    public void setManager(boolean manager) {
        isManager = manager;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
