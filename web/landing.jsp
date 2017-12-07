<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file = "header.jsp" %>

<br> <br>
<div class="uk-container">
    <div class="uk-container-large">
        <div class="uk-card uk-card-default uk-card-body uk-width-xxlarge uk-align-center">
            <form action="/find-flights" method="post">
                <input type="hidden" name="flight_search" value="1">
                <h3 class="uk-heading-line uk-text-left"><span>Find Flights</span></h3> <br>
                <center>
                    <label><input name="search_type" value="1" class="uk-radio" onclick="search_type_func(1)" type="radio" checked> One way</label> &nbsp;&nbsp;&nbsp;
                    <label><input name="search_type" value="2" class="uk-radio" onclick="search_type_func(2)" type="radio"> Round Trip</label> &nbsp;&nbsp;&nbsp;
                    <label><input name="search_type" value="3" class="uk-radio" onclick="search_type_func(3)" type="radio"> Multi City</label> &nbsp; | &nbsp;
                    <label><input name="flight_type" value="0" class="uk-radio" onclick="flight_type(0)" type="radio" checked> International </label> &nbsp;&nbsp;&nbsp;
                    <label><input name="flight_type" value="1" class="uk-radio" onclick="flight_type(1)" type="radio"> Domestic</label> &nbsp;&nbsp;&nbsp;
                </center>
                <br><br>
                <div uk-grid>
                    <div class="uk-width-1-3">
                        Flying From: <br>
                        <select name="airport" class="uk-select">
                            <option value="1"> JFK </option>
                            <option value="2"> LGA </option>
                        </select>
                    </div>
                    <div class="uk-width-1-3">
                        <div id="return-airport">Flying To: <br>
                            <select name="airport" id="return-airport-select" class="uk-select">
                                <option value="3"> DEL </option>
                                <option value="4"> BOM </option>
                            </select>
                        </div>
                    </div>

                    <div class="uk-width-1-3">
                        <div id="airport-3">
                            Flying To: <br>
                            <select name="airport" id="airport-3-select" class="uk-select">
                                <option value="3"> DEL </option>
                                <option value="4"> BOM </option>
                            </select>
                        </div>
                    </div>

                    <br><br><br>
                    <div class="uk-width-1-3">
                        Departing: <br>
                        <input type="date" class="uk-input" name="date">
                    </div>
                    <div class="uk-width-1-3">
                        <div id="date-2-containter">Returning: <br>
                        <input type="date" id="date-2" class="uk-input" name="date">
                        </div>
                    </div>

                    <div class="uk-width-1-3">
                    </div>

                    <br><br>

                    <div class="uk-width-1-3">
                        <label class="uk-form-label" for="adults_select">Passengers: </label>
                        <div class="uk-form-controls">
                            <select class="uk-select" name="passenger_count" id="adults_select">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>

                    <%--<div class="uk-width-1-4"></div>--%>

                    <div class="uk-width-1-3">
                        <label class="uk-form-label" for="prefered_class">Preferred Class :</label>
                        <div class="uk-form-controls">
                            <select class="uk-select" name="class" id="prefered_class">
                                <option value="1">Economy Class</option>
                                <option value="2">Business Class</option>
                                <option value="3">First Class</option>
                            </select>
                        </div>
                    </div>

                    <div class="uk-width-1-3"><br>
                        <label class="uk-form-label"><input type="checkbox" name="isFlexible" class="uk-checkbox"> Flexible Dates/Times </label>
                    </div>

                </div>
                <br>
                <button class="uk-button uk-align-center uk-button-primary" type="submit">Search</button>
            </div>
        </form>
        <!--find flights card end-->

        <!-- announcements sections begins-->
        <div class="uk-margin">
            <div uk-grid>
                <div class="uk-width-1-3">
                    <div class="uk-card uk-card-hover uk-card-body">
                        <h3 class="uk-card-title">Primary</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    </div>
                </div>

                <div class="uk-width-1-3">
                    <div class="uk-card uk-card-hover uk-card-body">
                        <h3 class="uk-card-title">Primary</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    </div>
                </div>

                <div class="uk-width-1-3">
                    <div class="uk-card uk-card-hover uk-card-body">
                        <h3 class="uk-card-title">Primary</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file = "footer.jsp" %>