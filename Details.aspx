<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form_details" runat="server">
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" ShowFooter="True" CellPadding="4" DataKeyNames="ISBN" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" />
            <Columns>   
               <asp:TemplateField HeaderText="ISBN">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>   
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbISBN1" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
                    </EditItemTemplate>
                   <FooterTemplate>
                        <asp:TextBox ID="tbISBNf"  Text="" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbTitle1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbTitle" Text="" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Author">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbAuthor1" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbAuthor" Text="" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbPrice1" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbPrice" Text="" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Publisher">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Publisher") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbPublisher1" runat="server" Text='<%# Bind("Publisher") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbPublisher" Text="" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Copies">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Copies") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbcopies1" runat="server" Text='<%# Bind("Copies") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbcopies" Text="" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/Images/edit.png" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton runat="server" ImageUrl="~/Images/delete.png" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/Images/save.png" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                        <asp:ImageButton runat="server" ImageUrl="~/Images/cancel.png" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/Images/add.png" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />
                    </FooterTemplate>
                </asp:TemplateField> 

            </Columns>
            <EditRowStyle BackColor="Gray" />
            <FooterStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <br />
        <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
        <br />
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [Book]" DeleteCommand="DELETE FROM [Book] WHERE [ISBN] = @ISBN" InsertCommand="INSERT INTO [Book] ([ISBN], [Title], [Author], [Price], [Publisher], [Copies]) VALUES (@ISBN, @Title, @Author, @Price, @Publisher, @Copies)" UpdateCommand="UPDATE [Book] SET [Title] = @Title, [Author] = @Author, [Price] = @Price, [Publisher] = @Publisher, [Copies] = @Copies WHERE [ISBN] = @ISBN">
            <DeleteParameters>
                <asp:Parameter Name="ISBN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="Publisher" Type="String" />
                <asp:Parameter Name="Copies" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="Publisher" Type="String" />
                <asp:Parameter Name="Copies" Type="Int32" />
                <asp:Parameter Name="ISBN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

