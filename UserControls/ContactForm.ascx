<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="ContactForm" ClientIDMode="Predictable" %>

<div id="contact">
<div class="row">
<p> 
    <span>Name</span>
    <asp:TextBox ID="name" runat="server"></asp:TextBox></p>
<p>
    <span>Phone</span>
    <asp:TextBox ID="phone" runat="server"></asp:TextBox>
</p>
</div>
<div class="row">
<p>
<span>E-mail</span>
<asp:TextBox ID="email" runat="server"></asp:TextBox>
</p>
</div>
<p>
<span>Message</span>
 <asp:TextBox ID="message" TextMode="MultiLine" Rows="7" runat="server"></asp:TextBox>
</p>
<asp:Button ID="btnSubmit" CssClass="button white" Text="Send Email" style="margin-left: 16px;" runat="server" onclick="btnSubmit_Click"/>
<div class="row">
<asp:Literal ID="litMessage" runat="server"></asp:Literal>
</div>
</div>
                   

               

         
