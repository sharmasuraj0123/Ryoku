<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Reservation List - By Customer</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>

        <div class="uk-width-expand">
            <div class="uk-margin">
                <div uk-grid>
                    <div class="uk-width-1-3">
                        <label for="cust-name">Customer: </label>&nbsp;
                        <input type="text" id="cust-name" class="uk-input uk-form-width-small uk-form-small uk-form-blank" placeholder="Name">
                    </div>
                    <div class="uk-width-1-3">
                        <label for="cust-id">or Customer ID: </label>
                        <input type="text" id="cust-id" class="uk-input uk-form-width-small uk-form-small uk-form-blank" placeholder="ID">
                    </div>
                    <div class="uk-width-1-3 uk-text-right">
                        <button class="uk-button uk-button-default uk-button-small">Get Reservations</button>
                    </div>
                </div>
            </div>
            <div class="uk-card uk-card-default uk-card-small uk-card-body">
                <div class="uk-margin-small">
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3">
                            <span class="bold">American Airlines</span>
                        </div>
                        <div class="uk-width-1-3 uk-text-center">
                            <span> JFK <span uk-icon="icon: shrink"></span> DEL  </span> <br>
                            <span class="small-font">New York - New Delhi</span>
                        </div>
                        <div class="uk-width-1-3 uk-text-right">
                            09:00 &ndash; 23:00 <span class="uk-text-danger"> +1 </span> <br>
                            December 21, 2017
                        </div>
                    </div>
                </div>
                <ul uk-accordion="multiple : true">
                    <li>
                        <h3 class="uk-accordion-title small-font"> Details </h3>
                        <div class="uk-accordion-content">
                            <hr>
                            <div class="uk-margin-small">
                                <div class="uk-grid-small" uk-grid>
                                    <div class="uk-text-left uk-width-1-3 uk-text-small">
                                        <span> AA 101 </span> &nbsp; <span class="uk-text-muted" uk-icon="icon: chevron-right"></span> &nbsp; <span> JFK <span uk-icon="icon: arrow-right"></span> DEL </span> <br>
                                        <span>18h 30m</span>
                                    </div>
                                    <div class="uk-width-1-3 uk-text-center uk-text-small">
                                        09:00 &ndash; 23:00 <span class="uk-text-danger"> +1 </span> <br>
                                        December 21, 2017
                                    </div>
                                    <div class="uk-width-expand uk-text-right">
                                        $ <b>498</b>&nbsp;<sup>.50</sup>
                                    </div>
                                </div>
                                <div class="uk-margin-medium-top">
                                    <div class="uk-margin-small" uk-grid>
                                        <div class="uk-width-1-3">
                                            <h3 class="small-font uk-text-muted"> Pranav Sethi </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-center">
                                            <h3 class="small-font uk-text-muted"> Meal Type: Indian </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-right">
                                            <span class="small-font uk-text-muted"> Seat :</span> &nbsp;
                                            <button class="uk-button-text uk-button"><span class="uk-text-muted">33F</span></button>&nbsp;
                                            <span class="small-font uk-text-muted"> (ECONOMY) </span>
                                        </div>
                                    </div>
                                    <div class="uk-margin-small" uk-grid>
                                        <div class="uk-width-1-3">
                                            <h3 class="small-font uk-text-muted"> Pranav Sethi </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-center">
                                            <h3 class="small-font uk-text-muted"> Meal Type: Indian </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-right">
                                            <span class="small-font uk-text-muted"> Seat :</span> &nbsp;
                                            <button class="uk-button-text uk-button"><span class="uk-text-muted">33F</span></button>&nbsp;
                                            <span class="small-font uk-text-muted"> (ECONOMY) </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="uk-margin-small">
                                <div class="uk-grid-small" uk-grid>
                                    <div class="uk-text-left uk-width-1-3 uk-text-small">
                                        <span> AA 101 </span> &nbsp; <span class="uk-text-muted" uk-icon="icon: chevron-right"></span> &nbsp; <span> JFK <span uk-icon="icon: arrow-right"></span> DEL </span> <br>
                                        <span>18h 30m</span>
                                    </div>
                                    <div class="uk-width-1-3 uk-text-center uk-text-small">
                                        21:00 &ndash; 23:00 <br>
                                        January 21, 2018
                                    </div>
                                    <div class="uk-width-expand uk-text-right">
                                        $ <b>498</b>&nbsp;<sup>.50</sup>
                                    </div>
                                </div>
                                <div class="uk-margin-medium-top">
                                    <div class="uk-margin-small" uk-grid>
                                        <div class="uk-width-1-3">
                                            <h3 class="small-font uk-text-muted"> Pranav Sethi </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-center">
                                            <h3 class="small-font uk-text-muted"> Meal Type: Indian </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-right">
                                            <span class="small-font uk-text-muted"> Seat :</span> &nbsp;
                                            <button class="uk-button-text uk-button"><span class="uk-text-muted">33F</span></button>&nbsp;
                                            <span class="small-font uk-text-muted"> (ECONOMY) </span>
                                        </div>
                                    </div>
                                    <div class="uk-margin-small" uk-grid>
                                        <div class="uk-width-1-3">
                                            <h3 class="small-font uk-text-muted"> Pranav Sethi </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-center">
                                            <h3 class="small-font uk-text-muted"> Meal Type: Indian </h3>
                                        </div>
                                        <div class="uk-width-1-3 uk-text-right">
                                            <span class="small-font uk-text-muted"> Seat :</span> &nbsp;
                                            <button class="uk-button-text uk-button"><span class="uk-text-muted">33F</span></button>&nbsp;
                                            <span class="small-font uk-text-muted"> (ECONOMY) </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>

<%@include file="footer.jsp"%>