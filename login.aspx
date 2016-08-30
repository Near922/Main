<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Panel ID="loginPanel" runat="server" DefaultButton="btnLogin" Style="margin: 0 auto; display: flex; align-items: center; height: 500px; width: 100%;">
                <div style="margin: 0 auto; max-width: 400px; width: 100%; border: solid; border-color: lightgray; border-width: 1px; text-align: center;">
                    <div class="row">
                        <div class="col-sm-12">
                            <div style="background-color: #4baad3; height: 100%; width: 100%;">
                                <p style="color: white; font-size: 35px; padding: 10px; text-align: left !important;">
                                    Login Form
                                </p>
                                </div>
                        </div>
                    </div>
                    <div style="padding: 20px; background-color: #F2F2F2;">
                        <div class="row" style="padding-bottom: 20px; padding-top: 20px;">
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtUserID" runat="server"
                                    placeholder="User ID" CssClass="textbox" />
                            </div>
                        </div>
                        <div class="row" style="padding-bottom: 30px;">
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="textbox" />
                            </div>
                        </div>
                        <div class="row" style="padding-bottom: 20px;">
                            <div class="col-sm-12">
                                <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="opac special_link_button" Style="width: 100%; background-color: #4baad3;"
                                    Text="Login" />
                            </div>
                        </div>
                        <div class="row" style="padding-bottom: 10px;">
                            <div class="col-sm-12">
                                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div style="width: 100%; text-align:center;">
            <table style="width: 100%; max-width: 400px; margin: 0 auto;">
                <tr>
                    <th style="text-align:center;">UserID
                    </th>
                    <th  style="text-align:center;">Password
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
        </div>
    </div>
</asp:Content>
