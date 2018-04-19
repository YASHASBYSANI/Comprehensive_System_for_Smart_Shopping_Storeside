<%@ Page Title="Check In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CheckIn.aspx.cs" Inherits="CheckIn" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Check In</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <%--<div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <i class="w3-text-red w3-hover-text-black fa fa-chevron-up w3-closebtn w3-large" onclick="showAccordian('divCustomerCheckin');"></i>
                        <div class="w3-text-blue w3-center w3-xlarge">Customer Checkin</div>
                    </div>
                    <div id="divCustomerCheckin" class="w3-container w3-show w3-animate-zoom accords">
                        <div class="w3-row">
                            <div class="w3-col m3">&nbsp;</div>
                            <div class="w3-col m6">
                                <div class="group">
                                    <asp:TextBox ID="txtCheckinUsername" class="input-animated" placeholder=" " runat="server" OnTextChanged="txtCheckinUsername_TextChanged" AutoPostBack="true" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Customer Username</label>
                                </div>
                            </div>
                            <div class="w3-col m3">&nbsp;</div>
                        </div>
                    </div>
                </div>
                <hr />--%>
                <div class="w3-panel w3-leftbar w3-border-blue">
                    <div class="w3-container">
                        <%--<i class="w3-text-red w3-hover-text-black fa fa-chevron-down w3-closebtn w3-large" onclick="showAccordian('divCustomerCheckinData');"></i>--%>
                        <div class="w3-text-blue w3-center w3-xlarge">Customer Checkin Data</div>
                    </div>
                    <div id="divCustomerCheckinData" class="w3-container w3-show w3-animate-zoom accords w3-padding-top">
                        <div class="w3-row">
                            <div class="w3-col m5">
                                <div class="w3-container w3-padding-0 w3-margin-0">
                                    <center>
                                        <div class="select">
                                            <asp:DropDownList id="drpStartDate" class="slct" OnSelectedIndexChanged="drpStartDate_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                <asp:ListItem value="1">Beginning of Time</asp:ListItem>
                                                <asp:ListItem value="2">Specific Date</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </center>
                                    <div id="divStartDateSelecter" class="w3-animate-zoom" runat="server" style="display: none;">
                                        <div class="group">
                                            <asp:TextBox ID="txtStartDateSelecter" class="input-animated" placeholder=" "  runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><i class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;Select Start Date</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w3-col m2 w3-xxlarge w3-text-red">
                                To
                            </div>
                            <div class="w3-col m5">
                                <div class="w3-container w3-padding-0 w3-margin-0">
                                    <center>
                                        <div class="select">
                                            <asp:DropDownList id="drpEndDate" class="slct" OnSelectedIndexChanged="drpEndDate_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                <asp:ListItem value="1">Till Today</asp:ListItem>
                                                <asp:ListItem value="2">Specific Date</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </center>
                                    <div id="divEndDateSelecter" class="w3-animate-zoom" runat="server" style="display: none;">
                                        <div class="group">
                                            <asp:TextBox ID="txtEndDateSelecter" class="input-animated" placeholder=" " runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><i class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;Select End Date</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <asp:Button ID="btnGetCheckinData" Text="Get Customer Checkin Data" class="w3-btn w3-green w3-ripple w3-padding" OnClick="btnGetCheckinData_Click" runat="server" />
                        <asp:Panel ID="pnlView" Style="padding: 0px; padding-top: 0px; text-align: center;" runat="server" Visible="false ">
                            <h3 style="font-size: 22px;">Customer Checkin Data Result</h3>
                            <div class="w3-text-grey w3-right w3-small"><b><i>Note</i></b>: Data ordered by "Checkin Date-Time".</div>
                            <table border="1" style="width: calc(100% - 20px); color: white; border-collapse: collapse; height: 32px; border: 1px solid white;" class="w3-red">
                                <tr>
                                    <td style="width: 20%; text-align: center">Checkin<br />ID</td>
                                    <td style="width: 20%; text-align: center">Customer<br />Username</td>
                                    <td style="width: 20%; text-align: center">Checkin<br />Date-Time</td>
                                    <td style="width: 20%; text-align: center">Customer<br />Name</td>
                                    <td style="width: 20%; text-align: center">Customer<br />Phone</td>
                                </tr>
                            </table>
                            <div style="max-height: 300px; overflow-y: auto; overflow-x: hidden; width: 100%;">
                                <asp:Panel ID="pnlGridView" runat="server" style="width: calc(100% - 0px);">
                                    <asp:GridView ID="grdCheckinDateView" runat="server" AutoGenerateColumns="false" ShowHeader="false" Style="font-size-adjust: 0.5; width: 100%;" class="w3-hoverable">
                                        <Columns>
                                            <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdCheckinDateViewCheckinId" />
                                            <asp:TemplateField ItemStyle-Width="20%" ItemStyle-Wrap="true">
                                                <ItemStyle Wrap="true" Width="20%" />
                                                <ItemTemplate>
                                                    <div style="padding: 0; margin: 0; word-wrap: break-word; word-break: break-all;">
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("grdCheckinDateViewUsername") %>' style="text-align: justify;"></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdCheckinDateViewCheckinDateTime" />
                                            <asp:TemplateField ItemStyle-Width="20%" ItemStyle-Wrap="true">
                                                <ItemStyle Wrap="true" Width="20%" />
                                                <ItemTemplate>
                                                    <div style="padding: 0; margin: 0; word-wrap: break-word; word-break: break-all;">
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("grdCheckinDateViewCustName") %>' style="text-align: justify;"></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdCheckinDateViewCustPhone" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- script to adjust style of few elements -->
    <script type="text/javascript">
        $(window).ready(function () {
            doOnLoad();
            //document.getElementById("divSeperatorLarge").style.height = Math.max(document.getElementById("divFromDateSelecter").offsetHeight, document.getElementById("divToDateSelecter").offsetHeight) + "px";
        });
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
        }
    </script>

    <!-- script for dropdown -->
    <script type="text/javascript">
        function selectChange(ele) {
            if (ele.id == "<%= drpStartDate.ClientID %>") {
                var eleTxt = document.getElementById('<%= txtStartDateSelecter.ClientID %>');
                var eleDateSelecterDiv = document.getElementById('divStartDateSelecter');
            }
            else {
                var eleTxt = document.getElementById('<%= txtEndDateSelecter.ClientID %>');
                var eleDateSelecterDiv = document.getElementById('divEndDateSelecter');
            }
            if (ele.value == "2") {
                //eleDateSelecterDiv.style.display = "block";
                eleTxt.removeAttribute("readonly");
                eleTxt.focus();
            }
            else {
                //eleDateSelecterDiv.style.display = "none";
                eleTxt.setAttribute("readonly", "readonly");
                eleTxt.blur();
                //eleTxt.value = "";
            }
        }
    </script>

    <script>
        function doOnLoad() {
            var myCalendar1;
            myCalendar1 = new dhtmlXCalendarObject(["<%=txtStartDateSelecter.ClientID%>"]);
            myCalendar1.hideTime();
            myCalendar1.setDateFormat("%d-%M-%Y");
            myCalendar1.setInsensitiveRange(new Date(), null);

            var myCalendar2;
            myCalendar2 = new dhtmlXCalendarObject(["<%=txtEndDateSelecter.ClientID%>"]);
            myCalendar2.hideTime();
            myCalendar2.setDateFormat("%d-%M-%Y");
            myCalendar2.setInsensitiveRange(new Date(), null);
        }
    </script>
</asp:Content>