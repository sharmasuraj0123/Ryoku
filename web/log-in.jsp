<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.html"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Log In</span></h3> <br>

    <div uk-grid>
        <div class="uk-width-3-4">
            <div class="uk-card uk-card-default uk-card-body">
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Sign In to your account

                <form class="uk-form-horizontal uk-margin-large">

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user-email">Email: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user-email" type="text" placeholder="Your email address">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user-password1t">Password: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user-password1t" type="Password" placeholder="">
                        </div>
                    </div>


                    <div class="uk-margin-medium-top">
                        <label><input type="checkbox" class="uk-checkbox" checked name="keepSignedIn"> Keep me signed in <span uk-icon="icon: unlock"></span> </label>
                    </div>

                    <div class="uk-margin-medium uk-text-center">
                        <button class="uk-button uk-button-primary">Sign In</button>
                    </div>

                </form>


            </div>
        </div>

        <%@include file="sidebar_right.html"%>
        
    </div>

</div>

<%@ include file="footer.html"%>