<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Monthly Sales Report </span></h3>
    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form class="uk-form-horizontal uk-margin" action="/my-account/sales-report" method="post">
                <div class="uk-margin uk-grid-small" uk-grid>
                    <div class="uk-width-1-2">
                        Month : <input type="month" name="month-year" class="uk-input uk-width-auto">
                    </div>
                    <div class="uk-width-expand uk-align-right uk-text-right">
                        <button type="submit" class="uk-button-default uk-button"> Get List </button>
                    </div>
                </div>
            </form>
            <div class="uk-margin">
                <table class="uk-table">
                    <thead>
                    <tr>
                        <th>
                            Reservation #
                        </th>
                        <th>
                            Customer ID
                        </th>
                        <th>
                            Customer Name
                        </th>
                        <th>
                            Flight Number
                        </th>
                        <th>
                            Date
                        </th>
                        <th>
                            Revenue
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>