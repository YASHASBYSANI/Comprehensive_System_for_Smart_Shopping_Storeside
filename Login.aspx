<%@ Page MaintainScrollPositionOnPostback="true" Title="Login/Signup" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Login / Sign Up</h2>
            </div>
            <div class="tabContainer">
                <div class="tabs" data-max-width="1024">
                    <span class="tab" data-tab="a">
                        <span class="text">Login</span>
                    </span>
                    <span class="tab" data-tab="b">
                        <span class="text">Sign Up</span>
                    </span>
                </div>
            </div>
            <div class="sectionsContainer">
                <div class="sections">

                    <div class="section" data-section="a">
                        <div class="w3-container w3-white w3-padding-medium">
                            <div class="w3-row">
                                <div class="w3-col m6">
                                    <div id="divNormalLogin" class="w3-container w3-padding-0 w3-center">
                                        <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                            <span class="w3-left w3-padding w3-text-black w3-large">Use your created account to log in.</span>
                                        </div>
                                        <div class="w3-center">
                                            <img src="Images/online-shop.mod.min.png" alt="Avatar" style="width: 20%;" class="w3-circle w3-margin-top" />
                                        </div>

                                        <div class="w3-section">
                                            <div class="group">
                                                <asp:TextBox ID="txtLoginStoreId" class="input-animated" placeholder=" " runat="server" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Store ID</label>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtLoginStorePass" class="input-animated" placeholder=" " runat="server" type="password" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Store Password</label>
                                                <i id="iconShowLoginPassword" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('login');"></i>
                                            </div>

                                            <div class="coloured w3-left">
                                                <div class="checkbox-container">
                                                    <label style="position: inherit; pointer-events: all;">
                                                        <asp:CheckBox ID="chkLoginRemember" Checked="true" runat="server" />
                                                        <!-- <input id="check_remember" type="checkbox" checked="checked" /> -->
                                                        <span class="checkbox-material">
                                                            <span class="check"></span>
                                                        </span>
                                                        &nbsp;Remember login for 24 hours
                                                    </label>
                                                </div>
                                            </div>
                                            <asp:Button ID="btnLogin" Text="Login" class="w3-btn-block w3-green w3-ripple w3-section w3-padding" OnClick="btnLogin_Click" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="w3-col m1 w3-center w3-padding-0">
                                    <div id="divSeperatorSmall" class="w3-hide-large w3-hide-medium w3-margin-0">
                                        <hr class="colorgraph" />
                                    </div>
                                    <div id="divSeperatorLarge" class="w3-hide-small w3-margin-0 w3-display-container">
                                        <div class="w3-badge w3-xxlarge w3-red w3-display-middle w3-padding" style="z-index: 200;">Or</div>
                                    </div>
                                </div>
                                <div class="w3-col m5">
                                    <div id="divSocialLogin" class="w3-container w3-padding-0 w3-center">
                                        <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                            <span class="w3-left w3-padding w3-text-black w3-large">Use another service to log in.</span>
                                        </div>
                                        <div class="w3-row w3-padding-medium w3-hide-small">
                                            <div class="w3-col s12 m12 l12 w3-padding-medium">
                                                <div class="w3-btn-block w3-ripple w3-disabled" style="background-color: #3B5998;">
                                                    <div class="w3-border-right w3-border-white">
                                                        <i class="fa fa-facebook-official w3-xlarge" aria-hidden="true"></i>&nbsp;
                                                <div class="w3-medium">
                                                    Login with Facebook
                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="w3-col s12 m12 l12 w3-padding-medium">
                                                <div class="w3-btn-block w3-ripple w3-disabled" style="background-color: #1DA1F2;">
                                                    <div class="w3-border-right w3-border-white">
                                                        <i class="fa fa-twitter w3-xlarge" aria-hidden="true"></i>&nbsp;
                                                <div class="w3-medium">
                                                    Login with Twitter
                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="w3-col s12 m12 l12 w3-padding-medium">
                                                <div class="w3-btn-block w3-ripple w3-disabled" style="background-color: #DB4437;">
                                                    <div class="w3-border-right w3-border-white">
                                                        <i class="fa fa-google w3-xlarge" aria-hidden="true"></i>&nbsp;
                                                <div class="w3-medium">
                                                    Login with Google
                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w3-row w3-padding-0 w3-hide-large w3-hide-medium">
                                            <div class="w3-container w3-yellow w3-margin-top">
                                                <i class="fa fa-info-circle w3-xxxlarge w3-left" aria-hidden="true"></i>
                                                Press the consecutive button to login via social platforms.
                                            </div>
                                            <div class="w3-col s4 m12 l12 w3-padding-small">
                                                <div class="w3-btn-block w3-disabled" style="background-color: #3B5998;">
                                                    <i class="fa fa-facebook-official w3-xlarge" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                            <div class="w3-col s4 m12 l12 w3-padding-small">
                                                <div class="w3-btn-block w3-disabled" style="background-color: #1DA1F2;">
                                                    <i class="fa fa-twitter w3-xlarge" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                            <div class="w3-col s4 m12 l12 w3-padding-small">
                                                <div class="w3-btn-block w3-disabled" style="background-color: #DB4437;">
                                                    <i class="fa fa-google w3-xlarge" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="section" data-section="b">
                        <div class="w3-container w3-white w3-padding-medium">
                            <div class="w3-row">
                                <div class="w3-col m6">
                                    <div id="divStoreDetails1" class="w3-container w3-center">
                                        <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                            <span class="w3-left w3-padding w3-text-black w3-large"><span class="w3-text-blue">Step 1: </span>Enter store credentials and licence details.</span>
                                        </div>
                                        <div class="w3-center">
                                            <img src="Images/shopping-basket.png" alt="Avatar" style="width: 20%;" class="w3-circle w3-margin-top" />
                                        </div>
                                        <div class="w3-section">
                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreId" class="input-animated" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Store ID</label>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreVerCode" class="input-animated" runat="server" placeholder=" " oninput="autoKey(this);" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-key" aria-hidden="true"></i>&nbsp;Store Licence Code</label>
                                                <button id="iconVerCodeError" class="w3-transparent w3-border-0 w3-padding-0 sideIcon" runat="server" style="display: none;" onserverclick="iconVerCodeError_ServerClick">
                                                    <i class="fa fa-times-circle w3-text-red"></i>
                                                </button>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreName" class="input-animated" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Store Name</label>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStorePass1" class="input-animated" type="password" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Password</label>
                                                <i id="iconShowRegPass1" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('regPass1');"></i>
                                            </div>
                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStorePass2" class="input-animated" type="password" runat="server" placeholder=" "  oninput="checkPasswords();" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Confirm Password</label>
                                                <%--<button id="iconConfPassError" class="w3-transparent w3-border-0 w3-padding-0 sideIcon" style="display: block;">--%>
                                                <i id="iconConfPassError" class="fa fa-times-circle w3-text-red sideIcon" style="display: none;"></i>
                                                <%--</button>--%>
                                                <i id="iconShowRegPass2" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('regPass2');"></i>
                                            </div>
                                            <%--<asp:Button ID="btnRegisterStep1" Text="Proceed" class="w3-btn-block w3-green w3-ripple w3-section w3-padding" OnClick="btnRegisterStep1_Click" runat="server" />--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="w3-col m6">
                                    <div id="divStoreDetails2" class="w3-container w3-center">
                                        <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                            <span class="w3-left w3-padding w3-text-black w3-large"><span class="w3-text-blue">Step 2: </span>Enter store location details.</span>
                                        </div>
                                        <div class="w3-section">
                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreCity" class="input-animated" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-map-pin" aria-hidden="true"></i>&nbsp;Store Location City</label>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreState" class="input-animated" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-map-pin" aria-hidden="true"></i>&nbsp;Store Location State</label>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreZip" class="input-animated" runat="server" placeholder=" " onkeypress="findZip(this);" MaxLength="6" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-map-pin" aria-hidden="true"></i>&nbsp;Store ZIP Code</label>
                                                <button id="iconZipError" class="w3-transparent w3-border-0 w3-padding-0 sideIcon" style="display: none;">
                                                    <i class="fa fa-times-circle w3-text-red"></i>
                                                </button>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreLat" class="input-animated" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-map-pin" aria-hidden="true"></i>&nbsp;Store Location Latitude</label>
                                            </div>

                                            <div class="group">
                                                <asp:TextBox ID="txtRegisterStoreLong" class="input-animated" runat="server" placeholder=" " />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label><i class="fa fa-map-pin" aria-hidden="true"></i>&nbsp;Store Location Longitude</label>
                                            </div>
                                            
                                            <button type="button" class="w3-btn-block w3-red w3-ripple w3-section w3-padding" onclick="clearLocation();">
                                                Clear Location&nbsp;<i class="fa fa-eraser"></i>
                                            </button>

                                            <div class="w3-hide-small w3-padding-24 w3-display-container">
                                                <div class="w3-badge w3-xlarge w3-red w3-display-middle w3-padding" style="z-index: 200;">Or</div>
                                            </div>
                                            
                                            <button type="button" class="w3-btn-block w3-red w3-ripple w3-section w3-padding" onclick="getCoordinates();">
                                                Get Location Automatically&nbsp;<i class="fa fa-map-marker"></i>
                                            </button>

                                            <div id="divGeolocationError" class="w3-card w3-border-pale-red w3-border- w3-center w3-padding-0 w3-margin-0" style="display: none;">
                                                <div class="w3-container w3-pale-red">
                                                    <span class="fa-stack fa-lg w3-large w3-text-red w3-left">
                                                        <i class="fa fa-ban fa-stack-2x"></i>
                                                        <i class="fa fa-map-marker fa-stack-1x"></i>
                                                    </span>
                                                    <span class="w3-text-red w3-center w3-xlarge">Geo-location Error</span>
                                                    <i class="fa fa-times w3-text-black w3-right w3-hover-text-red w3-padding-8 w3-large" style="cursor:pointer;" onclick="document.getElementById('divGeolocationError').style.display='none';"></i>
                                                </div>
                                                <div class="w3-container w3-padding-24">
                                                    <span id="txtGeolocationError" class="w3-text-black"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="coloured w3-left">
                                <div class="checkbox-container">
                                    <label style="position: inherit; pointer-events: all;">
                                        <%--<asp:CheckBox ID="chkRegAgreement" Checked="false" runat="server" />--%>
                                        <input id="chkRegAgreement" type="checkbox" onchange="agreementCheckChanged(this);" />
                                        <span class="checkbox-material">
                                            <span class="check"></span>
                                        </span>
                                        &nbsp;I accept the terms and conditions.
                                    </label>
                                </div>
                            </div>
                            <asp:Button ID="btnRegister" Text="Finish Sign Up" class="w3-btn-block w3-green w3-ripple w3-section w3-padding w3-disabled" OnClick="btnRegister_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Cookie Footer -->
    <div id="cookieFooter" class="w3-card-8 w3-animate-bottom w3-padding-0">
        <div class="w3-container w3-red w3-large w3-padding-medium">
            Cookie Terms Acceptance
                <i onclick="document.getElementById('cookieFooter').style.display='none';" class="fa fa-remove w3-right w3-closebtn" title="Yes, I accept."></i>
        </div>
        <div class="w3-container w3-black w3-center w3-padding-medium">
            <div class="w3-container w3-hide-small w3-hide-medium w3-medium" style="text-align: justify;">
                We accept cookies on our websites to help us offer you the best online experience. We've already placed some of these tiny packets of information on your browser to do this. By continuing to use our website you're agreeing to our use of cookies.
                    <br />
                <div class="w3-btn w3-right w3-dark-grey w3-medium w3-hover-white" onclick="document.getElementById('cookieFooter').style.display='none';">
                    Yes, I understand
                </div>
            </div>
            <div class="w3-container w3-hide-large w3-small" style="text-align: justify;">
                We accept cookies on our websites to help us offer you the best online experience. We've already placed some of these tiny packets of information on your browser to do this. By continuing to use our website you're agreeing to our use of cookies.
                    <br />
                <div class="w3-btn w3-right w3-dark-grey w3-medium w3-hover-white" onclick="document.getElementById('cookieFooter').style.display='none';">
                    Yes, I understand
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <!-- script to adjust style of few elements -->
    <script type="text/javascript">
        $(window).ready(function () {
            document.getElementById("divSeperatorLarge").style.height = Math.max(document.getElementById("divNormalLogin").offsetHeight, document.getElementById("divSocialLogin").offsetHeight) + "px";
            setTimeout(function () {
                document.getElementById("cookieFooter").style.display = "block";
            }, 3000);
        });
    </script>

    <!-- script for auto-hyphenation -->
    <script type="text/javascript">
        function autoKey(ele) {
            var str = ele.value.replace(/-/g, "");
            //alert(str + " : " + str.length + "\n" + ele.value);
            if (str.length != 0 && str.length % 5 == 0 && str.length < 25) {
                if (ele.value.substr(-1,1) != "-")
                    ele.value += "-";
            }
            if (str.length > 25) {
                document.getElementById("<%=iconVerCodeError.ClientID%>").style.display = "block";
            }
            else {
                document.getElementById("<%=iconVerCodeError.ClientID%>").style.display = "none";
            }
        }
    </script>

    <!-- script for confirm password -->
    <script type="text/javascript">
        function checkPasswords() {
            var elePass1 = document.getElementById('<%=txtRegisterStorePass1.ClientID%>');
            var elePass2 = document.getElementById('<%=txtRegisterStorePass2.ClientID%>');
            var eleIcon = document.getElementById('iconConfPassError');
            if (elePass2.value.length > 0) {
                eleIcon.style.display = "block";
                if ((elePass2.value == elePass1.value)) {   // && eleIcon.classList.contain("w3-text-red")) {
                    eleIcon.classList.remove("w3-text-red");
                    eleIcon.classList.add("w3-text-green");
                    eleIcon.classList.remove("fa-times-circle");
                    eleIcon.classList.add("fa-check-circle");
                }
                else {
                    eleIcon.classList.remove("w3-text-green");
                    eleIcon.classList.add("w3-text-red");
                    eleIcon.classList.remove("fa-check-circle");
                    eleIcon.classList.add("fa-times-circle");
                }
            }
            else {
                eleIcon.style.display = "none";
            }
        }
    </script>

    <!-- script for zip -->
    <%--<script type="text/javascript">
        // Create the XHR object.
        function createCORSRequest(method, url) {
            var xhr = new XMLHttpRequest();
            if ("withCredentials" in xhr) {
                // XHR for Chrome/Firefox/Opera/Safari.
                xhr.open(method, url, true);
            } else if (typeof XDomainRequest != "undefined") {
                // XDomainRequest for IE.
                xhr = new XDomainRequest();
                xhr.open(method, url);
            } else {
                // CORS not supported.
                xhr = null;
            }
            return xhr;
        }

        // Helper method to parse the title tag from the response.
        function getTitle(text) {
            return text.match('<title>(.*)?</title>')[1];
        }

        // Make the actual CORS request.
        function findZip(ele) {
            alert("hi2");
            
        }
        function findZip(ele) {
            var tag = document.createElement("script");
            tag.src = 'https://www.whizapi.com/api/v2/util/ui/in/indian-city-by-postal-code?pin=560013&project-app-key=kr46qphix56ktqpra9uj1zyo?callback=getZip';
            document.getElementsByTagName("head")[0].appendChild(tag);
        }
        function getZip(response) {
            alert(response);
        }
    </script>--%>
    <script type="text/javascript">
        function findZip(ele) {
            var s = ele.value.replace(/\D/g, "");
            ele.value = s;
            alert(s + " : " + ele.value);
            if (ele.value.length == 6) {

            }
            //else if (ele.value.length > 6){
            //    ele.value = ele.value.replace(/(\d{6})(\d+)/, "$1");
            //    //alert(str);
            //}
        }
    </script>

    <!-- script to toggle password view -->
    <script type="text/javascript">
        function togglePassword(field) {
            switch (field) {
                case "login":
                    var icon = document.getElementById("iconShowLoginPassword");
                    var textField = document.getElementById("<%= txtLoginStorePass.ClientID %>");
                    break;
                case "regPass1":
                    var icon = document.getElementById("iconShowRegPass1");
                    var textField = document.getElementById("<%= txtRegisterStorePass1.ClientID %>");
                    break;
                case "regPass2":
                    var icon = document.getElementById("iconShowRegPass2");
                    var textField = document.getElementById("<%= txtRegisterStorePass2.ClientID %>");
                    break;
            }
            
            if (icon.classList.contains("fa-eye")) {
                textField.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            }
            else {
                textField.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
    </script>

    <!-- script for tabs -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            if (document.querySelectorAll('.tabContainer').length && document.querySelectorAll('.sectionsContainer').length) {
                var activeTab = document.querySelector('.tabContainer').querySelector('.tabs .tab:first-child');
                var activeSection = document.querySelector('.sectionsContainer').querySelector('.sections .section:first-child');
                activeTab.classList.add('active');
                activeSection.classList.add('active');
            }

            app.tabs.initialize();
        }, false);

        var app = {
            tabs: {
                initialize: function () {
                    if (document.querySelectorAll('.tabContainer').length) {
                        var container = document.querySelectorAll('.tabContainer');

                        for (var i = 0, l = container.length; i < l; i++) {
                            app.tabs.contain.call(null, container[i]);
                            app.tabs.setIndicatorWidth.call(null, container[i]);

                            var tabs = container[i].querySelectorAll('.tabs .tab');

                            for (var ii = 0, ll = tabs.length; ii < ll; ii++) {
                                tabs[ii].addEventListener('click', function () {
                                    app.tabs.setActiveTab.call(this);
                                }, false);
                            }
                        }

                        window.addEventListener('resize', function () {
                            for (var i = 0, l = container.length; i < l; i++) {
                                app.tabs.contain.call(null, container[i]);
                                app.tabs.setIndicatorWidth.call(null, container[i]);
                            }
                        }, false);
                    }
                },
                setIndicatorWidth: function (parent) {
                    if (parent.querySelectorAll('.tabs div').length === 0) {
                        parent.querySelector('.tabs').appendChild(document.createElement('div'));
                        parent.querySelector('.tabs div').classList.add('indicator');
                    }

                    var indicator = parent.querySelector('.tabs .indicator');
                    var containerRect = parent.querySelector('.tabs').getBoundingClientRect();
                    var curTabRect = parent.querySelector('.tabs .tab.active').getBoundingClientRect();

                    // left = left of active element minus left of parent container
                    indicator.style.left = (curTabRect.left - containerRect.left) + 'px';
                    // right = parent container width minus width of active element plus left of active element
                    indicator.style.right = ((containerRect.left + containerRect.width) - (curTabRect.left + curTabRect.width)) + 'px';
                },
                setActiveTab: function () {
                    var indicator = this.parentElement.querySelector('.indicator');
                    var parent = this;
                    var newTab = this;
                    var newTabSelector = this.getAttribute('data-tab');
                    <%--alert(newTabSelector == "a");
                    if (newTabSelector == "a") {
                        document.getElementById('<%= txtLoginStoreId.ClientID %>').focus();
                    }
                    else {
                        document.getElementById('<%= txtRegisterStoreId.ClientID %>').focus();
                    }--%>
                    var newSection = document.querySelector('.sectionsContainer .sections .section[data-section=' + newTabSelector + ']')
                    var oldSection = document.querySelector('.sectionsContainer .sections .section.active');

                    while (!parent.classList.contains('tabs')) {
                        parent = parent.parentElement;
                    }

                    var oldTab = parent.querySelector('.tab.active');

                    var parentRect = parent.getBoundingClientRect();
                    var newTabRect = newTab.getBoundingClientRect();
                    var indicatorRect = indicator.getBoundingClientRect();

                    if (indicatorRect.left < newTabRect.left) {
                        TweenMax.to(indicator, .2, {
                            right: ((parentRect.left + parentRect.width) - (newTabRect.left + newTabRect.width)) + 'px',
                            ease: Power2.easeOut
                        });

                        TweenMax.to(indicator, .2, {
                            left: (newTabRect.left - parentRect.left) + 'px',
                            ease: Power2.easeOut,
                            delay: .1
                        });
                    } else {
                        TweenMax.to(indicator, .2, {
                            left: (newTabRect.left - parentRect.left) + 'px',
                            ease: Power2.easeOut
                        });

                        TweenMax.to(indicator, .2, {
                            right: ((parentRect.left + parentRect.width) - (newTabRect.left + newTabRect.width)) + 'px',
                            ease: Power2.easeOut,
                            delay: .1
                        });
                    }

                    oldTab.classList.remove('active');
                    oldSection.classList.remove('active');
                    this.classList.add('active');
                    newSection.classList.add('active');

                },
                contain: function (container) {

                }
            }
        }
    </script>

    <!-- script to get coordinate and location -->
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        function getCoordinates() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (p) {
                    document.getElementById('<%= txtRegisterStoreLat.ClientID %>').value = (p.coords.latitude + " ").substr(0, 9);
                    document.getElementById('<%= txtRegisterStoreLong.ClientID %>').value = (p.coords.longitude + " ").substr(0, 9);
                    document.getElementById('<%= txtRegisterStoreLat.ClientID %>').setAttribute("readonly", "readonly");
                    document.getElementById('<%= txtRegisterStoreLong.ClientID %>').setAttribute("readonly", "readonly");
                    setTimeout(function () { getLocation(); }, 300);
                }, function (error) {
                    document.getElementById("divGeolocationError").style.display = "block";
                    var ele = document.getElementById("txtGeolocationError");
                    var str = "";
                    switch (error.code) {
                        case error.PERMISSION_DENIED:
                            str = "User denied the request for Geolocation.";
                            break;
                        case error.POSITION_UNAVAILABLE:
                            str = "Location information is unavailable.";
                            break;
                        case error.TIMEOUT:
                            str = "The request to get user location timed out.";
                            break;
                        case error.UNKNOWN_ERROR:
                            str = "An unknown error occurred.";
                            break;
                    }
                    str += " Enter location details manually.";
                    ele.innerHTML = str;
                });
            }
            else {
                document.getElementById("txtGeolocationError").innerHTML = 'Geo Location feature failed. Enter location details manually.';
            }
        }
    </script>
    <script type="text/javascript">
        function getLocation() {
            apiUrl = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + document.getElementById('<%= txtRegisterStoreLat.ClientID %>').value + ',' + document.getElementById('<%= txtRegisterStoreLong.ClientID %>').value + '&sensor=true';
            //alert(apiUrl);
            $.ajax({
                url: apiUrl,
                success: function (data) {
                    //alert("hi");
                    var city = "", state = "", zip = "";
                    var obj = data;
                    for (var i = 0; i < obj.results[0].address_components.length; i++) {
                        //alert(obj.results[0].address_components[i]);
                        for (var j = 0; j < obj.results[0].address_components[i].types.length; j++) {
                            if (obj.results[0].address_components[i].types[j] == "administrative_area_level_2")
                                city = obj.results[0].address_components[i].long_name;
                            if (obj.results[0].address_components[i].types[j] == "administrative_area_level_1")
                                state = obj.results[0].address_components[i].long_name;
                            if (obj.results[0].address_components[i].types[j] == "postal_code")
                                zip = obj.results[0].address_components[i].long_name;
                        }
                    }
                    document.getElementById('<%= txtRegisterStoreCity.ClientID %>').value = city;
                    document.getElementById('<%= txtRegisterStoreState.ClientID %>').value = state;
                    document.getElementById('<%= txtRegisterStoreZip.ClientID %>').value = zip;
                    document.getElementById('<%= txtRegisterStoreCity.ClientID %>').setAttribute("readonly", "readonly");
                    document.getElementById('<%= txtRegisterStoreState.ClientID %>').setAttribute("readonly", "readonly");
                    document.getElementById('<%= txtRegisterStoreZip.ClientID %>').setAttribute("readonly", "readonly");
                }
            });
            //$.getJSON('https://www.whizapi.com/api/v2/util/ui/in/indian-city-by-postal-code?pin=560013&project-app-key=kr46qphix56ktqpra9uj1zyo&jsonp=?').done(function (response) {
            //    alert(response.ResponseCode);
            //});
        }
    </script>
    <script type="text/javascript">
        function clearLocation() {
            document.getElementById('<%= txtRegisterStoreLat.ClientID %>').value = "";
            document.getElementById('<%= txtRegisterStoreLong.ClientID %>').value = "";
            document.getElementById('<%= txtRegisterStoreCity.ClientID %>').value = "";
            document.getElementById('<%= txtRegisterStoreState.ClientID %>').value = "";
            document.getElementById('<%= txtRegisterStoreZip.ClientID %>').value = "";
            document.getElementById('<%= txtRegisterStoreCity.ClientID %>').removeAttribute("readonly");
            document.getElementById('<%= txtRegisterStoreState.ClientID %>').removeAttribute("readonly");
            document.getElementById('<%= txtRegisterStoreZip.ClientID %>').removeAttribute("readonly");
            document.getElementById('<%= txtRegisterStoreLat.ClientID %>').removeAttribute("readonly");
            document.getElementById('<%= txtRegisterStoreLong.ClientID %>').removeAttribute("readonly");
        }
    </script>

    <!-- script for check agreement -->
    <script type="text/javascript">
        function agreementCheckChanged(ele) {
            var regButton = document.getElementById('<%=btnRegister.ClientID%>');
            if (ele.checked == true) {
                regButton.classList.remove("w3-disabled");
                regButton.removeAttribute("disabled");
            }
            else {
                regButton.classList.add("w3-disabled");
                regButton.setAttribute("disabled", "disabled");
            }
        }
    </script>
</asp:Content>
