<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="Checkout3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManager10" runat="server">
    </asp:ScriptManagerProxy>
    <div>
        <br />
        <asp:UpdatePanel ID="messageUpdate" runat="server">
            <ContentTemplate>

                <div id="messageDiv" style="display: none; text-align: left;" runat="server" class="alert alert-success">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Success!</strong>
                    <asp:Label ID="lblMessage" runat="server" Text="Data was saved successfully." />
                </div>
                <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Error!</strong>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="An error has occurred.  Please contact the administrator." />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <div class="form-group">
            <asp:TextBox CssClass="textbox" runat="server" ID="txtDatePicker" />
            <asp:Button runat="server" ID="btnSearch" CssClass="special_button_dark"
                Text="Search" ForeColor="White" OnClick="btnSearch_Click" />
        </div>
        <br />
        <br />
        <cc1:CalendarExtender ID="calExtend" runat="server" TargetControlID="txtDatePicker" />
        <asp:Button runat="server" ID="btnAddServer" Width="135px" CssClass="special_button_dark" Text="Add Server" ForeColor="White" />
        <asp:Button runat="server" ID="btnAddSA" CssClass="special_button_dark"
            Text="Add SA" ForeColor="White" />
        <br />
        <br />
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

                                        <asp:GridView ID="tblServerDataGridView" CssClass="style_grid" runat="server" AllowSorting="True"
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
                                                EmptyDataRowStyle-Width="100%" Width="100%" RowStyle-Height="25" CssClass="style_grid">
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
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Totals" Width="300px"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Sales"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Cash"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="SATips"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Deposit"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label31" runat="server" Font-Size="Large" Font-Strikeout="False"
                                        ForeColor="Black" Style="text-align: left" Text="Lunch" Width="300px"></asp:Label>
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
                                        Text="Dinner" Style="text-align: left" Width="300px"></asp:Label>
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
                                        ForeColor="Black" Text="Grand Total" Style="text-align: left" Width="300px"></asp:Label>
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
    </div>
    <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none;" />
    <asp:Button ID="btnShowTips" runat="server" Text="Show Modal Popup" Style="display: none;" />
    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="msgDetails" runat="server" PopupControlID="msgPanel"
        TargetControlID="btnShow" CancelControlID="btnClose" BackgroundCssClass="modalBackground grid">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="msgPanel" runat="server" align="center" Style="display: none;">
        <div style="background-color: White; width: 400px;">
            <div style="background-color: #3498db; padding: 20px 20px 20px 20px; text-align: left;">
                <asp:Label ID="Label10" runat="server" Text="Message" ForeColor="White" Font-Size="50px"> </asp:Label>
            </div>
            <div class="input_form">
                <asp:UpdatePanel ID="upMessage" runat="server">
                    <ContentTemplate>
                        <div style="padding-bottom: 20px;">
                            <asp:Label ID="lblMain" runat="server" Style="font-size: medium"></asp:Label>
                            <asp:Label ID="lblCash" runat="server" Style="font-size: medium; font-weight: 700"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="btnClose" runat="server" CssClass="special_button_red" Text="Close" />
            </div>
            <br />
        </div>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="mpeServerInput" runat="server" PopupControlID="serverInputPanel"
        TargetControlID="btnAddServer" BackgroundCssClass="modalBackground grid">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="serverInputPanel" runat="server" class="modal_panel">
        <asp:UpdatePanel ID="upPanelserverInput" runat="server">
            <ContentTemplate>
                <div style="max-height: 600px; overflow: auto;" class="outer_input_div">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label7" runat="server" Text="Server Form" ForeColor="White" Font-Size="50px"> </asp:Label>
                    </div>
                    <div class="input_form">
                        <div id="page_one" runat="server">
                            <div>
                                <asp:Label ID="Label8" runat="server" ForeColor="Black" Text="Shift:"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="cboShiftOptions" runat="server" BackColor="White" ToolTip="Select Lunch or Dinner for shift."
                                    ForeColor="Black" CssClass="textbox">
                                </asp:DropDownList>
                                <asp:Label ID="lblShiftEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label34" runat="server" ForeColor="Black" Text="Name:"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="txtName" runat="server" BToolTip="Enter Server/Bartender name."
                                    ForeColor="Black" CssClass="textbox">
                                </asp:DropDownList>
                                <asp:Label ID="lblNameEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label35" runat="server" ForeColor="Black" Text="Section:"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="cboOptions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboOptions_SelectedIndexChanged"
                                    ToolTip="Select serving section." ForeColor="Black" CssClass="textbox">
                                </asp:DropDownList>

                                <asp:Label ID="lblSectionEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                        </div>
                        <div id="page_two" runat="server" visible="false">
                            <div>
                                <asp:Label ID="Label36" runat="server" ForeColor="Black" Text="Sales:"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtSales" runat="server" ToolTip="Enter Sales." ForeColor="Black"
                                    CssClass="textbox"></asp:TextBox>

                                <asp:Label ID="lblSalesEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label37" runat="server" ForeColor="Black" Text="Cash:"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtOwed" runat="server" ToolTip="Enter cash owed to the house or server."
                                    ForeColor="Black" CssClass="textbox"></asp:TextBox>

                                <asp:Label ID="lblCashEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label38" runat="server" ForeColor="Black" Text="Charge Tips:"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtCharge" runat="server" ToolTip="Enter charge tips." ForeColor="Black"
                                    CssClass="textbox"></asp:TextBox>

                                <asp:Label ID="lblChargeEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                            <div id="barDiv" runat="server" class="form-group">
                                <div>
                                    <asp:Label ID="Label39" runat="server" ForeColor="Black" Text="Bar:"></asp:Label>
                                </div>
                                <asp:TextBox ID="txtBarTips" runat="server" ToolTip="Enter bar tips unless a bartender or ToGo server."
                                    ForeColor="Black" CssClass="textbox"></asp:TextBox>

                                <asp:Label ID="lblBarEdit" runat="server" Style="text-align: center"></asp:Label>
                            </div>
                        </div>

                        <div class="form-group" style="overflow: hidden;">


                            <asp:Button ID="btnNext" runat="server" Style="float: left;" CssClass="special_button_dark" Text="Next" OnClick="btnNext_Click" />


                            <asp:Button ID="btnBack" runat="server" Style="float: left;" CssClass="special_button_dark" Text="Back" Visible="false" OnClick="btnBack_Click" />

                            <asp:Button ID="btnCalculate" runat="server" Style="float: right;" Text="Calculate" CssClass="special_button_dark"
                                OnClick="btnCalculate_Click"
                                ToolTip="Calculate money owed." Visible="False" />


                            <asp:Button ID="btnServerClose" runat="server" Style="float: right;" CssClass="special_button_red" Text="Cancel" OnClick="btnServerClose_Click" />

                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="mpeTipsInput" runat="server" PopupControlID="tipsPanel"
        BackgroundCssClass="modalBackground grid" TargetControlID="btnClose">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="tipsPanel" runat="server" Style="display: none;" CssClass="modal_panel">
        <asp:UpdatePanel ID="updateTips" runat="server">
            <ContentTemplate>
                <div class="outer_input_div">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label9" runat="server" Text="Tips Form" ForeColor="White" Font-Size="50px"> </asp:Label>
                    </div>
                    <div class="input_form" style="min-height: 150px;">
                        <div>
                            <asp:Label ID="Label40" runat="server" ForeColor="Black" Text="Tips:"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTips" runat="server" ToolTip="Must claim at least 15% of sales."
                                ForeColor="Black" CssClass="textbox"></asp:TextBox>

                            <asp:Label ID="lblTipsEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div class="form-group">

                            <asp:Button ID="btnSend" runat="server" Style="float: left;" CssClass="special_button_dark" OnClick="btnSend_Click" Text="Send"
                                ToolTip="Send results to the grid." />

                            <asp:Button ID="btnTipsClose" runat="server" Style="float: right;" CssClass="special_button_dark" Text="Cancel" OnClick="btnTipsClose_Click" />

                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="mpeBWForm" runat="server" PopupControlID="bwInputPanel"
        BackgroundCssClass="modalBackground grid" TargetControlID="btnAddSA">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="bwInputPanel" runat="server" Style="display: none;" CssClass="modal_panel">
        <asp:UpdatePanel ID="upPanelBW" runat="server">
            <ContentTemplate>
                <div class="outer_input_div">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label11" runat="server" Text="Server Assistant Form" ForeColor="White"
                            Font-Size="50px"> </asp:Label>
                    </div>
                    <div class="input_form" style="min-height: 200px;">
                        <div>
                            <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Shift:"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="cboBWShiftOptions" runat="server" BackColor="White" ToolTip="Select Lunch or Dinner for shift."
                                ForeColor="Black" CssClass="textbox">
                            </asp:DropDownList>
                            <asp:Label ID="lblBWShiftEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label41" runat="server" ForeColor="Black" Text="Name:"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="txtBackName" runat="server" ToolTip="Enter Backwaiter name."
                                ForeColor="Black" CssClass="textbox">
                            </asp:DropDownList>
                            <asp:Label ID="lblBackNameEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label42" runat="server" ForeColor="Black" Text="Hours:"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtHours" runat="server" ToolTip="Enter hours backwaiter worked."
                                ForeColor="Black" CssClass="textbox"></asp:TextBox>

                            <asp:Label ID="lblHoursEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div class="form-group" style="overflow: hidden">

                            <asp:Button ID="button1" runat="server" CssClass="special_button_dark" Style="float: left;" OnClick="button1_Click" Text="Send"
                                ToolTip="Send results to the grid." />

                            <asp:Button ID="btnBWClose" runat="server" CssClass="special_button_red" Style="float: right;" Text="Cancel" OnClick="btnBWClose_Click" />

                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
