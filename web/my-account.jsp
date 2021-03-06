<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Account Settings</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form method="post" action="/my-account?updateUser=1" class="uk-form-horizontal uk-margin">
                <input type="hidden" value="${sessionScope.get("customer").id}" name="person_id">
                <input type="hidden" value="${sessionScope.get("customer").accountNumber}" name="customer_id">

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-email" type="text" required name="emailAddress"  placeholder="Your email address" value="${sessionScope.get("customer").emailAddress}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-old-password">Current Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-old-password" required name="password_old" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-new-password">New Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-new-password" name="password_1" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-new-password-2">Confirm Password </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-new-password-2" name="password_2" type="password" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-first-name" type="text"  name="firstName" placeholder="" value="${sessionScope.get("customer").firstName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-last-name" type="text"  name="lastName" placeholder="" value="${sessionScope.get("customer").lastName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-phone-number">Mobile: </label>
                    <div class="uk-form-controls">

                        <c:set var="mobile" value="${sessionScope.get(\"customer\").phoneNumber}"/>
                        <% Object mob = pageContext.getAttribute("mobile");
                           if (mob.toString().equals("0")){
                               %>
                        <input class="uk-input" id="_user-phone-number" type="text"  name="mobile" placeholder="Mobile Number" value="">
                        <%
                           } else {
                        %>
                        <input class="uk-input" id="_user-phone-number" type="text"  name="mobile" placeholder="Mobile Number" value="${sessionScope.get("customer").phoneNumber}">
                        <% } %>
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-address-1" type="text"  name="address" placeholder="Address" value="${sessionScope.get("customer").address}">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-city-town" type="text"  name="city" placeholder="City/Town" value="${sessionScope.get("customer").city}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_user-state" type="text" placeholder="State">--%>
                        <select name="state" id="_user-state" name="state" class="uk-select">
                            <option value="${sessionScope.get("customer").state}">${sessionScope.get("customer").state}</option>
                            <option value="">--</option>
                            <%@include file="_state_options.html"%>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <c:set var="zip" value="${sessionScope.get(\"customer\").zipCode}"/>
                        <% Object m2 = pageContext.getAttribute("zip");
                            if(m2.toString().equals("0"))
                                pageContext.setAttribute("zip", "");
                            else pageContext.setAttribute("zip", m2.toString());
                        %>
                        <input class="uk-input" id="_user-zip-code" type="text" placeholder="Zip Code" name="zipCode" value="<%= pageContext.getAttribute("zip")%>">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: credit-card"></span> &nbsp;&nbsp; Payment Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-credit-card"> Credit Card Number: </label>
                    <div class="uk-form-controls">
                        <c:set var="cc" value="${sessionScope.get(\"customer\").creditCardNumber}"/>
                        <% Object cc = pageContext.getAttribute("zip");
                            if(cc.toString().equals("0"))
                                pageContext.setAttribute("cc", "");
                            else pageContext.setAttribute("cc", cc.toString());
                        %>
                        <input class="uk-input" id="_user-credit-card" type="text" placeholder="Credit Card Number" name="creditCard" maxlength="16" value="<%= pageContext.getAttribute("cc")%>">
                    </div>
                </div>

                <div class="uk-margin-medium-top uk-text-center">
                    <button class="uk-button uk-button-primary" type="submit">Update</button>
                </div>

            </form>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>