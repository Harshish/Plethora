<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Stats" runat="server">

        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN,TansactionID,Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                <asp:BoundField DataField="Copies" HeaderText="Copies" SortExpression="Copies" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="CopiesSold" HeaderText="CopiesSold" SortExpression="CopiesSold" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Weeks" HeaderText="Weeks for Procurement" SortExpression="Weeks" />
                <asp:TemplateField HeaderText="Inventory Level">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="IL" Text=""></asp:Label>
                        
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT Book.ISBN, Book.Title, Book.Author, Book.Price, Book.Publisher, Book.Copies, Sale.TansactionID, Sale.ISBN AS Expr1, Sale.Date, Sale.CopiesSold, Publisher.Id, Publisher.ISBN AS Expr2, Publisher.Name, Publisher.Address, Publisher.Weeks FROM Book INNER JOIN Sale ON Book.ISBN = Sale.ISBN INNER JOIN Publisher ON Book.Publisher = Publisher.Name WHERE (Book.Author LIKE '%' + @Author + '%') AND (Book.Title LIKE '%' + @Title + '%') AND (CONVERT(date, Sale.Date) = @cdate) ORDER BY Sale.Date">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="%" Name="Author" QueryStringField="author" Type="String" />
                <asp:QueryStringParameter DefaultValue="%" Name="Title" QueryStringField="title" Type="String" />
                <asp:ControlParameter ControlID="Calendar1" Name="cdate" PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

