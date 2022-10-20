<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="OnlineBakeryShop.adminhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>adminhome</title>
    <style>
        body{
            background-color:cornsilk;
            font-size:20px;
            font-family: 'Century Gothic';
        }
        h1{
            font-family: Papyrus;
        }
        #btnLogout{
            color:white;
            background-color:orange;
            border-radius:5px;
            outline:none;
            border:none;
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
        <center><h1>Admin Home</h1></center>
        <asp:HyperLink ID="hlViewCustomer" runat="server" ForeColor="Blue" NavigateUrl="~/ViewCustomers.aspx">View Customers</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="hlAddItem" runat="server" ForeColor="Blue" NavigateUrl="~/Item.aspx">Add Item</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="hlViewOrders" runat="server" ForeColor="Blue" NavigateUrl="~/ViewOrders.aspx">View Orders</asp:HyperLink>
        <br />
        <br />
        <asp:Button ID="btnLogout" runat="server" OnClick="onClickLogout" Text="Logout" Height="35px" Width="120px"/>
    </form>
</body>
</html>
