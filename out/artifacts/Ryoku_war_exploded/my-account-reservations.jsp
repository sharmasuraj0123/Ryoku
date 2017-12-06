<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>

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
                                <div class="uk-text-center uk-margin-small-top"><br>
                                    <button class="uk-button uk-button-danger">Cancel Reservation </button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <%-- Card 1 End--%>
                <div class="uk-card uk-card-default uk-card-small uk-card-body">
                </div>
                <h3 class="uk-heading-line uk-text-center uk-text-muted small-font"> <span>Past</span></h3>
                <div class="uk-card uk-card-default uk-card-small uk-card-body">
                </div>
            </div>

        </div>

    </div>
</div>

<%@include file="footer.html"%>