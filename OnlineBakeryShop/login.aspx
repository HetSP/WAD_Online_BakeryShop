<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OnlineBakeryShop.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>
    <style>
        body{
            background-color:cornsilk;
            font-size:20px;
            font-family: 'Century Gothic';
        }
        h1{
            font-family: Papyrus;
        }
        #btnLogin{
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
    <div>
        <center>
        <h1>LOGIN</h1>
        <form id="form1" runat="server">
            <div>
                Email:&nbsp;
                <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div>
                Password:&nbsp;
                <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Password is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="onClickLogin"  Height="35px" Width="120px"/>
                <br />
            </div>
        </form>
            <br />
        New User?&nbsp;
        <asp:HyperLink ID="HyperLinkRegister" runat="server" ForeColor="Blue" NavigateUrl="~/register.aspx">Register</asp:HyperLink>
    &nbsp; here.
            </center>
    </div>
</body>
</html>
