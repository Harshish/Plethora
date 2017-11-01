<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookRequest.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="request_form" runat="server">
        
        <asp:GridView ID="GridView1" Width="1365px" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <asp:Label ID="lblinfo" CssClass="tm-carousel-item-title" runat="server"/>
        <asp:Button ID="modelPopup" runat="server" style="display:none" />
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="modelPopup" PopupControlID="updatePanel"
        CancelControlID="btnCancel" BackgroundCssClass="tableBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="updatePanel" runat="server" BackColor="White" Height="400px" Width="700px" style="display:none">
        <table width="100%" cellspacing="4">
	        <tr style="background-color:#263238">
	        <td colspan="2"  align="center" class="tm-carousel-item-title">Publisher Details</td>
	        </tr>
	        <tr>
		        <td align="right" style=" width:55%" class="tm-carousel-item-title">
		        Title:
		        </td>
		        <td>
		        <asp:Label ID="popTitle" CssClass="tm-carousel-item-title" runat="server"></asp:Label>
		        </td>
	        </tr>
	        <tr>
		        <td align="right" class="tm-carousel-item-title">
		        Author:
		        </td>
		        <td>
		        <asp:Label ID="popAuthor" CssClass="tm-carousel-item-title" runat="server"/>
		        </td>
	        </tr>
	        <tr>
		        <td align="right" class="tm-carousel-item-title">
		        Publisher Name:
		        </td>
		        <td>
		        <asp:TextBox CssClass="form-control" ID="popPubName" runat="server"/>
		        </td>
	        </tr>
	        <tr>
		        <td align="right" class="tm-carousel-item-title">
		        Publisher Address:
		        </td>
		        <td>
		        <asp:TextBox CssClass="form-control" ID="popPubAddress" runat="server"/>
		        </td>
	        </tr>
	       
	        <tr>
		        <td align=right >
		        <asp:Button ID="btnConfirm" CssClass="tm-bordered-btn" runat="server" Text="Place Order" onclick="btnConfirm_Click"/>
		        </td>
		        <td>
		        <asp:Button ID="btnCancel" CssClass="tm-bordered-btn" runat="server" Text="Cancel" />
		        </td>
	        </tr>
        </table>
        </asp:Panel>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    </form>
</asp:Content>

