<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Add New Customer</span></h3>
    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-cr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form action="/my-account/customer/add" method="post" class="uk-form-horizontal uk-margin">

                <input type="hidden" name="new_cust" value="1">

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-email" type="email" name="emailAddress" required placeholder="Customer email address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-old-password">Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-old-password" type="password" name="password_old" placeholder="" required>
                    </div>
                </div>


                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-first-name" type="text" placeholder="" name="firstName">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-last-name" type="text" placeholder="" name="lastName">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-phone-number" type="number" placeholder="" name="mobile">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-address-1" type="text" placeholder="Address" name="address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-city-town" type="text" placeholder="City/Town" name="city">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_cust-state" type="text" placeholder="State">--%>
                        <select name="state" id="_cust-state" name="state" class="uk-select">
                            <option value="">--</option>
                            <%@include file="_state_options.html"%>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-zip-code" type="number" name="zipCode" placeholder="Zip Code">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: credit-card"></span> &nbsp;&nbsp; Credit Card Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cust-credit-card"> Credit Card Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cust-credit-card" name="creditCard" type="number" placeholder="Credit Card Number" maxlength="16">
                    </div>
                </div>

                <div class="uk-margin-medium-top uk-text-center">
                    <button class="uk-button uk-button-primary" type="submit">Add</button>
                </div>

            </form>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>