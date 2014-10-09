<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeadForm.ascx.cs" Inherits="U_PGC.usercontrols.LeadForm" %>

<form id="Form1" runat="server">

<asp:Panel ID="pnlForm" runat="server">
    <asp:Label ID="lblErr" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
    <table class="lead-form">
        <tr>
            <td>
                <p class="lead-form-label">
                    Name **
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <asp:TextBox ID="txtName" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">Title</p>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">
                    Company **
                    <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <asp:TextBox ID="txtCompany" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">Address</p>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">City</p>
                <asp:TextBox ID="txtCity" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">State</p>
                <asp:TextBox ID="txtState" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">Zip</p>
                <asp:TextBox ID="txtZip" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">
                    Phone **
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">
                    Email **
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="lead-form-input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">
                    Are you a Current PGC Customer?**
                    <asp:RequiredFieldValidator ID="rfvCustomerType" runat="server" ControlToValidate="rblCustomerType" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <br />
                <asp:RadioButtonList runat="server" ID="rblCustomerType" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Yes" Value="Current"></asp:ListItem>
                    <asp:ListItem Text="No" Value="New"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <p class="lead-form-label">Comments</p>
                <asp:TextBox ID="txtComments" runat="server" Rows="4" TextMode="MultiLine" CssClass="lead-form-textarea"></asp:TextBox>
            </td>
        </tr>
    </table>
    
    <div><asp:ImageButton ID="ibtnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" ImageUrl="~/images/pgc_landing_11.gif"/></div>
</asp:Panel>
<asp:Panel ID="pnlSubmitted" runat="server" Visible="false">	
	<h2>Thank you for your inquiry!<br />PGC will contact you as soon as possible.</h2>
</asp:Panel>
</form>