<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="login_form" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Username:  "></asp:Label>
        <asp:TextBox ID="uname" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label2" runat="server" Text="Password:  "></asp:Label>
        <asp:TextBox ID="pw" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        <asp:button ID="managerBtn" runat="server" text="Login as Manager" OnClick="managerBtn_Click" /><br /><br />
        <asp:button ID="employeeBtn" runat="server" text="Login as Employee" OnClick="employeeBtn_Click" /><br /><br />
        <asp:button ID="ownerBtn" runat="server" text="Login as Owner" OnClick="ownerBtn_Click" />
    </form>
</asp:Content>

