<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Reservation List - By Flight</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>

        <div class="uk-width-expand">
            <div class="uk-margin">
                <div uk-grid>
                    <div class="uk-width-1-3">
                        <label for="flight-number">Flight Number: </label>
                        <input type="text" id="flight-number" class="uk-input uk-form-width-small uk-form-small uk-form-blank" placeholder="UA 101">
                    </div>
                    <div class="uk-width-1-3">
                        <label for="flight-date">Flight Date: </label>
                        <input type="date" id="flight-date" class="uk-input uk-form-width-small uk-form-small uk-form-blank">
                    </div>
                    <div class="uk-width-1-3 uk-text-right">
                        <button class="uk-button uk-button-default uk-button-small">Get Customers</button>
                    </div>
                </div>
            </div>
            <div class="uk-card uk-card-default uk-card-small uk-card-body">


                <ul uk-accordion="multiple : true">
                    <c:forEach items="${reservations}" var="reservation">
                    <li>
                        <h3 class="uk-accordion-title small-font"> ${reservation.customer.firstName} ${reservation.customer.lastName}</h3>
                        <div class="uk-accordion-content uk-text-small">
                            <div class="uk-margin-small">
                                <table class="uk-table uk-background-muted uk-table-small uk-table-divider">
                                    <tbody>
                                        <c:forEach items="${reservation.pasengerList}" var="passenger">
                                        <tr>
                                            <td>${passenger.firstName} ${passenger.lastName}</td>
                                            <td class="uk-text-center">Meal Type : ${passenger.mealPref}</td>
                                            <td class="uk-text-right">Seat Number : ${passenger.seat_num}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </li>

                    </c:forEach>

                </ul>

            </div>
        </div>

    </div>
</div>

<%@include file="footer.jsp"%>