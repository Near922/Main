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
                <span class="close" data-dismiss="alert" aria-label="close">&times;</span>
                <strong>Correct!</strong>
                <asp:Label ID="lblMessage" runat="server" Text="You chose the correct answer." />
            </div>
            <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                <span class="close" data-dismiss="alert" aria-label="close">&times;</span>
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
                            <asp:ImageButton ID="sigil1" CssClass="opac" runat="server" OnClick="sigil1_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset" /></td>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil2" CssClass="opac" runat="server" OnClick="sigil2_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset" /></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil3" CssClass="opac" runat="server" OnClick="sigil3_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset" /></td>
                        <td style="vertical-align: middle; height: 200px; width: 200px;">
                            <asp:ImageButton ID="sigil4" CssClass="opac" runat="server" OnClick="sigil4_Click" BorderWidth="3" BorderColor="#FFCC00" BorderStyle="Inset" /></td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="numberPanel" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="lblErrorUpdate" runat="server">
                <ContentTemplate>
                    <!-- Modal content-->
                    <div class="modal-content" style="text-align: center;">

                        <div class="modal-header" style="padding: 35px 50px;">
                            <asp:LinkButton ID="bntX" runat="server" CssClass="close" PostBackUrl="~/Home.aspx" >&times;</asp:LinkButton>
                            <h4 class="modal-title">Game Over</h4>
                        </div>
                        <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                            <div class="row" style="padding-bottom: 20px;">
                                <div class="col-sm-12">
                                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Your Score:"></asp:Label>
                                    <asp:Label ID="lblScore" runat="server" Text="" Font-Size="X-Large"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6" style="padding: 10px;">
                                    <asp:Button ID="btnRestart" runat="server" Text="Play Again" CssClass="special_button_dark" OnClick="btnRestart_Click" />
                                </div>
                                <div class="col-sm-6" style="padding: 10px;">
                                    <asp:LinkButton ID="btnClose" runat="server" CssClass="special_button_dark" Text="Exit" UseSubmitBehavior="False" PostBackUrl="~/Home.aspx" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="Button10" runat="server" CssClass="btn btn-default"
                                Text="Close"  PostBackUrl="~/Home.aspx" />

                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

