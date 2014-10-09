using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.NodeFactory;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class UserInformation : System.Web.UI.UserControl
{


    public string GeneralEmail
    {
        get { return (ViewState["GeneralEmail"] == null) ? "" : ViewState["GeneralEmail"].ToString(); }
        set { ViewState["GeneralEmail"] = value; }
    }

    public string Interest1
    {
        get { return (ViewState["Interest1"]==null)? "" :  ViewState["Interest1"].ToString(); }
        set {ViewState["Interest1"] = value; }
    }

    public string Interest1Email
    {
        get { return (ViewState["Interest1Email"] == null) ? "" : ViewState["Interest1Email"].ToString(); }
        set { ViewState["Interest1Email"] = value; }
    }
    public string Interest2
    {
        get { return (ViewState["Interest2"] == null) ? "" : ViewState["Interest2"].ToString(); }
        set { ViewState["Interest2"] = value; }
    }
    public string Interest2Email
    {
        get { return (ViewState["Interest2Email"] == null) ? "" : ViewState["Interest2Email"].ToString(); }
        set { ViewState["Interest2Email"] = value; }
    }
    public string Interest3
    {
        get { return (ViewState["Interest3"] == null) ? "" : ViewState["Interest3"].ToString(); }
        set { ViewState["Interest3"] = value; }
    }
    public string Interest3Email
    {
        get { return (ViewState["Interest3Email"] == null) ? "" : ViewState["Interest3Email"].ToString(); }
        set { ViewState["Interest3Email"] = value; }
    }
    public string Interest4
    {
        get { return (ViewState["Interest4"] == null) ? "" : ViewState["Interest4"].ToString(); }
        set { ViewState["Interest4"] = value; }
    }
    public string Interest4Email
    {
        get { return (ViewState["Interest4Email"] == null) ? "" : ViewState["Interest4Email"].ToString(); }
        set { ViewState["Interest4Email"] = value; }
    }
    public string Interest5
    {
        get { return (ViewState["Interest5"] == null) ? "" : ViewState["Interest5"].ToString(); }
        set { ViewState["Interest5"] = value; }
    }
    public string Interest5Email
    {
        get { return (ViewState["Interest5Email"] == null) ? "" : ViewState["Interest5Email"].ToString(); }
        set { ViewState["Interest5Email"] = value; }
    }
    public string Interest6
    {
        get { return (ViewState["Interest6"] == null) ? "" : ViewState["Interest6"].ToString(); }
        set { ViewState["Interest6"] = value; }
    }
    public string Interest6Email
    {
        get { return (ViewState["Interest6Email"] == null) ? "" : ViewState["Interest6Email"].ToString(); }
        set { ViewState["Interest6Email"] = value; }
    }
    public string Interest7
    {
        get { return (ViewState["Interest7"] == null) ? "" : ViewState["Interest7"].ToString(); }
        set { ViewState["Interest7"] = value; }
    }
    public string Interest7Email
    {
        get { return (ViewState["Interest7Email"] == null) ? "" : ViewState["Interest7Email"].ToString(); }
        set { ViewState["Interest7Email"] = value; }
    }
    public string Interest8
    {
        get { return (ViewState["Interest8"] == null) ? "" : ViewState["Interest8"].ToString(); }
        set { ViewState["Interest8"] = value; }
    }
    public string Interest8Email
    {
        get { return (ViewState["Interest8Email"] == null) ? "" : ViewState["Interest8Email"].ToString(); }
        set { ViewState["Interest8Email"] = value; }
    }
    public string Interest9
    {
        get { return (ViewState["Interest9"] == null) ? "" : ViewState["Interest9"].ToString(); }
        set { ViewState["Interest9"] = value; }
    }
    public string Interest9Email
    {
        get { return (ViewState["Interest9Email"] == null) ? "" : ViewState["Interest9Email"].ToString(); }
        set { ViewState["Interest9Email"] = value; }
    }
    public string Interest10
    {
        get { return (ViewState["Interest10"] == null) ? "" : ViewState["Interest10"].ToString(); }
        set { ViewState["Interest10"] = value; }
    }
    public string Interest10Email
    {
        get { return (ViewState["Interest10Email"] == null) ? "" : ViewState["Interest10Email"].ToString(); }
        set { ViewState["Interest10Email"] = value; }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string email = HttpUtility.HtmlDecode(Request.QueryString["email"]);
            txtEmail.Text = email;
            SetupCheckboxes();

            Node currNode = Node.GetCurrent();
            string message = GetProperty(currNode, "pageContent");
            litMessage.Text = message;

            btnCancel.Attributes.Add("onClick", "javascript:history.back(); return false;");
        }
    }



    /// <summary>
    /// Setup the check boxes based on the parameters given
    /// </summary>
    private void SetupCheckboxes()
    {
        Node currNode = Node.GetCurrent();

        GeneralEmail = GetProperty(currNode, "GeneralEmail");

        string label = GetProperty(currNode,"interest1");
        if (label != "")
        {
            CheckBox1.Text = label;
            CheckBox1.Visible = true;
            Interest1 = label;
            Interest1Email = GetProperty(currNode, "interest1Email");
        }
        else
        {
            CheckBox1.Checked = false;
            CheckBox1.Visible = false;
        }

        label = GetProperty(currNode, "interest2");
        if (label != "")
        {
            CheckBox2.Text = label;
            CheckBox2.Visible = true;
            Interest2 = label;
            Interest2Email = GetProperty(currNode, "interest2Email");
        }
        else
        {
            CheckBox2.Checked = false;
            CheckBox2.Visible = false;
        }

        label = GetProperty(currNode, "interest3");
        if (label != "")
        {
            CheckBox3.Text = label;
            CheckBox3.Visible = true;
            Interest3 = label;
            Interest3Email = GetProperty(currNode, "interest3Email");
        }
        else
        {
            CheckBox3.Checked = false;
            CheckBox3.Visible = false;
        }

        label = GetProperty(currNode, "interest4");
        if (label != "")
        {
            CheckBox4.Text = label;
            CheckBox4.Visible = true;
            Interest4 = label;
            Interest4Email = GetProperty(currNode, "interest4Email");
        }
        else
        {
            CheckBox4.Checked = false;
            CheckBox4.Visible = false;
        }

        label = GetProperty(currNode, "interest5");
        if (label != "")
        {
            CheckBox5.Text = label;
            CheckBox5.Visible = true;
            Interest5 = label;
            Interest5Email = GetProperty(currNode, "interest5Email");
        }
        else
        {
            CheckBox5.Checked = false;
            CheckBox5.Visible = false;
        }

        label = GetProperty(currNode, "interest6");
        if (label != "")
        {
            CheckBox6.Text = label;
            CheckBox6.Visible = true;
            Interest6 = label;
            Interest6Email = GetProperty(currNode, "interest6Email");
        }
        else
        {
            CheckBox6.Checked = false;
            CheckBox6.Visible = false;
        }

        label = GetProperty(currNode, "interest7");
        if (label != "")
        {
            CheckBox7.Text = label;
            CheckBox7.Visible = true;
            Interest7 = label;
            Interest7Email = GetProperty(currNode, "Interest7Email");
        }
        else
        {
            CheckBox7.Checked = false;
            CheckBox7.Visible = false;
        }

        label = GetProperty(currNode, "interest8");
        if (label != "")
        {
            CheckBox8.Text = label;
            CheckBox8.Visible = true;
            Interest8 = label;
            Interest8Email = GetProperty(currNode, "interest8Email");
        }
        else
        {
            CheckBox8.Checked = false;
            CheckBox8.Visible = false;
        }

        label = GetProperty(currNode, "interest9");
        if (label != "")
        {
            CheckBox9.Text = label;
            CheckBox9.Visible = true;
            Interest9 = label;
            Interest9Email = GetProperty(currNode, "interest9Email");
        }
        else
        {
            CheckBox9.Checked = false;
            CheckBox9.Visible = false;
        }

        label = GetProperty(currNode, "interest10");
        if (label != "")
        {
            CheckBox10.Text = label;
            CheckBox10.Visible = true;
            Interest10 = label;
            Interest10Email = GetProperty(currNode, "interest10Email");
        }
        else
        {
            CheckBox10.Checked = false;
            CheckBox10.Visible = false;
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


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //gather the info
            InterestSubmission submission = new InterestSubmission();
            submission.FName = txtFName.Text;
            submission.LName = txtLName.Text;
            submission.Add1 = txtAdd1.Text;
            submission.Add2 = txtAdd2.Text;
            submission.City = txtCity.Text;
            submission.CompanyName = txtConame.Text;
            submission.State = txtState.Text;
            submission.Zip = txtZip.Text;
            submission.Phone = txtPhone.Text;
            submission.Notes = txtNotes.Text;
            submission.Email = txtEmail.Text;

            if (chkInterestGeneral.Checked)
            {
                submission.Interests.Add("General", GeneralEmail);
            }

            if (CheckBox1.Checked)
            {
                submission.Interests.Add(Interest1, Interest1Email);
            }

            if (CheckBox2.Checked)
            {
                submission.Interests.Add(Interest2, Interest2Email);
            }

            if (CheckBox3.Checked)
            {
                submission.Interests.Add(Interest3, Interest3Email);
            }

            if (CheckBox4.Checked)
            {
                submission.Interests.Add(Interest4, Interest4Email);
            }

            if (CheckBox5.Checked)
            {
                submission.Interests.Add(Interest5, Interest5Email);
            }

            if (CheckBox6.Checked)
            {
                submission.Interests.Add(Interest6, Interest6Email);
            }

            if (CheckBox7.Checked)
            {
                submission.Interests.Add(Interest7, Interest7Email);
            }

            if (CheckBox8.Checked)
            {
                submission.Interests.Add(Interest8, Interest8Email);
            }

            if (CheckBox9.Checked)
            {
                submission.Interests.Add(Interest9, Interest9Email);
            }

            if (CheckBox10.Checked)
            {
                submission.Interests.Add(Interest10, Interest10Email);
            }

            try
            {
                //save to db
                submission.Save();

                //send any emails that need to be sent
                submission.SendEmails();
            }
            catch (Exception ex)
            {
                pnlForm.Visible = false;
                pnlSent.Visible = true;
                litSuccess.Text = ex.Message;
            }

            //let them know 
            Node currNode = Node.GetCurrent();

            string message = GetProperty(currNode, "successMessage");
            litSuccess.Text = message;
            pnlForm.Visible = false;
            pnlSent.Visible = true;

        }
    }
}

