<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInformation.ascx.cs" Inherits="UserInformation" %>
<asp:Panel ID="pnlForm" runat="server">
<table>
<tbody>
<tr><td colspan="2"><asp:Literal ID="litMessage" runat="server"></asp:Literal></td></tr>
<tr><td><table id="tblInterests" class="tblInterests"><tbody><tr><td><h2 class="form-area-header">Interests</h2>
<br /><asp:CheckBox ID="chkInterestGeneral" runat="server" Text="General Interest"/>
<br /><asp:CheckBox ID="CheckBox1" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox2" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox3" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox4" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox5" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox6" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox7" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox8" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox9" runat="server" Text=""/>
<br /><asp:CheckBox ID="CheckBox10" runat="server" Text=""/>
</td></tr></tbody></table>

</td><td>
<table id="tblInfo" class="tblInfo"><tbody><tr><td colspan="2"><h2 class="form-area-header">Your Information</h2></td></tr>
<tr><td>First Name</td><td><asp:TextBox ID="txtFName" runat="server" CssClass="infoinput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="*" ValidationGroup="form"></asp:RequiredFieldValidator></td></tr>
<tr><td>Last Name</td><td><asp:TextBox ID="txtLName" runat="server" CssClass="infoinput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="*" ValidationGroup="form"></asp:RequiredFieldValidator></td></tr>
<tr><td>Verify Email</td><td><asp:TextBox ID="txtEmail" runat="server" CssClass="infoinput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ValidationGroup="form"></asp:RequiredFieldValidator></td></tr>
<tr><td>Company Name</td><td><asp:TextBox ID="txtConame" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>Phone</td><td><asp:TextBox ID="txtPhone" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>Address Line 1</td><td><asp:TextBox ID="txtAdd1" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>Address Line 2</td><td><asp:TextBox ID="txtAdd2" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>City</td><td><asp:TextBox ID="txtCity" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>State</td><td><asp:TextBox ID="txtState" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>Zip</td><td><asp:TextBox ID="txtZip" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td>Notes</td><td><asp:TextBox TextMode="MultiLine" ID="txtNotes" runat="server" CssClass="infoinput"></asp:TextBox></td></tr>
<tr><td colspan="2"><asp:ValidationSummary runat="server" ID="summary" ValidationGroup="form" ShowMessageBox="false" ShowSummary="true"/></td></tr>



</tbody></table></td></tr>
<tr><td>&nbsp;</td><td><asp:Button ID="btnCancel" runat="server" Text="Cancel" 
       CssClass="map-btn" style="float:right;margin-top: 20px;margin-right: 100px;"/><asp:Button ID="btnSubmit" runat="server" 
        text="Submit" onclick="btnSubmit_Click" CssClass="map-btn" style="float:right;margin-top: 20px;"/>
        <asp:Literal ID="litErr" runat="server" ></asp:Literal></td></tr>
</tbody>
</table>
</asp:Panel>
<asp:Panel ID="pnlSent" runat="server" Visible ="false">
<asp:Literal ID="litSuccess" runat="server"></asp:Literal>
</asp:Panel>