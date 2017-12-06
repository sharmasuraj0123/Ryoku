import java.sql.Time;
import java.sql.Timestamp;

public class Customer extends Person{

    private int accountNumber;
    private Timestamp dateCreated;
    private long creditCardNumber;
    private double ratings;

    public Customer(){
        super();
    }

    public Customer(int id, String firstName, String lastName,
                    String emailAddress, String password,
                    String address, String city, String state,
                    int zipCode, long phoneNumber, int accountNumber,
                    Timestamp dateCreated, long creditCardNumber,
                    double ratings) {
        super(id, firstName, lastName, emailAddress, password, address, city, state, zipCode, phoneNumber);
        this.accountNumber = accountNumber;
        this.dateCreated = dateCreated;
        this.creditCardNumber = creditCardNumber;
        this.ratings = ratings;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(int accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp datecreated) {
        this.dateCreated = datecreated;
    }

    public long getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(long creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    public double getRatings() {
        return ratings;
    }

    public void setRatings(double ratings) {
        this.ratings = ratings;
    }
}
