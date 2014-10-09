using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using umbraco.NodeFactory;

public partial class ScholarshipApplication : System.Web.UI.UserControl
{
    public string EmailTo { get; set; }
    public string EmailFrom { get; set; }
    public string SubmitMessage { get; set; }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlApplication.Visible = true;
            pnlSubmissionMessage.Visible = false;
        }

       
    }

    private void SendApplication()
    {
        bool valid = true;
        if (!chkAuth.Checked)
        {
            litMessage.Text = "<span class='important'>Please check the box above the submit button indicating you agree with the statements</span>";
            valid = false;
        }

        if (!chkScholarship.Checked && !chkMemorial.Checked)
        {
            litMessage.Text += "<br/><span class='important'>Please select which type(s) of scholarship you are applying for.</span>";
                valid=false;
        }

        if(valid){
            EmailApplication();
            litSubmitted.Text = "<br/><span class='important'>" + SubmitMessage + "</span>";
            pnlApplication.Visible = false;
            pnlSubmissionMessage.Visible = true;
        }
    }

    private void EmailApplication()
    {
        Node currNode = Node.GetCurrent();
        this.SubmitMessage = GetProperty(currNode, "submitMessage");
        this.EmailFrom = GetProperty(currNode, "emailFrom");
        this.EmailTo = GetProperty(currNode, "emailTo");

        string errEmail = ConfigurationManager.AppSettings["errEmail"];

        string applyingfor = "";
        if (chkMemorial.Checked) applyingfor += "Memorial Award";
        if(chkScholarship.Checked) applyingfor += "  Scholarship Award";

        string education = "";
        if(chkHighSchool.Checked) education+="High School";
        if(chkGED.Checked) education+=" GED";
        if(chkTrade.Checked) education += " Trade School";
        if(chkCollege.Checked) education += " College";

        String strBody = "";

        strBody += "<table>";
         strBody += String.Format("<tr>Applying for:<td></td><td>{0}</td></tr>", applyingfor);
         strBody += String.Format("<tr>Date:<td></td><td>{0}</td></tr>", DateTime.Now.ToShortDateString() );
        strBody += "<tr><td colspan='2'>Personal Information</td></tr>";
       
             strBody += String.Format("<tr>Name:<td></td><td>{0}</td></tr>", txtName.Text);
             strBody += String.Format("<tr>Address:<td></td><td>{0}</td></tr>",txtAddress.Text );
             strBody += String.Format("<tr>City:<td></td><td>{0}</td></tr>",txtCity.Text );
             strBody += String.Format("<tr>State:<td></td><td>{0}</td></tr>", txtState.Text );
             strBody += String.Format("<tr>Zip Code:<td></td><td>{0}</td></tr>", txtZip.Text);
             strBody += String.Format("<tr>Telephone Numbers:<td></td><td>{0}</td></tr>", txtPhone.Text);
                strBody += "<tr><td colspan='2'>Educational Background</td></tr>";
             strBody += String.Format("<tr>Education:<td></td><td>{0}</td></tr>", education);
             strBody += String.Format("<tr>GPA:<td></td><td>{0}</td></tr>", txtGpa.Text);
          strBody += String.Format("<tr>What was your course of study and where and when did you attend?:<td></td><td>{0}</td></tr>", txtCourse.Text);
          strBody += String.Format("<tr>Community Involvement/Volunteer Work:<td></td><td>{0}</td></tr>",txtCommunity.Text );
          strBody += String.Format("<tr>Any previous awards or special recognition:<td></td><td>{0}</td></tr>", txtAwards.Text);
          strBody += String.Format("<tr>College or trade school planning to attend:<td></td><td>{0}</td></tr>", txtCollege.Text);
         strBody += String.Format("<tr>What career do you plan to pursue:<td></td><td>{0}</td></tr>", txtCareerPlan.Text );
         strBody += String.Format("<tr>Planning to go to school:<td></td><td>{0}</td></tr>", rdoFullOrPart.Text);
         strBody += String.Format("<tr>How many classes per semester:<td></td><td>{0}</td></tr>", txtClasses.Text);
         strBody += String.Format("<tr>Time frame for completion of degree:<td></td><td>{0}</td></tr>",txtTimeFrame.Text );
         strBody += String.Format("<tr>Plan to work during school:<td></td><td>{0}</td></tr>", rdoWorkTime.Text );
         strBody += String.Format("<tr>Hours and shifts available:<td></td><td>{0}</td></tr>", txtHours.Text);
        strBody += "<tr><td colspan='2'>References</td></tr>";
         strBody += String.Format("<tr>Name of Reference:<td></td><td>{0}</td></tr>",txtRefName1.Text );
         strBody += String.Format("<tr>Address:<td></td><td>{0}</td></tr>", txtRefAddress1.Text);
         strBody += String.Format("<tr>City:<td></td><td>{0}</td></tr>", txtRefCity1.Text );
         strBody += String.Format("<tr>State:<td></td><td>{0}</td></tr>", txtRefState1.Text);
         strBody += String.Format("<tr>Zip:<td></td><td>{0}</td></tr>", txtRefZip1.Text);
               strBody += String.Format("<tr>Name of Reference:<td></td><td>{0}</td></tr>", txtRefName2.Text);
         strBody += String.Format("<tr>Address:<td></td><td>{0}</td></tr>", txtRefAddress2.Text );
         strBody += String.Format("<tr>City:<td></td><td>{0}</td></tr>", txtRefCity2.Text);
         strBody += String.Format("<tr>State:<td></td><td>{0}</td></tr>", txtRefState2.Text);
         strBody += String.Format("<tr>Zip:<td></td><td>{0}</td></tr>",txtRefZip2.Text );
        strBody += String.Format("<tr>Personal vision for the future:<td></td><td>{0}</td></tr>", txtVision.Text);
        strBody += String.Format("<tr>Describe what makes you feel you are a good candidate for this scholarship:<td></td><td>{0}</td></tr>", txtCandidate.Text);
        strBody += String.Format("<tr>In what ways you would benefit from this scholarship:<td></td><td>{0}</td></tr>",txtBenefit.Text );
        strBody += "</table>";
        try
        {
            //Notification email
            umbraco.library.SendMail(EmailFrom, EmailTo, "Scholarship Application Submission", strBody, true);
        }
        catch (Exception ex)
        {  
            litMessage.Text = ex.Message + ex.StackTrace;
            string data = "Info: " + ex.Message + ex.StackTrace;
            umbraco.library.SendMail("err@nerinc.org", errEmail, "NER - Error with scholarship application email", data, true);
        }

        //send the data to the db
        MySqlConnection conn = null;
        string commandStr = @"INSERT INTO mysql5_912296_ner._scholarship_application_submissions " +
            "(applying_for, education, dt, name,address,city,state,zip,phone,gpa,course,community,awards,"+
        "career_plan,full_or_part,classes,time_frame,work_time,hours,refname1,refadd1,refcity1,refstate1,"+
        "refzip1,refname2,refadd2,refcity2,refstate2,refzip2,vision,candidate,benefit) " +
            "VALUES (?applying_for, ?education, NOW(), ?name,?address,?city,?state,?zip,?phone,?gpa,?course,?community,?awards,"+
        "?career_plan,?full_or_part,?classes,?time_frame,?work_time,?hours,?refname1,?refadd1,?refcity1,?refstate1,"+
        "?refzip1,?refname2,?refadd2,?refcity2,?refstate2,?refzip2,?vision,?candidate,?benefit);";
        try
        {

            string connectionString = @"Server=mysql502.discountasp.net;Database=MYSQL5_912296_ner;Uid=nerincorg00;Pwd=neradmin1;";
            conn = new MySqlConnection(connectionString);

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandStr;

            cmd.Parameters.AddWithValue("?vision",txtVision.Text );
            cmd.Parameters.AddWithValue("?candidate",txtCandidate.Text );
            cmd.Parameters.AddWithValue("?benefit", txtBenefit.Text);
            cmd.Parameters.AddWithValue("?classes",txtClasses.Text );
            cmd.Parameters.AddWithValue("?time_frame",txtTimeFrame.Text );
            cmd.Parameters.AddWithValue("?work_time", rdoWorkTime.Text);
            cmd.Parameters.AddWithValue("?hours", txtHours.Text);
            cmd.Parameters.AddWithValue("?refname1", txtRefName1.Text);
            cmd.Parameters.AddWithValue("?refadd1", txtRefAddress1.Text);
            cmd.Parameters.AddWithValue("?refcity1", txtRefCity1.Text);
            cmd.Parameters.AddWithValue("?refstate1",txtRefState1.Text );
            cmd.Parameters.AddWithValue("?refzip1", txtRefZip1.Text);
            cmd.Parameters.AddWithValue("?refname2", txtRefName1.Text);
            cmd.Parameters.AddWithValue("?refadd2", txtRefAddress2.Text);
            cmd.Parameters.AddWithValue("?refcity2",txtRefCity2.Text );
            cmd.Parameters.AddWithValue("?refstate2", txtRefState2.Text);
            cmd.Parameters.AddWithValue("?refzip2", txtRefZip2.Text);
            cmd.Parameters.AddWithValue("?applying_for", applyingfor);
            cmd.Parameters.AddWithValue("?education",education );
            cmd.Parameters.AddWithValue("?name", txtName.Text);
            cmd.Parameters.AddWithValue("?address", txtAddress.Text);
            cmd.Parameters.AddWithValue("?city", txtCity.Text);
            cmd.Parameters.AddWithValue("?state", txtState.Text);
            cmd.Parameters.AddWithValue("?zip", txtZip.Text);
            cmd.Parameters.AddWithValue("?phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("?gpa", txtGpa.Text);
            cmd.Parameters.AddWithValue("?course", txtCourse.Text);
            cmd.Parameters.AddWithValue("?community", txtCommunity.Text);
            cmd.Parameters.AddWithValue("?awards", txtAwards.Text);
            cmd.Parameters.AddWithValue("?career_plan", txtCareerPlan.Text);
            cmd.Parameters.AddWithValue("?full_or_part", rdoFullOrPart.Text);
       
         
            conn.Open();
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            litMessage.Text = ex.Message + ex.StackTrace;
            string data = "Info: " + ex.Message + ex.StackTrace;
            umbraco.library.SendMail("err@nerinc.org", errEmail, "NER - Error with scholarship application insert", data, true);
        }
        finally
        {
            conn.Close();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SendApplication();
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