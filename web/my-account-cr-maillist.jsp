<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Mailing List</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-cr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form class="uk-form-horizontal uk-margin">
                <table class="uk-table uk-table-small uk-table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${MailingList}" var="cust">
                        <%
                            String data = pageContext.getAttribute("cust").toString();
                            int i = data.indexOf('$');
                            String dataName = data.substring(0, i);
                            String email = data.substring(i+1);
                        %>
                        <tr>
                            <td>
                                <%= dataName%>
                            </td>
                            <td>
                                <%= email%>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="uk-margin-large-top">
                    <button class="uk-button uk-align-center uk-button-primary">
                        Download List
                    </button>
                </div>
            </form>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>