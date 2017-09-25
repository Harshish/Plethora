<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">  
        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Author"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="tbAuthor" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btSearch" runat="server" Text="Search" OnClick="btSearch_Click" />
    </form> 
</asp:Content>

