<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Edit Employee</span></h3>
    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form action="/my-account/employee/edit?updateEmp=1" method="post" class="uk-form-horizontal uk-margin">

                <input type="hidden" value="${employee.id}" name="person_id">
                <input type="hidden" value="${employee.employeeId}" name="employee_id">
                
                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-email" type="email" name="emailAddress" required placeholder="Employee email address" value="${employee.emailAddress}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-old-password">Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-old-password" type="password" name="password_old" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-first-name" type="text" placeholder="" required name="firstName" value="${employee.firstName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-last-name" type="text" placeholder="" required name="lastName" value="${employee.lastName}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-startDate">Start Date: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-startDate" type="date" placeholder="" value="${startDate}" disabled>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-rating">Rating: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-rating" type="text" placeholder="" value="${employee.rating}" disabled>
                    </div>
                </div>

                <div class="uk-margin">
                    <c:set var="mobile" value="${employee.phoneNumber}"/>
                    <% Object m2 = pageContext.getAttribute("mobile");
                        if(m2.toString().equals("0"))
                            pageContext.setAttribute("mobile", "");
                        else pageContext.setAttribute("mobile", m2.toString());
                    %>

                    <label class="uk-form-label" for="_emp-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-phone-number" type="number" placeholder="" required name="mobile" value="${mobile}">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-address-1" type="text" placeholder="Address" required name="address" value="${employee.address}">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-city-town" type="text" placeholder="City/Town" required name="city" value="${employee.city}">
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
                    <c:set var="zip" value="${employee.zipCode}"/>
                    <%  m2 = pageContext.getAttribute("zip");
                        if(m2.toString().equals("0"))
                            pageContext.setAttribute("zip", "");
                        else pageContext.setAttribute("zip", m2.toString());
                    %>
                    <label class="uk-form-label" for="_emp-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-zip-code" type="number" required name="zipCode" placeholder="Zip Code" value="${zip}">
                    </div>
                </div>

                <br>
                <c:set var="ssn" value="${employee.SSN}"/>
                <%  m2 = pageContext.getAttribute("ssn");
                    if(m2.toString().equals("0"))
                        pageContext.setAttribute("ssn", "");
                    else pageContext.setAttribute("ssn", m2.toString());
                %>
                <span uk-icon="icon: file"></span> &nbsp;&nbsp; Social Security Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-ssn-card"> Social Security Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-ssn-card" name="SSN" type="number" required placeholder="Social Security Number" maxlength="10" value="${ssn}" >
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-hourlyPay"> Hourly Pay: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_emp-hourlyPay" name="hourlyPay" type="text" required placeholder="Hourly Pay" maxlength="10" ${employee.hourlyPay}>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_emp-hourlyPay2"> Manager : <input class="uk-checkbox" id="_emp-hourlyPay2" name="manager" type="checkbox"> </label>
                </div>

                <div class="uk-margin-medium-top uk-text-center">
                    <button class="uk-button uk-button-primary" type="submit">Update</button>
                </div>

            </form>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>