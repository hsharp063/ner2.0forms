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
<table id="tblPersonal">

<tr><td class="area-header" colspan="4">Personal Information</td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr>
<td>First Name*:</td><td><asp:TextBox ID="txtFirst" runat="server" 
        CssClass="smallinput" MaxLength="50" ></asp:TextBox></td>
<td>Last Name*:</td><td><asp:TextBox ID="txtLast" runat="server" 
        CssClass="smallinput" MaxLength="50"></asp:TextBox></td></tr>
<tr><td>Address*:</td><td colspan="3"><asp:TextBox ID="txtAddress" 
        CssClass="wideinput" runat="server" MaxLength="200"></asp:TextBox></td></tr>
<tr><td>City*:</td><td colspan="3"><asp:TextBox ID="txtCity" runat="server" MaxLength="45"></asp:TextBox>&nbsp;State*:&nbsp; <asp:TextBox ID="txtState" runat="server" MaxLength="2" Width="50px"></asp:TextBox>&nbsp;Zip Code*:&nbsp; 
    <asp:TextBox ID="txtZip" runat="server" Width="100px" MaxLength="10"></asp:TextBox></td></tr>
<tr><td>Phone Number*:</td><td><asp:TextBox id="txtPhone" runat="server" 
        CssClass="smallinput" MaxLength="15"></asp:TextBox></td><td colspan="2"></td></tr>
        <tr><td>Email:</td><td colspan="3"><asp:TextBox ID="txtEmail" runat="server" MaxLength="200" CssClass="wideinput"></asp:TextBox></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td class="area-header" colspan="4">How did you find out about Northeast Residence, Inc?</td></tr>
<tr><td colspan="2">
<asp:RadioButtonList ID="rdoFindOut" runat="server">
<asp:ListItem Text="Referral; if so by whom?" Value="Referrel"></asp:ListItem>
<asp:ListItem Text="Classifieds/Paper; if so, which paper?" Value="Classifieds"></asp:ListItem>
<asp:ListItem Text="Job Fair; if so, where?" Value="Job Fair"></asp:ListItem>
<asp:ListItem Text="Other; please list source" Value="Other"></asp:ListItem>
</asp:RadioButtonList>
</td><td colspan="2"><table><tbody>
<tr><td><asp:TextBox ID="txtReferrel" runat="server" CssClass ="referrel" 
        MaxLength="30"></asp:TextBox></td></tr>
<tr><td><asp:TextBox ID="txtClassifieds" runat="server" CssClass ="classified" 
        MaxLength="30"></asp:TextBox></td></tr>
<tr><td><asp:TextBox ID="txtFair" runat="server" CssClass ="fair" MaxLength="30"></asp:TextBox></td></tr>
<tr><td><asp:TextBox ID="txtOther" runat="server" CssClass ="other" MaxLength="30"></asp:TextBox></td></tr>
</tbody></table>
</td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td colspan="2" class="area-header">Position Applied For:</td><td colspan="2">
    <asp:TextBox ID="txtPosition" runat="server" MaxLength="50"></asp:TextBox></td></tr>
<tr><td colspan="2">Number of hours available per week: <asp:TextBox ID="txtHours" 
        runat="server" MaxLength="30"></asp:TextBox></td><td colspan="2">Are you interested in: <asp:CheckBox ID="chkFullTime" runat="server" Text="Full Time"/><asp:CheckBox runat="server" ID="chkPart" text="Part Time"/></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td colspan="4" class="area-header">Please check all shifts you are available to work:</td></tr>
<tr><td colspan="4">
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
</td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td colspan="4" class="area-header">Education</td></tr>
<tr><td colspan="2"></td><td>Location</td><td>Years Completed</td></tr>
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
<tr><td>Additional Training:</td><td colspan="3">
    <asp:TextBox ID="txtAdditionalTraining" runat="server" CssClass="wideinput" 
        MaxLength="500"></asp:TextBox></td></tr>
<tr><td colspan="2">Do you have a legal right to be employed in the U.S.?</td>
    <td align="left" colspan="2"><asp:CheckBoxList ID="chkListLegalRight" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td colspan="2">&nbsp; If yes, proof is required?</td><td align="left" 
        colspan="2"><asp:CheckBoxList ID="chkListLegalProof" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td colspan="2">Do you have a valid Driver's license?</td><td align="left" 
        colspan="2"><asp:CheckBoxList ID="chkListDriversLic" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td colspan="2">Are you of legal age to work?</td><td align="left" colspan="2"><asp:CheckBoxList ID="chkListLegalAge" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td colspan="2">Have you applied at Northeast Residence Before?</td><td colspan="2"><asp:CheckBoxList ID="chkListAppliedBefore" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList>If so, when?<asp:TextBox 
        ID="txtAppliedWhen" runat="server" MaxLength="50"></asp:TextBox></td></tr>
