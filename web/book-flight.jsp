<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Book Flight</span></h3>

    <div uk-grid>
        <div class="uk-width-3-4">
            <div class="uk-card uk-card-default uk-card-body">
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <form class="uk-form-horizontal uk-margin" method="post" action="/confirm-reservation">
                    <input type="hidden" value="1" name="in-progress">
                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-email">Email: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-email" type="text" placeholder="Your email address" name="emailAddress" required value="${customer_data.emailAddress}">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-first-name">First Name: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-first-name" type="text" placeholder="" required name="firstName" value="${customer_data.firstName}">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-last-name">Last Name: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-last-name" type="text" placeholder="" required name="lastName" value="${customer_data.lastName}">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-phone-number">Mobile: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-phone-number" type="text" placeholder="" required name="phoneNumber" value="${customer_data.phoneNumber}">
                        </div>
                    </div>

                    <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-address-1">Address: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-address-1" type="text" placeholder="Address" required name="address" value="${customer_data.address}">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-city-town"> City / Town</label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-city-town" type="text" placeholder="City/Town" required name="city" value="${customer_data.city}">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-state"> State: </label>
                        <div class="uk-form-controls">
                            <%--<input class="uk-input" id="_user-state" type="text" placeholder="State">--%>
                                <select name="state" id="_user-state" class="uk-select" required name="state" value="${customer_data.state}">
                                    <option value="NY">NY</option>
                                </select>
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-zip-code"> Zip Code: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-zip-code" type="text" placeholder="Zip Code" required name="zipCode" value="${customer_data.zipCode}">
                        </div>
                    </div>

                    <br>
                    <span uk-icon="icon: credit-card"></span> &nbsp;&nbsp; Payment Info

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_user-credit-card"> Credit Card Number: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_user-credit-card" type="text" placeholder="Credit Card Number" maxlength="16" required name="creditCardNumber" value="${customer_data.creditCardNumber}">
                        </div>
                    </div>

                    <br>
                    <span uk-icon="icon: users"></span> &nbsp;&nbsp; Passenger(s)
                    <ul uk-accordion="multiple : true">
                        <%
                            int x = 1;
                            Object o = request.getAttribute("passenger_count");
                            if (o != null)
                                x = (Integer) Integer.parseInt((String) o);
                            if (x < 0) x = 1;
                            for (int i = 1; i <= x; i++){
                        %>
                        <li>
                            <h3 class="uk-accordion-title medium-font"> Passenger <%=i%> </h3>
                            <div class="uk-accordion-content">
                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-<%=i%>-first-name">First Name: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-<%=i%>-first-name"  name="passenger_firstName" required type="text" placeholder="${customer_data.firstName}">
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-<%=i%>-last-name">Last Name: </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" id="_passenger-<%=i%>-last-name" name="passenger_lastName" required type="text" placeholder="${customer_data.lastName}">
                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-<%=i%>-meal">Meal Preference: </label>
                                    <div class="uk-form-controls">
                                        <select name="meal_preference" id="_passenger-<%=i%>-meal" class="uk-select">
                                            <option value="nane">None</option>
                                            <option value="Vegan">Vegan</option>
                                            <option value="Fruits">Fruits</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="uk-margin">
                                    <label class="uk-form-label" for="_passenger-<%=i%>-seat">Seat Preference: </label>
                                    <div class="uk-form-controls">
                                        <select name="seat_preference" class="uk-select" id="_passenger-<%=i%>-seat">
                                            <option value="none">None</option>
                                            <option value="aisle">Aisle</option>
                                            <option value="window">Window</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </li>
                        <hr>
                        <%
                            }
                        %>
                    </ul>



                    <div class="uk-margin-medium-top uk-text-center">
                        <button class="uk-button uk-button-primary" type="submit">Confirm</button>
                        <a href="/" class="uk-button uk-button-default">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
        <c:set value="${sessionScope.get(\"flight_selected\")}" var="flight"/>
        <c:set value="${flight.price}" var="f_price" />
        <div class="uk-width-1-4">
            <div class="uk-card uk-card-default uk-card-body uk-animation-slide-right-small">
                <h4 class="uk-card-title">Summary</h4>
                <div class="margin-small uk-grid-small" uk-grid>
                    <div class="uk-width-1-2">
                        <span class="small-font">Passengers:</span>
                    </div>
                    <div class="uk-width-1-2">
                        <span class="small-font uk-align-right uk-text-right "><%=x%></span>
                    </div>
                </div>
                <hr>
                <div class="margin-small uk-grid-small" uk-grid>
                    <div class="uk-width-1-2">
                        <span class="small-font ">Your Fare:</span>
                    </div>
                    <div class="uk-width-1-2">
                        <span class="small-font uk-align-right uk-text-right ">$ ${flight.price}.0</span>
                    </div>
                </div>

                <div class="uk-margin-small uk-grid-small" uk-grid >
                    <div class="uk-width-1-2">
                        <span class="small-font ">
                            Fees(10%):
                        </span>
                    </div>
                    <div class="uk-width-1-2">
                        <span class="small-font uk-align-right uk-text-right"><%
                                double fee = Double.parseDouble(pageContext.getAttribute("f_price").toString());
                                double f2 = fee * 0.1;
                                out.print("$ " + f2);
                            %></span>
                    </div>
                </div>
                <% if (pageContext.getAttribute("bid_price") != null){ %>
                <div class="uk-margin-small" uk-grid>
                    <div class="uk-width-1-2">
                        <span class="">Bid: </span>
                    </div>
                    <div class="uk-width-1-2">
                        <span class="uk-text-danger"> ${bid_price} </span>
                    </div>
                </div>
                <%
                    fee = Integer.parseInt(pageContext.getAttribute("bid_price").toString());
                } %>
                <hr>
                <div class="uk-margin-small uk-grid-small" uk-grid>
                    <div class="uk-width-1-2">
                        <span class="small-font ">Total:</span>
                    </div>
                    <div class="uk-width-1-2">
                        <% request.getSession().setAttribute("total_fare", (fee+f2)); %>
                        <span class="small-font uk-align-right uk-text-right ">$ <%= (fee+f2) %></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>