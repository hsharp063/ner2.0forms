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
using Microsoft.VisualBasic;
using MySql.Data;
using MySql.Data.MySqlClient;

    public partial class NewsAlertSignupForm : System.Web.UI.UserControl
    {
        public string RedirectURL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //btnSubmit.Attributes.Add("onClick", "javascript:alert('Thank you, you have been added to our contact list');");
            //if (!Page.IsPostBack)
            //{
            //   // litMessage.Text = "";
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    //SubmitData();
                    string url = RedirectURL + "?email=" + HttpUtility.HtmlEncode(txtEmail.Text);
                    Response.Redirect(url);
                }
                catch (Exception ex)
                {
                    //lblErr.Text = ex.StackTrace;
                    litErr.Text = ex.Message + ex.StackTrace;
                }
            }
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

        protected void ClearFields()
        {
            txtEmail.Text = "";
        }
    }
