<%@ Page MaintainScrollPositionOnPostback="true" Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Home</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <div class="w3-panel w3-leftbar w3-border-blue w3-large">
                    Welcome to the home page of <span class="w3-text-red">Samy Store Application</span>.<br />
                    Here are some quick links for you.<br />
                    <br />
                    <div class="w3-row">
                        <div class="w3-col s6 m4 w3-padding">
                            <a href="StockTaking.aspx" class="w3-btn-block w3-green w3-ripple w3-padding">
                                <div class="w3-container w3-rightbar w3-border-white">
                                    Stock Taking&nbsp;<i class="fa fa-stack-overflow fa-fw"></i>
                                </div>
                            </a>
                        </div>
                        <%--<div class="w3-col s6 m3 w3-padding">
                            <a href="CheckIn.aspx" class="w3-btn-block w3-green w3-ripple w3-padding">
                                <div class="w3-container w3-rightbar w3-border-white">
                                    Check In&nbsp;<i class="fa fa-sign-in fa-fw"></i>
                                </div>
                            </a>
                        </div>--%>
                        <div class="w3-col s6 m4 w3-padding">
                            <a href="CheckOut.aspx" class="w3-btn-block w3-green w3-ripple w3-padding">
                                <div class="w3-container w3-rightbar w3-border-white">
                                    Check Out&nbsp;<i class="fa fa-sign-out fa-fw"></i>
                                </div>
                            </a>
                        </div>
                        <div class="w3-col s6 m4 w3-padding">
                            <a href="ManagerConsole.aspx" class="w3-btn-block w3-green w3-ripple w3-padding">
                                <div class="w3-container w3-rightbar w3-border-white">
                                    Manager's Console&nbsp;<i class="fa fa-shield fa-fw"></i>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <i class="w3-text-red w3-hover-text-black fa fa-chevron-down w3-closebtn w3-large" onclick="showAccordian('divStoreDetails');"></i>
                        <div class="w3-text-blue w3-center w3-xlarge">Store Details</div>
                    </div>
                    <div id="divStoreDetails" class="w3-container w3-hide w3-animate-zoom">
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
                                    <%--<i id="btnEditStoreDetailsStoreName" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreName');"></i>--%>
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
                        </table>
                    </div>
                </div>
                <hr />
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <i class="w3-text-red w3-hover-text-black fa fa-chevron-down w3-closebtn w3-large" onclick="showAccordian('divStoreManagerDetails');"></i>
                        <div class="w3-text-blue w3-center w3-xlarge">Store Manager Details</div>
                    </div>
                    <div id="divStoreManagerDetails" class="w3-container w3-hide w3-animate-zoom">
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
                                    <%--<i id="btnEditStoreDetailsStoreManagerName" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreManagerName');"></i>--%>
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
                                    <%--<i id="btnEditStoreDetailsStoreManagerPhone" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreManagerPhone');"></i>--%>
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
                                    <%--<i id="btnEditStoreDetailsStoreManagerEmail" class="fa fa-pencil-square-o w3-xlarge w3-text-blue w3-hover-text-indigo" style="cursor: pointer; position: relative; bottom: -30px;" onclick="editClicked('StoreDetailsStoreManagerEmail');"></i>--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- script on page-load -->
    <script type="text/javascript">
        $(window).ready(function () {
            document.getElementById('<%= txtStoreDetailsStoreId.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreName.ClientID %>').setAttribute("readonly", "readonly");
            document.getElementById('<%= txtStoreDetailsStoreLocation.ClientID %>').setAttribute("readonly", "readonly");
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

                eleTxt.setAttribute('readonly', 'readonly');
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
    </script>
</asp:Content>