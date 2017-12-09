<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>My Account</span></h3>
    <C:set value="${sessionScope.get(\"emplyoee\")}" var="emp"/>
    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-cr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form action="/my-account?updateUser=2" method="post" class="uk-form-horizontal uk-margin">
                <c:set var="emp" scope="request" value="${sessionScope.get(\"employee\")}" />

                <input type="hidden" value="${emp.id}" name="person_id">
                <input type="hidden" value="${emp.employeeId}" name="employee_id">

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-email" type="email" name="emailAddress" required placeholder="Your email address" value="${emp.emailAddress}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-old-password">Current Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-old-password" type="password" name="password_old" placeholder="" required>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-new-password">New Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-new-password" type="password" name="pass1" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-new-password-2">Confirm Password </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-new-password-2" type="password" name="pass2" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-first-name" type="text" placeholder=""required  name="firstName" value="${emp.firstName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-last-name" type="text" placeholder=""required  name="lastName" value="${emp.lastName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <c:set var="mob" value="${emp.phoneNumber}"/>
                        <% Object m2 = pageContext.getAttribute("mob");
                            if(m2.toString().equals("0"))
                                pageContext.setAttribute("mob", "");
                            else pageContext.setAttribute("mob", m2.toString());
                        %>
                        <input class="uk-input" id="_cr-phone-number" type="number" placeholder="" required name="mobile" value="<%=pageContext.getAttribute("mob")%>">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-address-1" type="text" placeholder="Address"required  name="address" value="${emp.address}">
                    </div>
                </div>required

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-city-town" type="text" placeholder="City/Town"required  name="city" value="${emp.city}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_cr-state" type="text" placeholder="State">--%>
                        <select name="state" id="_cr-state" name="state" required class="uk-select">
                            <option value="${emp.state}">${emp.state}</option>
                            <option value="">--</option>
                            <%@include file="_state_options.html"%>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <c:set var="zip" value="${emp.zipCode}"/>
                    <% m2 = pageContext.getAttribute("zip");
                        if(m2.toString().equals("0"))
                            pageContext.setAttribute("zip", "");
                        else pageContext.setAttribute("zip", m2.toString());
                    %>
                    <label class="uk-form-label" for="_cr-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-zip-code" type="number" required name="zipCode" placeholder="Zip Code" value="<%=pageContext.getAttribute("zip")%>">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: copy"></span> &nbsp;&nbsp; Social Security

                <div class="uk-margin">
                    <c:set var="ssn" value="${emp.SSN}"/>
                    <% m2 = pageContext.getAttribute("ssn");
                        if(m2.toString().equals("0"))
                            pageContext.setAttribute("ssn", "");
                        else pageContext.setAttribute("ssn", m2.toString());
                    %>
                    <label class="uk-form-label" for="_cr-social-security-number"> Social Security Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-social-security-number" required name="socialSecurityNumber" type="number" placeholder="Social Security Number" maxlength="10" value="<%=pageContext.getAttribute("ssn")%>" >
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