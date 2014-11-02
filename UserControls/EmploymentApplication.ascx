<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmploymentApplication.ascx.cs" Inherits="EmploymentApplication" ClientIDMode="Static" %>
	<script type="text/javascript">

	    function showRightTextBox() {
	        var radioList = $('#rdoFindOut');
	        var selectedVal = $('#rdoFindOut input:checked').val();
	        if (selectedVal == "Referrel") {
	            $('.classified').hide();
	            $('.fair').hide();
	            $('.other').hide();
	            $('.referrel').show();
	        } else if (selectedVal == "Classifieds") {
	            $('.referrel').hide();
	            $('.fair').hide();
	            $('.other').hide();
	            $('.classified').show();
	        } else if (selectedVal == "Job Fair") {
	            $('.referrel').hide();
	            $('.classified').hide();
	            $('.other').hide();
	            $('.fair').show();
	        } else if (selectedVal == "Other") {
	            $('.referrel').hide();
	            $('.classified').hide();
	            $('.fair').hide();
	            $('.other').show();
	        }
	    }
	    $(document).ready(function () {
	        //hide all initially
	        $('.referrel').hide();
	        $('.classified').hide();
	        $('.fair').hide();
	        $('.other').hide();
	        //attach listener
	        $('[id*="rdoFindOut"]').change(function () {
	            showRightTextBox();
	        });

	        $('#leftcontent').css('top','-20px;');

	    });</script>

    <asp:Literal ID="litMessage" runat="server"></asp:Literal>
<asp:Panel ID="pnlApplication" runat="server">
<div class="row"><span class="area-header">Personal Information</span></div>
<div class="row">
	<p>
		<label for="txtFirst">First Name*:</label><asp:TextBox ID="txtFirst" runat="server" CssClass="smallinput" MaxLength="50" ></asp:TextBox>
	</p>
	<p>
		<label for="txtLast">Last Name*:</label><asp:TextBox ID="txtLast" runat="server" CssClass="smallinput" MaxLength="50"></asp:TextBox>
	</p>
</div>
<div class="row">
<p>
	<label for="txtAddress">Address*:</label><asp:TextBox ID="txtAddress" CssClass="wideinput" runat="server" MaxLength="200"></asp:TextBox>
</p>
<p>
	<label for="txtCity">City*:</label><asp:TextBox ID="txtCity" runat="server" MaxLength="45"></asp:TextBox>
</p>
</div>
<div class="row">
<p>
	<label for="txtState">State*:</label><asp:TextBox ID="txtState" runat="server" MaxLength="2"></asp:TextBox>
</p>
<p>
	<label for="txtZip">Zip Code*:</label><asp:TextBox ID="txtZip" runat="server" MaxLength="10"></asp:TextBox>
</p>
</div>
<div class="row">
<p>
	<label for="txtPhone">Phone Number*:</label><asp:TextBox id="txtPhone" runat="server" CssClass="smallinput" MaxLength="15"></asp:TextBox>
</p>
<p>
	<label for="txtEmail">Email:</label><asp:TextBox ID="txtEmail" runat="server" MaxLength="200" CssClass="wideinput"></asp:TextBox>
</p>
</div>
<div class="row">
<span>
	How did you find out about Northeast Residence, Inc?
</span>
</div>
<div class="row">

<asp:RadioButtonList ID="rdoFindOut" runat="server">
<asp:ListItem Text="Referral; if so by whom?" Value="Referrel"></asp:ListItem>
<asp:ListItem Text="Classifieds/Paper; if so, which paper?" Value="Classifieds"></asp:ListItem>
<asp:ListItem Text="Job Fair; if so, where?" Value="Job Fair"></asp:ListItem>
<asp:ListItem Text="Other; please list source" Value="Other"></asp:ListItem>
</asp:RadioButtonList>

<asp:TextBox ID="txtReferrel" runat="server" CssClass ="referrel" MaxLength="30"></asp:TextBox>
<asp:TextBox ID="txtClassifieds" runat="server" CssClass ="classified" MaxLength="30"></asp:TextBox>
<asp:TextBox ID="txtFair" runat="server" CssClass ="fair" MaxLength="30"></asp:TextBox>
<asp:TextBox ID="txtOther" runat="server" CssClass ="other" MaxLength="30"></asp:TextBox>

</div>

