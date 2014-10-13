using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using umbraco.NodeFactory;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using umbraco;
using umbraco.cms.businesslogic.member;
using System.Web.Security;


/// <summary>
/// Summary description for Class1
/// </summary>
public class ContactFormSurfaceController : Umbraco.Web.Mvc.SurfaceController
{
    [HttpPost]
    public ActionResult SubmitForm(ContactUsSubmission model)
    {    
        //model not valid, do not save, but return current umbraco page
        if (!ModelState.IsValid)
        {
            //Perhaps you might want to add a custom message to the ViewBag
            //which will be available on the View when it renders (since we're not 
            //redirecting)     
            string message = SendEmail(model);
            TempData.Add("FormResult", message);
            return CurrentUmbracoPage();
        }

        //redirect to current page to clear the form
        return RedirectToCurrentUmbracoPage();          
    }

    private string SendEmail(ContactUsSubmission model)
    {

        var currNode = Node.GetCurrent();

        if (currNode != null)
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
                strBody += "<tr><td>Name: </td><td>" + model.Name + "</td></tr>";
                strBody += "<tr><td>Date: </td><td>" + date + "</td></tr>";
                strBody += "<tr><td>Message: </td><td>" + model.Message + "</td></tr>";
                strBody += "<tr><td>Email: </td><td>" + model.Email + "</td></tr>";
                strBody += "<tr><td>Email: </td><td>" + model.Phone + "</td></tr>";
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
                    return "Thank you, your email has been sent.";
                }
                catch (Exception ex2)
                {
                    return "Error sending email : " + ex2.Message;
                }

                //ClearFields();
            }
            else
            {
                return "Error sending email: Form not fully configured";
            }
        }
        else
        {
            return "Error sending email: Current node null";
        }

    }


    protected void ClearFields()
    {
        //name.Text = "";
        //email.Text = "";
        //message.Text = "";
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