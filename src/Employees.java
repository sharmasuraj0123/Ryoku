

import java.sql.*;


public class Employees extends Person {
    private int employeeId;
    private int SSN;
    private Timestamp startDate;
    private double hourlyPay;
    private boolean isManager;
    private double rating;

    public Employees(){
        super();
    }

    public Employees(int id, String firstName, String lastName,
                     String emailAddress, String password, String address,
                     String city, String state, int zipCode, long phoneNumber,
                     int employeeId, int SSN, Timestamp startDate,
                     double hourlyPay, boolean isManager, double rating) {

        super(id, firstName, lastName,
                emailAddress, password, address, city, state, zipCode,
                phoneNumber);
        this.employeeId = employeeId;
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

    public double getHourlyPay() {
        return hourlyPay;
    }

    public void setHourlyPay(double hourlyPay) {
        this.hourlyPay = hourlyPay;
    }

    public boolean isManager() {
        return isManager;
    }

    public void setManager(boolean manager) {
        isManager = manager;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }
}