<div class="row"><span class="area-header">Position</span></div>
<div class="row">
<p>
    <label for="txtPosition">Position applying for:</label><asp:TextBox ID="txtPosition" runat="server" MaxLength="50"></asp:TextBox>
</p>
</div>
<div class="row">
<p><label for="txtHours">Number of hours available per week:</label> <asp:TextBox ID="txtHours" 
        runat="server" MaxLength="30"></asp:TextBox>
</p>
<p>
Are you interested in: <br/>
<asp:CheckBox ID="chkFullTime" runat="server" Text="Full Time"/><br/>
<asp:CheckBox runat="server" ID="chkPart" text="Part Time"/>
</p>
</div>
<div class="row"><span style="display:block;">Please check all shifts you are available to work:</span></div>
<div class="row">
<table width="100%">
<tr><td>Sunday</td><td>Monday</td><td>Tuesday</td><td>Wednesday</td><td>Thursday</td><td>Friday</td><td>Saturday</td></tr>
<tr><td><asp:CheckBox ID="chk62Sun" runat="server" Text="6a - 2p" /></td>
<td><asp:CheckBox ID="chk62Mon" runat="server" Text="6a - 9a" /></td>
<td><asp:CheckBox ID="chk62Tues" runat="server" Text="6a - 9a" /></td>
<td><asp:CheckBox ID="chk62Wed" runat="server" Text="6a - 9a" /></td>
<td><asp:CheckBox ID="chk62Thurs" runat="server" Text="6a - 9a" /></td>
<td><asp:CheckBox ID="chk62Fri" runat="server" Text="6a - 9a" /></td>
<td><asp:CheckBox ID="chk62Sat" runat="server" Text="6a - 2p" /></td>
</tr>

<tr><td><asp:CheckBox ID="chk210Sun" runat="server" Text="2p - 10p" /></td>
<td><asp:CheckBox ID="chk210Mon" runat="server" Text="2p - 10p" /></td>
<td><asp:CheckBox ID="chk210Tues" runat="server" Text="2p - 10p" /></td>
<td><asp:CheckBox ID="chk210Wed" runat="server" Text="2p - 10p" /></td>
<td><asp:CheckBox ID="chk210Thurs" runat="server" Text="2p - 10p" /></td>
<td><asp:CheckBox ID="chk210Fri" runat="server" Text="2p - 10p" /></td>
<td><asp:CheckBox ID="chk210Sat" runat="server" Text="2p - 10p" /></td>
</tr>

<tr><td><asp:CheckBox ID="chk108Sun" runat="server" Text="10p - 8a" /></td>
<td><asp:CheckBox ID="chk108Mon" runat="server" Text="10p - 8a" /></td>
<td><asp:CheckBox ID="chk108Tues" runat="server" Text="10p - 8a" /></td>
<td><asp:CheckBox ID="chk108Wed" runat="server" Text="10p - 8a" /></td>
<td><asp:CheckBox ID="chk108Thurs" runat="server" Text="10p - 8a" /></td>
<td><asp:CheckBox ID="chk108Fri" runat="server" Text="10p - 8a" /></td>
<td><asp:CheckBox ID="chk108Sat" runat="server" Text="10p - 8a" /></td>
</tr>
</table>
</div>
<div class="row"><span class="area-header">Education</span></div>
<table id="tblSchools" style="width:100%">
<tr><th>Type</th><th>School Name</th><th>Location</th><th>Years <br/>Completed</th></tr>
<tr><td>High School:</td><td><asp:TextBox id="txtHighSchool" runat="server" 
        MaxLength="45"></asp:TextBox></td><td><asp:TextBox ID="txtHighSchoolLoc" 
            runat="server" MaxLength="50"></asp:TextBox></td>
    <td align="center"><asp:TextBox ID="txtHighSchoolYears" runat="server" Width="20px" 
            MaxLength="5"></asp:TextBox></td></tr>
<tr><td>Business/Trade School:</td><td><asp:TextBox id="txtBusSchool" 
        runat="server" MaxLength="50"></asp:TextBox></td><td>
        <asp:TextBox ID="txtBusSchoolLoc" runat="server" MaxLength="50"></asp:TextBox></td>
    <td align="center"><asp:TextBox ID="txtBusSchoolYears" runat="server" Width="20px" 
            MaxLength="5"></asp:TextBox></td></tr>
