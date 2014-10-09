<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsAlertSignup.ascx.cs" Inherits="NewsAlertSignup"  %>
<%@ Register TagPrefix="pnwc" Namespace="PNayak.Web.UI.WebControls" Assembly="PNayak.Web.UI.WebControls.ExportButton" %>

<h3>News and Alerts Form Submissions</h3>
<br />
<div><asp:Label ID="lblErr" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></div>
<div><pnwc:ExportButton ID="btnExport" runat="server" Text="Export data to CSV file" CausesValidation="false"></pnwc:ExportButton></div>
<br />
<asp:GridView ID="gvSubmissions" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="20" OnPageIndexChanging="OnPaging" CellPadding="4">
	<Columns>
		<asp:BoundField HeaderText="First Name" DataField="first_name" />
        <asp:BoundField HeaderText="Last Name" DataField="last_name" />
        <asp:BoundField HeaderText="Email" DataField="email" />
        <asp:BoundField HeaderText="Company Name" DataField ="comp_name" />
        <asp:BoundField HeaderText="Phone" DataField="phone" />
        <asp:BoundField HeaderText="Address 1" DataField ="add1" />
        <asp:BoundField HeaderText="Address 2" DataField ="add2" />
        <asp:BoundField HeaderText="City" DataField ="city" />
        <asp:BoundField HeaderText="State" DataField ="state" />
        <asp:BoundField HeaderText="Zip" DataField ="zip" />
        <asp:BoundField HeaderText="Notes" DataField ="notes" />
        <asp:BoundField HeaderText="Interests" DataField ="interests" />
		<asp:BoundField HeaderText="Timestamp" DataField="dt" DataFormatString="{0:MM/dd/yyyy hh:mm:ss tt}" />
	</Columns>
	<RowStyle BackColor="GhostWhite" HorizontalAlign="Center" />
	<AlternatingRowStyle BackColor="White" />
	<HeaderStyle BackColor="#4B6C9E" Font-Size="12px" ForeColor="White" />
</asp:GridView>
