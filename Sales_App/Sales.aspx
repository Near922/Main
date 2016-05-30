<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales_App_Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div style="width: 100%;" align="center">
                    <asp:Button ID="btnBack" runat="server" class="special_button_red" Text="Exit"
                    PostBackUrl="PointOfSaleMain.aspx" />
        <table cellpadding="10px" style="width: 70%;  margin: 0 auto; ">
            <tr>
                <td>
                    <asp:Label ID="lblBeverage" runat="server" Text="Beverages:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblBeverageTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Starters:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSoup" runat="server" Text="Soups:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSoupTotal" runat="server" Text="$0.00" Font-Italic="False" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApp" runat="server" Text="Appetizers:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblAppTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>

                <td>
                    <asp:Label ID="lblSalad" runat="server" Text="Salads:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSaladTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Meals:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSandwich" runat="server" Text="Sandwiches:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSandwichTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEntree" runat="server" Text="Entrees:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblEntreeTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDessert" runat="server" Text="Desserts:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblDessertTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Alcohol:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblWine" runat="server" Text="Wines:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblWineTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBeer" runat="server" Text="Beers:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblBeerTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTotal" runat="server" Text="Total:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSalesTotal" runat="server" Text="$0.00" ForeColor="Black" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

