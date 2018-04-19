<%@ Page Title="Manager's Console" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManagerConsole.aspx.cs" Inherits="ManagerConsole" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <asp:Button ID="btnManagerLogout" Text="Logout from Manager's Console" class="w3-btn w3-white w3-text-red w3-hover-black w3-hover-text-red w3-ripple w3-section w3-padding w3-left" OnClick="btnManagerLogout_Click" runat="server" />
                <h2>Manager's Console</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <i class="w3-text-red w3-hover-text-black fa fa-chevron-up w3-closebtn w3-large" onclick="showAccordian('divStoreDetails');"></i>
                        <div class="w3-text-blue w3-center w3-xlarge">Store Details</div>
                    </div>
                    <div id="divStoreDetails" class="w3-container w3-show w3-animate-zoom accords">
                        <table class="w3-table w3-bordered w3-centered">
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreId" Text="sushant" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-id-badge" aria-hidden="true"></i>&nbsp;Store ID</label>
                                    </div>
                                </td>
                                <td>
                                    <%--<i id="btnEditStoreDetailsStoreId" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreId');"></i>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreName" Text="sushant" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Store Name</label>
                                    </div>
                                </td>
                                <td>
                                    <i id="btnEditStoreDetailsStoreName" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreName');"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreLocation" Text="City, State, 654321" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;Store Location</label>
                                    </div>
                                </td>
                                <td>
                                    <%--<i id="btnEditStoreDetailsStoreLocation" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreLocation');"></i>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreLicence" Text="xxxxx-xxxxx-xxxxx-xxxxx-xxxxx" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-key" aria-hidden="true"></i>&nbsp;Store Licence Code</label>
                                    </div>
                                </td>
                                <td>
                                    <%--<i id="btnEditStoreDetailsStoreLicence" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreLicence');"></i>--%>
                                </td>
                            </tr>
                        </table>
                        <asp:Button ID="btnSaveStoreDetails" Text="Save Manager Details" class="w3-btn-block w3-green w3-ripple w3-section w3-padding" OnClick="btnSaveStoreDetails_Click" runat="server" />
                    </div>
                </div>
                <hr />
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <i class="w3-text-red w3-hover-text-black fa fa-chevron-down w3-closebtn w3-large" onclick="showAccordian('divStoreManagerDetails');"></i>
                        <div class="w3-text-blue w3-center w3-xlarge">Store Manager Details</div>
                    </div>
                    <div id="divStoreManagerDetails" class="w3-container w3-hide w3-animate-zoom accords">
                        <table class="w3-table w3-bordered w3-centered">
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreManagerName" Text="Adolf Hitler" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Store Manager Name</label>
                                    </div>
                                </td>
                                <td>
                                    <i id="btnEditStoreDetailsStoreManagerName" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreManagerName');"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreManagerPhone" Text="9876543210" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;Store Manager Phone</label>
                                    </div>
                                </td>
                                <td>
                                    <i id="btnEditStoreDetailsStoreManagerPhone" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreManagerPhone');"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreDetailsStoreManagerEmail" Text="example@example.com" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-at" aria-hidden="true"></i>&nbsp;Store Manager Email</label>
                                    </div>
                                </td>
                                <td>
                                    <i id="btnEditStoreDetailsStoreManagerEmail" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreManagerEmail');"></i>
                                </td>
                            </tr>
                        </table>
                        <asp:Button ID="btnSaveStoreManagerDetails" Text="Save Manager Details" class="w3-btn-block w3-green w3-ripple w3-section w3-padding" OnClick="btnSaveStoreManagerDetails_Click" runat="server" />
                    </div>
                </div>
                <hr />
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <i class="w3-text-red w3-hover-text-black fa fa-chevron-down w3-closebtn w3-large" onclick="showAccordian('divPasswordDetails');"></i>
                        <div class="w3-text-blue w3-center w3-xlarge">Change Store Passwords</div>
                    </div>
                    <div id="divPasswordDetails" class="w3-container w3-hide w3-animate-zoom accords">
                        <div class="w3-row">
                            <div class="w3-col m6 w3-padding">
                                <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                    <span class="w3-left w3-padding w3-text-black w3-large">Change Store Password?</span>
                                    <div id="toggleStorePass" class="toggle w3-right">
                                        <div class="toggle__rail">
                                            <div class="toggle__ball">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="divChangeStorePass" class="w3-container w3-animate-zoom" style="display: none;">
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreLoginCurrPass" class="input-animated" placeholder=" " runat="server" type="password" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Current Store Password</label>
                                        <i id="iconShowStoreLoginCurrPass" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('StoreLoginCurrPass');"></i>
                                    </div>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreLoginNewPass1" class="input-animated" placeholder=" " runat="server" type="password" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-certificate" aria-hidden="true"></i>&nbsp;New Store Password</label>
                                        <%--<i id="iconShowStoreLoginNewPass1" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('StoreLoginNewPass1');"></i>--%>
                                    </div>
                                    <div class="group">
                                        <asp:TextBox ID="txtStoreLoginNewPass2" class="input-animated" placeholder=" " runat="server" type="password" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;Confirm New Password</label>
                                        <%--<i id="iconShowStoreLoginNewPass2" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('StoreLoginNewPass2');"></i>--%>
                                    </div>
                                    <br />
                                    <asp:Button ID="btnChangeStorePass" Text="Change Store Password" class="w3-btn-block w3-green w3-ripple w3-padding" OnClick="btnChangeStorePass_Click" runat="server" />
                                </div>
                            </div>
                            <div class="w3-col m6 w3-padding">
                                <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                    <span class="w3-left w3-padding w3-text-black w3-large">Change Store Manager's Password?</span>
                                    <div id="toggleManagerPass" class="toggle w3-right">
                                        <div class="toggle__rail">
                                            <div class="toggle__ball">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="divChangeManagerPass" class="w3-container w3-animate-zoom" style="display: none;">
                                    <div class="group">
                                        <asp:TextBox ID="txtManagerCurrPass" class="input-animated" placeholder=" " runat="server" type="password" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Current Manager Password</label>
                                        <i id="iconShowManagerCurrPass" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('ManagerCurrPass');"></i>
                                    </div>
                                    <div class="group">
                                        <asp:TextBox ID="txtManagerNewPass1" class="input-animated" placeholder=" " runat="server" type="password" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-certificate" aria-hidden="true"></i>&nbsp;New Manager Password</label>
                                        <%--<i id="iconShowManagerNewPass1" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('ManagerNewPass1');"></i>--%>
                                    </div>
                                    <div class="group">
                                        <asp:TextBox ID="txtManagerNewPass2" class="input-animated" placeholder=" " runat="server" type="password" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;Confirm New Password</label>
                                        <%--<i id="iconShowManagerNewPass2" class="fa fa-eye w3-text-blue-grey w3-hover-text-blue sideIconPass" onclick="togglePassword('ManagerNewPass2');"></i>--%>
                                    </div>
                                    <br />
                                    <asp:Button ID="btnChangeManagerPass" Text="Change Manager's Password" class="w3-btn-block w3-green w3-ripple w3-padding" OnClick="btnChangeManagerPass_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(window).ready(function () {
            document.getElementById('<%= txtStoreDetailsStoreId.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreName.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreLocation.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreLicence.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreManagerName.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreManagerPhone.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreManagerEmail.ClientID %>').setAttribute("readonly", "readonly");
        })
    </script>

    <!-- script for when edit button is clicked -->
    <script type="text/javascript">
        function editClicked(action) {
            var eleBtn = document.getElementById('btnEdit' + action);
            var eleTxt = eleBtn.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild;
            var errorFlag = false;
            if (eleBtn.classList.contains('fa-pencil-square-o')) {
                eleBtn.classList.remove('fa-pencil-square-o');
                eleBtn.classList.add('fa-check');
                eleBtn.classList.remove('w3-text-blue');
                eleBtn.classList.remove('w3-hover-text-indigo');
                eleBtn.classList.add('w3-text-green');
                eleBtn.classList.add('w3-hover-text-teal');

                eleTxt.removeAttribute('readonly');
                eleTxt.focus();
            }
            else {
                eleBtn.classList.add('fa-pencil-square-o');
                eleBtn.classList.remove('fa-check');
                eleBtn.classList.add('w3-text-blue');
                eleBtn.classList.add('w3-hover-text-indigo');
                eleBtn.classList.remove('w3-text-green');
                eleBtn.classList.remove('w3-hover-text-teal');

                eleTxt.setAttribute('readonly','readonly');
                eleTxt.blur();
                if (action == 'StoreDetailsStoreManagerPhone' && !/^\d{10}$/.test(eleTxt.value)) {
                    alert("Invalid \"Store Manager Phone\" value. Should be 10 digits. Enter again.");
                    errorFlag = true;
                }
                else if (action == 'StoreDetailsStoreManagerEmail' && !/(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/.test(eleTxt.value)) {
                    alert("Invalid \"Store Manager Email\" value. Enter again.");
                    errorFlag = true;
                }
            }
            if (errorFlag) {
                editClicked(action);
                eleTxt.focus();
            }
        }
    </script>

    <!-- script for accordian -->
    <script type="text/javascript">
        function showAccordian(elementId) {
            var accrods = document.getElementsByClassName("accords");
            for (var i = 0; i < accrods.length; i++) {
                if (accrods[i].id == elementId) {
                    var x = document.getElementById(elementId);
                    var btn = x.parentNode.firstElementChild.firstElementChild;
                    if (x.className.indexOf("w3-show") == -1) {
                        x.className += " w3-show";
                        x.className = x.className.replace(" w3-hide", "");

                        btn.classList.remove('fa-chevron-down');
                        btn.classList.add('fa-chevron-up');
                    } else {
                        x.className += " w3-hide";
                        x.className = x.className.replace(" w3-show", "");

                        btn.classList.add('fa-chevron-down');
                        btn.classList.remove('fa-chevron-up');
                    }
                }
                else {
                    if (accrods[i].className.indexOf("w3-show") != -1) {
                        var x = document.getElementById(accrods[i].id);
                        var btn = x.parentNode.firstElementChild.firstElementChild;

                        x.className += " w3-hide";
                        x.className = x.className.replace(" w3-show", "");

                        btn.classList.add('fa-chevron-down');
                        btn.classList.remove('fa-chevron-up');
                    }
                }
            }
            //var x = document.getElementById(elementId);
            //var btn = x.parentNode.firstElementChild.firstElementChild;
            //if (x.className.indexOf("w3-show") == -1) {
            //    x.className += " w3-show";
            //    x.className = x.className.replace(" w3-hide", "");

            //    btn.classList.remove('fa-chevron-down');
            //    btn.classList.add('fa-chevron-up');
            //} else {
            //    x.className += " w3-hide";
            //    x.className = x.className.replace(" w3-show", "");

            //    btn.classList.add('fa-chevron-down');
            //    btn.classList.remove('fa-chevron-up');
            //}
        }
    </script>

    <script type="text/javascript">
        var stateStorePass = false;
        var stateManagerPass = false;
        $('#toggleStorePass').on('click', function () {
            if (stateStorePass === false) {
                document.getElementById('divChangeStorePass').style.display = 'block';
                $(this).addClass('toggle--active');
                stateStorePass = true;
            } else {
                document.getElementById('divChangeStorePass').style.display = 'none';
                $(this).removeClass('toggle--active');
                stateStorePass = false;
            }
        });
        $('#toggleManagerPass').on('click', function () {
            if (stateManagerPass === false) {
                document.getElementById('divChangeManagerPass').style.display = 'block';
                $(this).addClass('toggle--active');
                stateManagerPass = true;
            } else {
                document.getElementById('divChangeManagerPass').style.display = 'none';
                $(this).removeClass('toggle--active');
                stateManagerPass = false;
            }
        });
    </script>

    <!-- script to toggle password view -->
    <script type="text/javascript">
        function togglePassword(field) {
            switch (field) {
                case "StoreLoginCurrPass":
                    var icon = document.getElementById("iconShowStoreLoginCurrPass");
                    var textField = document.getElementById("<%= txtStoreLoginCurrPass.ClientID %>");
                    break;
                case "ManagerCurrPass":
                    var icon = document.getElementById("iconShowManagerCurrPass");
                    var textField = document.getElementById("<%= txtManagerCurrPass.ClientID %>");
                    break;
                <%--case "StoreLoginNewPass2":
                    var icon = document.getElementById("iconShowStoreLoginNewPass2");
                    var textField = document.getElementById("<%= txtStoreLoginNewPass2.ClientID %>");
                    break;--%>
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
</asp:Content>