<tr><td>College:</td><td><asp:TextBox id="txtCollege" runat="server" MaxLength="50"></asp:TextBox></td><td>
    <asp:TextBox ID="txtCollegeLoc" runat="server" MaxLength="50"></asp:TextBox></td>
    <td align="center"><asp:TextBox ID="txtCollYears" runat="server" Width="20px" 
            MaxLength="5"></asp:TextBox></td></tr>
<tr><td>Area of study:</td><td colspan="3"><asp:TextBox ID="txtAreaOfStudy" 
        runat="server" CssClass="wideinput" MaxLength="230"></asp:TextBox></td></tr>
</table>

<div class="row">

	<label for="txtAdditionalTraining">Additional Training</label>
	<asp:TextBox ID="txtAdditionalTraining" runat="server" CssClass="wideinput" TextMode="multiline" Rows="3" MaxLength="500"></asp:TextBox>

</div>

<div class="row">
<p>
<span class="leftlabel">Do you have a legal right to be employed in the U.S.?</span>
    <asp:CheckBoxList ID="chkListLegalRight" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList>
</p>
</div>

<div class="row">
<p><span class="leftlabel">If yes, proof is required?</span>
	<asp:CheckBoxList ID="chkListLegalProof" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList>

</p>
</div>
<div class="row">
<p><span class="leftlabel">Do you have a valid Driver's license?</span>
<asp:CheckBoxList ID="chkListDriversLic" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList>
</p></div>
<div class="row"><p><span class="leftlabel">Are you of legal age to work?</span>
<asp:CheckBoxList ID="chkListLegalAge" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList></p></div>
<div class="row">
<p>
	<span class="leftlabel">Have you applied at Northeast Residence Before?</span>
	<asp:CheckBoxList ID="chkListAppliedBefore" runat="server">
		<asp:ListItem value="Yes" Text="Yes"></asp:ListItem>
		<asp:ListItem Value="No" Text="No"></asp:ListItem>
	</asp:CheckBoxList>
</p>
</div>
<div class="row">
<p>
	<span class="leftlabel">If so, when?</span>
	<asp:TextBox ID="txtAppliedWhen" runat="server" MaxLength="50"></asp:TextBox>
</p>
</div>
		
<div class="row">
<p>
	<span class="leftlabel">Have you worked at Northeast Residence Before?</span>
	<asp:CheckBoxList ID="chkListWorkedBefore" runat="server">
		<asp:ListItem value="Yes" Text="Yes"></asp:ListItem>
		<asp:ListItem Value="No" Text="No"></asp:ListItem>
	</asp:CheckBoxList>
</p>
</div>
<div class="row">
<p>
	<span class="leftlabel">If so, when?</span>
	<asp:TextBox ID="txtWorkedwhen" runat="server" MaxLength="50"></asp:TextBox>
</p>
<p>
	<span class="leftlabel">Which Site? </span>
    <asp:TextBox ID="txtWorkedBeforeSite" runat="server" MaxLength="50"></asp:TextBox>
</p>
</div>

<div class="row"><span class="area-header">Work History</span></div>
<div class="row">
<p>
	<label for="txtTitle1">Job Title</label>
	<asp:TextBox ID="txtTitle1" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for="txtCompanyName1">Company Name</label>
	<asp:TextBox ID="txtCompanyName1" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for ="txtCompanyPhone1">Company Telephone</label>
	<asp:TextBox ID="txtCompanyPhone1" runat="server" MaxLength="15"></asp:TextBox>
</p>
</div>
<div class="row">
<p>
	<label for="txtCompanyAdd1">Address</label>
	<asp:TextBox ID="txtCompanyAdd1" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for="txtCompanyCity1">City</label>
	<asp:textBox ID="txtCompanyCity1" runat="server" MaxLength="50"></asp:textBox>
</p>
<p>
	<label for="txtCompanyState1">State</label>
	<asp:textBox ID="txtCompanyState1" runat="server"  MaxLength="2" ></asp:textBox>
</p>
</div>

<div class="row">
<p>
	<label for="txtEmplFrom1">Employed From (M/YR):</label>
	<asp:TextBox ID="txtEmplFrom1" runat="server"  MaxLength="10"></asp:TextBox>
</p>
<p>
	<label for="txtEmplTo1">To</label>
	<asp:TextBox MaxLength="10" ID="txtEmplTo1" runat="server"  ></asp:TextBox>
