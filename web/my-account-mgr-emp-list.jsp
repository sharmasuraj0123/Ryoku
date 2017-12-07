<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Employee List</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <% int i = 1;%>
            <c:forEach items="${employeeList}" var="emp_list">
            <ul uk-accordion="multiple : true">
                <li>
                    <h3 class="uk-accordion-title small-font"> <%=i++%>. ${emp_list.firstName} ${emp_list.lastName}</h3>
                    <div class="uk-accordion-content uk-text-small">
                        <div class="uk-margin-small">
                            <table class="uk-table uk-background-muted uk-table-small uk-table-divider">
                                <tbody>
                                <tr>
                                    <td>Employee ID: </td>
                                    <td>${emp_list.employeeId}</td>
                                </tr>
                                <tr>
                                    <td>First Name : </td>
                                    <td>${emp_list.firstName}</td>
                                </tr>
                                <tr>
                                    <td>Last Name : </td>
                                    <td>${emp_list.lastName}</td>
                                </tr>
                                <tr>
                                    <td>Email : </td>
                                    <td>${emp_list.emailAddress}</td>
                                </tr>
                                <tr>
                                    <td>Address : </td>
                                    <td>${emp_list.address}</td>
                                </tr>
                                <tr>
                                    <td>City / Town :</td>
                                    <td>${emp_list.city}</td>
                                </tr>
                                <tr>
                                    <td>State : </td>
                                    <td>${emp_list.state}</td>
                                </tr>
                                <tr>
                                    <td>Zip Code</td>
                                    <td>${emp_list.zipCode}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Start Date
                                    </td>
                                    <td>
                                        ${emp_list.startDate}
                                    </td>
                                </tr>
                                <tr>
                                    <td>Hourly Pay</td>
                                    <td>${emp_list.hourlyPay}</td>
                                </tr>
                                <tr>
                                    <td>Social Security Info: </td>
                                    <td>On-File</td>
                                </tr>
                                <tr>
                                    <td>Rating:</td>
                                    <td>&starf; ${emp_list.rating}</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="uk-margin" uk-grid>
                                <div class="uk-width-2-3">
                                    <button class="uk-button uk-button-primary">Reservations</button>
                                </div>
                                <div class="uk-width-1-3 uk-text-right">
                                    <button class="uk-button uk-button-secondary"> <span uk-icon="icon: file-edit"></span> </button>
                                    <button class="uk-button uk-button-danger"> <span uk-icon="icon: trash"></span> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <hr>
            </c:forEach>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>