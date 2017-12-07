<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Customer List</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <% if ((int)session.getAttribute("person_type") == 1){%>
                <%@include file="my-account-cr-sidebar.html"%>
            <%} else if ((int)session.getAttribute("person_type") == 2) { %>
                <%@include file="my-account-mgr-sidebar.html"%>
            <%}%>
        </div>
        <div class="uk-width-expand">
            <% int i = 1;%>
            <c:forEach items="${CustomerList}" var="cust_list">
            <ul uk-accordion>
                <li>
                    <h3 class="uk-accordion-title small-font"> <%= i++ %>. ${cust_list.firstName} ${cust_list.lastName} </h3>
                    <div class="uk-accordion-content uk-text-small">
                        <div class="uk-margin-small">
                            <table class="uk-table uk-background-muted uk-table-small uk-table-divider">
                                <tbody>
                                <tr>
                                    <td>
                                        Customer ID:
                                    </td>
                                    <td>${cust_list.accountNumber}</td>
                                </tr>
                                <tr>
                                    <td>First Name : </td>
                                    <td>${cust_list.firstName}</td>
                                </tr>
                                <tr>
                                    <td>Last Name : </td>
                                    <td>${cust_list.lastName}</td>
                                </tr>
                                <tr>
                                    <td>Email : </td>
                                    <td>${cust_list.emailAddress}</td>
                                </tr>
                                <tr>
                                    <td>Address : </td>
                                        <td>${cust_list.address}</td>
                                </tr>
                                <tr>
                                    <td>City / Town :</td>
                                    <td>${cust_list.city}</td>
                                </tr>
                                <tr>
                                    <td>State : </td>
                                    <td>${cust_list.state}</td>
                                </tr>
                                <tr>
                                    <td>Zip Code</td>
                                    <td>${cust_list.zipCode}</td>
                                </tr>
                                <tr>
                                    <td>Account Since</td>
                                    <td>${cust_list.dateCreated}</td>
                                </tr>
                                <tr>
                                    <td>Payment Info: </td>
                                    <td>On-File</td>
                                </tr>
                                <tr>
                                    <td>Rating: </td>
                                    <td>&starf; ${cust_list.ratings} </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="uk-margin" uk-grid>
                                <div class="uk-width-2-3">
                                    <button class="uk-button uk-button-primary">Create Reservation</button>
                                    <a href="/my-account/customer/list/reservation?id=${cust_list.id}" class="uk-button uk-button-primary">Reservations</a>
                                </div>
                                <div class="uk-width-1-3 uk-text-right">
                                    <a href="/my-account/customer/edit?id=${cust_list.id}" class="uk-button uk-button-secondary"> <span uk-icon="icon: file-edit"></span> </a>
                                    <a href="/my-account/customer/delete?id=${cust_list.id}" class="uk-button uk-button-danger"> <span uk-icon="icon: trash"></span> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            <hr>
            </ul>
            </c:forEach>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>