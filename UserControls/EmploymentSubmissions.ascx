<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmploymentSubmissions.ascx.cs" Inherits="EmploymentSubmissions" %>
<%@ Register TagPrefix="pnwc" Namespace="PNayak.Web.UI.WebControls" Assembly="PNayak.Web.UI.WebControls.ExportButton" %>

<h3>Employment Application Submissions</h3>
<br />
<div><asp:Label ID="lblErr" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></div>
<div><pnwc:ExportButton ID="btnExport" runat="server" Text="Export data to Excel file" CausesValidation="false" ></pnwc:ExportButton></div>
<br />
<asp:GridView ID="gvSubmissions" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="20" OnPageIndexChanging="OnPaging" CellPadding="4">
	<Columns>
    	<asp:BoundField HeaderText="Timestamp" DataField="dt" DataFormatString="{0:MM/dd/yyyy}" />
		<asp:BoundField HeaderText="First Name" DataField="first_name" />
        <asp:BoundField HeaderText="Last Name" DataField="last_name" />
        <asp:BoundField HeaderText="Address" DataField="address" />
        <asp:BoundField HeaderText="City" DataField="city" />
        <asp:BoundField HeaderText="State" DataField ="state" />
        <asp:BoundField HeaderText="Zip" DataField ="zip" />
        <asp:BoundField HeaderText="Email" DataField="email" />
       <asp:BoundField HeaderText="Heard About?" DataField="heard_about" />
              <asp:BoundField HeaderText="Heard about details" DataField="heard_details" />
                     <asp:BoundField HeaderText="Desired position" DataField="position" />
                            <asp:BoundField HeaderText="Interested in" DataField="hour_type" />
                                   <asp:BoundField HeaderText="# hours/week" DataField="hours" />
                                          <asp:BoundField HeaderText="High school" DataField="highschool_name" />
                                                 <asp:BoundField HeaderText="Highschool location" DataField="highschool_location" />
                                                        <asp:BoundField HeaderText="Highschool Years" DataField="highschool_years" />
                                                               <asp:BoundField HeaderText="College" DataField="college_name" />
                                                                      <asp:BoundField HeaderText="College Location" DataField="college_location" />
                                                                       <asp:BoundField HeaderText="College Years" DataField="college_years" />
                     <asp:BoundField HeaderText="Trade School" DataField="trade_name" />
                            <asp:BoundField HeaderText="Trade School location" DataField="trade_location" />
                                   <asp:BoundField HeaderText="Trade School years" DataField="trade_years" />
                                          <asp:BoundField HeaderText="Area of study" DataField="area_of_study" />
                                                 <asp:BoundField HeaderText="Additional training" DataField="additional_training" />
                                                        <asp:BoundField HeaderText="Legal right to work in US" DataField="legal_right" />
                                                               <asp:BoundField HeaderText="Proof required?" DataField="proof_required" />
                                                                      <asp:BoundField HeaderText="Valid license?" DataField="valid_license" />
                                                                                           <asp:BoundField HeaderText="Legal age?" DataField="legal_age" />
                            <asp:BoundField HeaderText="Applied to NER before?" DataField="applied_before" />
                                   <asp:BoundField HeaderText="Worked at NER before?" DataField="worked_before" />
                                          <asp:BoundField HeaderText="When applied" DataField="applied_when" />
                                             
                                                        <asp:BoundField HeaderText="Worked at Ner when?" DataField="worked_when" />
                                                               <asp:BoundField HeaderText="Worked at which site?" DataField="worked_site" />
                                                                      <asp:BoundField HeaderText="Other relevant experience" DataField="other_relevant_experience" />
                                                                        <asp:BoundField HeaderText="Email from" DataField="email_from" />
                                                                          <asp:BoundField HeaderText="Email To" DataField="email_to" />
                                                                            <asp:BoundField HeaderText="Work History Company 1" DataField="history1_name" />
                                                                              <asp:BoundField HeaderText="Work History Job Description 1" DataField="history1_job_description" />
                                                                                       <asp:BoundField HeaderText="Work History Phone 1" DataField="history1_phone" />
                                                                              <asp:BoundField HeaderText="Work History Address 1" DataField="history1_add" />
                                                                                <asp:BoundField HeaderText="Work History State 1" DataField="history1_state" />
                                                                                  
                                                                                        <asp:BoundField HeaderText="Work History Phone 1" DataField="history1_phone" />
                                                                                <asp:BoundField HeaderText="Work History Employed From 1" DataField="history1_employed_from" />
                                                                                  <asp:BoundField HeaderText="Work History Employed To 1" DataField="history1_employed_to" />
                                                                                        <asp:BoundField HeaderText="Allowed to contact Work History 1?" DataField="history1_contact_allowed" />
                                                                                <asp:BoundField HeaderText="Work History Reason for leaving" DataField="history1_reason_for_leaving" />
                                                                                  <asp:BoundField HeaderText="Work History Job title" DataField="history1_job_title" />
                                                                                     <asp:BoundField HeaderText="Work History Company 2" DataField="history2_name" />
                                                                                      
                                                                                        <asp:BoundField HeaderText="Work History Company 2" DataField="history2_name" />
                                                                              <asp:BoundField HeaderText="Work History Job Description 2" DataField="history2_job_description" />
                                                                                       <asp:BoundField HeaderText="Work History Phone 2" DataField="history2_phone" />
                                                                              <asp:BoundField HeaderText="Work History Address 2" DataField="history2_add" />
                                                                                <asp:BoundField HeaderText="Work History State 2" DataField="history2_state" />
                                                                                  
                                                                                        <asp:BoundField HeaderText="Work History Phone 2" DataField="history2_phone" />
                                                                                <asp:BoundField HeaderText="Work History Employed From 2" DataField="history2_employed_from" />
                                                                                  <asp:BoundField HeaderText="Work History Employed To 2" DataField="history2_employed_to" />
                                                                                        <asp:BoundField HeaderText="Allowed to contact Work History 2?" DataField="history2_contact_allowed" />
                                                                                <asp:BoundField HeaderText="Work History Reason for leaving" DataField="history2_reason_for_leaving" />
                                                                                  <asp:BoundField HeaderText="Work History Job title" DataField="history2_job_title" />
                                                                                     <asp:BoundField HeaderText="Work History Company 2" DataField="history2_name" />

                                                                                     <asp:BoundField HeaderText="Work History Company 3" DataField="history3_name" />
                                                                              <asp:BoundField HeaderText="Work History Job Description 3" DataField="history3_job_description" />
                                                                                       <asp:BoundField HeaderText="Work History Phone 3" DataField="history3_phone" />
                                                                              <asp:BoundField HeaderText="Work History Address 3" DataField="history3_add" />
                                                                                <asp:BoundField HeaderText="Work History State 3" DataField="history3_state" />
                                                                                  
                                                                                        <asp:BoundField HeaderText="Work History Phone 3" DataField="history3_phone" />
                                                                                <asp:BoundField HeaderText="Work History Employed From 3" DataField="history3_employed_from" />
                                                                                  <asp:BoundField HeaderText="Work History Employed To 3" DataField="history3_employed_to" />
                                                                                        <asp:BoundField HeaderText="Allowed to contact Work History 3?" DataField="history3_contact_allowed" />
                                                                                <asp:BoundField HeaderText="Work History Reason for leaving" DataField="history3_reason_for_leaving" />
                                                                                  <asp:BoundField HeaderText="Work History Job title" DataField="history3_job_title" />
                                                                                     <asp:BoundField HeaderText="Work History Company 3" DataField="history3_name" />
                                                                                   
                                                                                            
                                                                             
                                                                            
	
	</Columns>
	<RowStyle BackColor="GhostWhite" HorizontalAlign="Center" />
	<AlternatingRowStyle BackColor="White" />
	<HeaderStyle BackColor="#4B6C9E" Font-Size="12px" ForeColor="White" />
</asp:GridView>
