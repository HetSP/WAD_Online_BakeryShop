<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="OnlineBakeryShop.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>home</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 356px;
        }
        #btnConfirmOrder,#btnAddOrder,#btnOrder,#btnHomeLogout{
            color:white;
            background-color:orange;
            border-radius:5px;
            outline:none;
            border:none;
        }
        body{
            background-color:cornsilk;
            font-size:20px;
            font-family: 'Century Gothic';
        }
        h1{
            font-family: Papyrus;
        }
        nav{
            background-color:orange;
            font-size:35px;
            font-family: 'Century Gothic';
        }
    </style>
</head>
<body>
     <nav>
        <span>The Baker's Heart</span>
    </nav>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Inventory</h1>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" CellPadding="25">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>Product Name:<%#Eval("Name") %></td>
                        </tr>
                        <tr>
                            <td>Product ID:<%#Eval("ItemId") %></td>
                        </tr>
                        <tr>
                            <hr />
                            <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imgPath") %>' Height="200" Width="200"/></td>
                        </tr>
                        <tr>
                            <td>Flavour:<%#Eval("Flavour") %></td>
                        </tr>
                        <tr>
                            <td>Price:<%#Eval("Price") %></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
                </center>
            <asp:Panel ID="PanelOrderForm" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Quantity:</td>
                        <td>
                            <asp:TextBox ID="tbQuantity" runat="server" TextMode="Number"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ControlToValidate="tbQuantity" ErrorMessage="Please enter quantity!!" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RangeValidator ID="RangeValidatorQuantity" runat="server" ControlToValidate="tbQuantity" ErrorMessage="Quantity must be greater than 0!!" ForeColor="Red" MaximumValue="200" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">ItemId:</td>
                        <td>
                            <asp:DropDownList ID="ddlItemId" runat="server" DataSourceID="SqlDataSource1" DataTextField="ItemId" DataValueField="ItemId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items]"></asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorItemId" runat="server" ControlToValidate="ddlItemId" ErrorMessage="You have to select Item!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="btnConfirmOrder" runat="server" OnClick="onClickConfirmOrder" Text="Confirm Order" Height="35px" Width="120px"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Panel ID="PanelPlaceOrder" runat="server">
                <asp:Button ID="btnOrder" runat="server" OnClick="onClickOrder" Text="Place Order" Height="35px" Width="120px"/>
            </asp:Panel>
            <br />
            <asp:HyperLink ID="hlMyOrders" runat="server" ForeColor="Blue" NavigateUrl="~/Myorders.aspx">View My Orders</asp:HyperLink>
            <br />
            <br />
            <asp:Button ID="btnHomeLogout" runat="server" OnClick="onClickLogout" Text="Logout" Height="35px" Width="120px"/>
        </div>
    </form>
</body>
</html>
