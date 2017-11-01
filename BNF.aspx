<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BNF.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="customer_form" runat="server">
        <%-- <asp:Label runat="server" Text="ISBN"></asp:Label><br /> 
        <asp:TextBox ID="tbISBN" runat="server"></asp:TextBox><br /> --%>
        <asp:Label runat="server" Text="Title"></asp:Label><br />
        <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox><br />
        <asp:Label runat="server" Text="Author"></asp:Label><br />
        <asp:TextBox ID="tbAuthor" runat="server"></asp:TextBox><br />
        <asp:Label runat="server" Text="Email"></asp:Label><br />
        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox><br />
        <asp:Button ID="btRequest" runat="server" Text="Send Request" OnClick="btRequest_Click" />
    </form>
</asp:Content>

