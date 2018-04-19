<%@ Page Title="Manager's Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManagerLogin.aspx.cs" Inherits="ManagerLogin" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Manager Login</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-row">
                        <div id="divManagerLogin" class="w3-col m6">
                            <div class="group">
                                <asp:TextBox ID="txtManagerLoginStoreId" class="input-animated" placeholder=" " runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label><i class="fa fa-id-badge" aria-hidden="true"></i>&nbsp;Store ID</label>
                            </div>
                            <div class="group">
                                <asp:TextBox ID="txtManagerLoginPass" class="input-animated" placeholder=" " runat="server" type="password" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Manager Password</label>
                                <i id="iconShowManagerLoginPassword" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword();"></i>
                            </div>
                        </div>
                        <div class="w3-col m1">
                            <div id="divSeperatorLarge" class="w3-hide-small w3-margin-0 w3-display-container">
                                <div class="w3-badge w3-xlarge w3-red w3-display-middle w3-padding" style="z-index: 200;">
                                    <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                        <div id="divLogin" class="w3-col m5 w3-display-container">
                            <asp:Button ID="btnManagerLogin" Text="Login as Store Manager" class="w3-btn-block w3-green w3-ripple w3-padding w3-margin-0 w3-display-middle" OnClick="btnManagerLogin_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(window).ready(function () {
            document.getElementById("divSeperatorLarge").style.height = document.getElementById("divManagerLogin").offsetHeight + "px";
            document.getElementById("divLogin").style.height = document.getElementById("divManagerLogin").offsetHeight + "px";
        })
    </script>

    <script type="text/javascript">
        function togglePassword(field) {
            var icon = document.getElementById("iconShowManagerLoginPassword");
            var textField = document.getElementById("<%= txtManagerLoginPass.ClientID %>");
            
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
</asp:Content>

