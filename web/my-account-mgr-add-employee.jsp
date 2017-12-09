<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Add New Employee</span></h3>
    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form action="/my-account/employee/add" method="post" class="uk-form-horizontal uk-margin">

                <input type="hidden" name="new_emp" value="1">

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-email" type="email" name="emailAddress" required placeholder="Customer email address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-old-password">Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-old-password" type="password" name="password_old" placeholder="" required>
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-first-name" type="text" placeholder="" required name="firstName">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-last-name" type="text" placeholder="" required name="lastName">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-phone-number" type="number" placeholder="" required name="mobile">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-address-1" type="text" placeholder="Address" required name="address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-city-town" type="text" placeholder="City/Town" required name="city">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_emp-state" type="text" placeholder="State">--%>
                        <select name="state" id="_emp-state" name="state" required class="uk-select">
                            <option value="">--</option>
                            <%@include file="_state_options.html"%>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-zip-code" type="number" required name="zipCode" placeholder="Zip Code">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: file"></span> &nbsp;&nbsp; Social Security Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-ssn-card"> Social Security Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-ssn-card" name="SSN" type="number" required placeholder="Social Security Number" maxlength="10">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-hourlyPay"> Hourly Pay: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-hourlyPay" name="hourlyPay" type="text" required placeholder="Hourly Pay" maxlength="10">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label"> Manager <input class="uk-checkbox" name="manager" type="checkbox"> </label>
                </div>

                <div class="uk-margin-medium-top uk-text-center">
                    <button class="uk-button uk-button-primary" type="submit">Add</button>
                </div>

            </form>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>