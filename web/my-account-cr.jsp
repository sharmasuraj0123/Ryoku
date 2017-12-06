<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>My Account</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-cr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form class="uk-form-horizontal uk-margin">


                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-email" type="text" placeholder="Your email address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-old-password">Current Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-old-password" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-new-password">New Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-new-password" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-new-password-2">Confirm Password </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-new-password-2" type="password" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-first-name" type="text" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-last-name" type="text" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-phone-number" type="text" placeholder="">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-address-1" type="text" placeholder="Address Line 1">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-address-2"> </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-address-2" type="text" placeholder="Address Line 2">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-city-town" type="text" placeholder="City/Town">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_cr-state" type="text" placeholder="State">--%>
                        <select name="state" id="_cr-state" class="uk-select">
                            <option value="NY">NY</option>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-zip-code" type="text" placeholder="Zip Code">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: copy"></span> &nbsp;&nbsp; Social Security

                <div class="uk-margin">
                    <label class="uk-form-label" for="_cr-social-security-number"> Social Security Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_cr-social-security-number" type="text" placeholder="Social Security Number" maxlength="10">
                    </div>
                </div>

                <div class="uk-margin-medium-top uk-text-center">
                    <button class="uk-button uk-button-primary">Update</button>
                </div>

            </form>
        </div>
    </div>

</div>

<%@include file="footer.html"%>