<tr><td colspan="2">Have you worked at Northeast Residence Before?</td><td colspan="2"><asp:CheckBoxList ID="chkListWorkedBefore" runat="server"><asp:ListItem value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Value="No" Text="No"></asp:ListItem></asp:CheckBoxList>If so, when?<asp:TextBox 
        ID="txtWorkedwhen" runat="server" MaxLength="50"></asp:TextBox><br />Which Site? 
    <asp:TextBox ID="txtWorkedBeforeSite" runat="server" MaxLength="50"></asp:TextBox></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td class="area-header" colspan="4">Work History</td></tr>
<tr><td colspan="2">Company Name: &nbsp;<asp:TextBox ID="txtCompanyName1" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox></td><td colspan="2">Company Telephone: <asp:TextBox ID="txtCompanyPhone1" runat="server" MaxLength="15"></asp:TextBox></td></tr>
<tr><td colspan="2">Address:&nbsp;<asp:TextBox ID="txtCompanyAdd1" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox></td><td colspan="2">Employed From (M/YR):&nbsp;<asp:TextBox ID="txtEmplFrom1" runat="server" Width="50px" MaxLength="10"></asp:TextBox>&nbsp;To:&nbsp; <asp:TextBox MaxLength="10" ID="txtEmplTo1" runat="server"  Width="50px"></asp:TextBox></td></tr>
<tr><td colspan="2">City:&nbsp;<asp:textBox ID="txtCompanyCity1" runat="server" MaxLength="50"></asp:textBox> State:&nbsp;<asp:textBox ID="txtCompanyState1" runat="server"  MaxLength="2" Width="50px"></asp:textBox></td><td colspan="2">May we contact this employer? <asp:CheckBoxList ID="chkListCompanyContact1" runat="server"><asp:ListItem Value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td>Reason for Leaving:</td><td colspan="3"><asp:TextBox ID="txtReason1" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox></td></tr>
<tr><td>Job Title:</td><td colspan="3"><asp:TextBox ID="txtTitle1" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox></td></tr>
<tr><td>Description of Duties:</td><td colspan="3"><asp:TextBox ID="txtDescription1" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="500"></asp:TextBox></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td colspan="2">Company Name:&nbsp; <asp:TextBox ID="txtCompanyName2" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox></td><td colspan="2">Company Telephone:&nbsp; <asp:TextBox ID="txtCompanyPhone2" runat="server" MaxLength="15"></asp:TextBox></td></tr>
<tr><td colspan="2">Address:&nbsp;<asp:TextBox ID="txtCompanyAdd2" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox></td><td colspan="2">Employed From (M/YR):&nbsp;<asp:TextBox ID="txtEmplFrom2" runat="server" Width="50px" MaxLength="10"></asp:TextBox>&nbsp;To:&nbsp; <asp:TextBox MaxLength="10" ID="txtEmplTo2" runat="server"  Width="50px"></asp:TextBox></td></tr>
<tr><td colspan="2">City:&nbsp;<asp:textBox ID="txtCompanyCity2" runat="server" MaxLength="50"></asp:textBox> State:&nbsp;<asp:textBox ID="txtCompanyState2" runat="server"  MaxLength="2" Width="50px"></asp:textBox></td><td colspan="2">May we contact this employer? <asp:CheckBoxList ID="chkListCompanyContact2" runat="server"><asp:ListItem Value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td>Reason for Leaving:</td><td colspan="3"><asp:TextBox ID="txtReason2" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox></td></tr>
<tr><td>Job Title:</td><td colspan="3"><asp:TextBox ID="txtTitle2" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox></td></tr>
<tr><td>Description of Duties:</td><td colspan="3"><asp:TextBox ID="txtDescription2" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="500"></asp:TextBox></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td colspan="2">Company Name:&nbsp; <asp:TextBox ID="txtCompanyName3" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox></td><td colspan="2">Company Telephone: &nbsp;<asp:TextBox ID="txtCompanyPhone3" runat="server" MaxLength="15"></asp:TextBox></td></tr>
<tr><td colspan="2">Address:&nbsp;<asp:TextBox ID="txtCompanyAdd3" runat="server" CssClass="textMedium" MaxLength="255"></asp:TextBox></td><td colspan="2">Employed From (M/YR):&nbsp;<asp:TextBox ID="txtEmplFrom3" runat="server" Width="50px" MaxLength="10"></asp:TextBox>&nbsp;To:&nbsp; <asp:TextBox MaxLength="10" ID="txtEmplTo3" runat="server"  Width="50px"></asp:TextBox></td></tr>
<tr><td colspan="2">City:&nbsp;<asp:textBox ID="txtCompanyCity3" runat="server" MaxLength="50"></asp:textBox> State:<asp:textBox ID="txtCompanyState3" runat="server"  MaxLength="2" Width="50px" >
</asp:textBox></td><td colspan="2">May we contact this employer? <asp:CheckBoxList ID="chkListCompanyContact3" runat="server"><asp:ListItem Value="Yes" Text="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:CheckBoxList></td></tr>
<tr><td>Reason for Leaving:</td><td colspan="3"><asp:TextBox ID="txtReason3" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox></td></tr>
<tr><td>Job Title:</td><td colspan="3"><asp:TextBox ID="txtTitle3" runat="server" CssClass="wideinput" MaxLength="255"></asp:TextBox></td></tr>
<tr><td>Description of Duties:</td><td colspan="3"><asp:TextBox ID="txtDescription3" runat="server" CssClass="wideinput" TextMode="MultiLine" MaxLength="500"></asp:TextBox></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td>Other Relevant Experience:</td><td colspan="3"><asp:TextBox ID="txtOtherRelevant" runat="server" TextMode="MultiLine" CssClass="wideinput" MaxLength="500"></asp:TextBox></td></tr>
<tr><td colspan="4" class="table-space"></td></tr>
<tr><td class="area-header" colspan="4">Professional References</td></tr>
<tr><td colspan="4">
<table width="100%"><tbody>
<tr><td><table width="70%" style="margin:auto;"><tbody>
<tr><td>Name</td><td align="right">Telephone Number</td><td align="right">How long 
    have
    <br />
    you known him/her?</td></tr>