</p>
</div>

<div class="row">
<p>
	<label for="txtDescription1">Description of Duties</label>
	<asp:TextBox ID="txtDescription1" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
</p>
<p>
	<label for="txtReason1">Reason for Leaving:</label>
	<asp:TextBox ID="txtReason1" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="255"></asp:TextBox>
</p>
</div>


<div class="row">
<p>
	<label for="chkListCompanyContact1">May we contact this employer?</label>
	<asp:CheckBoxList ID="chkListCompanyContact1" runat="server"><asp:ListItem Value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:CheckBoxList>
</p>
</div>

<div class="row lineabove">
<p>
	<label for="txtTitle2">Job Title</label>
	<asp:TextBox ID="txtTitle2" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for="txtCompanyName2">Company Name</label>
	<asp:TextBox ID="txtCompanyName2" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for ="txtCompanyPhone2">Company Telephone</label>
	<asp:TextBox ID="txtCompanyPhone2" runat="server" MaxLength="15"></asp:TextBox>
</p>
</div>
<div class="row">
<p>
	<label for="txtCompanyAdd2">Address</label>
	<asp:TextBox ID="txtCompanyAdd2" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for="txtCompanyCity2">City</label>
	<asp:textBox ID="txtCompanyCity2" runat="server" MaxLength="50"></asp:textBox>
</p>
<p>
	<label for="txtCompanyState2">State</label>
	<asp:textBox ID="txtCompanyState2" runat="server"  MaxLength="2" ></asp:textBox>
</p>
</div>

<div class="row">
<p>
	<label for="txtEmplFrom2">Employed From (M/YR):</label>
	<asp:TextBox ID="txtEmplFrom2" runat="server"  MaxLength="10"></asp:TextBox>
</p>
<p>
	<label for="txtEmplTo2">To</label>
	<asp:TextBox MaxLength="10" ID="txtEmplTo2" runat="server"  ></asp:TextBox>
</p>
</div>

<div class="row">
<p>
	<label for="txtDescription2">Description of Duties</label>
	<asp:TextBox ID="txtDescription2" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
</p>
<p>
	<label for="txtReason2">Reason for Leaving:</label>
	<asp:TextBox ID="txtReason2" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="255"></asp:TextBox>
</p>
</div>

<div class="row">
<p>
	<label for="chkListCompanyContact2">May we contact this employer?</label>
	<asp:CheckBoxList ID="chkListCompanyContact2" runat="server"><asp:ListItem Value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:CheckBoxList>
</p>
</div>

<div class="row lineabove">
<p>
	<label for="txtTitle3">Job Title</label>
	<asp:TextBox ID="txtTitle3" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for="txtCompanyName3">Company Name</label>
	<asp:TextBox ID="txtCompanyName3" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for ="txtCompanyPhone3">Company Telephone</label>
	<asp:TextBox ID="txtCompanyPhone3" runat="server" MaxLength="15"></asp:TextBox>
</p>
</div>
<div class="row">
<p>
	<label for="txtCompanyAdd3">Address</label>
	<asp:TextBox ID="txtCompanyAdd3" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox>
</p>
<p>
	<label for="txtCompanyCity3">City</label>
	<asp:textBox ID="txtCompanyCity3" runat="server" MaxLength="50"></asp:textBox>
</p>
<p>
	<label for="txtCompanyState3">State</label>
	<asp:textBox ID="txtCompanyState3" runat="server"  MaxLength="2" ></asp:textBox>
</p>
</div>

<div class="row">
<p>
	<label for="txtEmplFrom3">Employed From (M/YR):</label>
	<asp:TextBox ID="txtEmplFrom3" runat="server"  MaxLength="10"></asp:TextBox>
</p>
<p>
	<label for="txtEmplTo3">To</label>
	<asp:TextBox MaxLength="10" ID="txtEmplTo3" runat="server"  ></asp:TextBox>
</p>
</div>

<div class="row">
<p>
	<label for="txtDescription3">Description of Duties</label>
	<asp:TextBox ID="txtDescription3" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
</p>
<p>
	<label for="txtReason3">Reason for Leaving:</label>
	<asp:TextBox ID="txtReason3" runat="server" CssClass="wideinput" TextMode="MultiLine"  MaxLength="255"></asp:TextBox>
</p>
</div>

