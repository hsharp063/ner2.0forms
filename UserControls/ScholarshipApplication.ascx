<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ScholarshipApplication.ascx.cs" Inherits="ScholarshipApplication" %>
<asp:Panel ID="pnlApplication" runat="server">
<table id="tblApp">
<tr><td><asp:Literal ID="litMessage" runat="server"></asp:Literal></td></tr>
<tr><td><span class="large-text border">Application for: </span><asp:CheckBox ID="chkScholarship" runat="server" Text="Scholarship Award" /><asp:CheckBox ID="chkMemorial" runat="server" Text="Memorial Award" /></td></tr>
<tr><td class="gray-row border">If you <u>qualify</u> for both awards, please check both.  Only one application is necessary.</td></tr>
<tr><td  class="table-space"></td></tr>
<tr><td class="area-header" colspan="4">Personal Information</td></tr>
<tr><td class="table-space"></td></tr>
<tr><td class="border">Name: <asp:TextBox ID="txtName" runat="server" MaxLength="255" CssClass="wideinput"></asp:TextBox></td></tr>
<tr><td class="border">Address: <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" CssClass="wideinput"></asp:TextBox></td></tr>
<tr><td class="border">City: <asp:TextBox ID="txtCity" runat="server" MaxLength="255" CssClass="smallinput"></asp:TextBox>State: <asp:TextBox ID="txtState" runat="server" MaxLength="2" Width="75px"></asp:TextBox> Zip Code: <asp:TextBox ID="txtZip" runat="server" MaxLength="15" CssClass="smallinput"></asp:TextBox></td></tr>
<tr><td class="border">Telephone Number(s): <asp:TextBox ID="txtPhone" runat="server" MaxLength="255" CssClass="wideinput"></asp:TextBox></td></tr>
<tr><td class="table-space"></td></tr>
<tr><td class="area-header" colspan="4">Educational Background:</td></tr>
<tr><td class="table-space"></td></tr>
<tr><td>Education: <asp:CheckBox ID="chkHighSchool" runat="server" text="High School Diploma"/><asp:CheckBox ID="chkGED" runat="server" Text="GED" /><asp:CheckBox ID="chkTrade" runat="server" Text="Trade School" /><asp:CheckBox ID="chkCollege" runat="server" Text="College" /></td></tr>
<tr><td>If trade school or college, what is your accumulative GPA?&nbsp;&nbsp;<asp:TextBox ID="txtGpa" runat="server" MaxLength="10" Width="70"></asp:TextBox></td></tr>
<tr><td>What was your course of study and where and when did you attend:<br />
<asp:TextBox ID="txtCourse" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>Community Involvement/Volunteer Work:<br />
<asp:TextBox ID="txtCommunity" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>Please list previous awards or special recognition given to you:<br />
<asp:TextBox ID="txtAwards" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>What college or trade school do you plan to attend?<br />
<asp:TextBox ID="txtCollege" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>What career do you plan to pursue?<br />
<asp:TextBox ID="txtCareerPlan" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>Do you plan to go to school full-time or part-time?
<asp:RadioButtonList ID="rdoFullOrPart" runat="server"><asp:ListItem Text="Full-time" Value="full"></asp:ListItem><asp:ListItem value="part" Text="Part-time"></asp:ListItem></asp:RadioButtonList></td></tr>
<tr><td>How  many classes per semester do you plan to take?<br />
<asp:TextBox ID="txtClasses" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>What is your time frame for completion of your degree?<br />
<asp:TextBox ID="txtTimeFrame" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>
<tr><td>Do you plan to work full-time, part-time, or seasonal hours while you are attending school?
<asp:RadioButtonList ID="rdoWorkTime" runat="server"><asp:ListItem Text="Full-time" Value="full"></asp:ListItem><asp:ListItem value="part" Text="Part-time"></asp:ListItem><asp:ListItem Text="Seasonal" Value="seasonal"></asp:ListItem></asp:RadioButtonList></td></tr>
<tr><td>How many hours and what shifts will you be available?<br />
<asp:TextBox ID="txtHours" runat="server" TextMode="MultiLine" CssClass="wideinput-tex-tarea"></asp:TextBox></td></tr>

<tr><td  class="table-space"></td></tr>
<tr><td class="gray-row border">Provide the names and complete mailing addresses of at least two references not related to
you that we may contact:</td></tr>
<tr><td>Name of reference:&nbsp;&nbsp; <asp:TextBox ID="txtRefName1" runat="server" CssClass="wideinput"></asp:TextBox></td></tr>
<tr><td>Address:&nbsp;&nbsp; <asp:TextBox ID="txtRefAddress1" runat="server" CssClass="wideinput"></asp:TextBox></td></tr>
<tr class="bottomborder"><td>City:&nbsp;&nbsp; <asp:TextBox ID="txtRefCity1" runat="server"></asp:TextBox>&nbsp;&nbsp;State: &nbsp;&nbsp;<asp:TextBox ID="txtRefState1" runat="server"></asp:TextBox>&nbsp;&nbsp;Zip Code:&nbsp;&nbsp; <asp:TextBox ID="txtRefZip1" runat="server"></asp:TextBox></td></tr>
<tr><td>Name of reference: &nbsp;&nbsp;<asp:TextBox ID="txtRefName2" runat="server" CssClass="wideinput"></asp:TextBox></td></tr>
<tr><td>Address:&nbsp;&nbsp; <asp:TextBox ID="txtRefAddress2" runat="server" CssClass="wideinput"></asp:TextBox></td></tr>
<tr class="bottomborder"><td>City:&nbsp;&nbsp; <asp:TextBox ID="txtRefCity2" runat="server"></asp:TextBox>&nbsp;&nbsp;State: &nbsp;&nbsp;<asp:TextBox ID="txtRefState2" runat="server"></asp:TextBox>&nbsp;&nbsp;Zip Code:&nbsp;&nbsp; <asp:TextBox ID="txtRefZip2" runat="server"></asp:TextBox></td></tr>

<tr><td  class="table-space"></td></tr>
<tr><td class="gray-row border">Please respond to the following questions:</td></tr>
<tr><td  class="table-space"></td></tr>
<tr><td>What is your personal vision for the future - where do you see yourself five to ten years from now? 
Please include information about your educational and career goals.<br />
<asp:TextBox ID="txtVision" runat="server" TextMode="MultiLine" 
        CssClass="wideinput-tex-tarea" Rows="5" ></asp:TextBox></td></tr>
<tr><td>Describe why you feel you are a good candidate for this scholarship:<br />
<asp:TextBox ID="txtCandidate" runat="server" TextMode="MultiLine" 
        CssClass="wideinput-tex-tarea" Rows="5"></asp:TextBox></td></tr>
<tr><td>Describe in what ways you would benefit from this scholarship:<br />
<asp:TextBox ID="txtBenefit" runat="server" TextMode="MultiLine" 
        CssClass="wideinput-tex-tarea" Rows="5"></asp:TextBox></td></tr>

<tr><td  class="table-space"></td></tr>
<tr><td class="gray-row border">PLEASE NOTE: Scholarships and grants may affect other student aid programs.  See your financial officer for details.</td></tr>
<tr><td  class="table-space"></td></tr>
<tr><td><asp:CheckBox ID="chkAuth" runat="server" />All of the information supplied with and in this application is true and accurate. </td></tr>

<tr><td><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="map-btn" 
        onclick="btnSubmit_Click" /></td></tr>
</table>
</asp:Panel>
<asp:Panel ID="pnlSubmissionMessage" runat="server">
<asp:Literal ID="litSubmitted" runat="server"></asp:Literal>
</asp:Panel>