<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Reverse Auctions</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-cr-sidebar.html"%>
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
                            <span class="uk-text-muted"> <s>$<b>999</b></s></span>
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
                            <%--<span class="uk-label uk-label-warning">Pending</span>--%>
                        </div>
                    </div>
                    <ul uk-accordion>
                        <li>
                            <h3 class="uk-accordion-title small-font"> Customer Bids</h3>
                            <div class="uk-accordion-content">
                                <div class="uk-margin-small">
                                    <table class="uk-table uk-text-small uk-table-small uk-table-divider">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <a href="" class="uk-button uk-button-link">Customer 1</a> Bid #1
                                            </td>
                                            <td class="uk-text-left">
                                                Bid Price: &nbsp; <span> $700<sup>.00</sup> </span>
                                            </td>
                                            <td class="uk-text-center">
                                                <span class="uk-label uk-label-warning">Pending</span>
                                            </td>
                                            <td class="uk-text-right">
                                                <button class="uk-button-secondary uk-button-small uk-button"><span uk-icon="icon: check"></span></button>&nbsp;
                                                <button class="uk-button-danger uk-button-small uk-button"><span uk-icon="icon: close"></span></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="" class="uk-button uk-button-link">Customer 2</a> Bid #1
                                            </td>
                                            <td class="uk-text-left">
                                                Bid Price: &nbsp; <span> $700<sup>.00</sup> </span>
                                            </td>
                                            <td class="uk-text-center">
                                                <span class="uk-label uk-label-success">Approved</span>
                                            </td>
                                            <td class="uk-text-right">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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
                            <span class="uk-text-muted"> <s>$<b>999</b></s></span>
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
                            <%--<span class="uk-label uk-label-warning">Pending</span>--%>
                        </div>
                    </div>
                    <ul uk-accordion>
                        <li>
                            <h3 class="uk-accordion-title small-font"> Customer Bids</h3>
                            <div class="uk-accordion-content">
                                <div class="uk-margin-small">
                                    <table class="uk-table uk-text-small uk-table-small uk-table-divider">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <a href="" class="uk-button uk-button-link">Customer 1</a> Bid #1
                                            </td>
                                            <td class="uk-text-left">
                                                Bid Price: &nbsp; <span> $700<sup>.00</sup> </span>
                                            </td>
                                            <td class="uk-text-center">
                                                <span class="uk-label uk-label-warning">Pending</span>
                                            </td>
                                            <td class="uk-text-right">
                                                <button class="uk-button-secondary uk-button-small uk-button"><span uk-icon="icon: check"></span></button>&nbsp;
                                                <button class="uk-button-danger uk-button-small uk-button"><span uk-icon="icon: close"></span></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="" class="uk-button uk-button-link">Customer 2</a> Bid #1
                                            </td>
                                            <td class="uk-text-left">
                                                Bid Price: &nbsp; <span> $700<sup>.00</sup> </span>
                                            </td>
                                            <td class="uk-text-center">
                                                <span class="uk-label uk-label-success">Approved</span>
                                            </td>
                                            <td class="uk-text-right">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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