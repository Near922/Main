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
    <br />
    <br />
    <div class="row">
        <div class="col-sm-3">

            <div style="padding: 10px;">
                <asp:Button ID="btnAdd" runat="server" class="special_button_dark table_button" Text='Add' OnClick="btnAdd_Click" />
            </div>
        </div>
        <div class="col-sm-3">

            <div style="padding: 10px;">
                <asp:Button ID="btnSave" runat="server" class="special_button_dark table_button" Text='Save' OnClick="btnSave_Click" />
            </div>
        </div>
        <div class="col-sm-3">
            <div style="padding: 10px;">
                <asp:Button ID="btnBack" runat="server" class="special_button_dark table_button" Text='Back' OnClick="btnBack_Click" />
            </div>
        </div>
    </div>
</asp:Content>

