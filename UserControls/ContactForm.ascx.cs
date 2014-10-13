using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.XPath;
using System.Data;
using System.Data.SqlClient;
using umbraco.NodeFactory;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using umbraco;
using umbraco.cms.businesslogic.member;
using System.Web.Security;

public partial class ContactForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        litMessage.Text = "Submit clicked";
        SendEmail();
    }

    private void SendEmail()
    {

        var currNode = Node.GetCurrent();

        if (currNode != null)
        {
            if (name.Text.Length < 1 || email.Text.Length < 1 || message.Text.Length < 1)
            {
                litMessage.Text = "<span class='alert'>Name, Email and Message are required.</span>";
            }
            else
            {
                //Get default properties
                string emailFrom = GetProperty(currNode, "emailFrom");
                string emailTo = GetProperty(currNode, "emailTo");
                string emailSubject = GetProperty(currNode, "emailSubject");

                string date = DateTime.Now.ToShortDateString();

                if (emailFrom != "" && emailTo != "")
                {
                    String strBody = "";
                    strBody += "<table>";
                    strBody += "<tr><td>Name: </td><td>" + name.Text + "</td></tr>";
                    strBody += "<tr><td>Date: </td><td>" + date + "</td></tr>";
                    strBody += "<tr><td>Message: </td><td>" + message.Text + "</td></tr>";
                    strBody += "<tr><td>Email: </td><td>" + email.Text + "</td></tr>";
                    strBody += "</table>";


                    //Send email
                    // umbraco.library.SendMail(emailFrom, emailTo, subject, strBody, true);
                    MailMessage mess = new MailMessage(emailFrom, emailTo, emailSubject, strBody);
                    mess.IsBodyHtml = true;

                    try
                    {
                        SmtpClient client = new SmtpClient();
                        client.Send(mess);
                        mess.Attachments.Dispose();
                        mess.Dispose();
                        litMessage.Text = "<span class='alert'>Thank you, your email has been sent.</span>";
                    }
                    catch (Exception ex2)
                    {
                        litMessage.Text = "Error sending email : " + ex2.Message;
                    }

                    ClearFields();
                }
                else
                {
                    litMessage.Text = "<span class='alert'>Error 102</span>";
                }
            }
           
        }
        else
        {
            litMessage.Text = "<span class='alert'>An error has occurred (122)</span>";
        }
    }


    protected void ClearFields()
    {
        name.Text = "";
        email.Text = "";
        message.Text = "";
    }

    protected string GetProperty(Node pNode, string pPropertyName)
    {
        if (pNode.GetProperty(pPropertyName) != null)
        {
            return pNode.GetProperty(pPropertyName).Value;
        }
        else
        {
            return "";
        }
    }


}