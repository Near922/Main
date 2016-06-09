<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="SplitBills.aspx.cs" Inherits="Sales_App_SplitBills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <asp:Button ID="btnAdd" runat="server" class="special_button_dark" Text='Add' OnClick="btnAdd_Click" />
    <asp:Button ID="btnSave" runat="server" class="special_button_dark" Text='Save' OnClick="btnSave_Click" />
    <asp:Button ID="btnBack" runat="server" class="special_button_dark" Text='Back' OnClick="btnBack_Click" />
    <script src="../Scripts/jquery-2.1.4.js" type="text/javascript"></script>
    <script src="../Scripts/JScript.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.min.js"></script>
</asp:Content>

