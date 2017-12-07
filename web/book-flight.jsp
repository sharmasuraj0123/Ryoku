<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Book Flight</span></h3>

    <div uk-grid>
        <div class="uk-width-3-4">
            <div class="uk-card uk-card-default uk-card-body">
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <form class="uk-form-horizontal uk-margin">
                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-email">Email: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-email" type="text" placeholder="Your email address">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-first-name">First Name: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-first-name" type="text" placeholder="">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-last-name">Last Name: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-last-name" type="text" placeholder="">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-phone-number">Mobile: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-phone-number" type="text" placeholder="">
                        </div>
                    </div>

                    <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-address-1">Address: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-address-1" type="text" placeholder="Address Line 1">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-address-2"> </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-address-2" type="text" placeholder="Address Line 2">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-city-town"> City / Town</label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-city-town" type="text" placeholder="City/Town">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-state"> State: </label>
                        <div class="uk-form-controls">
                            <%--<input class="uk-input" id="_user-state" type="text" placeholder="State">--%>
                                <select name="state" id="_user-state" class="uk-select">
                                    <option value="NY">NY</option>
                                </select>
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-zip-code"> Zip Code: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-zip-code" type="text" placeholder="Zip Code">
                        </div>
                    </div>

                    <br>
                    <span uk-icon="icon: credit-card"></span> &nbsp;&nbsp; Payment Info

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-credit-card"> Credit Card Number: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-credit-card" type="text" placeholder="Credit Card Number" maxlength="16">
                        </div>
                    </div>

                    <br>
                    <span uk-icon="icon: users"></span> &nbsp;&nbsp; Passenger(s)
                    <ul uk-accordion="multiple : true">
                        <li>
                            <h3 class="uk-accordion-title medium-font"> Passenger 1 </h3>
                            <div class="uk-accordion-content">
                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-first-name">First Name: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-first-name" type="text" placeholder="">
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-last-name">Last Name: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-last-name" type="text" placeholder="">
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-phone-number">Mobile: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-phone-number" type="text" placeholder="">
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-address-1">Address: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-address-1" type="text" placeholder="Address Line 1">
                                    </div>
                                </div>
                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-address-2"> </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-address-2" type="text" placeholder="Address Line 2">
                                    </div>
                                </div>
                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-city-town"> City / Town</label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-city-town" type="text" placeholder="City/Town">
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-state"> State: </label>
                                    <div class="uk-form-controls">
                                        <%--<input class="uk-input" id="_user-state" type="text" placeholder="State">--%>
                                        <select name="state" id="_passenger-1-state" class="uk-select">
                                            <option value="NY">NY</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-1-zip-code"> Zip Code: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-1-zip-code" type="text" placeholder="Zip Code">
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>

                    <hr>

                    <div class="uk-margin-medium-top uk-text-center">
                        <button class="uk-button uk-button-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="sidebar_right.html"%>
    </div>
</div>
<%@include file="footer.jsp"%>