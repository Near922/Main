<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="PointOfSaleMain.aspx.cs" Inherits="PointOfSaleMain" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Error!</strong> An error has occurred.  Please contact the administrator.
    </div>
    <br />
    <asp:Label ID="lblGreeting" runat="server" Text="" Font-Size="Large" Font-Bold="True" />
    <br />
    <br />
    <br />

        <div class="row">
            <div class="col-sm-4">
                <div style="padding: 15px;">
                    <asp:Button ID="btnNewTable" runat="server" class="special_button_blue_two table_button" Text="New Table" />
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
    <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none;" />
    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="modalPopup" runat="server" PopupControlID="numberPanel"
        TargetControlID="btnNewTable" BackgroundCssClass="modalBackground grid">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="numberPanel" runat="server" CssClass="modalPopup Panel1" align="center"
        Style="display: none;">
        <div style="background-color: White;">
            <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                <asp:Label ID="Label7" runat="server" Text="Enter Table" ForeColor="White" Font-Size="50px"> </asp:Label>
            </div>
            <div style="padding: 20px 20px 20px 20px;">
                <table id="msgDetails">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="TBLNUMupdatebtns" runat="server">
                                <ContentTemplate>
                                    <table id="tblTableButtons" runat="server" visible="true">
                                        <tr>
                                            <td colspan="3" style="border-top-style: none; border-bottom-style: none">
                                                <asp:UpdatePanel ID="TBLNUMupdate" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblTblNumber" runat="server" Text="Table Number" Font-Size="X-Large"></asp:Label>
                                                        <asp:Label ID="txtTblNum" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%" BackColor="#F4F4F4" Height="50px" Font-Size="X-Large"></asp:Label><asp:Label
                                                            ID="tblNumError" runat="server" Text="" ForeColor="Red" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button1" runat="server" class="special_button_dark" Text="1" OnClick="Button1_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button2" runat="server" class="special_button_dark" Text="2" OnClick="Button2_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button3" runat="server" class="special_button_dark" Text="3" OnClick="Button3_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button4" runat="server" class="special_button_dark" Text="4" OnClick="Button4_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button5" runat="server" class="special_button_dark" Text="5" OnClick="Button5_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button6" runat="server" class="special_button_dark" Text="6" OnClick="Button6_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button7" runat="server" class="special_button_dark" Text="7" OnClick="Button7_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button8" runat="server" class="special_button_dark" Text="8" OnClick="Button8_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button9" runat="server" class="special_button_dark" Text="9" OnClick="Button9_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="ButtonClear" runat="server" class="special_button_dark" Text="Clear" OnClick="ButtonClear_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonZero" runat="server" class="special_button_dark" Text="0" OnClick="ButtonZero_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonTableNumBack" runat="server" class="special_button_dark" Text="Back"
                                                    OnClick="ButtonTableNumBack_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="center" style="border-top-style: none; border-bottom-style: none">
                                                <asp:Button ID="btnEnter" runat="server" CssClass="special_button_dark"
                                                    Text="Enter" OnClick="btnEnter_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table id="tblGuestButtons" runat="server" visible="false">
                                        <tr>
                                            <td colspan="3" style="border-top-style: none; border-bottom-style: none">
                                                <asp:UpdatePanel ID="UpdatePanelNumGuests" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblNumGuests" runat="server" Text="Number of Guests" Font-Size="X-Large"></asp:Label>
                                                        <asp:Label ID="txtNumGuests" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%" BackColor="#F4F4F4" Height="50px" Font-Size="X-Large"></asp:Label><asp:Label
                                                            ID="guestNumError" runat="server" Text="" ForeColor="Red" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button10" runat="server" class="special_button_dark" Text="1" OnClick="Button10_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button11" runat="server" class="special_button_dark" Text="2" OnClick="Button11_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button12" runat="server" class="special_button_dark" Text="3" OnClick="Button12_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button13" runat="server" class="special_button_dark" Text="4" OnClick="Button13_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button14" runat="server" class="special_button_dark" Text="5" OnClick="Button14_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button15" runat="server" class="special_button_dark" Text="6" OnClick="Button15_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button16" runat="server" class="special_button_dark" Text="7" OnClick="Button16_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button17" runat="server" class="special_button_dark" Text="8" OnClick="Button17_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button18" runat="server" class="special_button_dark" Text="9" OnClick="Button18_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="ButtonGuestClear" runat="server" class="special_button_dark" Text="Clear"
                                                    OnClick="ButtonGuestClear_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonGuestZero" runat="server" class="special_button_dark" Text="0" OnClick="ButtonGuestZero_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonBack" runat="server" class="special_button_dark" Text="Back" OnClick="ButtonBack_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="center" style="border-top-style: none; border-bottom-style: none">
                                                <asp:Button ID="btnGuestEnter" runat="server" CssClass="special_button_dark"
                                                    Text="Enter" OnClick="btnGuestEnter_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:UpdatePanel ID="closeBtnUpdate" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnClose" runat="server" CssClass="special_button_red"
                                        Text="Close" OnClick="btnClose_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <!-- ModalPopupExtender -->
</asp:Content>
