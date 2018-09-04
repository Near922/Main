<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="tblDetails.aspx.cs" Inherits="tblDetails" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function openModal() {
            $('#numberPanel').modal('show');
        }
        $(document).ready(function () {
            var val = $('#lblMenuButtonActive').val();
            $('a[href="' + val + '"]').parents("li").addClass("active");
            $(val).addClass("active");
        }
        );
    </script>
    <style>
        .checkGridView tr:hover {
        }

        a:hover {
            color: white !important;
        }

        a:visited {
            color: white !important;
        }

        a:active {
            color: white !important;
        }

        a:focus {
            color: white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <asp:Label ID="lblServerName" runat="server" Text="" Font-Size="20px" Font-Names="Oxygen" Font-Bold="True"></asp:Label>
    <asp:Label ID="lblTableNum" runat="server" Text="" Font-Size="20px" Font-Names="Oxygen" Font-Bold="True"></asp:Label>
    <br />
    <br />


    <div class="row">
        <div class="col-sm-3">
            <asp:UpdatePanel ID="billUpdate" runat="server">
                <ContentTemplate>
                    <div id="billContainer" runat="server" style="min-height: 300px; padding: 10px;">
                        <ul style="color: black !important;" class="nav  nav-tabs">
                                         <% var tab_state = ""; %>
                            <% for (int i = 0; i < table.GetBills().Count; i++)
                                { %>
                            <% if (int.Parse(lblActiveBill.Value) == i)
                                {
                                    tab_state = "active";%>
                            <%} %>
                            <% else
                                {
                                    tab_state = "";%>
                            <%} %>
                            <li class="<%= tab_state %> billTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#<%=string.Format("bill_{0}", i)%>">

                                <%= string.Format("Check {0}", i + 1) %>

                            </a>
                                <input type="hidden" id='billIndex' value="<%=string.Format("{0}", i) %>" />
                            </li>
                            <% } %>
                        </ul>
                        <div class="tab-content">
                            <% var state = ""; %>
                            <% var bills = table.GetBills(); %>
                            <% for (int i = 0; i < bills.Count; i++)
                                { %>
                            <% if (int.Parse(lblActiveBill.Value) == i)
                                {
                                    state = "active";%>
                            <%} %>
                            <% else
                                {
                                    state = "";%>
                            <%} %>
                            <div id="<%=string.Format("bill_{0}", i)%>" style="height: 100%; background-color: cyan;" class="tab-pane fade in <%= state %>">
                                <div class="checkGridView" style="min-height: 500px;">
                                    <% if (bills[i].Orders != null && bills[i].Orders.Count > 0)
                                        {%>
                                    <table class="add checkGridView" id="<%=string.Format("ordersTable{0}", i) %>">
                                        <%foreach (var order in bills[i].Orders)
                                            {%>
                                        <% string format = order.GetName; %>
                                        <% string bgColor = "cyan"; %>
                                        <% if (order.Status.Equals(OrderStatus.Ordered)){ %>
                                        <%format = ">>" + order.GetName; %>
                                        <%} %>

                                        <% if (order.Status.Equals(OrderStatus.OnHold)){ %>
                                              <%bgColor = "pink"; %>
                                        <% } %>
                                        <tr style="background-color: <%= bgColor %>;">
                                            <td><%= format%></td>
                                            <td><%=string.Format("{0:C}", order.GetPrice)%></td>
                                        </tr>
                                        <%}%>
                                    </table>

                                    <table style="color: black !important; width: 100%;">

                                        <tr>
                                            <td style="color: black !important;">Subtotal</td>
                                            <td style="color: black !important; text-align: right;"><%=string.Format("{0:C}", bills[i].SubTotal)%></td>
                                        </tr>
                                        <tr>
                                            <td style="color: black !important;">Tax</td>
                                            <td style="color: black !important; text-align: right;"><%=string.Format("{0:C}", bills[i].TaxTotal)%></td>
                                        </tr>
                                        <tr>
                                            <td style="color: black !important;">Total</td>
                                            <td style="color: black !important; text-align: right;"><%=string.Format("{0:C}", bills[i].FinalTotal)%></td>
                                        </tr>
                                        <tr>
                                            <td style="color: black !important;">Payment</td>
                                            <td style="color: black !important; text-align: right;"><%=string.Format("{0:C}", bills[i].Payment)%></td>
                                        </tr>
                                        <tr>
                                            <td style="color: black !important;">Balance Due</td>
                                            <td style="color: black !important; text-align: right;"><%=string.Format("{0:C}", bills[i].FinalTotal - bills[i].Payment)%></td>
                                        </tr>
                                    </table>
                                    <%}%>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="repeatButton" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="deleteButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="col-sm-9">


                <ul style="color: black !important;" class="nav  nav-tabs">

                <li class="menuTab" style="color: black !important; border-color: gray !important;"><a data-toggle="tab" style="color: black !important;" href="#bev">Beverages</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#soup">Soup</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#apps">Appetizers</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#salads">Salads</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#sand">Sandwiches</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#entree">Entrees</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#dessert">Desserts</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#beer">Beer</a></li>
                <li class="menuTab" style="border-color: gray;"><a data-toggle="tab" style="color: black !important;" href="#wine">Wine</a></li>
            </ul>
            <div class="tab-content">
                <div id="bev" class="tab-pane fade in">
                    <asp:ListView ID="ListViewBeverage" runat="server" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewBeverage_ItemCommand1">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="bvgButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="soup" class="tab-pane fade in">

                    <asp:ListView ID="ListViewSoup" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewSoup_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="soupButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="apps" class="tab-pane fade in">
                    <asp:ListView ID="ListViewApps" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewApps_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="appsButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                </div>
                <div id="salads" class="tab-pane fade in">
                    <asp:ListView ID="ListViewSalad" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewSalad_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="saladButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="sand" class="tab-pane fade in">
                    <asp:ListView ID="ListViewSandwichs" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewSandwichs_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="sandwichButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="entree" class="tab-pane fade in">

                    <asp:ListView ID="ListViewEntree" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewEntree_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="entreeButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="dessert" class="tab-pane fade in">

                    <asp:ListView ID="ListViewDessert" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewDessert_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="dessertButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="beer" class="tab-pane fade in">

                    <asp:ListView ID="ListViewBeer" runat="server" CellSpacing="5" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewBeer_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="beerButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div id="wine" class="tab-pane fade in">

                    <asp:ListView ID="ListViewWine" runat="server" CellSpacing="5" RepeatColumns="5"
                        RepeatDirection="Horizontal" OnItemCommand="ListViewWine_ItemCommand">
                        <ItemTemplate>
                            <div style="padding: 15px; float: left;" class="table_button">
                                <asp:Button ID="wineButton" runat="server" class="special_link_button opac table_button" Text='<%# Eval("Name") %>'
                                    CommandName='<%# Eval("Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

        </div>
    </div>
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
                            OnClick="exitButton_Click" UseSubmitBehavior="True" />
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
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button1" runat="server" class="special_button_dark_panel money_button">1</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button2" runat="server" class="special_button_dark_panel money_button">2</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button3" runat="server" class="special_button_dark_panel money_button">3</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button4" runat="server" class="special_button_dark_panel money_button">4</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button5" runat="server" class="special_button_dark_panel money_button">5</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button6" runat="server" class="special_button_dark_panel money_button">6</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button7" runat="server" class="special_button_dark_panel money_button">7</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button8" runat="server" class="special_button_dark_panel money_button">8</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="Button9" runat="server" class="special_button_dark_panel money_button">9</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <asp:Button ID="ButtonClear" runat="server" class="special_button_dark_panel clear_button" Text="Clear" ClientIDMode="Static" />
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <button type="button" id="ButtonZero" runat="server" class="special_button_dark_panel money_button">0</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div style="padding-bottom: 10px !important;">
                                                    <asp:Button ID="ButtonTableNumBack" runat="server" class="special_button_dark_panel money_back_button" Text="Back"
                                                        ClientIDMode="Static" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-4">
                                                    <div style="padding-bottom: 10px !important;">
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div style="padding-bottom: 10px !important;">
                                                        <button type="button" id="btnDecimal" runat="server" class="special_button_dark_panel money_button">.</button>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div style="padding-bottom: 10px !important;">
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="row" style="padding-top: 50px;">
                                            <div class="col-xs-12">
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


    <asp:UpdatePanel ID="updateHiddenFields" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID='lblActiveBill' Value='0' ClientIDMode="Static" />
             <asp:HiddenField runat="server" ID='lblMenuButtonActive' Value='#bev' ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID='lblSelectedRow' Value='' ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID='lblSelectedRowIndex' Value='' ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
