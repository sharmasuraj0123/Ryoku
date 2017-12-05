<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>

<br> <br>
<div class="uk-container">
    <h4 class="uk-heading-line uk-text-center"> <span>Search Results</span></h4>

    <div uk-grid>
        <div class="uk-width-1-4">
            <div class="uk-card uk-card-primary uk-card-body uk-animation-slide-left-small">
                <h4 class="uk-heading-line uk-text-left"> <span>Modify Search</span></h4>

                <label class="uk-form-label"><input name="seach_type" class="uk-radio" type="radio" checked> One way</label>
                <br>
                <label class="uk-form-label"><input name="seach_type" class="uk-radio" type="radio"> Round Trip</label>
                <br>
                <label class="uk-form-label"><input name="seach_type" class="uk-radio" type="radio"> Multi City</label>

                <div class="uk-margin">
                    <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> From:</label>
                    <select class="uk-select">
                        <option> JFK </option>
                        <option> LGA </option>
                    </select>
                </div>


                <div class="uk-margin">
                    <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> To:</label><br>
                    <select class="uk-select">
                        <option> DEL </option>
                        <option> BOM </option>
                    </select>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label">Departing:</label> <br>
                    <input type="date" class="uk-input" name="deptarting_date">
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label">Returning:</label> <br>
                    <input type="date" class="uk-input" name="returning_date">
                </div>

                <div class="uk-margin">
                    <div class="uk-grid">
                        <div class="uk-width-1-1">
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

                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="prefered_class">Preferred Class:</label>
                    <div class="uk-form-controls">
                        <select class="uk-select" id="prefered_class">
                            <option>Economy Class</option>
                            <option>Business Class</option>
                            <option>First Class</option>
                        </select>
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label"><input type="checkbox" class="uk-checkbox"> Flexible Dates/Times </label>
                </div>
                <button class="uk-align-center uk-button uk-button-default uk-button-small">Update</button>
            </div>
            <div class="uk-margin">
                <hr class="uk-divider-icon">
            </div>
        </div>



        <div class="uk-width-3-4">
            <div class="uk-margin">
                <ul class="uk-breadcrumb">
                    <li><a>Non Stop</a></li>
                    <li><span>All Flights</span></li>
                </ul>
            </div>
                <div class="uk-card uk-card-default uk-card-body">
                    <div class="uk-margin">
                        <div class="uk-grid-small" uk-grid>
                            <div class="uk-width-expand">
                                <span class="uk-text-bold">American Airlines</span>
                            </div>
                            <div class="uk-width-auto">
                                $ <b>999</b>&nbsp;<sup>.00</sup>
                            </div>
                        </div>
                        <div class="uk-grid-small" uk-grid>
                            <div class="uk-width-1-3 uk-text-small">
                                09:00 &ndash; 23:00
                            </div>
                            <div class="uk-width-1-3 uk-text-small">
                                <span class="uk-align-center">18h 30m</span>
                            </div>
                            <div class="uk-width-expand">
                                <button class="uk-align-right uk-button uk-button-secondary uk-button-small"> Select </button>
                            </div>
                        </div>
                        <ul uk-accordion>
                            <li>
                                <h3 class="uk-accordion-title small-font"> More Details</h3>
                                <div class="uk-accordion-content">
                                    <button class="uk-button uk-align-center uk-button-small uk-button-link"> Reverse Auction this flight </button>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <hr>

                    <div class="uk-margin">
                        <div class="uk-grid-small" uk-grid>
                            <div class="uk-width-expand">
                                <span class="uk-text-bold">American Airlines</span>
                            </div>
                            <div class="uk-width-auto">
                                $ <b>999</b>&nbsp;<sup>.00</sup>
                            </div>
                        </div>
                        <div class="uk-grid-small" uk-grid>
                            <div class="uk-width-1-3 uk-text-small">
                                09:00 &ndash; 23:00
                            </div>
                            <div class="uk-width-1-3 uk-text-small">
                                <span class="uk-align-center">18h 30m</span>
                            </div>
                            <div class="uk-width-expand">
                                <button class="uk-align-right uk-button uk-button-secondary uk-button-small"> Select </button>
                            </div>
                        </div>
                        <ul uk-accordion>
                            <li>
                                <h3 class="uk-accordion-title small-font"> More Details</h3>
                                <div class="uk-accordion-content">
                                    <button class="uk-button uk-align-center uk-button-small uk-button-link"> Reverse Auction this flight </button>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>

        </div>
    </div>

</div>

<%@include file="footer.html"%>