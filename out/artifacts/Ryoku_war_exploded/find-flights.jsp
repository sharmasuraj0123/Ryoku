<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br> <br>
<div class="uk-container">
    <h4 class="uk-heading-line uk-text-center"> <span>Search Results</span></h4>

    < <div uk-grid>
        <div class="uk-width-1-4">
            <form action="/find-flights" method="post">
                <div class="uk-card uk-card-primary uk-card-body uk-animation-slide-left-small">
                    <h4 class="uk-heading-line uk-text-left"> <span>Modify Search</span></h4>

                    <label class="uk-form-label"><input name="seach_type" value="1" class="uk-radio" type="radio" checked> One way</label>
                    <br>
                    <label class="uk-form-label"><input name="seach_type" value="2" class="uk-radio" type="radio"> Round Trip</label>
                    <br>
                    <label class="uk-form-label"><input name="seach_type" value="3" class="uk-radio" type="radio"> Multi City</label>
                    <br><br>
                    <label class="uk-form-label"><input name="flight_type" value="0" class="uk-radio" type="radio" checked> International</label>
                    <br>
                    <label class="uk-form-label"><input name="flight_type" value="1" class="uk-radio" type="radio"> Domestic</label>

                    <div class="uk-margin">
                        <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> From:</label>
                        <select  name="airport" class="uk-select">
                            <option value="1" > JFK </option>
                            <option value="2" > LGA </option>
                        </select>
                    </div>


                    <div class="uk-margin">
                        <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> To:</label><br>
                        <select  name="airport" class="uk-select">
                            <option value="3" > DEL </option>
                            <option value="4" > BOM </option>
                        </select>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label">Departing:</label> <br>
                        <input type="date" class="uk-input" name="date">
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label">Returning:</label> <br>
                        <input type="date" class="uk-input" name="date">
                    </div>

                    <div class="uk-margin">
                        <div class="uk-grid">
                            <div class="uk-width-1-1">
                                <label class="uk-form-label" for="adults_select">Passengers: </label>
                                <div class="uk-form-controls">
                                    <select class="uk-select" id="adults_select" name="passenger_count">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label" for="prefered_class">Preferred Class:</label>
                        <div class="uk-form-controls">
                            <select class="uk-select" name="class"  id="prefered_class">
                                <option value="0" >Economy Class</option>
                                <option value="1" >Business Class</option>
                                <option value="2" >First Class</option>
                            </select>
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label"><input type="checkbox" class="uk-checkbox" name="isFlexible"> Flexible Dates/Times </label>
                    </div>
                    <button class="uk-align-center uk-button uk-button-default uk-button-small" type="submit">Update</button>
                </div>
                <div class="uk-margin">
                    <hr class="uk-divider-icon">
                </div>
            </form>
        </div>



        <div class="uk-width-3-4">
            <div class="uk-margin">
                <ul class="uk-breadcrumb">
                    <li><a>Non Stop</a></li>
                    <li><span>All Flights</span></li>
                </ul>
            </div>

            <div class="uk-card uk-card-default uk-card-small uk-card-body">
                <c:forEach items="${flightBlocks}" var="flight_block">
                    <div class="uk-margin">
                        <%--<div class="uk-grid-small" uk-grid>--%>
                            <%--<div class="uk-width-1-3">--%>
                                <%--<span class="uk-text-bold"> ${legs.airlineName} </span><br>--%>
                                <%--<span class="uk-text-small uk-text-muted"> ${legs.airline} ${legs.flight_number} </span>--%>
                            <%--</div>--%>
                            <%--<div class="uk-width-1-3 uk-text-center">--%>
                                <%--<span> ${legs.departureAirport_ob.name} <span uk-icon="icon: arrow-right"></span> ${legs.arrivalAirport_ob.name} </span> <br>--%>
                                <%--<span class="small-font">${legs.departureAirport_ob.city} - ${legs.arrivalAirport_ob.city}</span>--%>
                            <%--</div>--%>
                            <%--<div class="uk-width-1-3 uk-text-right">--%>
                                <%--$ <b>${flight_block.price}</b>&nbsp;<sup>.00</sup>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="uk-margin-small">
                            <div class="uk-grid-small" uk-grid>
                                <div class="uk-width-1-3">
                                    <c:set value="${flightBlocks[0].flightlegs[0]}" var="f1"/>
                                    <span class="bold">${f1.airlineName}</span>
                                </div>
                                <div class="uk-width-1-3 uk-text-center">
                                    <span> ${srcAirport.name} <span uk-icon="icon: arrow-right"></span> ${destAirport.name}  </span> <br>
                                    <span class="small-font">${srcAirport.city} - ${destAirport.city}</span>
                                </div>
                                <div class="uk-width-1-3 uk-text-right">
                                    $ <b>${flight_block.price}</b>&nbsp;<sup>.00</sup>
                                </div>
                            </div>
                        </div>
                    <div class="uk-grid-small" uk-grid>
                            <div class="uk-width-1-3 uk-text-small">
                                <%--${legs.dTime} &ndash; ${legs.aTime} <br>--%>
                                <%--${legs.d_date}--%>
                            </div>
                            <div class="uk-width-1-3 uk-text-center uk-text-small">
                                <span class="uk-align-center">${flight_block.hours}h ${flight_block.minutes}m</span>
                            </div>
                            <div class="uk-width-expand">
                                <button class="uk-align-right uk-button uk-button-secondary uk-button-small"> Select </button>
                            </div>
                        </div>
                    <c:forEach items="${flight_block.flightlegs}" var="legs">
                        <ul uk-accordion>
                            <li>
                                <h3 class="uk-accordion-title small-font"> More </h3>
                                <div class="uk-accordion-content">
                                    <div class="uk-margin-small" uk-grid>
                                        <div class="uk-width-1-3 uk-text-small">
                                            Reverse Auction
                                        </div>
                                        <div class="uk-width-1-3 uk-text-small">
                                            Your Price: <input type="text" class="uk-input uk-form-width-small uk-form-blank uk-form-small" placeholder="$">
                                        </div>
                                        <div class="uk-width-1-3 uk-text-small uk-text-right">
                                            <button class="uk-button uk-button-small uk-button-default"> <span class="uk-text-primary">Bid</span></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </c:forEach>
                    </div>

                    <hr>
                </c:forEach>
                    <%--<div class="uk-margin">--%>
                        <%--<div class="uk-grid-small" uk-grid>--%>
                            <%--<div class="uk-width-1-3">--%>
                                <%--<span class="uk-text-bold">American Airlines</span><br>--%>
                                <%--<span class="uk-text-small uk-text-muted"> AA 101 </span>--%>
                            <%--</div>--%>
                            <%--<div class="uk-width-1-3 uk-text-center">--%>
                                <%--<span> JFK <span uk-icon="icon: arrow-right"></span> DEL  </span> <br>--%>
                                <%--<span class="small-font">New York - New Delhi</span>--%>
                            <%--</div>--%>
                            <%--<div class="uk-width-1-3 uk-text-right">--%>
                                <%--$ <b>999</b>&nbsp;<sup>.00</sup>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="uk-grid-small" uk-grid>--%>
                            <%--<div class="uk-width-1-3 uk-text-small">--%>
                                <%--09:00 &ndash; 23:00 <span class="uk-text-danger"> +1</span> <br>--%>
                                <%--December 21, 2017--%>
                            <%--</div>--%>
                            <%--<div class="uk-width-1-3 uk-text-center uk-text-small">--%>
                                <%--<span class="uk-align-center">18h 30m</span>--%>
                            <%--</div>--%>
                            <%--<div class="uk-width-expand">--%>
                                <%--<button class="uk-align-right uk-button uk-button-secondary uk-button-small"> Select </button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<ul uk-accordion>--%>
                            <%--<li>--%>
                                <%--<h3 class="uk-accordion-title small-font"> More </h3>--%>
                                <%--<div class="uk-accordion-content">--%>
                                    <%--<div class="uk-margin-small" uk-grid>--%>
                                        <%--<div class="uk-width-1-3 uk-text-small">--%>
                                            <%--Reverse Auction--%>
                                        <%--</div>--%>
                                        <%--<div class="uk-width-1-3 uk-text-small">--%>
                                            <%--Your Price: <input type="text" class="uk-input uk-form-width-small uk-form-blank uk-form-small" placeholder="$">--%>
                                        <%--</div>--%>
                                        <%--<div class="uk-width-1-3 uk-text-small uk-text-right">--%>
                                            <%--<button class="uk-button uk-button-small uk-button-default"> <span class="uk-text-primary">Bid</span></button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                </div>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>