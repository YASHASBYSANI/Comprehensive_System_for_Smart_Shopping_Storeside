<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="w3-card-8 w3-margin-0 w3-white">
        <div class="w3-container w3-red w3-right-align">
            <h2>Logout</h2>
        </div>
        <div class="w3-container w3-white w3-padding-medium">
            <h3>Logout successful.</h3>
            <p>
                You have been logged out successfully.<br />
                You are being redirected to the login page in <span id="countDown" class="w3-xlarge w3-text-blue">5</span> seconds.<br /><br />
                <span class="w3-text-red w3-xlarge">Auto login won't work after you logout.</span>
            </p>
            <a href="Login.aspx" class="w3-btn-block w3-green w3-ripple w3-section w3-padding">Login /Sign Up
            </a>
        </div>
    </div>

    <script type="text/javascript">
        $(window).ready(function () {
            var secs = 5;
            setTimeout(function () {
                location.href = "Login.aspx";
            }, 5000);
            setInterval(function () {
                document.getElementById("countDown").innerHTML = secs;
                secs = secs - 1;
            }, 1000);
        });
    </script>
</asp:Content>

