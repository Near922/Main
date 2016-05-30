<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="SigilQuiz.aspx.cs" Inherits="SigilQuiz" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>
            <div id="messageDiv" style="display: none; text-align: left;" runat="server" class="alert alert-success">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Correct!</strong>
                <asp:Label ID="lblMessage" runat="server" Text="You chose the correct answer." />
            </div>
            <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Incorrect!</strong>You chose the incorrect answer.
            </div>
            <br />
            <br />
            <asp:Label ID="lblQuestion" runat="server" Font-Size="X-Large" Text="Please choose the sigil that belongs to " />
            <asp:Label ID="lblHouse" runat="server" Font-Size="X-Large" Text="" Font-Bold="True" />
            <div style="width: 100%; text-align: center;">
                <table style="margin: auto;">
                    <tr>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil1" CssClass="opac" runat="server" OnClick="sigil1_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset"  /></td>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil2" CssClass="opac"  runat="server" OnClick="sigil2_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset"  /></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil3" CssClass="opac"  runat="server" OnClick="sigil3_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset"  /></td>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil4" CssClass="opac" runat="server" OnClick="sigil4_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset" /></td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none;" />
    <!-- ModalPopupExtender -->
    <asp:ModalPopupExtender ID="mpe" runat="server" PopupControlID="gameOverPanel"
        TargetControlID="btnShow" CancelControlID="btnClose" BackgroundCssClass="modalBackground grid">
    </asp:ModalPopupExtender>
    <asp:Panel ID="gameOverPanel" runat="server" Style="display: none; height: 200px;">
        <asp:UpdatePanel ID="updateGameOver" runat="server">
            <ContentTemplate>
                <div style="background-color: White;">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label8" runat="server" Text="Game Over" ForeColor="White" Font-Size="50px"> </asp:Label>
                    </div>
                    <div style="padding: 20px 20px 20px 20px;">
                        <div style="height: 100px;">
                            <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Your Score:"></asp:Label>
                            <asp:Label ID="lblScore" runat="server" Text="" Font-Size="X-Large"></asp:Label>
                        </div>
                        <asp:Button ID="btnRestart" runat="server" Text="Play Again" CssClass="special_button_dark" OnClick="btnRestart_Click" />
                        <asp:Button ID="btnClose" runat="server" CssClass="special_button_dark" Text="Exit" OnClick="btnClose_Click" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

