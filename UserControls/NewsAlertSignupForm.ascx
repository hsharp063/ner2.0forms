<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsAlertSignupForm.ascx.cs" Inherits="NewsAlertSignupForm" %>
<p>Signup to receive our newsletter.</p>
<p>
	<label for="name">Email *</label>
	<asp:TextBox ID="txtEmail" runat="server" CssClass="newsAlertSignup"></asp:TextBox>
</p>
<asp:Button ID="btnSubmit" runat="server"  CssClass="button white" ValidationGroup="NewsAlert" Text="Signup &#x2192;" OnClick="btnSubmit_Click" />
<asp:RequiredFieldValidator runat="server" ID="rfvEmail" Display="None"  ErrorMessage="Please enter an e-mail address" ControlToValidate="txtEmail" ValidationGroup="NewsAlert"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
    ErrorMessage="Please enter a valid e-mail address" ValidationGroup="NewsAlert"></asp:RegularExpressionValidator>
<asp:ValidationSummary runat="server" ID="vsNewsAlert" CssClass="error-note"  ShowMessageBox="true" ShowSummary="true" ValidationGroup="NewsAlert" />
<br /><asp:Literal ID="litErr" runat="server"></asp:Literal></td></tr>
</table>
<script type="text/javascript">
    //Added to prevent scroll to top on postback
    window.scrollTo = function (x, y) {
        return true;
    }
</script>

