﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="tblDetails.aspx.cs" Inherits="tblDetails" EnableEventValidation="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <asp:Label ID="lblServerName" runat="server" Text="" Font-Size="20px" Font-Names="Oxygen" Font-Bold="True"></asp:Label>
    <asp:Label ID="lblTableNum" runat="server" Text="" Font-Size="20px" Font-Names="Oxygen" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:UpdatePanel ID="billUpdate" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-sm-3">
                    <div id="billContainter" runat="server" style="min-height: 300px">
                    </div>
                </div>
                <div class="col-sm-9">
                    <cc1:TabContainer ID="TabContainer1" CssClass="MyTabStyle" runat="server" ActiveTabIndex="4" Style="text-align: left; position: relative;"
                        ForeColor="Black" Width="100%" Height="300">
                        <cc1:TabPanel runat="server" ID="TabPanelBev" HeaderText="Beverages" Style="position: relative;">
                            <ContentTemplate>
                                    <asp:ListView ID="ListViewBeverage" runat="server" RepeatColumns="4"
                                        RepeatDirection="Horizontal" OnItemCommand="ListViewBeverage_ItemCommand1">
                                        <ItemTemplate>
                                            <div style="padding: 15px; float: left;" class="table_button">
                                                <asp:Button ID="bvgButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                    CommandName='<%# Eval("Name") %>' />
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelSoup" HeaderText="Soup" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewSoup" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewSoup_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="soupButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelApps" HeaderText="Appetizers" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewApps" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewApps_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="appsButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelSalad" HeaderText="Salads" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewSalad" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewSalad_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="saladButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelSandwichs" HeaderText="Sandwichs" Width="100%">
                            <HeaderTemplate>
                                Sandwichs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:ListView ID="ListViewSandwichs" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewSandwichs_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="sandwichButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelEntree" HeaderText="Entrees" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewEntree" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewEntree_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="entreeButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelDessert" HeaderText="Desserts" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewDessert" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewDessert_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="dessertButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelBeer" HeaderText="Beer" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewBeer" runat="server" CellSpacing="5" RepeatColumns="4"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewBeer_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="beerButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanelWine" HeaderText="Wine" Width="100%">
                            <ContentTemplate>
                                <asp:ListView ID="ListViewWine" runat="server" CellSpacing="5" RepeatColumns="5"
                                    RepeatDirection="Horizontal" OnItemCommand="ListViewWine_ItemCommand">
                                    <ItemTemplate>
                                        <div style="padding: 15px; float: left;" class="table_button">
                                            <asp:Button ID="wineButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                                CommandName='<%# Eval("Name") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="repeatButton" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="deleteButton" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none;" />

    <!-- ModalPopupExtender -->


    <asp:UpdatePanel ID="controlUpdates" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnShow2" runat="server" Text="Show Modal Popup" Style="display: none;" />
            <cc1:ModalPopupExtender ID="modalPopup" runat="server" PopupControlID="numberPanel"
                TargetControlID="paymentButton" BackgroundCssClass="modalBackground grid">
            </cc1:ModalPopupExtender>
            <cc1:ModalPopupExtender ID="mpeSplitChecks" runat="server" PopupControlID="pnlSplit"
                TargetControlID="btnShow2" BackgroundCssClass="modalBackground grid">
            </cc1:ModalPopupExtender>
            <br />
            <br />
            <div class="row">
                <div class="col-sm-3">

                    <div style="padding: 10px;">
                        <asp:Button ID="sendButton" runat="server" class="special_button_dark table_button" Text='Send' OnClick="sendButton_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="holdButton" runat="server" class="special_button_dark table_button" Text='Hold' OnClick="holdButton_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="deleteButton" runat="server" class="special_button_dark table_button" Text='Delete'
                            OnClick="deleteButton_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="addButton" runat="server" class="special_button_dark table_button" Text='Add Check'
                            OnClick="addButton_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="repeatButton" runat="server" class="special_button_dark table_button" Text='Repeat'
                            OnClick="repeatButton_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="btnSplit" runat="server" class="special_button_dark table_button" Text='Split' OnClick="btnSplit_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="paymentButton" runat="server" class="special_button_dark table_button" Text='Apply Payment' />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="btnCloseTable" runat="server" class="special_button_dark table_button" Text='Close'
                            OnClick="btnCloseTable_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div style="padding: 10px;">
                        <asp:Button ID="exitButton" runat="server" class="special_button_dark table_button" Text='Exit' BackColor="Red"
                            OnClick="exitButton_Click" />
                    </div>
                </div>
                <div class="col-sm-3">
                </div>
            </div>

            <asp:Panel ID="numberPanel" runat="server" CssClass="modalPopup Panel1" align="center"
                Style="display: none;">
                <div style="background-color: White;">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label7" runat="server" Text="Make Payment" ForeColor="White" Font-Size="50px"> </asp:Label>
                    </div>
                    <div style="padding: 20px 20px 20px 20px;">
                        <table id="msgDetails">
                            <tr>
                                <td>
                                    <table id="tblPaymentButtons" runat="server" visible="true">
                                        <tr>
                                            <td colspan="3" style="border-top-style: none; border-bottom-style: none">
                                                <asp:UpdatePanel ID="TBLPaymentupdate" runat="server">
                                                    <ContentTemplate>

                                                        <asp:Label ID="txtTblPayment" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%" BackColor="#F4F4F4" Height="50px" Font-Size="X-Large"></asp:Label>
                                                        <asp:Label
                                                            ID="tblNumError" runat="server" Text="" ForeColor="Red" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button1" runat="server" class="special_button_dark" Text="1" OnClick="Button1_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button2" runat="server" class="special_button_dark" Text="2" OnClick="Button2_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button3" runat="server" class="special_button_dark" Text="3" OnClick="Button3_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button4" runat="server" class="special_button_dark" Text="4" OnClick="Button4_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button5" runat="server" class="special_button_dark" Text="5" OnClick="Button5_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button6" runat="server" class="special_button_dark" Text="6" OnClick="Button6_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button7" runat="server" class="special_button_dark" Text="7" OnClick="Button7_Click" />
                                            </td>
                                            <td style="padding: 10px;"> 
                                                <asp:Button ID="Button8" runat="server" class="special_button_dark" Text="8" OnClick="Button8_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="Button9" runat="server" class="special_button_dark" Text="9" OnClick="Button9_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="ButtonClear" runat="server" class="special_button_dark" Text="Clear" OnClick="ButtonClear_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="ButtonZero" runat="server" class="special_button_dark" Text="0" OnClick="ButtonZero_Click" />
                                            </td>
                                            <td style="padding: 10px;">
                                                <asp:Button ID="ButtonpaymentAmountBack" runat="server" class="special_button_dark" Text="Back"
                                                    OnClick="ButtonpaymentAmountBack_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="border-top-style: none; border-bottom-style: none; padding: 10px;">
                                                <asp:Button ID="btnEnter" runat="server" CssClass="special_button_dark"
                                                    Text="Enter" OnClick="btnEnter_Click" />
                                            </td>
                                            <td align="center" style="border-top-style: none; border-bottom-style: none; padding: 10px;">
                                                <asp:Button ID="btnClose" runat="server" CssClass="special_button_red"
                                                    Text="Close"
                                                    OnClick="btnClose_Click" />
                                            </td>
                                            <td align="center" style="border-top-style: none; border-bottom-style: none ; padding: 10px;">
                                                <asp:Button ID="btnDecimal" runat="server" CssClass="special_button_dark" Text="." OnClick="btnDecimal_Click" />
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>


            <asp:Panel ID="pnlSplit" runat="server" CssClass="modalPopup Panel1" align="center"
                Style="display: none;">
                <div style="background-color: White;">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label2" runat="server" Text="Split Checks" ForeColor="White" Font-Size="50px"> </asp:Label>
                    </div>
                    <div style="padding: 20px 20px 20px 20px;">
                        <table id="tblSplitChecks">
                            <tr>
                                <td>

                                    <table id="Table2" runat="server" visible="true">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:PlaceHolder ID="ph" runat="server" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>

                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField runat="server" ID='lblSelectedRow' Value='' ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID='lblSelectedRowIndex' Value='' ClientIDMode="Static" />
</asp:Content>
