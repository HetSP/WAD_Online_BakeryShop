<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="OnlineBakeryShop.Item" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>additem</title>
    <style>
        #showAddForm,#btnAddItem{
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
            <center><h1>Add Items</h1></center>
            <asp:GridView ID="GridViewItem" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Flavour" HeaderText="Flavour" SortExpression="Flavour" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items]" UpdateCommand="UPDATE [Items] Set [Name]=@Name, [Flavour]=@Flavour ,[Price]=@Price where [ItemId]=@ItemId" DeleteCommand="Delete from [Items] where [ItemId]=@ItemId"></asp:SqlDataSource>
            <br />
            <asp:Panel ID="PanelshowForm" runat="server">
                <asp:Button ID="showAddForm" runat="server" Text="Add Item" OnClick="showForm" Height="35px" Width="120px"/>
            </asp:Panel>
            <br />
            <asp:Panel ID="addItemPanel" runat="server">
            <table class="auto-style1">
                <tr><td class="auto-style2">
            Name:&nbsp;&nbsp;</td><td> <asp:TextBox ID="tbName" runat="server"></asp:TextBox></td></tr>
                <tr>
                    <td class="auto-style2">imagePath:</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr><td class="auto-style2">
            Flavour:&nbsp;&nbsp;</td><td>
            <asp:TextBox ID="tbFlavour" runat="server"></asp:TextBox></td></tr>
            <tr><td class="auto-style2">
            Price:&nbsp;&nbsp;</td><td>
            <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox></td></tr>
                <tr><td>&nbsp;<asp:Button ID="btnAddItem" runat="server" OnClick="onClickAddItem" Text="Add Item" Height="35px" Width="120px"/></td></tr>
               </table>
            </asp:Panel>
            
        </div>
    </form>
    <asp:HyperLink runat="server" ID="hlBacktoHome" ForeColor="Blue" NavigateUrl="~/adminhome.aspx">Back to Home</asp:HyperLink>
</body>
</html>
