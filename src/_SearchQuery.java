import java.io.Serializable;
import java.sql.Array;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Arrays;

public class _SearchQuery implements Serializable {
    public String[] airports;
    public int numPassengers;
    public double flyingClass;
    public ArrayList<Date> dates;
    public int searchType;
    public int scopeType;
    public boolean isFlexible;

    public _SearchQuery(String[] airports, int numPassengers, double flyingClass, ArrayList<Date> dates, int searchType, int scopeType, boolean isFlexible) {
        this.airports = airports;
        this.numPassengers = numPassengers;
        this.flyingClass = flyingClass;
        this.dates = dates;
        this.searchType = searchType;
        this.scopeType = scopeType;
        this.isFlexible = isFlexible;
    }

    public String toString(){
        return "[" + Arrays.toString(airports) + ", " + numPassengers + ", "
                + flyingClass + ", " + dates.toString() + ", " + searchType
                + ", " + scopeType + ", " + isFlexible + "]";
    }

    public String[] getAirports() {
        return airports;
    }

    public void setAirports(String[] airports) {
        this.airports = airports;
    }

    public int getNumPassengers() {
        return numPassengers;
    }

    public void setNumPassengers(int numPassengers) {
        this.numPassengers = numPassengers;
    }

    public double getFlyingClass() {
        return flyingClass;
    }

    public void setFlyingClass(double flyingClass) {
        this.flyingClass = flyingClass;
    }

    public ArrayList<Date> getDates() {
        return dates;
    }

    public void setDates(ArrayList<Date> dates) {
        this.dates = dates;
    }

    public int getSearchType() {
        return searchType;
    }

    public void setSearchType(int searchType) {
        this.searchType = searchType;
    }

    public int getScopeType() {
        return scopeType;
    }

    public void setScopeType(int scopeType) {
        this.scopeType = scopeType;
    }

    public boolean isFlexible() {
        return isFlexible;
    }

    public void setFlexible(boolean flexible) {
        isFlexible = flexible;
    }
}
