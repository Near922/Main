<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales_App_Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div style="width: 100%;">
        <div style="width: 100%; text-align: center;">
            <asp:Button ID="btnBack" runat="server" class="special_button_red" Text="Exit"
                PostBackUrl="PointOfSaleMain.aspx" />
        </div>

        <br />
        <table style="width: 70%; margin: 0 auto;">
            <tr>
                <td colspan="2" style="padding-bottom: 20px;">
                    <h2>Sales</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBeverage" runat="server" Style="font-size: 16px;" Text="Beverages:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblBeverageTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;">
                    <asp:Label ID="Label1" runat="server" Text="Starters:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSoup" runat="server" Style="font-size: 16px;" Text="Soups:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSoupTotal" runat="server" Text="$0.00" Font-Italic="False" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApp" runat="server" Style="font-size: 16px;" Text="Appetizers:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblAppTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>

                <td>
                    <asp:Label ID="lblSalad" runat="server" Style="font-size: 16px;" Text="Salads:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSaladTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;">
                    <asp:Label ID="Label2" runat="server" Text="Meals:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSandwich" runat="server" Style="font-size: 16px;" Text="Sandwiches:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblSandwichTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEntree" runat="server" Style="font-size: 16px;" Text="Entrees:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblEntreeTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDessert" runat="server" Style="font-size: 16px;" Text="Desserts:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblDessertTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;">
                    <asp:Label ID="Label3" runat="server" Text="Alcohol:" Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblWine" runat="server" Style="font-size: 16px;" Text="Wines:" />
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblWineTotal" runat="server" Text="$0.00" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBeer" runat="server" Style="font-size: 16px;" Text="Beers:" />
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

