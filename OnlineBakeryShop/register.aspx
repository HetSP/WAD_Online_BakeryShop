<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="OnlineBakeryShop.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>register</title>
    <style>
        body{
            background-color:cornsilk;
            font-size:20px;
            font-family: 'Century Gothic';
        }
        h1{
            font-family: Papyrus;
        }
        #btnRegister{
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
    <center>
    <h1>Register</h1>
    <form id="form1" runat="server">
        <div>
            Name:&nbsp;
            <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="tbName" ErrorMessage="Name is Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Email:&nbsp;
            <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Password:&nbsp;
            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Password is Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Enter Password of length 6 to 12!!" ForeColor="Red" ValidationExpression="[0-9|a-z|A-Z]{6,12}"></asp:RegularExpressionValidator>
            <br />
            Confirm Password:&nbsp;
            <asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ControlToValidate="tbConfirmPassword" ErrorMessage="Confirm Password is Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
            <asp:CompareValidator ID="CompareValidatorConfirmPassword" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbConfirmPassword" ErrorMessage="Confirm Password must match Password!!" ForeColor="Red"></asp:CompareValidator>
&nbsp;
            <br />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="onClickRegister" Height="35px" Width="120px"/>
            <br />
            <br />
            Already Registered&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLinkLogin" runat="server" ForeColor="Blue" NavigateUrl="~/login.aspx">Login</asp:HyperLink>
&nbsp;&nbsp;&nbsp; here.</div>
    </form>
        </center>
</body>
</html>
