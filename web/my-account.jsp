<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>

<br><br>
<div class="uk-container">
    <h3 class="uk-heading-line uk-text-left"> <span>Account Settings</span></h3>

    <div uk-grid>
        <div class="uk-width-1-4">
            <div class=" uk-light uk-card-body uk-card-secondary">
                <ul class="uk-nav-default uk-nav-parent-icon" uk-nav>

                    <li class="uk-active"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: settings"></span> My Account</a></li>


                    <%--<li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: table"></span> Item</a></li>--%>
                    <%--<li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span> Item</a></li>--%>


                    <li class="uk-nav-divider"></li>
                    <li class="uk-nav-header">Reservations</li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: world"></span> All </a></li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: future"></span> Upcoming </a></li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: history"></span> Past </a></li>



                    <li class="uk-nav-divider"></li>
                    <li class="uk-nav-header">Flight List</li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: star"></span> Best Seller Flights</a></li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: heart"></span> Personalized Flights</a></li>

                    <li class="uk-nav-divider"></li>
                    <li class="uk-nav-header">Reverse Auctions</li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: clock"></span> Current</a></li>
                    <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: history"></span> Past</a></li>

                </ul>
            </div>
        </div>
        <div class="uk-width-expand">
            <form class="uk-form-horizontal uk-margin">


                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-email">Email: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-email" type="text" placeholder="Your email address">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-new-password">Password: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-new-password" type="password" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-new-password-2">Confirm Password </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-new-password-2" type="password" placeholder="">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: user"></span> &nbsp;&nbsp; Personal Details.

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-first-name">First Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-first-name" type="text" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-last-name">Last Name: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-last-name" type="text" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-phone-number">Mobile: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-phone-number" type="text" placeholder="">
                    </div>
                </div>

                <br><span uk-icon="icon: location"></span> &nbsp;&nbsp; Address Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-address-1">Address: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-address-1" type="text" placeholder="Address Line 1">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-address-2"> </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-address-2" type="text" placeholder="Address Line 2">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-city-town"> City / Town</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-city-town" type="text" placeholder="City/Town">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-state"> State: </label>
                    <div class="uk-form-controls">
                        <%--<input class="uk-input" id="_user-state" type="text" placeholder="State">--%>
                        <select name="state" id="_user-state" class="uk-select">
                            <option value="NY">NY</option>
                        </select>
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-zip-code"> Zip Code: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-zip-code" type="text" placeholder="Zip Code">
                    </div>
                </div>

                <br>
                <span uk-icon="icon: credit-card"></span> &nbsp;&nbsp; Payment Info

                <div class="uk-margin">
                    <label class="uk-form-label" for="_user-credit-card"> Credit Card Number: </label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="_user-credit-card" type="text" placeholder="Credit Card Number" maxlength="16">
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