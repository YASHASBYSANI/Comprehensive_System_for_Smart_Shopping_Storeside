<%@ Page MaintainScrollPositionOnPostback="true" Title="Stock Taking" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StockTaking.aspx.cs" Inherits="StockTaking" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Stock Taking</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-row">
                        <div class="w3-col m6">
                            <div class="w3-container w3-padding">
                                <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                    <span class="w3-left w3-padding w3-text-black w3-large">Primary item details.</span>
                                </div>
                                <div class="group">
                                    <asp:TextBox ID="txtStockTakingItemCode" class="input-animated" type="number" placeholder=" " runat="server" OnTextChanged="txtStockTakingItemCode_TextChanged" AutoPostBack="true" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp;Item Code</label>
                                </div>
                                <div class="group">
                                    <asp:TextBox ID="txtStockTakingItemName" class="input-animated" placeholder=" " runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-cube" aria-hidden="true"></i>&nbsp;Item Name</label>
                                </div>
                                <div class="group">
                                    <asp:TextBox ID="txtStockTakingItemWetWeight" class="input-animated" placeholder=" " runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-balance-scale" aria-hidden="true"></i>&nbsp;Item Wet Weight (grams)</label>
                                </div>
                                <%--<div class="group">
                                    <asp:TextBox ID="txtStockTakingItemDateManufacture" class="input-animated" placeholder=" " runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;Date of Manufacture</label>
                                </div>--%>
                            </div>
                        </div>
                        <div class="w3-col m6">
                            <div class="w3-container w3-padding">
                                <div class="w3-container w3-padding w3-margin-0 w3-light-grey">
                                    <span class="w3-left w3-padding w3-text-black w3-large">Secondary item details.</span>
                                </div>
                                <div class="group">
                                    <asp:TextBox ID="txtStockTakingItemQuantity" class="input-animated" placeholder=" " runat="server" type="number" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-cubes" aria-hidden="true"></i>&nbsp;Quantity</label>
                                </div>
                                <div class="coloured w3-left">
                                    <div class="checkbox-container">
                                        <label style="position: inherit; pointer-events: all;">
                                            <asp:CheckBox ID="chkWeightRequired" Checked="true" runat="server" OnCheckedChanged="chkWeightRequired_CheckedChanged" AutoPostBack="true" />
                                            <!-- <input id="check_remember" type="checkbox" checked="checked" /> -->
                                            <span class="checkbox-material">
                                                <span class="check"></span>
                                            </span>
                                            &nbsp;Weight/Volume Required
                                        </label>
                                    </div>
                                </div>
                                <div class="clr"></div>
                                <div id="divWeight" class="w3-row" runat="server">
                                    <div class="w3-col s10">
                                        <div class="group">
                                            <asp:TextBox ID="txtStockTakingItemWeight" class="input-animated" type="number" placeholder=" " runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><i class="fa fa-balance-scale" aria-hidden="true"></i>&nbsp;Weight/Volume</label>
                                        </div>
                                    </div>
                                    <div class="w3-col s2">
                                        <asp:DropDownList ID="drpWeightUnit" runat="server" class="w3-right" style="position: relative; bottom: -45px;">
                                            <asp:ListItem Value="--" Text="--"></asp:ListItem>
                                            <asp:ListItem Value="kg" Text="kg"></asp:ListItem>
                                            <asp:ListItem Value="g" Text="g"></asp:ListItem>
                                            <asp:ListItem Value="l" Text="l"></asp:ListItem>
                                            <asp:ListItem Value="ml" Text="ml"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="group">
                                    <asp:TextBox ID="txtStockTakingItemPrice" type="number" class="input-animated" placeholder=" " runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-inr" aria-hidden="true"></i>&nbsp;Price (INR)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnAddItem" Text="Add Item to Inventory" class="w3-btn-block w3-green w3-ripple w3-section w3-padding" OnClick="btnAddItem_Click" runat="server" />
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(window).ready(function () {
            //doOnLoad();
        })
    </script>

    <script>
        <%--function doOnLoad() {
            var myCalendar;
            myCalendar = new dhtmlXCalendarObject(["<%=txtStockTakingItemDateManufacture.ClientID%>"]);
            myCalendar.hideTime();
            myCalendar.setDateFormat("%d-%M-%Y");
            myCalendar.setInsensitiveRange(new Date(), null);
        }--%>
    </script>
</asp:Content>

