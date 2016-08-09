<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="tblDetails.aspx.cs" Inherits="tblDetails" EnableEventValidation="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        function openModal() {
            $('#numberPanel').modal('show');
        }

    </script>
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
                    <cc1:TabContainer ID="TabContainer1" CssClass="MyTabStyle" runat="server" ActiveTabIndex="0" Style="text-align: left; position: relative;"
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

    <!-- ModalPopupExtender -->


    <asp:UpdatePanel ID="controlUpdates" runat="server">
        <ContentTemplate>
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
                        <asp:Button ID="paymentButton" runat="server" class="special_button_dark table_button" Text='Payment' OnClick="paymentButton_Click" />
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

            <div class="modal fade" id="numberPanel" role="dialog">
                <div class="modal-dialog">
                    <asp:UpdatePanel ID="lblErrorUpdate" runat="server">
                        <ContentTemplate>
                            <!-- Modal content-->
                            <div class="modal-content" style="text-align: center;">

                                <div class="modal-header" style="padding: 35px 50px;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Payment</h4>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                                    <div style="padding: 20px;">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:Label ID="txtPaymentSpan" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%" BackColor="#F4F4F4" Height="50px" Font-Size="X-Large" ClientIDMode="Static" CssClass="table_button modal_span"></asp:Label>
                                                <asp:Label ID="tblNumError" runat="server" ForeColor="Red" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 20px;">
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button1" runat="server" class="special_button_dark_panel money_button table_button">1</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button2" runat="server" class="special_button_dark_panel money_button table_button">2</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button3" runat="server" class="special_button_dark_panel money_button table_button">3</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button4" runat="server" class="special_button_dark_panel money_button table_button">4</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button5" runat="server" class="special_button_dark_panel money_button table_button">5</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button6" runat="server" class="special_button_dark_panel money_button table_button">6</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button7" runat="server" class="special_button_dark_panel money_button table_button">7</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button8" runat="server" class="special_button_dark_panel money_button table_button">8</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button9" runat="server" class="special_button_dark_panel money_button table_button">9</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <asp:Button ID="ButtonClear" runat="server" class="special_button_dark_panel clear_button table_button" Text="Clear" ClientIDMode="Static" />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="ButtonZero" runat="server" class="special_button_dark_panel money_button table_button">0</button>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <asp:Button ID="ButtonTableNumBack" runat="server" class="special_button_dark_panel money_back_button table_button" Text="Back"
                                                        ClientIDMode="Static" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div style="padding-bottom: 10px !important;"> 

                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div style="padding-bottom: 10px !important;">
                                                        <button type="button" id="btnDecimal" runat="server" class="special_button_dark_panel money_button table_button">.</button>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div style="padding-bottom: 10px !important;">
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="row" style="padding-top: 50px;">
                                            <div class="col-sm-12">
                                                <asp:Button ID="btnEnter" runat="server" CssClass="special_button_dark_panel" Style="width: 100%; background-color: #4baad3;"
                                                    Text="Enter" OnClick="btnEnter_Click" />

                                            </div>

                                        </div>
                                    </div>
                                    <asp:HiddenField ID="tableNumber" runat="server" ClientIDMode="Static" />

                                </div>
                                <div class="modal-footer">
                            <button type="button" id="btnClose" class="btn btn-default"
                                data-dismiss="modal">
                                Close</button>

                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField runat="server" ID='lblSelectedRow' Value='' ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID='lblSelectedRowIndex' Value='' ClientIDMode="Static" />
</asp:Content>
