<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Admin Account</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>

        <div class="uk-width-expand">
            <form action="/my-account?updateUser=2" method="post" class="uk-form-horizontal uk-margin">
                <c:set var="emp" scope="request" value="${sessionScope.get(\"employee\")}" />

                <input type="hidden" value="${emp.id}" name="person_id">
                <input type="hidden" value="${emp.employeeId}" name="employee_id">

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-email" type="email" name="emailAddress" required placeholder="Your email address" value="${emp.emailAddress}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-old-password">Current Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-old-password" type="password" name="password_old" placeholder="" required>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-new-password">New Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-new-password" type="password" name="pass1" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-new-password-2">Confirm Password </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-new-password-2" type="password" name="pass2" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-first-name" type="text" placeholder="" name="firstName" value="${emp.firstName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-last-name" type="text" placeholder="" name="lastName" value="${emp.lastName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <c:set var="mob" value="${emp.phoneNumber}"/>
                        <% Object m2 = pageContext.getAttribute("mob");
                            if(m2.toString().equals("0"))
                                pageContext.setAttribute("mob", "");
                            else pageContext.setAttribute("mob", m2.toString());
                        %>
                        <input class="uk-input" id="_mgr-phone-number" type="text" placeholder="" name="mobile" value="<%=pageContext.getAttribute("mob")%>">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-address-1" type="text" placeholder="Address" name="address" value="${emp.address}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-city-town" type="text" placeholder="City/Town" name="city" value="${emp.city}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_mgr-state" type="text" placeholder="State">--%>
                        <select name="state" id="_mgr-state" name="state" class="uk-select">
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
                    <label class="uk-form-label" for="_mgr-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-zip-code" type="text" name="zipCode" placeholder="Zip Code" value="<%=pageContext.getAttribute("zip")%>">
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
                    <label class="uk-form-label" for="_mgr-social-security-number"> Social Security Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-social-security-number" name="socialSecurityNumber" type="text" placeholder="Social Security Number" maxlength="10" value="<%=pageContext.getAttribute("ssn")%>" >
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