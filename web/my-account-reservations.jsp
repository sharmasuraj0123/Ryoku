<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>My Reservations</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-sidebar.html"%>
        </div>

        <div class="uk-width-expand">
            <div class="uk-margin">
                <div class="uk-card uk-card-default uk-card-small uk-card-body">
                    <c:forEach items="${reservations}" var="reservation">
                        <div class="uk-margin-small">
                            <div class="uk-grid-small" uk-grid>
                                <div class="uk-width-1-3">
                                    Reservation ID: <span class="bold"> ${reservation.reservation_id}</span>
                                </div>
                                <div class="uk-width-1-3 uk-text-center">
                                    <span> $ ${reservation.total_fare}   </span>

                                </div>
                                <div class="uk-width-1-3 uk-text-right">
                                        ${reservation.dateCreated}  <br>
                                        ${reservation.numOfPassengers} passenger
                                </div>
                                    <%--<div class="uk-width-1-3 uk-text-right">--%>
                                    <%--09:00 &ndash; 23:00 <span class="uk-text-danger"> +1 </span> <br>--%>
                                    <%--December 21, 2017--%>
                                    <%--</div>--%>
                            </div>
                        </div>

                        <ul uk-accordion="multiple : true">
                            <c:forEach items="${reservation.flights}" var="flight">
                                <c:forEach items="${flight.flightlegs}" var="leg">
                                    <li>
                                        <h3 class="uk-accordion-title small-font"> Details </h3>
                                        <div class="uk-accordion-content">
                                            <hr>
                                            <div class="uk-margin-small">
                                                <div class="uk-grid-small" uk-grid>
                                                    <div class="uk-text-left uk-width-1-3 uk-text-small">
                                                            ${leg.airline}  &nbsp; <span class="uk-text-muted" uk-icon="icon: chevron-right"></span> &nbsp; ${leg.departureAirport_ob.name} <span uk-icon="icon: arrow-right"></span> ${leg.arrivalAirport_ob.name}  <br>
                                                        <span> ${leg.hours}h ${leg.minutes}m</span>
                                                    </div>
                                                    <div class="uk-width-1-3 uk-text-center uk-text-small">
                                                            ${leg.dTime} &ndash; ${leg.aTime} <span class="uk-text-danger"></span> <br>
                                                            ${leg.d_date}
                                                    </div>
                                                        <%--<div class="uk-width-expand uk-text-right">--%>
                                                        <%--${flight_serach.price}&nbsp;<sup>.00</sup>--%>
                                                        <%--</div>--%>
                                                </div>

                                                <c:forEach items="${reservation.pasengerList}" var="passenger">
                                                    <div class="uk-margin-medium-top">
                                                        <div class="uk-margin-small" uk-grid>
                                                            <div class="uk-width-1-3">
                                                                <h3 class="small-font uk-text-muted"> ${passenger.firstName} ${passenger.lastName}</h3>
                                                            </div>
                                                            <div class="uk-width-1-3 uk-text-center">
                                                                <h3 class="small-font uk-text-muted"> Meal Type: ${passenger.mealPref}  </h3>
                                                            </div>
                                                            <div class="uk-width-1-3 uk-text-right">
                                                                <span class="small-font uk-text-muted"> Seat :</span> &nbsp;
                                                                <button class="uk-button-text uk-button"><span class="uk-text-muted">${passenger.seat_num}</span></button>&nbsp;
                                                                <span class="small-font uk-text-muted"> ${passenger.travelClass} </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                            <hr>

                                        </div>
                                    </li>

                                </c:forEach>
                            </c:forEach>
                        </ul>
                    </c:forEach>
                </div>
                <%-- Card 1 End--%>
                <div class="uk-card uk-card-default uk-card-small uk-card-body">
                </div>
                <%--<h3 class="uk-heading-line uk-text-center uk-text-muted small-font"> <span>Past</span></h3>--%>
                <div class="uk-card uk-card-default uk-card-small uk-card-body">
                </div>
            </div>

        </div>

    </div>
</div>

<%@include file="footer.jsp"%>