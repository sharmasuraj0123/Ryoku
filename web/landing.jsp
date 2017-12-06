<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file = "header.html" %>

<br> <br>
<div class="uk-container">
    <div class="uk-container-large">
        <div class="uk-card uk-card-default uk-card-body uk-width-xxlarge uk-align-center">
            <!--<b>Find Flights </b><br> <br>-->
            <h3 class="uk-heading-line uk-text-left"><span>Find Flights</span></h3> <br>
            <center>
                <label><input name="seach_type" class="uk-radio" type="radio" checked> One way</label> &nbsp;&nbsp;&nbsp;
                <label><input name="seach_type" class="uk-radio" type="radio"> Round Trip</label> &nbsp;&nbsp;&nbsp;
                <label><input name="seach_type" class="uk-radio" type="radio"> Multi City</label> &nbsp; | &nbsp;
                <label><input name="flight_type" class="uk-radio" type="radio" checked> International </label> &nbsp;&nbsp;&nbsp;
                <label><input name="flight_type" class="uk-radio" type="radio"> Domestic</label> &nbsp;&nbsp;&nbsp;
            </center>
            <br><br>
            <div uk-grid>
                <div class="uk-width-1-3">
                    Flying From: <br>
                    <select class="uk-select">
                        <option> JFK </option>
                        <option> LGA </option>
                    </select>
                </div>
                <div class="uk-width-1-3">
                    Flying To: <br>
                    <select class="uk-select">
                        <option> DEL </option>
                        <option> BOM </option>
                    </select>
                </div>

                <div class="uk-width-1-3"> </div>

                <br><br><br>
                <div class="uk-width-1-3">
                    Departing: <br>
                    <input type="date" class="uk-input" name="deptarting_date">
                </div>
                <div class="uk-width-1-3">
                    Returning: <br>
                    <input type="date" class="uk-input" name="returning_date">
                </div>

                <div class="uk-width-1-3">
                </div>

                <br><br>

                <div class="uk-width-1-3">
                    <label class="uk-form-label" for="adults_select">Passengers: </label>
                    <div class="uk-form-controls">
                        <select class="uk-select" id="adults_select">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                </div>

                <%--<div class="uk-width-1-4"></div>--%>

                <div class="uk-width-1-3">
                    <label class="uk-form-label" for="prefered_class">Preferred Class :</label>
                    <div class="uk-form-controls">
                        <select class="uk-select" id="prefered_class">
                            <option>Economy Class</option>
                            <option>Business Class</option>
                            <option>First Class</option>
                        </select>
                    </div>
                </div>

                <div class="uk-width-1-3"><br>
                    <label class="uk-form-label"><input type="checkbox" class="uk-checkbox"> Flexible Dates/Times </label>
                </div>

            </div>
            <br>
            <button class="uk-button uk-align-center uk-button-primary">Search</button>
        </div>

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

<%@ include file = "footer.html" %>