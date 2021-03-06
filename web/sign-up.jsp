<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>

<br><br>
<div class="uk-container">
   <h3 class="uk-heading-line uk-text-left"> <span>Create an Account</span></h3> <br>

    <div uk-grid>
        <div class="uk-width-3-4">
            <div class="uk-card uk-card-default uk-card-body">
                <span uk-icon="icon: users"></span> &nbsp;&nbsp; Sign Up

                <form action="/sign-up" method="POST" class="uk-form-horizontal uk-margin-large">
                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user_name_first">First Name: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user_name_first" type="text" name="FirstName" required placeholder="Your first name">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user_name_last">Last Name: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user_name_last" type="text" name="LastName" required placeholder="Your last name">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user-email">Email: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user-email" type="email" name="emailAddress" required placeholder="Your email address">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user-password1t">Password: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user-password1t" name="Password_1" required type="Password" placeholder="">
                        </div>
                    </div>

                    <div class="uk-margin">
                        <label class="uk-form-label" for="_new_user-password2">Confirm Password: </label>
                        <div class="uk-form-controls">
                            <input class="uk-input" id="_new_user-password2" name="Password_2" type="password" required placeholder="">
                        </div>
                    </div>

                    <div class="uk-margin-medium">
                        <label> <input type="checkbox" required class="uk-checkbox" name="pp_tos"> I have read and agree to the
                            <a href="#" class="uk-button uk-button-link">Terms of Service</a> and <a href="#" class="uk-button uk-button-link">Privacy Policy</a> </label>
                        <br><br>
                        Already have an Account ? <a href="#" class="uk-button uk-button-link">Login</a>
                    </div>

                    <div class="uk-margin uk-text-center">
                        <button class="uk-button uk-button-primary" type="submit">Join Now</button>
                    </div>

                </form>


            </div>
        </div>


        <%@include file="sidebar_right.html"%>

    </div>

</div>

<%@ include file="footer.jsp"%>