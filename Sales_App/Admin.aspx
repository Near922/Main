<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Sales_App_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../Scripts/jquery-2.1.4.js" type="text/javascript"></script>
    <script src="../Scripts/JScript.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
    <link href="../Styles/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="../Styles/bootstrap-responsive.css" rel="stylesheet" />
    <br />
    <p style="color: #808080; font-size: 50px; padding-bottom: 20px; padding-top: 50px;">
        Admin
    </p>
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
    <div id="messageDiv" style="display: none; text-align: left;" runat="server" class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong>
        <asp:Label ID="lblMessage" runat="server" Text="Message was deleted successfully." />
    </div>
    <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
        <strong>Error!</strong> An error has occurred.  Please contact the administrator.
    </div>

            <div>
                <asp:Label ID="lblhitCounts" runat="server" Text="" Font-Size="X-Large" />
            </div>
            <br />
            <div>
                <asp:Label ID="lblMessageCount" runat="server" Text="" Font-Size="X-Large" />
            </div>
            <br />
            <asp:Repeater runat="server" ID="rptMessages">
                <HeaderTemplate>
                    <asp:Label ID="lblMessageHeader" runat="server" Text="Messages" Font-Size="X-Large" />
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="message_header">
                        <div style="float: left;">
                            <span style="font-weight: bold">From: </span>
                            <asp:HiddenField ID="hidden" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "ID") %>' />
                            <span><%# DataBinder.Eval(Container.DataItem, "Name") %></span>
                        </div>
                        <div style="float: left; padding-left: 100px;">
                            <span style="font-weight: bold">Sent: </span>
                            <span><%# DataBinder.Eval(Container.DataItem, "SentDate") %></span>
                        </div>
                        <div style="float: right;">
                            <asp:CheckBox runat="server" ID="chkbox" />
                        </div>
                    </div>
                    <div style="height: 10px;">
                    </div>
                    <div class="message_header">
                        <span>Respond To: <%# DataBinder.Eval(Container.DataItem, "EmailAddress") %></span>
                    </div>
                    <div style="height: 10px;">
                    </div>
                    <div class="message_body">
                        <span><%# DataBinder.Eval(Container.DataItem, "MessageBody") %></span>
                    </div>
                    <div style="height: 30px;">
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="special_button_dark" OnClick="btnDelete_Click" />
    </div>
</asp:Content>

