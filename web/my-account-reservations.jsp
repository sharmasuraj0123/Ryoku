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
                <div class="uk-card uk-card-default uk-card-body">
                    <div class="uk-margin-small">
                        <div class="uk-grid-small" uk-grid>
                            <div class="uk-width-1-3">
                                <span class="bold">American Airlines</span>
                            </div>
                            <div class="uk-width-1-3 uk-text-center">
                                <span> JFK <span uk-icon="icon: shrink"></span> DEL  </span>
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
                                            <span> JFK <span uk-icon="icon: arrow-right"></span> DEL </span> <br>
                                            <span>18h 30m</span>
                                        </div>
                                        <div class="uk-width-1-2 uk-text-small">
                                            09:00 &ndash; 23:00 <span class="uk-text-danger"> +1 </span> <br>
                                            December 21, 2017 - December 22, 2017
                                        </div>
                                        <div class="uk-width-expand uk-text-right">
                                            $ <b>498</b>&nbsp;<sup>.50</sup>
                                        </div>
                                    </div>
                                    <div class="uk-margin-small" uk-grid>
                                        <div class="uk-width-1-2">
                                            <button class="uk-button uk-button-default">Seat Selection</button>
                                        </div>
                                        <div class="uk-width-1-2 uk-text-right">
                                            <button class="uk-button uk-button-default"><span class="uk-text-danger">Cancel Reservation</span> </button>
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
</div>

<%@include file="footer.html"%>