public class InterestSubmission
{
    private string errEmail = ConfigurationManager.AppSettings["errEmail"];
    public Dictionary<string,string> Interests { get; set; }
    public string FName { get; set; }
    public string LName { get; set; }
    public string Add1 { get; set; }
    public string Add2 { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public string Phone { get; set; }
    public string CompanyName { get; set; }
    public string Notes { get; set; }
    public string Email { get; set; }

    public string InterestsAsString {
        get {
            string str = "";
            foreach (KeyValuePair<string, string> kvp in this.Interests)
            {
                str += kvp.Key + " ";
            }
            return str;
        }
    }

    public InterestSubmission()
    {
        Interests = new Dictionary<string, string>();
    }

    public void Save()
    {
        MySqlConnection conn = null;
        string commandStr = @"INSERT INTO mysql5_912296_ner._InterestSubmissions " +
            "(first_name, last_name, comp_name, phone, add1, add2, city, state, zip, notes, interests, dt, email) " +
            "VALUES (?first_name, ?last_name, ?comp_name, ?phone, ?add1, ?add2, ?city, ?state, ?zip, ?notes, ?interests, NOW(), ?email);";
        try
        {

            string connectionString = @"Server=mysql502.discountasp.net;Database=MYSQL5_912296_ner;Uid=nerincorg00;Pwd=neradmin1;";
            conn = new MySqlConnection(connectionString);


            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandStr;

            cmd.Parameters.AddWithValue("?first_name", this.FName);
            cmd.Parameters.AddWithValue("?last_name", this.LName);
            cmd.Parameters.AddWithValue("?comp_name", this.CompanyName);
            cmd.Parameters.AddWithValue("?phone", this.Phone);
            cmd.Parameters.AddWithValue("?add1", this.Add1);
            cmd.Parameters.AddWithValue("?add2", this.Add2);
            cmd.Parameters.AddWithValue("?city", this.City);
            cmd.Parameters.AddWithValue("?state", this.State);
            cmd.Parameters.AddWithValue("?zip", this.Zip);
            cmd.Parameters.AddWithValue("?notes", this.Notes);
            cmd.Parameters.AddWithValue("?interests", this.InterestsAsString);
            cmd.Parameters.AddWithValue("?email", this.Email);


            conn.Open();
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            umbraco.library.SendMail("", "hilary.sharp.063@gmail.com", "NER Exception UserInformation.cs", ex.Message, false);
        }
        finally
        {
            conn.Close();
        }

       
    }

    public void SendEmails()
    {
        //going to be <email, interest list>
        Dictionary<string, string> sortedEmails = new Dictionary<string, string>();
        try
        {
 
            foreach (KeyValuePair<string, string> kvp in this.Interests)
            {
                if (sortedEmails.ContainsKey(kvp.Value))
                {
                    sortedEmails[kvp.Value] += ", " + kvp.Key;
                }
                else
                {
                    sortedEmails.Add(kvp.Value, kvp.Key);
                }
            }
        }catch (Exception ex)
        {
            umbraco.library.SendMail("err@nerinc.org", errEmail, "NER - Error sending News & Alerts SignUp", ex.Message, true);
        }

        foreach (KeyValuePair<string, string> kvp in sortedEmails)
        {

            try
            {
                umbraco.library.SendMail("noreply@nerinc.org", kvp.Key, "News & Alerts Sign Up", BuildEmailHTMl(kvp.Value), true);
            }
            catch (Exception ex)
            {
                string data = "Info: " + BuildEmailHTMl(kvp.Key) + " Send to: " +  kvp.Value + " Exception: " + ex.Message + ex.StackTrace;
                umbraco.library.SendMail("err@nerinc.org",errEmail , "NER - Error sending News & Alerts SignUp", data, true);
            }
        }
    }

    private string BuildEmailHTMl(string interest)
    {
        string output = "A nerinc.org user has entered the interest information shown below: <br/><table><tbody>";
        output += String.Format("<tr><td>Date:</td><td>{0}</td></tr>", DateTime.Now.Date.ToShortDateString());
        output += String.Format("<tr><td>First Name:</td><td>{0}</td></tr>", this.FName);
        output += String.Format("<tr><td>Last Name:</td><td>{0}</td></tr>", this.LName);
        output += String.Format("<tr><td>Email:</td><td>{0}</td></tr>", this.Email);
        output += String.Format("<tr><td>Company Name:</td><td>{0}</td></tr>", this.CompanyName);
        output += String.Format("<tr><td>Address 1:</td><td>{0}</td></tr>", this.Add1);
        output += String.Format("<tr><td>Address 2:</td><td>{0}</td></tr>", this.Add2);
        output += String.Format("<tr><td>City:</td><td>{0}</td></tr>", this.City);
        output += String.Format("<tr><td>State:</td><td>{0}</td></tr>", this.State);
        output += String.Format("<tr><td>Zip:</td><td>{0}</td></tr>", this.Zip);
        output += String.Format("<tr><td>Notes:</td><td>{0}</td></tr>", this.Notes);
        output += String.Format("<tr><td>Interests:</td><td>{0}</td></tr>", this.InterestsAsString);

        return output;
    }
}
