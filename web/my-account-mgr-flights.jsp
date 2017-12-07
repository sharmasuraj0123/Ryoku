<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Flight List</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>

        <div class="uk-width-expand">
            <div class="uk-margin">
                <div uk-grid>
                    <div class="uk-width-3-4">
                        <ul class="uk-breadcrumb">
                            <li><a href="#">All Flights</a></li>
                            <li><a href="#">Scheduled</a></li>
                            <li><a href="#">On TIme</a></li>
                            <li><a href="#" class="uk-text-muted hover-black">Delayed</a></li>
                        </ul>
                    </div>
                    <div class="uk-width-1-4">
                        <select class="uk-select uk-form-small">
                            <option>Airports: All</option>
                            <option>DEL</option>
                            <option>JFK</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="uk-card uk-card-default uk-card-small uk-card-body">
                <c:forEach items="${flights}" var="flight">
                <div class="uk-margin">
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3">
                            <span class="uk-text-bold"> ${flight.airlineName}</span> <br>
                            <span class="uk-text-small uk-text-muted"> ${flight.airline} </span>
                        </div>
                        <div class="uk-width-1-3 uk-text-center">
                            <span> ${flight.departureAirport} <span uk-icon="icon: arrow-right"></span> ${flight.arrivalAirport}  </span> <br>
                            <span class="small-font">${flight.departureAirport_ob.city} - ${flight.arrivalAirport_ob.city}</span>
                        </div>
                        <div class="uk-width-1-3 uk-text-right">
                            $ <b>${flight.base_fare}</b>&nbsp;<sup>.00</sup>
                        </div>
                    </div>
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3 uk-text-small">
                            <span class="uk-badge">M</span> T W <span class="uk-badge">T</span> <span class="uk-badge">F</span> S S
                            <div class="uk-margin-small">
                                ${flight.dTime} &ndash; ${flight.aTime} <span class="uk-text-danger"> +1</span>
                            </div>
                        </div>
                        <div class="uk-width-1-3 uk-text-center uk-text-small">
                            <span class="uk-align-center">18h 30m</span>
                        </div>
                        <div class="uk-width-expand uk-text-right">
                            <label class="uk-label uk-label-default"> Scheduled </label>
                        </div>
                    </div>
                </div>
                <hr>
                </c:forEach>
                <div class="uk-margin">
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3">
                            <span class="uk-text-bold">American Airlines</span> <br>
                            <span class="uk-text-small uk-text-muted"> AA 101 </span>
                        </div>
                        <div class="uk-width-1-3 uk-text-center">
                            <span> JFK <span uk-icon="icon: arrow-right"></span> DEL  </span> <br>
                            <span class="small-font">New York - New Delhi</span>
                        </div>
                        <div class="uk-width-1-3 uk-text-right">
                            <span class="uk-text-muted"> $999</span>
                            <span class="uk-text-primary">
                                 $<b>700</b>&nbsp;<sup>.00</sup>
                            </span>
                        </div>
                    </div>
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3 uk-text-small">
                            <span class="uk-badge">M</span> T W <span class="uk-badge">T</span> <span class="uk-badge">F</span> S S
                            <div class="uk-margin-small">
                                09:00 &ndash; 23:00 <span class="uk-text-danger"> +1</span>
                            </div>
                        </div>
                        <div class="uk-width-1-3 uk-text-center uk-text-small">
                            <span class="uk-align-center">18h 30m</span>
                        </div>
                        <div class="uk-width-expand uk-text-right">
                            <label class="uk-label uk-label-success"> On Time </label> <label class="uk-label uk-label-warning"> Delayed </label>
                        </div>
                    </div>
                </div>
                <div class="uk-margin-small"></div>
            </div>
        </div>

    </div>
</div>

<%@include file="footer.jsp"%>