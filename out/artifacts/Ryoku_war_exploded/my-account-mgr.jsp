<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Admin Account</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <%@include file="my-account-mgr-sidebar.html"%>
        </div>
        <div class="uk-width-expand">
            <form class="uk-form-horizontal uk-margin">


                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-email" type="text" placeholder="Your email address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-old-password">Current Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-old-password" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-new-password">New Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-new-password" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-new-password-2">Confirm Password </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-new-password-2" type="password" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-first-name" type="text" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-last-name" type="text" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-phone-number" type="text" placeholder="">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-address-1" type="text" placeholder="Address Line 1">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-address-2"> </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-address-2" type="text" placeholder="Address Line 2">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-city-town" type="text" placeholder="City/Town">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_mgr-state" type="text" placeholder="State">--%>
                        <select name="state" id="_mgr-state" class="uk-select">
                            <option value="NY">NY</option>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-zip-code" type="text" placeholder="Zip Code">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: copy"></span> &nbsp;&nbsp; Social Security

                <div class="uk-margin">
                    <label class="uk-form-label" for="_mgr-social-security-number"> Social Security Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_mgr-social-security-number" type="text" placeholder="Social Security Number" maxlength="10">
                    </div>
                </div>

                <div class="uk-margin-medium-top uk-text-center">
                    <button class="uk-button uk-button-primary">Update</button>
                </div>

            </form>
        </div>
    </div>

</div>

<%@include file="footer.jsp"%>