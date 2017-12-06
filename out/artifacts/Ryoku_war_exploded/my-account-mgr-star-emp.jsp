<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Star Employee</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <div class="uk-card uk-card-body uk-card-default">
                <h3>Employee Name</h3>
                <div class="uk-margin">
                    <table class="uk-table uk-table-small uk-table-divider">
                        <tbody>
                        <tr>
                            <td>Email : </td>
                            <td>Employee.Email@email.com</td>
                        </tr>
                        <tr>
                            <td>Address : </td>
                            <td>Employee Address 1 <br>
                                Employee Address 2</td>
                        </tr>
                        <tr>
                            <td>City / Town :</td>
                            <td>Employee City</td>
                        </tr>
                        <tr>
                            <td>State : </td>
                            <td>Employee State</td>
                        </tr>
                        <tr>
                            <td>Zip Code</td>
                            <td>11001</td>
                        </tr>
                        <tr>
                            <td>
                                Start Date
                            </td>
                            <td>
                                2019-08-09
                            </td>
                        </tr>
                        <tr>
                            <td>Hourly Pay</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>Social Security Info: </td>
                            <td>On-File</td>
                        </tr>
                        <tr>
                            <td>Rating:</td>
                            <td>&starf; 5.5</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="uk-margin">
                    <span>Revenue Generated: $9123</span>
                </div>
                <div class="uk-margin uk-text-center">
                    <button class="uk-button uk-button-secondary">View Reservations</button>
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file="footer.html"%>