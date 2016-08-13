<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-color: white; height: 600px; margin: auto; display: table; width: 100%; text-align: center;">

        <div style="display: table-cell; vertical-align: middle;">
            <asp:Panel ID="loginPanel" runat="server" DefaultButton="btnLogin">
                <div style="min-width: 300px; max-width: 500px; min-height: 300px; border: solid; border-color: lightgray; border-width: 1px; background-color: #F2F2F2; text-align: center; margin: auto;">
                    <div  style="background-color: #4baad3; width: 100%;">
                        <div>
                            <p style="color: white; font-size: 50px; padding: 10px; text-align: left !important;">
                                Login Form
                            </p>
                        </div>
                    </div>
                    <div style="padding: 20px;">
                        <br />
                        <br />
                        <div class="row" style="padding-bottom: 20px;">
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtUserID" runat="server"
                                    placeholder="User ID" CssClass="textbox" />
                            </div>
                        </div>
                        <div class="row"  style="padding-bottom: 30px;">
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="textbox" />
                            </div>
                        </div>
                        <div class="row"  style="padding-bottom: 20px;">
                            <div class="col-sm-12">
                                <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="opac special_link_button" Style="width: 100%; background-color: #4baad3;"
                                    Text="Login" />
                            </div>
                        </div>
                        <div class="row"  style="padding-bottom: 10px;">
                            <div class="col-sm-12">
                                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <div style="width: 100%;">
        <table style="min-width: 300px; margin: 0 auto;">
            <tr>
                <th>UserID
                </th>
                <th>Password
                </th>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="user1" runat="server" Text="jamess"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="pass1" runat="server" Text="Hm5645T"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="meghanw"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="kNl54tmi"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
