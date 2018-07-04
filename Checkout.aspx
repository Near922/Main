<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="Checkout3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Scripts/FooTable-2.0.3/css/footable.core.min.css" rel="stylesheet" />
    <script type="text/javascript">

        function openServerModal() {
            $('#serverPanel').modal('show');
        }

        function openBWModal() {
            $('#bwPanel').modal('show');
        }
    </script>
    <style type="text/css">
        a:hover{
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
    <asp:ScriptManagerProxy ID="ScriptManager10" runat="server">
            <Scripts>
            <asp:ScriptReference Path="Scripts/FooTable-2.0.3/js/footable.js" />
            </Scripts>
    </asp:ScriptManagerProxy>
    <div>
        <br />
        <asp:UpdatePanel ID="messageUpdate" runat="server">
            <ContentTemplate>

                <div id="messageDiv" style="display: none; text-align: left;" runat="server" role="alert" class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong>
                    <asp:Label ID="lblMessage" runat="server" Text="Data was saved successfully." />
                </div>
                <div id="errorDiv" style="display: none; text-align: left;" runat="server" role="alert" class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Error!</strong>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="An error has occurred.  Please contact the administrator." />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <div class="row" style="padding-bottom: 20px;">
            <div class="col-sm-6" style="padding-bottom: 20px; text-align: left;">
                <asp:TextBox CssClass="form-control" runat="server" ID="txtDatePicker" />
            </div>
            <div class="col-sm-6" style="padding-bottom: 20px; text-align: left;">
                <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-block btn-lg btn-primary"
                    Text="Search" ForeColor="White"   Style="background-color: #34495E; max-width:300px;" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>
    <cc1:CalendarExtender ID="calExtend" runat="server" TargetControlID="txtDatePicker" />
    <asp:UpdatePanel ID="btnUpdatePanel" runat="server">
        <ContentTemplate>
            <div class="row" style="padding-bottom: 20px;">
                <div class="col-sm-3" style="padding-bottom: 20px; text-align: left;">
                    <asp:Button runat="server" ID="btnAddServer" CssClass="btn btn-block btn-lg btn-primary" Text="Add Server"  Style="background-color: #34495E; max-width:300px !important;" ForeColor="White" OnClick="btnAddServer_Click" UseSubmitBehavior="False" />
                </div>
                <div class="col-sm-3" style="padding-bottom: 20px; text-align: left">
                    <asp:Button runat="server" ID="btnAddSA" CssClass="btn btn-block btn-lg btn-primary" Style="background-color: #34495E; max-width:300px !important;"
                        Text="Add SA" ForeColor="White" OnClick="btnAddSA_Click" UseSubmitBehavior="False" />
                </div>
                <div class="col-sm-3" style="padding-bottom: 20px; text-align: left">
                </div>
                <div class="col-sm-3" style="padding-bottom: 20px; text-align: left">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="upPanelGrids" runat="server">
        <ContentTemplate>
            <div class="table-responsive">
                <div class="table">

                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Style="text-align: left;"
                        ForeColor="Black" Width="100%" CssClass="MyTabStyle">
                        <cc1:TabPanel runat="server" ID="TabPanel1" HeaderText="Lunch" Width="100%">
                            <ContentTemplate>
                                <div>
                                    <asp:Label ID="linkbutton1" runat="server" Text="+ Lunch"></asp:Label>
                                </div>
                                <asp:Panel ID="Panel1" runat="server" Style="width: 100%;">

                                    <asp:GridView ID="tblServerDataGridView" CssClass="style_grid footable toggle-medium" runat="server" AllowSorting="True"
                                        AutoGenerateColumns="False" OnSorting="tblServerDataGridView_Sorting"
                                        Width="100%" BorderStyle="None">
                                        <AlternatingRowStyle BackColor="#F2F2F2" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Server" SortExpression="Name" />
                                            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section"></asp:BoundField>
                                            <asp:BoundField DataField="Sales" DataFormatString="{0:c}" HeaderText="Sales" SortExpression="Sales" />
                                            <asp:BoundField DataField="Cash" DataFormatString="{0:c}" HeaderText="Cash" SortExpression="Cash" />
                                            <asp:BoundField DataField="TotalOwed" DataFormatString="{0:c}" HeaderText="Owed"
                                                SortExpression="TotalOwed" />
                                            <asp:BoundField DataField="ChargeTips" DataFormatString="{0:c}" HeaderText="Charge"
                                                SortExpression="ChargeTips" />
                                            <asp:BoundField DataField="BWTipout" DataFormatString="{0:c}" HeaderText="SA TO"
                                                SortExpression="BWTipout" />
                                            <asp:BoundField DataField="BarTipout" DataFormatString="{0:c}" HeaderText="Bar TO"
                                                SortExpression="BarTipout" />
                                            <asp:BoundField DataField="TipsClaimed" DataFormatString="{0:c}" HeaderText="Claim"
                                                SortExpression="Tips" />
                                        </Columns>
                                        <EmptyDataRowStyle BackColor="White" Width="100%" />
                                    </asp:GridView>

                                    <br />
                                    <br />
                                    <div>
                                        <asp:GridView ID="tblBackwaitDataGridView" runat="server" AutoGenerateColumns="False"
                                            Width="100%" CssClass="style_grid2">
                                            <AlternatingRowStyle BackColor="#F2F2F2" />
                                            <Columns>
                                                <asp:BoundField DataField="Name" HeaderText="Server Assistant" />
                                                <asp:BoundField DataField="Hours" HeaderText="Hours" />
                                                <asp:BoundField DataField="Tips" DataFormatString="{0:c}" HeaderText="Tips" />
                                            </Columns>
                                            <EmptyDataRowStyle BackColor="White" Width="100%" />
                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                                <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" CollapseControlID="linkbutton1"
                                    ExpandControlID="linkbutton1" CollapsedSize="0" CollapsedText="+ Lunch" ExpandedText="- Lunch"
                                    SuppressPostBack="True" TargetControlID="Panel1" TextLabelID="linkbutton1" Enabled="True">
                                </cc1:CollapsiblePanelExtender>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanel2" HeaderText="Dinner" ForeColor="Black">
                            <ContentTemplate>
                                <div>
                                    <asp:Label ID="linkbutton2" runat="server" Text="+ Dinner"></asp:Label>
                                </div>
                                <asp:Panel ID="Panel2" runat="server">
                                    <div>
                                        <asp:GridView ID="tblServerDataGridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                            OnSorting="tblServerDataGridView_Sorting"
                                            EmptyDataRowStyle-Width="100%" Width="100%" RowStyle-Height="25" CssClass="style_grid footable toggle-medium">
                                            <AlternatingRowStyle BackColor="#F2F2F2" />
                                            <Columns>
                                                <asp:BoundField DataField="Name" HeaderText="Server" SortExpression="Name" />
                                                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section"></asp:BoundField>
                                                <asp:BoundField DataField="Sales" DataFormatString="{0:c}" HeaderText="Sales" SortExpression="Sales" />
                                                <asp:BoundField DataField="Cash" DataFormatString="{0:c}" HeaderText="Cash" SortExpression="Cash" />
                                                <asp:BoundField DataField="TotalOwed" DataFormatString="{0:c}" HeaderText="Owed"
                                                    SortExpression="TotalOwed" />
                                                <asp:BoundField DataField="ChargeTips" DataFormatString="{0:c}" HeaderText="Charge"
                                                    SortExpression="ChargeTips" />
                                                <asp:BoundField DataField="BWTipout" DataFormatString="{0:c}" HeaderText="SA TO"
                                                    SortExpression="BWTipout" />
                                                <asp:BoundField DataField="BarTipout" DataFormatString="{0:c}" HeaderText="Bar TO"
                                                    SortExpression="BarTipout" />
                                                <asp:BoundField DataField="TipsClaimed" DataFormatString="{0:c}" HeaderText="Claim"
                                                    SortExpression="Tips" />
                                            </Columns>
                                            <EmptyDataRowStyle BackColor="White" Width="100%" />
                                        </asp:GridView>
                                    </div>
                                    <br />
                                    <br />
                                    <div>
                                        <asp:GridView ID="tblBackwaitDataGridView1" runat="server" AutoGenerateColumns="False"
                                            Width="100%" CssClass="style_grid2">
                                            <AlternatingRowStyle BackColor="#F2F2F2" />
                                            <Columns>
                                                <asp:BoundField DataField="Name" HeaderText="Server Assistant" />
                                                <asp:BoundField DataField="Hours" HeaderText="Hours" />
                                                <asp:BoundField DataField="Tips" DataFormatString="{0:c}" HeaderText="Tips" />
                                            </Columns>
                                            <EmptyDataRowStyle BackColor="White" Width="100%" />
                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                                </div>
                                <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" CollapseControlID="linkbutton2"
                                    ExpandControlID="linkbutton2" CollapsedSize="0" CollapsedText="+ Dinner" ExpandedText="- Dinner"
                                    SuppressPostBack="True" TargetControlID="Panel2" TextLabelID="linkbutton2" Enabled="True">
                                </cc1:CollapsiblePanelExtender>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                    <table style="width: 100%;" class="footable table toggle-medium">
                        <thead>
                            <tr>
                                <th data-class="expand" style="width: 60%;">

                                    <asp:Label ID="Label2" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Totals"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="Label3" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Sales"></asp:Label>
                                </th>
                                <th data-hide="phone">
                                    <asp:Label ID="Label4" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Cash"></asp:Label>
                                </th>
                                <th data-hide="phone">
                                    <asp:Label ID="Label5" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="SATips"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="Label6" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Deposit"></asp:Label>
                                </th>
                            </tr>
                        </thead>
                        <tr>
                            <td>
                                <asp:Label ID="Label31" runat="server" Font-Size="Large" Font-Strikeout="False"
                                    ForeColor="Black" Style="text-align: left" Text="Lunch"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLunchSales" runat="server" ForeColor="Black"
                                    Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLunchCash" runat="server" ForeColor="Black" Style="text-align: right"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLunchBackTips" runat="server" ForeColor="Black"
                                    Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLunchDeposit" runat="server" ForeColor="Black" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label32" runat="server" Font-Size="Large" Font-Strikeout="False"
                                    Text="Dinner" Style="text-align: left"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDinnerSales" runat="server" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDinnerCash" runat="server" ForeColor="Black" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDinnerBackTips" runat="server" ForeColor="Black"
                                    Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDinnerDeposit" runat="server" ForeColor="Black" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label33" runat="server" Font-Size="Large" Font-Strikeout="False"
                                    ForeColor="Black" Text="Grand Total" Style="text-align: left"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNetSales" runat="server" ForeColor="Black" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNetCashIn" runat="server" ForeColor="Black"
                                    Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblBackwait" runat="server" ForeColor="Black" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDeposit" runat="server" ForeColor="Black" Style="text-align: right; font-size: 16px;"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <div class="modal fade" id="serverPanel" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="modal-content" style="text-align: center;">

                        <div class="modal-header" style="padding: 35px 50px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Server</h4>
                        </div>
                        <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                            <div id="page_one" runat="server">
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label8" runat="server" ForeColor="Black" Text="Shift:"></asp:Label>
                                        </div>
                                        <asp:DropDownList ID="cboShiftOptions" runat="server" BackColor="White" ToolTip="Select Lunch or Dinner for shift."
                                            ForeColor="Black" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:Label ID="lblShiftEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label34" runat="server" ForeColor="Black" Text="Name:"></asp:Label>
                                        </div>

                                        <asp:DropDownList ID="txtName" runat="server" BToolTip="Enter Server/Bartender name."
                                            ForeColor="Black" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:Label ID="lblNameEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label35" runat="server" ForeColor="Black" Text="Section:"></asp:Label>
                                        </div>

                                        <asp:DropDownList ID="cboOptions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboOptions_SelectedIndexChanged"
                                            ToolTip="Select serving section." ForeColor="Black" CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:Label ID="lblSectionEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnNext" runat="server" CssClass="btn btn-block btn-lg btn-primary button_flat_blue" Style="background-color: #4baad3" Text="Next" OnClick="btnNext_Click" />
                                    </div>
                                </div>
                            </div>
                            <div id="page_two" runat="server" visible="false">
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label36" runat="server" ForeColor="Black" Text="Sales:"></asp:Label>
                                        </div>

                                        <asp:TextBox ID="txtSales" runat="server" ToolTip="Enter Sales." ForeColor="Black"
                                            CssClass="form-control"></asp:TextBox>

                                        <asp:Label ID="lblSalesEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">

                                        <div>
                                            <asp:Label ID="Label37" runat="server" ForeColor="Black" Text="Cash:"></asp:Label>
                                        </div>

                                        <asp:TextBox ID="txtOwed" runat="server" ToolTip="Enter cash owed to the house or server."
                                            ForeColor="Black" CssClass="form-control"></asp:TextBox>

                                        <asp:Label ID="lblCashEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label38" runat="server" ForeColor="Black" Text="Charge Tips:"></asp:Label>
                                        </div>

                                        <asp:TextBox ID="txtCharge" runat="server" ToolTip="Enter charge tips." ForeColor="Black"
                                            CssClass="form-control"></asp:TextBox>

                                        <asp:Label ID="lblChargeEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>

                                <div id="barDiv" runat="server" class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label39" runat="server" ForeColor="Black" Text="Bar:"></asp:Label>
                                        </div>
                                        <asp:TextBox ID="txtBarTips" runat="server" ToolTip="Enter bar tips unless a bartender or ToGo server."
                                            ForeColor="Black" CssClass="form-control"></asp:TextBox>

                                        <asp:Label ID="lblBarEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div id="msgDiv" runat="server" visible="false">
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <asp:Label ID="lblMain" runat="server" Style="font-size: medium"></asp:Label>
                                        <asp:Label ID="lblCash" runat="server" Style="font-size: medium; font-weight: 700"></asp:Label>
                                    </div>
                                </div>

                                <div class="row" style="padding-bottom: 20px; text-align: left;">

                                    <div class="col-sm-12">
                                        <asp:Button ID="btnClose" runat="server" CssClass="btn btn-block btn-lg btn-primary button_flat_blue" Style="background-color: #4baad3" Text="Next" OnClick="btnClose_Click" />
                                    </div>

                                </div>
                            </div>
                            <div id="tipsDiv" runat="server" visible="false">
                                <div class="row" style="padding-bottom: 20px; text-align: left;">
                                    <div class="col-sm-12">
                                        <div>
                                            <asp:Label ID="Label40" runat="server" ForeColor="Black" Text="Tips:"></asp:Label>
                                        </div>

                                        <asp:TextBox ID="txtTips" runat="server" ToolTip="Must claim at least 15% of sales."
                                            ForeColor="Black" CssClass="form-control"></asp:TextBox>

                                        <asp:Label ID="lblTipsEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-block btn-lg btn-primary #2980b9" Style="background-color: #4baad3" OnClick="btnSend_Click" Text="Send"
                                            ToolTip="Send results to the grid." />
                                    </div>
                                </div>
                            </div>

                            <div id="mainButtons" runat="server" class="row" style="padding-bottom: 20px;">
                                <div class="col-sm-6" style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px;">
                                    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-block btn-lg btn-primary button_flat_blue" Style="background-color: #4baad3" Text="Back" Visible="false" OnClick="btnBack_Click"  />
                                </div>
                                <div class="col-sm-6" style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px;">
                                    <asp:Button ID="btnCalculate" runat="server" CssClass="btn btn-block btn-lg btn-primary button_flat_blue" Style="background-color: #4baad3" Visible="false" OnClick="btnCalculate_Click" Text="Calculate"
                                        ToolTip="Send results to the grid." />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="serverClose" class="btn btn-default"
                                data-dismiss="modal">
                                Close</button>
                        </div>
                    </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="bwPanel" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="lblErrorUpdate" runat="server">
                <ContentTemplate>
                    <div class="modal-content" style="text-align: center;">

                        <div class="modal-header" style="padding: 35px 50px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Server Assistant</h4>
                        </div>
                        <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                            <div class="row" style="padding-bottom: 20px; text-align: left;">
                                <div class="col-sm-12">
                                    <div>
                                        <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Shift:"></asp:Label>
                                    </div>

                                    <asp:DropDownList ID="cboBWShiftOptions" runat="server" BackColor="White" ToolTip="Select Lunch or Dinner for shift."
                                        ForeColor="Black"  CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblBWShiftEdit" runat="server" Style="text-align: center"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="padding-bottom: 20px; text-align: left;">
                                <div class="col-sm-12">
                                    <div>
                                        <asp:Label ID="Label41" runat="server" ForeColor="Black" Text="Name:"></asp:Label>
                                    </div>

                                    <asp:DropDownList ID="txtBackName" runat="server" ToolTip="Enter Backwaiter name."
                                        ForeColor="Black" CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblBackNameEdit" runat="server" Style="text-align: center"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="padding-bottom: 20px; text-align: left;">
                                <div class="col-sm-12">
                                    <div>
                                        <asp:Label ID="Label42" runat="server" ForeColor="Black" Text="Hours:"></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtHours" runat="server" ToolTip="Enter hours backwaiter worked."
                                            ForeColor="Black" CssClass="form-control"></asp:TextBox>

                                        <asp:Label ID="lblHoursEdit" runat="server" Style="text-align: center"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-bottom: 20px;">
                                <div class="col-sm-12">
                                    <asp:Button ID="button1" runat="server" CssClass="btn btn-block btn-lg btn-primary button_flat_blue" Style="background-color: #4baad3" OnClick="button1_Click" Text="Send"
                                        ToolTip="Send results to the grid."  />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="bwClose" class="btn btn-default"
                                data-dismiss="modal">
                                Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
