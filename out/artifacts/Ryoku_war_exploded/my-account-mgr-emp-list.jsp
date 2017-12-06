<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Employee List</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <ul uk-accordion="multiple : true">
                <li>
                    <h3 class="uk-accordion-title small-font"> 1. Employee Name </h3>
                    <div class="uk-accordion-content uk-text-small">
                        <div class="uk-margin-small">
                            <table class="uk-table uk-background-muted uk-table-small uk-table-divider">
                                <tbody>
                                <tr>
                                    <td>First Name : </td>
                                    <td>Employee First Name</td>
                                </tr>
                                <tr>
                                    <td>Last Name : </td>
                                    <td>Employee Last Name</td>
                                </tr>
                                <tr>
                                    <td>Email : </td>
                                    <td>Employee.Email@email.com</td>
                                </tr>
                                <tr>
                                    <td>Address : </td>
                                    <td>Employee Address 1</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Employee Address 2</td>
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
                            <div class="uk-margin" uk-grid>
                                <div class="uk-width-2-3">
                                    <button class="uk-button uk-button-primary">Reservations</button>
                                </div>
                                <div class="uk-width-1-3 uk-text-right">
                                    <button class="uk-button uk-button-secondary"> <span uk-icon="icon: file-edit"></span> </button>
                                    <button class="uk-button uk-button-danger"> <span uk-icon="icon: trash"></span> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <hr>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>