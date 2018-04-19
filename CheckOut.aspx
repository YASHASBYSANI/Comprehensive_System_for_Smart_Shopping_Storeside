<%@ Page Title="Check Out" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Check Out</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <div class="w3-panel w3-leftbar w3-border-blue w3-large">
                    <div class="w3-container">
                        <div class="w3-text-blue w3-center w3-xlarge">Customer Check Out</div>
                    </div>
                    <div id="divCheckout" class="w3-container w3-show w3-animate-zoom accords">
                        <div class="w3-row">
                            <div id="divCheckOutText" class="w3-col m6">
                                <div class="group">
                                    <asp:TextBox ID="txtUserName" class="input-animated" placeholder=" " runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Username</label>
                                </div>
                            </div>
                            <div id="divCheckOutBtn" class="w3-col m6 w3-display-container">
                                <asp:Button ID="btnGetCheckOutDetails" Text="Get Check Out Details" class="w3-btn w3-green w3-ripple w3-padding w3-display-middle" OnClick="btnGetCheckOutDetails_Click" runat="server" />
                            </div>
                        </div>
                        <asp:Panel ID="divCheckOutDetails" runat="server" Visible="false">
                            <hr />
                            <div class="w3-row">
                                <div class="w3-col m6 w3-padding">
                                    <div class="group">
                                        <asp:TextBox ID="txtDetailsUserEmail" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-at" aria-hidden="true"></i>&nbsp;User's Email</label>
                                    </div>
                                    <div class="group">
                                        <asp:TextBox ID="txtDetailsUserName" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;User's Name</label>
                                    </div>
                                </div>
                                <div class="w3-col m6 w3-padding">
                                    <div class="group">
                                        <asp:TextBox ID="txtDetailsCheckinId" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-id-badge" aria-hidden="true"></i>&nbsp;Check-In ID</label>
                                    </div>
                                    <%--<div class="group">
                                        <asp:TextBox ID="txtDetailsCheckinDate" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;Check-In Date</label>
                                    </div>--%>
                                    <div class="group">
                                        <asp:TextBox ID="txtDetailsCheckinTime" class="input-animated" placeholder=" " runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;Check-In Time</label>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <asp:Panel ID="pnlView" Style="padding: 0px; padding-top: 0px; text-align: center;" runat="server">
                                <div class="w3-text-blue w3-center w3-large">Purchase Details</div>
                                <br />
                                <div class="w3-container w3-light-grey w3-padding w3-large w3-row" style="text-align: left">
                                    <div class="w3-col m6 w3-padding">
                                        <div class="group">
                                            <asp:TextBox ID="txtExpectedWeight" class="input-animated" placeholder=" " runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><i class="fa fa-balance-scale" aria-hidden="true"></i>&nbsp;Expected Wet Weight (grams)</label>
                                        </div>
                                    </div>
                                    <div class="w3-col m6 w3-padding">
                                        <div class="group">
                                            <asp:TextBox ID="txtObservedWeight" class="input-animated" placeholder=" " runat="server" OnTextChanged="txtObservedWeight_TextChanged" AutoPostBack="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><i class="fa fa-balance-scale" aria-hidden="true"></i>&nbsp;Recorded Wet Weight (grams)</label>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnStopAlarm" Text="Stop Alarm" class="w3-btn-block w3-red w3-ripple w3-padding" OnClick="btnStopAlarm_Click" Visible="false" runat="server" />
                                    <div class="clr"></div>
                                </div>
                                <br />
                                <div class="w3-container w3-light-grey w3-padding w3-large w3-row" style="text-align: left">
                                    <div class="w3-col m6">
                                        Transaction ID: <asp:Label ID="lblTransactionId" class="w3-text-red" runat="server"></asp:Label><br />
                                        Total purchase amount: <asp:Label ID="lblTotalAmount" class="w3-text-red" runat="server"></asp:Label> &#8377;<br />
                                        Paid via Samy Cash: <asp:Label ID="lblSamyCashAmount" class="w3-text-red" runat="server"></asp:Label> Samy Cash<sup>&#174;</sup><br />
                                        Pending amount to be received: <asp:Label ID="lblCashAmount" class="w3-text-red" runat="server"></asp:Label> &#8377;<br />
                                        <div class="coloured w3-left">
                                            <div class="checkbox-container">
                                                <label style="position: inherit; pointer-events: all;">
                                                    <asp:CheckBox ID="chkPayementReceived" Checked="false" runat="server" OnCheckedChanged="chkPayementReceived_CheckedChanged" AutoPostBack="true" />
                                                    <!-- <input id="check_remember" type="checkbox" checked="checked" /> -->
                                                    <span class="checkbox-material">
                                                        <span class="check"></span>
                                                    </span>
                                                    &nbsp;Pending amount received
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w3-col m6 w3-center">
                                        <asp:Button ID="btnCheckOut" Text="Check Out Customer" class="w3-btn w3-green w3-ripple w3-padding" OnClick="btnCheckOut_Click" runat="server" Visible="false" />
                                    </div>
                                </div>
                                <br />
                                <table border="1" style="width: calc(100% - 0px); color: white; border-collapse: collapse; height: 32px; border: 1px solid white;" class="w3-red w3-medium">
                                    <tr>
                                        <td style="width: 20%; text-align: center">Item<br />Code</td>
                                        <td style="width: 20%; text-align: center">Item<br />Name</td>
                                        <%--<td style="width: 20%; text-align: center">Batch<br />Number</td>--%>
                                        <td style="width: 15%; text-align: center">Weight/<br />Volume</td>
                                        <td style="width: 15%; text-align: center">Rate<br />(&#8377;)</td>
                                        <td style="width: 15%; text-align: center">Quantity</td>
                                        <td style="width: 15%; text-align: center">Price<br />(&#8377;)</td>
                                    </tr>
                                </table>
                                <div style="width: 100%;">
                                    <asp:Panel ID="pnlGridView" runat="server" style="width: calc(100% - 0px);">
                                        <asp:GridView ID="grdPurchaseDetails" runat="server" AutoGenerateColumns="false" ShowHeader="false" Style="font-size-adjust: 0.5; width: 100%;" class="w3-hoverable">
                                            <Columns>
                                                <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdPurchaseDetailsItemCode" />
                                                <asp:TemplateField ItemStyle-Width="20%" ItemStyle-Wrap="true">
                                                    <ItemStyle Wrap="true" Width="20%" />
                                                    <ItemTemplate>
                                                        <div style="padding: 0; margin: 0; word-wrap: break-word; word-break: break-all;">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("grdPurchaseDetailsItemName") %>' style="text-align: justify;"></asp:Label>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField ItemStyle-Width="15%" ItemStyle-Wrap="true" DataField="grdPurchaseDetailsItemWeight" />
                                                <asp:BoundField ItemStyle-Width="15%" ItemStyle-Wrap="true" DataField="grdPurchaseDetailsRate" />
                                                <asp:BoundField ItemStyle-Width="15%" ItemStyle-Wrap="true" DataField="grdPurchaseDetailsQuantity" />
                                                <asp:BoundField ItemStyle-Width="15%" ItemStyle-Wrap="true" DataField="grdPurchaseDetailsPrice" />
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Scripts -->
    <script type="text/javascript">
        $(window).ready(function () {
            document.getElementById("divCheckOutBtn").style.height = document.getElementById("divCheckOutText").offsetHeight + "px";
            document.getElementById("<%=txtDetailsUserEmail.ClientID%>").setAttribute("readonly", "readonly");
            document.getElementById("<%=txtDetailsUserName.ClientID%>").setAttribute("readonly", "readonly");
            document.getElementById("<%=txtDetailsCheckinId.ClientID%>").setAttribute("readonly", "readonly");
            document.getElementById("<%=txtDetailsCheckinTime.ClientID%>").setAttribute("readonly", "readonly");
        })
    </script>
</asp:Content>

