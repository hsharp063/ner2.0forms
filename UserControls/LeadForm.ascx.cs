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

namespace U_PGC.usercontrols
{
    public partial class LeadForm : System.Web.UI.UserControl
    {
        private String _notificationEmailTo = "";

        public String NotificationEmailTo
        {
            get
            {
                return _notificationEmailTo;
            }
            set
            {
                _notificationEmailTo = value;
            }
        }

        private String _notificationEmailFrom = "";

        public String NotificationEmailFrom
        {
            get
            {
                return _notificationEmailFrom;
            }
            set
            {
                _notificationEmailFrom = value;
            }
        }

        private String _autoResponseEmailFrom = "";

        public String AutoResponseEmailFrom
        {
            get
            {
                return _autoResponseEmailFrom;
            }
            set
            {
                _autoResponseEmailFrom = value;
            }
        }

        private String _autoResponseEmailSubject = "";

        public String AutoResponseEmailSubject
        {
            get
            {
                return _autoResponseEmailSubject;
            }
            set
            {
                _autoResponseEmailSubject = value;
            }
        }

        private String _autoResponseEmailBody = "";

        public String AutoResponseEmailBody
        {
            get
            {
                return _autoResponseEmailBody;
            }
            set
            {
                _autoResponseEmailBody = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SubmitData();

                if (lblErr.Text == "")
                {
                    pnlForm.Visible = false;
                    pnlSubmitted.Visible = true;
                }
            }
        }

        private void SubmitData()
        {
            string connectionString = ConfigurationSettings.AppSettings["umbracoDbDSN"];

            using (SqlConnection clearConnection = new SqlConnection(connectionString))
            {
                try
                {
                    clearConnection.Open();

                    SqlCommand sql = new SqlCommand("dbo.usp_bssLeadForm_Insert", clearConnection);
                    sql.CommandType = CommandType.StoredProcedure;
                    sql.Parameters.AddWithValue("@Name", txtName.Text);
                    sql.Parameters.AddWithValue("@Title", txtTitle.Text);
                    sql.Parameters.AddWithValue("@Company", txtCompany.Text);
                    sql.Parameters.AddWithValue("@Address", txtAddress.Text);
                    sql.Parameters.AddWithValue("@City", txtCity.Text);
                    sql.Parameters.AddWithValue("@State", txtState.Text);
                    sql.Parameters.AddWithValue("@Zip", txtZip.Text);
                    sql.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    sql.Parameters.AddWithValue("@Email", txtEmail.Text);
                    sql.Parameters.AddWithValue("@CustomerType", rblCustomerType.SelectedValue);
                    sql.Parameters.AddWithValue("@Comments", txtComments.Text);
                    sql.Parameters.AddWithValue("@ReferringPage", "3M® VHB™ Tape Sample Request");

                    sql.Parameters.Add("@ID", SqlDbType.Int);
                    sql.Parameters["@ID"].Direction = ParameterDirection.Output;
                    sql.ExecuteNonQuery();

                    String strBody = "";

                    strBody += "<table>";
                    strBody += "<tr><td>Referring Page: </td><td>3M® VHB™ Tape Sample Request</td></tr>";
                    strBody += "<tr><td>Name: </td><td>" + txtName.Text + "</td></tr>";
                    strBody += "<tr><td>Title: </td><td>" + txtTitle.Text + "</td></tr>";
                    strBody += "<tr><td>Company: </td><td>" + txtCompany.Text + "</td></tr>";
                    strBody += "<tr><td>Address: </td><td>" + txtAddress.Text + "</td></tr>";
                    strBody += "<tr><td>City: </td><td>" + txtCity.Text + "</td></tr>";
                    strBody += "<tr><td>State: </td><td>" + txtState.Text + "</td></tr>";
                    strBody += "<tr><td>Zip: </td><td>" + txtZip.Text + "</td></tr>";
                    strBody += "<tr><td>Phone: </td><td>" + txtPhone.Text + "</td></tr>";
                    strBody += "<tr><td>Email: </td><td>" + txtEmail.Text + "</td></tr>";
                    strBody += "<tr><td>Are you a current PGC Customer?: </td><td>" + rblCustomerType.SelectedValue + "</td></tr>";
                    strBody += "<tr><td>Comments: </td><td>" + txtComments.Text + "</td></tr>";
                    strBody += "</table>";

                    //Notification email
                    umbraco.library.SendMail(NotificationEmailFrom, NotificationEmailTo, "3M VHB Tape Sample Request", strBody, true);

                    //Responder email
                    umbraco.library.SendMail(AutoResponseEmailFrom, txtEmail.Text, AutoResponseEmailSubject, AutoResponseEmailBody.Replace("/r/n", " "), true);

                    ClearFields();
                }
                catch (Exception ex)
                {
                    lblErr.Text = ex.ToString();
                }
                finally
                {
                    clearConnection.Close();
                }
            }
        }

        protected void ClearFields()
        {
            txtName.Text = "";
            txtTitle.Text = "";
            txtCompany.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZip.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            rblCustomerType.ClearSelection();
            txtComments.Text = "";
        }
    }
}