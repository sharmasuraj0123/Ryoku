<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://localhost:8080/rsrc/uikit/css/uikit.min.css" />
        <link rel="stylesheet" href="http://localhost:8080/rsrc/static/css/style.css" />
        <script src="http://localhost:8080/rsrc/static/js/script.js"></script>
        <script src="http://localhost:8080/rsrc/uikit/js/uikit.min.js"></script>
        <script src="http://localhost:8080/rsrc/uikit/js/uikit-icons.min.js"></script>
        <script src="https://use.fontawesome.com/028384ec2d.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>

<body>

    <nav id="site-header" class="uk-navbar-container uk-navbar-transparent" uk-navbar>
        <div class="uk-navbar-left">
            <ul class="uk-navbar-nav">
                <li> <a href="./" id="site-name" class="uk-button uk-button-text" ><i class="fa fa-paper-plane-o" aria-hidden="true"></i> &nbsp;  Ryoku </a>
                </li>

            </ul>
        </div>
        <!--<div class="uk-navbar-center">...</div>-->

        <div class="uk-navbar-right">
            <ul class="uk-navbar-nav">
                <li> <a href="/" class="uk-button uk-button-text" > Search Flights </a> </li>
                <li> <a href="/my-account" class="uk-button uk-button-text" > My Account </a> </li>
                <li> <a href="/my-account/trips?${sessionScope.customer.accountNumber}" class="uk-button uk-button-text" > My Trips </a> </li>
                <% if ( request.getSession() != null &&
                        request.getSession().getAttribute("loggedin") != null &&
                        ((boolean)request.getSession().getAttribute("loggedin"))) {%>
                    <li> <a href="/log-in/logout" class="uk-button uk-button-text" > Log Out &nbsp;<span uk-icon="icon: sign-out"></span> </a> </li>
                <% } else {%>
                <li> <a href="/log-in" class="uk-button uk-button-text" > Log In </a> </li>
                <li> <a href="/sign-up" class="uk-button uk-button-text" > Sign Up </a> </li>
                <%} %>
            </ul>
        </div>
    </nav>

