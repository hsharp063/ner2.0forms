<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ScholarshipSubmissions.ascx.cs" Inherits="ScholarshipSubmissions" %>
<%@ Register TagPrefix="pnwc" Namespace="PNayak.Web.UI.WebControls" Assembly="PNayak.Web.UI.WebControls.ExportButton" %>

<h3>Scholarship Form Submissions</h3>
<br />
<div><asp:Label ID="lblErr" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></div>
<div><pnwc:ExportButton ID="btnExport" runat="server" Text="Export data to CSV file" CausesValidation="false"></pnwc:ExportButton></div>
<br />
<asp:GridView ID="gvSubmissions" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="20" OnPageIndexChanging="OnPaging" CellPadding="4">
	<Columns>
    	<asp:BoundField HeaderText="Timestamp" DataField="dt" DataFormatString="{0:MM/dd/yyyy}" />
		<asp:BoundField HeaderText="Name" DataField="name" />
        <asp:BoundField HeaderText="Address" DataField="address" />
        <asp:BoundField HeaderText="City" DataField="city" />
        <asp:BoundField HeaderText="State" DataField ="state" />
        <asp:BoundField HeaderText="Zip" DataField ="zip" />
           <asp:BoundField HeaderText="Phone" DataField="phone" />
        <asp:BoundField HeaderText="GPA" DataField ="gpa" />
        <asp:BoundField HeaderText="Course" DataField ="course" />
        <asp:BoundField HeaderText="Community" DataField="community" />
        <asp:BoundField HeaderText="Awards" DataField="awards" />
        <asp:BoundField HeaderText="Career Plan" DataField="career_plan" />
        <asp:BoundField HeaderText="School Schedule" DataField="full_or_part" />
        <asp:BoundField HeaderText="Classes" DataField="classes" />
        <asp:BoundField HeaderText="Time frame to complete degree" DataField="time_frame" />
        <asp:BoundField HeaderText="Desired work schedule" DataField="work_time" />
        <asp:BoundField HeaderText="Hours/Shifts Available" DataField="hours" />
        <asp:BoundField HeaderText="Reference 1 Name" DataField="refname1" />
          <asp:BoundField HeaderText="Reference 1 Address" DataField="refadd1" />
            <asp:BoundField HeaderText="Reference 1 City" DataField="refcity1" />
              <asp:BoundField HeaderText="Reference 1 State" DataField="refstate1" />
                <asp:BoundField HeaderText="Reference 1 Zip" DataField="refzip1" />
                  <asp:BoundField HeaderText="Reference 2 Name" DataField="refname2" />
                   <asp:BoundField HeaderText="Reference 2 Address" DataField="refadd2" />
                    <asp:BoundField HeaderText="Reference 2 City" DataField="refcity2" />
                     <asp:BoundField HeaderText="Reference 2 State" DataField="refstate2" />
                         <asp:BoundField HeaderText="Reference 2 Zip" DataField="refzip2" />
                             <asp:BoundField HeaderText="Personal Vision for Future" DataField="vision" />    
                             <asp:BoundField HeaderText="Why Good Candidate" DataField="candidate" />
                             <asp:BoundField HeaderText="How they would benefit" DataField="benefit" />

	
	</Columns>
	<RowStyle BackColor="GhostWhite" HorizontalAlign="Center" />
	<AlternatingRowStyle BackColor="White" />
	<HeaderStyle BackColor="#4B6C9E" Font-Size="12px" ForeColor="White" />
</asp:GridView>
