<%@ Page MaintainScrollPositionOnPostback="true" Title="Stocks" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Stocks.aspx.cs" Inherits="Stocks" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-card-8 w3-margin-0 w3-white">
            <div class="w3-container w3-red w3-right-align">
                <h2>Current Stocks</h2>
            </div>
            <div class="w3-container w3-white w3-padding-medium">
                <div class="w3-panel w3-leftbar w3-border-blue">
                
                <div id="divCustomerPurchaseData" class="w3-container w3-show w3-animate-zoom accords w3-padding-top">
                    <asp:Panel ID="pnlView" Style="padding: 0px; padding-top: 0px; text-align: center;" runat="server">
                        <div class="w3-text-grey w3-right w3-small"><b><i>Note</i></b>: Data ordered by "Intake Date-Time".</div>
                        <table border="1" style="width: calc(100% - 0px); color: white; border-collapse: collapse; height: 32px; border: 1px solid white;" class="w3-red">
                            <tr>
                                <td style="width: 20%; text-align: center">Item<br />
                                    Code</td>
                                <td style="width: 20%; text-align: center">Item<br />
                                    Name</td>
                                <td style="width: 20%; text-align: center">Item<br />
                                    Price (&#8377;)</td>
                                <td style="width: 20%; text-align: center">Quantity<br />
                                    In Stock</td>
                                <td style="width: 20%; text-align: center">Intake<br />
                                    Date-Time</td>
                            </tr>
                        </table>
                        <div style="overflow-x: hidden; width: 100%;">
                            <asp:Panel ID="pnlGridView" runat="server" Style="width: calc(100% - 0px);">
                                <asp:GridView ID="grdStockView" runat="server" AutoGenerateColumns="false" ShowHeader="false" Style="font-size-adjust: 0.5; width: 100%;" class="w3-hoverable">
                                    <Columns>
                                        <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdStockViewItemCode" />
                                        <asp:TemplateField ItemStyle-Width="20%" ItemStyle-Wrap="true">
                                            <ItemStyle Wrap="true" Width="20%" />
                                            <ItemTemplate>
                                                <div style="padding: 0; margin: 0; word-wrap: break-word; word-break: break-all;">
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("grdStockViewItemName") %>' Style="text-align: justify;"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdStockViewItemPrice" />
                                        <asp:BoundField ItemStyle-Width="20%" ItemStyle-Wrap="true" DataField="grdStockViewItemQuantity" />
                                        <asp:TemplateField ItemStyle-Width="20%" ItemStyle-Wrap="true">
                                            <ItemStyle Wrap="true" Width="20%" />
                                            <ItemTemplate>
                                                <div style="padding: 0; margin: 0; word-wrap: break-word; word-break: break-all;">
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("grdStockViewIntakeDateTime") %>' Style="text-align: justify;"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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

</asp:Content>

