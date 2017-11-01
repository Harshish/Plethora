<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookRequest.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="request_form" runat="server">
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="Order">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="cbOrder" OnCheckedChanged="cbOrder_CheckedChanged" AutoPostBack="true"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="White" />
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

        <asp:Button ID="modelPopup" runat="server" style="display:none" />
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="modelPopup" PopupControlID="updatePanel"
        CancelControlID="btnCancel" BackgroundCssClass="tableBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="updatePanel" runat="server" BackColor="White" Height="230px" Width="300px" style="display:none">
        <table width="100%" cellspacing="4">
	        <tr style="background-color:#33CC66">
	        <td colspan="2"  align="center">Publisher Details</td>
	        </tr>
	        <tr>
		        <td align="right" style=" width:45%">
		        Title:
		        </td>
		        <td>
		        <asp:Label ID="popTitle" runat="server"></asp:Label>
		        </td>
	        </tr>
	        <tr>
		        <td align="right">
		        Author:
		        </td>
		        <td>
		        <asp:Label ID="popAuthor" runat="server"/>
		        </td>
	        </tr>
	        <tr>
		        <td align="right">
		        Publisher Name:
		        </td>
		        <td>
		        <asp:TextBox ID="popPubName" runat="server"/>
		        </td>
	        </tr>
	        <tr>
		        <td align="right">
		        Publisher Address:
		        </td>
		        <td>
		        <asp:TextBox ID="popPubAddress" runat="server"/>
		        </td>
	        </tr>
	       
	        <tr>
		        <td align=right >
		        <asp:Button ID="btnConfirm" runat="server" Text="Place Order" onclick="btnConfirm_Click"/>
		        </td>
		        <td>
		        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
		        </td>
	        </tr>
        </table>
        </asp:Panel>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    </form>
</asp:Content>

