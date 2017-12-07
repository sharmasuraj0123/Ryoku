<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Best Seller Flights</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-sidebar.html"%>
        </div>

        <div class="uk-width-expand">
            <div class="uk-card uk-card-default uk-card-small uk-card-body">
                <div class="uk-margin">
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3">
                            <span class="uk-text-bold">American Airlines</span><br>
                            <span class="uk-text-small uk-text-muted"> AA 101 </span>
                        </div>
                        <div class="uk-width-1-3 uk-text-center">
                            <span> JFK <span uk-icon="icon: arrow-right"></span> DEL  </span> <br>
                            <span class="small-font">New York - New Delhi</span>
                        </div>
                        <div class="uk-width-1-3 uk-text-right">
                            $ <b>999</b>&nbsp;<sup>.00</sup>
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
                        <div class="uk-width-expand">
                            <button class="uk-align-right uk-button uk-button-secondary uk-button-small"> Select </button>
                        </div>
                    </div>
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
                </div>

                <hr>

                <div class="uk-margin">
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-3">
                            <span class="uk-text-bold">American Airlines</span><br>
                            <span class="uk-text-small uk-text-muted"> AA 101 </span>
                        </div>
                        <div class="uk-width-1-3 uk-text-center">
                            <span> JFK <span uk-icon="icon: arrow-right"></span> DEL  </span> <br>
                            <span class="small-font">New York - New Delhi</span>
                        </div>
                        <div class="uk-width-1-3 uk-text-right">
                            $ <b>999</b>&nbsp;<sup>.00</sup>
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
                        <div class="uk-width-expand">
                            <button class="uk-align-right uk-button uk-button-secondary uk-button-small"> Select </button>
                        </div>
                    </div>
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
                </div>

            </div>
        </div>

    </div>
</div>

<%@include file="footer.jsp"%>