<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomers.aspx.cs" Inherits="OnlineBakeryShop.ViewCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>viewcustomers</title>
    <style>
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
            <center><h1>Customers</h1></center>
            <asp:GridView ID="GridViewCustomer" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:HyperLink ID="hlAdminHome" runat="server" NavigateUrl="~/adminhome.aspx">Back to Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