<tr><td><asp:TextBox ID="txtRefName1" runat="server" MaxLength="55"></asp:TextBox></td>
    <td align="right"><asp:TextBox ID="txtRefPhone1" runat="server" MaxLength="25"></asp:TextBox></td>
    <td align="right"><asp:TextBox ID="txtRefLength1" runat="server" MaxLength="25"></asp:TextBox></td></tr>
<tr><td><asp:TextBox ID="txtRefName2" runat="server" MaxLength="55"></asp:TextBox></td>
    <td align="right"><asp:TextBox ID="txtRefPhone2" runat="server" MaxLength="25"></asp:TextBox></td>
    <td align="right"><asp:TextBox ID="txtRefLength2" runat="server" MaxLength="25"></asp:TextBox></td></tr>
<tr><td><asp:TextBox ID="txtRefName3" runat="server" MaxLength="55"></asp:TextBox></td>
    <td align="right"><asp:TextBox ID="txtRefPhone3" runat="server" MaxLength="25"></asp:TextBox></td>
    <td align="right"><asp:TextBox ID="txtRefLength3" runat="server" MaxLength="25"></asp:TextBox></td></tr>
    </tbody></table></td></tr>
<tr><td colspan="2" class="table-space"></td></tr>
<tr><td colspan="2" class="table-space"></td></tr>
<tr><td colspan="2">
<p>
I understand that the Immigration Reform and Control Act of November 6, 1986 requires me to prove the legality of my residency or citizenship.  I am also aware that the failure to provide such proof at the time of request may legally force my termination.  To the best of my knowledge the information contained on this application is true.  I understand that nothing contained in the employment application or in the granting of an interview is intended to create a contract between me and this company for either employment or the provision of any benefits; and further understand that if an employment relationship subsequently is established, I will have the right to terminate my employment at any time and the company will have a similar right.  In addition, I understand that no promise, representation or agreement contrary to the foregoing is binding on the company unless made in writing and signed by me and an authorized representative of the company.  I also understand that all job offers are contingent on applicant meeting requirements for program licensing. </p>
</td></tr>
<tr><td colspan="2">

<asp:RequiredFieldValidator runat="server" ID="rfvName" Display="None" ErrorMessage="Please enter a first name" ControlToValidate="txtFirst" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="rfvlName" Display="None" ErrorMessage="Please enter a last name" ControlToValidate="txtLast" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="rfvlAddress" Display="None" ErrorMessage="Please enter an address" ControlToValidate="txtAddress" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" Display="None" ErrorMessage="Please enter a city" ControlToValidate="txtCity" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" Display="None" ErrorMessage="Please enter a state" ControlToValidate="txtState" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" Display="None" ErrorMessage="Please enter a zip code" ControlToValidate="txtZip" ValidationGroup="Application"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator runat="server" ID="rfvPhone" Display="None" ErrorMessage="Please enter a phone number" ControlToValidate="txtPhone" ValidationGroup="Application"></asp:RequiredFieldValidator>

<asp:ValidationSummary runat="server" ID="vsApplication" ShowMessageBox="true" ShowSummary="true" ValidationGroup="Application" />

</td></tr>
<tr><td></td><td>
<asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        ValidationGroup="Application" onclick="btnSubmit_Click" CssClass="map-btn"/></td></tr>
</tbody></table>

</td></tr>
</table>
</asp:Panel>
<asp:Panel ID="pnlSubmissionMessage" runat="server">
<div style="top:-20px;">
<asp:Literal ID="litSubmitted" runat="server"></asp:Literal>
</div>
</asp:Panel>