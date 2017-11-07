<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ajax.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="ajax_form" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label CssClass="tm-carousel-item-title" ID="Label1" runat="server" Text="AJAX PAGE"></asp:Label><br />
                <asp:DropDownList CssClass="tm-bordered-btn" ID="DropDownList1" runat="server"></asp:DropDownList><br /><br />
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox><br />
                
                
                <asp:RadioButtonList ID="RadioButtonList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="Title"></asp:RadioButtonList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT [Title] FROM [Book]"></asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView1" Width="1355px" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource3">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                        <asp:BoundField DataField="Copies" HeaderText="Copies" SortExpression="Copies" />
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
                </asp:GridView><br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE ([Title] = @Title)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Title" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="TansactionID" DataValueField="TansactionID"></asp:CheckBoxList><br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT [TansactionID] FROM [Sale]"></asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server"  Width="1355px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="TansactionID">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="TansactionID" HeaderText="TansactionID" InsertVisible="False" ReadOnly="True" SortExpression="TansactionID" />
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="CopiesSold" HeaderText="CopiesSold" SortExpression="CopiesSold" />
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
                </asp:GridView><br />

                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [Sale] WHERE ([TansactionID] = @TansactionID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CheckBoxList1" Name="TansactionID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="Button1" CssClass="tm-bordered-btn" runat="server" Text="Go" OnClick="Button1_Click1" /><br />

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="RadioButtonList1" runat="server" ErrorMessage="Please check Radio Button"></asp:RequiredFieldValidator>
            </ContentTemplate>
        </asp:UpdatePanel>
        

    </form>
</asp:Content>

