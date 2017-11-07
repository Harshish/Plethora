<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="login_form" runat="server">
        <asp:Label ID="Label1" CssClass="tm-carousel-item-title" runat="server" Text="Username:  "></asp:Label>
        <asp:TextBox ID="uname" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label2" CssClass="tm-carousel-item-title" runat="server" Text="Password:  "></asp:Label>
        <asp:TextBox ID="pw" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label3" CssClass="tm-carousel-item-title" runat="server" Text=""></asp:Label>
        <asp:button ID="managerBtn" CssClass="tm-bordered-btn" runat="server" text="Login as Manager" OnClick="managerBtn_Click" /><br /><br />
        <asp:button ID="employeeBtn" CssClass="tm-bordered-btn" runat="server" text="Login as Employee" OnClick="employeeBtn_Click" />
        <asp:button ID="ownerBtn" CssClass="tm-bordered-btn" runat="server" text="Login as Owner" OnClick="ownerBtn_Click" />
    </form>
</asp:Content>

