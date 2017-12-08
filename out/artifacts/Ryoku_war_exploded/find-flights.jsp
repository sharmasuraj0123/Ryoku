<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% int i = 0; %>
<%int position = 0;%>
<br> <br>
<div class="uk-container">
    <h4 class="uk-heading-line uk-text-center"> <span>Search Results</span></h4>

    <div uk-grid>
        <div class="uk-width-1-4">
            <form action="/find-flights" method="post">
                <div class="uk-card uk-card-primary uk-card-body uk-animation-slide-left-small">
                    <h4 class="uk-heading-line uk-text-left"> <span>Modify Search</span></h4>

                    <label class="uk-form-label"><input name="search_type" value="1" onclick="search_type_func(1)" class="uk-radio" type="radio" <%
                        if (request.getParameter("search_type").toString().equals("1")){
                            out.print("checked");
                        }
                        %>> One way</label>
                    <br>
                    <label class="uk-form-label"><input name="search_type" value="2" onclick="search_type_func(2)" class="uk-radio" type="radio"
                        <%
                        if (request.getParameter("search_type").toString().equals("2")){
                            out.print("checked");
                        }
                        %>> Round Trip</label>
                    <br>
                    <label class="uk-form-label"><input name="search_type" value="3" onclick="search_type_func(3)" class="uk-radio" type="radio" <%
                        if (request.getParameter("search_type").toString().equals("3")){
                            out.print("checked");
                        }
                        %> > Multi City</label>
                    <br><br>
                    <label class="uk-form-label"><input name="flight_type" value="0" class="uk-radio" type="radio" <%
                        if (request.getParameter("flight_type").toString().equals("0")){
                            out.print("checked");
                        }
                        %>> International</label>
                    <br>
                    <label class="uk-form-label"><input name="flight_type" value="1" class="uk-radio" type="radio"
                        <%
                        if (request.getParameter("flight_type").toString().equals("1")){
                            out.print("checked");
                        }
                        %>> Domestic</label>

                    <div class="uk-margin">
                        <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> From:</label>
                        <select  name="airport" id="src-airport-select" class="uk-select">
                            <option value="${srcAirport.id}">${srcAirport.name}</option>
                            <option value="1" > JFK </option>
                            <option value="2" > LGA </option>
                        </select>
                    </div>


                    <div class="uk-margin">
                        <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> To:</label><br>
                        <select  name="airport" id="return-airport-select" class="uk-select">
                            <option value="${destAirport.id}"> ${destAirport.name} </option>
                            <option value="3" > DEL </option>
                            <option value="4" > BOM </option>
                        </select>
                    </div>


                    <div class="uk-margin" id="airport-3">
                        <label class="uk-form-label"> <i class="fa fa-plane" aria-hidden="true"></i> To:</label><br>
                        <select  name="airport" id="airport-3-select" class="uk-select">
                            <option value="${airport3.id}"> ${airport3.name} </option>
                            <option value="3" > DEL </option>
                            <option value="4" > BOM </option>
                        </select>
                    </div>


                    <div class="uk-margin">
                        <label class="uk-form-label">Departing:</label> <br>
                        <input type="date" class="uk-input" id="date-1" name="date" value="${searchQuery.dates[0]}">
                    </div>

                    <div class="uk-margin" id="date-2-containter">
                        <label class="uk-form-label">Returning/Connecting:</label> <br>
                        <input type="date" class="uk-input" id="date-2" name="date" value="${searchQuery.dates[1]}">
                    </div>


                    <div class="uk-margin" id="date-3-containter">
                        <label class="uk-form-label">Connecting:</label> <br>
                        <input type="date" class="uk-input" id="date-3" name="date" value="${searchQuery.dates[2]}">
                    </div>


                    <script>
                        $(function(){
                            search_type_func(${searchQuery.searchType});
                        });
                    </script>

                    <div class="uk-margin">
                        <div class="uk-grid">
                            <div class="uk-width-1-1">
                                <label class="uk-form-label" for="adults_select">Passengers: </label>
                                <div class="uk-form-controls">
                                    <select class="uk-select" id="adults_select" name="passenger_count">
                                        <option value="1" <%
                                            if (request.getParameter("passenger_count").toString().equals("1"))
                                                out.print("selected");
                                        %> >1</option>
                                        <option value="2" <%
                                            if (request.getParameter("passenger_count").toString().equals("2"))
                                                out.print("selected");
                                        %> >2</option>
                                        <option value="3" <%
                                            if (request.getParameter("passenger_count").toString().equals("3"))
                                                out.print("selected");
                                        %> >3</option>
                                        <option value="4" <%
                                            if (request.getParameter("passenger_count").toString().equals("4"))
                                                out.print("selected");
                                        %>>4</option>
                                        <option value="5" <%
                                            if (request.getParameter("passenger_count").toString().equals("5"))
                                                out.print("selected");
                                        %>>5</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label" for="prefered_class">Preferred Class:</label>
                        <div class="uk-form-controls">
                            <select class="uk-select" name="class"  id="prefered_class">
                                <option value="1"
                                        <%
                                            if (request.getParameter("class").toString().equals("1"))
                                                out.print("selected");
                                        %>>Economy Class</option>
                                <option value="2"
                                        <%
                                            if (request.getParameter("class").toString().equals("2"))
                                                out.print("selected");
                                        %>>Business Class</option>
                                <option value="3"
                                        <%
                                            if (request.getParameter("class").toString().equals("3"))
                                                out.print("selected");
                                        %>>First Class</option>
                            </select>
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label"><input type="checkbox" class="uk-checkbox" name="isFlexible" <%
                                            Object flexi = request.getParameter("isFlexible");
                                            if (flexi!=null && flexi.toString().equals("on"))
                                                out.print("checked");
                                        %> > Flexible Dates/Times </label>
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
                <% if (request.getAttribute("flightsNum").toString().equals("0")){
                    %>
                <div class="uk-align-center uk-margin">
                        No Search Results Found!
                </div>
                <%
                }%>
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
                                    <c:set value="${flight_block.flightlegs[0]}" var="f1"/>
                                    <span class="bold">${f1.airlineName}</span> <br>
                                    <span class="small-font uk-text-muted">
                                    <c:set value="${searchQuery.dates[0]}" var="date_d2" />
                                        <%
                                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                            SimpleDateFormat f = new SimpleDateFormat("MMMMM dd, YYYY");
                                            Object s = pageContext.getAttribute("date_d2");
                                            String ss = s.toString();
                                            Date sd = df.parse(ss);
                                            String s0 = f.format(sd.getTime());
                                            request.setAttribute("date_fg", s0);

                                        %>
                                        <%=request.getAttribute("date_fg")%> - ${f1.dTime}
                                    </span>
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

                            </div>
                            <div class="uk-width-1-3 uk-text-center uk-text-small">
                                <span class="uk-align-center">
                                        <c:set value="${flight_block.day}" var="fb_day" />
                                        <%
                                            Object day = pageContext.getAttribute("fb_day");
                                            boolean day_s = !day.toString().equals("0");
                                            if (day_s){
                                                %>
                                            <%= pageContext.getAttribute("fb_day") + "d" %>
                                        <%
                                            }
                                        %>
                                        ${flight_block.hours}h ${flight_block.minutes}m</span>
                            </div>
                            <div class="uk-width-expand">
                                <form action="/book-flight" method="post">
                                    <input type="hidden" value="<%=position++%>" name="flight_selected_position">
                                    <input type="hidden" value="<%=request.getParameter("passenger_count")%>" name="passenger_count">
                                    <input type="hidden" value="<%=request.getParameter("class")%>" name="class">
                                    <button class="uk-align-right uk-button uk-button-secondary uk-button-small" type="submit"> Select </button>
                                </form>
                            </div>
                        </div>
                        <ul uk-accordion>
                            <li>
                                <h3 class="uk-accordion-title small-font"> Details </h3>
                                <div class="uk-accordion-content">
                                <c:forEach items="${flight_block.flightlegs}" var="legs">
                                    <div class="uk-margin-small">
                                        <div class="uk-grid-small" uk-grid>
                                            <div class="uk-text-left uk-width-1-3 uk-text-small">
                                                <span> ${legs.airlineName} </span> &nbsp; <span class="uk-text-muted" uk-icon="icon: chevron-right"></span> ${legs.airline} ${legs.flight_number} <br>
                                                <span class="small-font"> ${legs.departureAirport_ob.name} <span uk-icon="icon: arrow-right"></span> ${legs.arrivalAirport_ob.name} </span>
                                            </div>
                                            <div class="uk-width-1-3 uk-text-center uk-text-small">
                                                ${legs.dTime} &ndash; ${legs.aTime} <br>
                                                ${legs.d_date}
                                            </div>
                                            <div class="uk-width-expand uk-text-right">
                                                <span class="uk-text-small"> ${legs.departureAirport_ob.city} <span uk-icon="icon: arrow-right"></span> ${legs.arrivalAirport_ob.city} </span>
                                                <br>
                                                <span class="small-font uk-text-muted">${legs.hours}h ${legs.minutes}m</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                    <ul uk-accordion>
                                        <li>
                                            <h3 class="uk-accordion-title small-font">  </h3>
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
                                </div>
                            </li>
                        </ul>
                    </div>

                    <% if (i++ > 0){ %>
                        <hr>
                    <%}%>
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