<div class="row">
<p>
	<label for="chkListCompanyContact3">May we contact this employer?</label>
	<asp:CheckBoxList ID="chkListCompanyContact3" runat="server"><asp:ListItem Value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:CheckBoxList>
</p>
</div>

<div class="row">

	<label for="txtOtherRelevant">Other Relevant Experience</label>
	<asp:TextBox ID="txtOtherRelevant" runat="server" TextMode="MultiLine" CssClass="wideinput" MaxLength="500"></asp:TextBox>

</div>

<div class="row"><span class="area-header">Professional References</span></div>

<div class="row">
<p>
	<span label for="txtRefName1">Name</span>
	<asp:TextBox ID="txtRefName1" runat="server" MaxLength="55"></asp:TextBox>
</p>
<p>
	<span label for="txtRefPhone1">Phone Number</span>
	<asp:TextBox ID="txtRefPhone1" runat="server" MaxLength="25"></asp:TextBox>
</p>
<p>
	<span label for="txtRefLength1">How long have you known them?</span>
	<asp:TextBox ID="txtRefLength1" runat="server" MaxLength="25"></asp:TextBox>
</p>
</div>

<div class="row lineabove">
<p>
	<span label for="txtRefName2">Name</span>
	<asp:TextBox ID="txtRefName2" runat="server" MaxLength="55"></asp:TextBox>
</p>
<p>
	<span label for="txtRefPhone2">Phone Number</span>
	<asp:TextBox ID="txtRefPhone2" runat="server" MaxLength="25"></asp:TextBox>
</p>
<p>
	<span label for="txtRefLength2">How long have you known them?</span>
	<asp:TextBox ID="txtRefLength2" runat="server" MaxLength="25"></asp:TextBox>
</p>
</div>

<div class="row lineabove">
<p>
	<span label for="txtRefName3">Name</span>
	<asp:TextBox ID="txtRefName3" runat="server" MaxLength="55"></asp:TextBox>
</p>
<p>
	<span label for="txtRefPhone3">Phone Number</span>
	<asp:TextBox ID="txtRefPhone3" runat="server" MaxLength="25"></asp:TextBox>
</p>
<p>
	<span label for="txtRefLength3">How long have you known them?</span>
	<asp:TextBox ID="txtRefLength3" runat="server" MaxLength="25"></asp:TextBox>
</p>
</div>

<div class="row">
<p style="width:100%">
I understand that the Immigration Reform and Control Act of November 6, 1986 requires me to prove the legality of my residency or citizenship.  I am also aware that the failure to provide such proof at the time of request may legally force my termination.  To the best of my knowledge the information contained on this application is true.  I understand that nothing contained in the employment application or in the granting of an interview is intended to create a contract between me and this company for either employment or the provision of any benefits; and further understand that if an employment relationship subsequently is established, I will have the right to terminate my employment at any time and the company will have a similar right.  In addition, I understand that no promise, representation or agreement contrary to the foregoing is binding on the company unless made in writing and signed by me and an authorized representative of the company.  I also understand that all job offers are contingent on applicant meeting requirements for program licensing. </p>
</div>

<asp:RequiredFieldValidator runat="server" ID="rfvName" Display="None" ErrorMessage="Please enter a first name" ControlToValidate="txtFirst" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="rfvlName" Display="None" ErrorMessage="Please enter a last name" ControlToValidate="txtLast" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="rfvlAddress" Display="None" ErrorMessage="Please enter an address" ControlToValidate="txtAddress" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" Display="None" ErrorMessage="Please enter a city" ControlToValidate="txtCity" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" Display="None" ErrorMessage="Please enter a state" ControlToValidate="txtState" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" Display="None" ErrorMessage="Please enter a zip code" ControlToValidate="txtZip" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="rfvPhone" Display="None" ErrorMessage="Please enter a phone number" ControlToValidate="txtPhone" ValidationGroup="Application"></asp:RequiredFieldValidator>

<asp:ValidationSummary runat="server" ID="vsApplication" ShowMessageBox="true" ShowSummary="true" ValidationGroup="Application" />

<div class="row">
<asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        ValidationGroup="Application" onclick="btnSubmit_Click" CssClass="button white"/></div>

</asp:Panel>
<asp:Panel ID="pnlSubmissionMessage" runat="server">
<div style="top:-20px;">
<asp:Literal ID="litSubmitted" runat="server"></asp:Literal>
</div>
</asp:Panel>