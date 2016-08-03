<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Sales_App_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <p style="color: #808080; font-size: 50px; padding-bottom: 20px; padding-top: 50px;">
        Admin
    </p>
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="messageDiv" style="display: none; text-align: left;" runat="server" class="alert alert-success">
                <span class="close" data-dismiss="alert" aria-label="close">&times;</span>
                <strong>Success!</strong>
                <asp:Label ID="lblMessage" runat="server" Text="Message was deleted successfully." />
            </div>
            <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                <span class="close" data-dismiss="alert" aria-label="close">&times;</span>
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
            <asp:DropDownList ID="lstMessagePerPage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstMessagePerPage_SelectedIndexChanged" />
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
            <div style="float: left; padding: 10px">
                <asp:LinkButton ID="lnkPrevious" runat="server" Text="Previous" OnClick="lnkPrevious_Click" />
            </div>
            <asp:Repeater ID="rptPages" runat="server" OnItemCommand="rptPages_ItemCommand" OnItemDataBound="rptPages_ItemDataBound">
                <ItemTemplate>
                    <div style="float: left; padding: 10px">
                        <asp:LinkButton ID="lnkPage" runat="server" Text="<%# Container.DataItem %>"></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="float: left; padding: 10px">
                <asp:LinkButton ID="lnkNext" runat="server" Text="Next" OnClick="lnkNext_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    <div>
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="special_button_dark" OnClick="btnDelete_Click" />
    </div>
    <br />
    <br />
</asp:Content>

