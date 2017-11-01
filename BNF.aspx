<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BNF.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="customer_form" runat="server">
        <%-- <asp:Label runat="server" Text="ISBN"></asp:Label><br /> 
        <asp:TextBox ID="tbISBN" runat="server"></asp:TextBox><br /> --%>
        <asp:Label runat="server" CssClass="tm-carousel-item-title" Text="Sorry, Book not available!"></asp:Label><br />
        <asp:Label runat="server" CssClass="tm-carousel-item-title" Text="Title"></asp:Label><br />
        <asp:TextBox ID="tbTitle" CssClass="form-control" runat="server"></asp:TextBox><br />
        <asp:Label runat="server" CssClass="tm-carousel-item-title" Text="Author"></asp:Label><br />
        <asp:TextBox ID="tbAuthor" CssClass="form-control" runat="server"></asp:TextBox><br />
        <asp:Label runat="server" CssClass="tm-carousel-item-title" Text="Email"></asp:Label><br />
        <asp:TextBox ID="tbEmail" CssClass="form-control" runat="server"></asp:TextBox><br />
        <asp:Button ID="btRequest" CssClass="tm-bordered-btn" runat="server" Text="Send Request" OnClick="btRequest_Click" />
    </form>
</asp:Content>

