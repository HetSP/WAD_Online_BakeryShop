<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Myorders.aspx.cs" Inherits="OnlineBakeryShop.Myorders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>myorders</title>
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
            <center><h1>Your Orders</h1></center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId,ItemId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="OrderId" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" />
                    <asp:BoundField DataField="Quntity" HeaderText="Quntity" SortExpression="Quntity" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                </Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Orders].[OrderId], [Orders].[Quntity], [Items].[Name] , [Items].[ItemId] FROM [Orders] INNER JOIN [Items] ON [Orders].[ItemId] = [Items].[ItemId] WHERE ([Orders].[UserId] = @UserId)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="hlBacktoHome" runat="server" ForeColor="Blue" NavigateUrl="~/home.aspx">Back to Home</asp:HyperLink>
        </div>
    </form>
</body>
</html>
