import java.io.Serializable;

public class Airport implements Serializable {

    private int id;
    private String name;
    private String state;
    private String city;
    private String country;

    public Airport(int id, String name, String state, String city, String country) {
        this.id = id;
        this.name = name;
        this.state = state;
        this.city = city;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
