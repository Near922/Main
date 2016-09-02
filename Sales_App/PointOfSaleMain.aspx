<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="PointOfSaleMain.aspx.cs" Inherits="PointOfSaleMain" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        function openModal() {
            $('#newTblModal').modal('show');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div id="errorDiv" style="display: none; text-align: left;" runat="server" role="alert" class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Error!</strong> An error has occurred.  Please contact the administrator.
    </div>
    <br />
    <asp:Label ID="lblGreeting" runat="server" Text="" Font-Size="Large" Font-Bold="True" />
    <br />
    <br />
    <br />
    <asp:UpdatePanel ID="btnUpdatePanel" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-sm-4">
                    <div style="padding: 15px;">
                        <asp:Button type="button" ID="btnNewTable" runat="server" class="special_button_blue_two table_button" Text="New Table" OnClick="btnNewTable_Click" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div style="padding: 15px;">
                        <asp:Button ID="btnSales" runat="server" class="special_button_blue_two table_button" Text="Sales"
                            OnClick="btnSales_Click" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div style="padding: 15px;">
                        <asp:Button ID="btnClockOut" runat="server" class="special_button_red table_button" Text="Sign Out" OnClick="btnClockOut_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="min-height: 500px; width: 100%; background-color: #F2F2F2;">
        <tr>
            <td style="height: 100%; vertical-align: top;">
                <asp:ListView ID="openTblList" runat="server"
                    OnItemCommand="openTblList_ItemCommand1" OnItemDataBound="openTblList_ItemDataBound">
                    <ItemTemplate>
                        <div style="padding: 15px;">
                            <asp:Button ID="tblButton" runat="server" CssClass="special_button_lite_dark table_button" Text='<%# Eval("TableNumber") %>'
                                CommandName='<%# Eval("TableNumber") %>' />
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>

    <div class="modal fade" id="newTblModal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="lblErrorUpdate" runat="server">
                <ContentTemplate>
                    <!-- Modal content-->
                    <div class="modal-content" style="text-align: center;">

                        <div class="modal-header" style="padding: 35px 50px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">New Table</h4>
                        </div>
                        <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                            <div style="padding: 20px;">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="lblTblNumber" runat="server" Text="Table Number" Font-Size="X-Large" ClientIDMode="Static"></asp:Label>
                                        <asp:Label ID="txtTblNum" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%" BackColor="#F4F4F4" Height="50px" Font-Size="X-Large" ClientIDMode="Static" CssClass="table_button modal_span"></asp:Label>
                                        <asp:Label ID="lblNumGuests" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%" BackColor="#F4F4F4" Height="50px" Font-Size="X-Large" Visible="false" CssClass="table_button" ClientIDMode="Static"></asp:Label>
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
                                </div>
                                <div class="row" style="padding-top: 50px;">
                                    <div class="col-xs-12">
                                        <asp:Button ID="btnEnter" runat="server" CssClass="special_button_dark_panel" Style="width: 100%; background-color: #4baad3;"
                                            Text="Enter" OnClick="btnEnter_Click" />

                                    </div>
                                </div>

                            </div>
                            <asp:HiddenField ID="tableNumber" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="numberGuests" runat="server" ClientIDMode="Static" />
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnClose" runat="server" CssClass="btn btn-default"
                                Text="Close" data-dismiss="modal" OnClick="btnClose_Click1" UseSubmitBehavior="False" />

                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
