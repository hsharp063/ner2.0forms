<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUsSubmissions.ascx.cs" Inherits="ContactUsSubmissions" %>
<%@ Register TagPrefix="pnwc" Namespace="PNayak.Web.UI.WebControls" Assembly="PNayak.Web.UI.WebControls.ExportButton" %>

<h3>Scholarship Form Submissions</h3>
<br />
<div><asp:Label ID="lblErr" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></div>
<div><pnwc:ExportButton ID="btnExport" runat="server" Text="Export data to CSV file" CausesValidation="false"></pnwc:ExportButton></div>
<br />
<asp:GridView ID="gvSubmissions" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="20" OnPageIndexChanging="OnPaging" CellPadding="4">
	<Columns>
    	<asp:BoundField HeaderText="Timestamp" DataField="dt" DataFormatString="{0:MM/dd/yyyy}" />
		<asp:BoundField HeaderText="Reason" DataField="reason" />
        <asp:BoundField HeaderText="Urgent?" DataField="urgent" />
        <asp:BoundField HeaderText="Comment Type" DataField="comment_type" />
        <asp:BoundField HeaderText="Commenting About" DataField ="commenting_about" />
        <asp:BoundField HeaderText="Name" DataField ="Name" />
           <asp:BoundField HeaderText="Phone" DataField="phone" />
             <asp:BoundField HeaderText="Email" DataField="email" />
               <asp:BoundField HeaderText="Fax" DataField="fax" />
                 <asp:BoundField HeaderText="Comments" DataField="comments" />     

	
	</Columns>
	<RowStyle BackColor="GhostWhite" HorizontalAlign="Center" />
	<AlternatingRowStyle BackColor="White" />
	<HeaderStyle BackColor="#4B6C9E" Font-Size="12px" ForeColor="White" />
</asp:GridView>
