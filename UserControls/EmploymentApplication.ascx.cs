using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using umbraco.NodeFactory;
using System.Configuration;

public partial class EmploymentApplication : System.Web.UI.UserControl
{
    public string EmailTo { get; set; }
    public string EmailFrom { get; set; }
    public string SubmitMessage { get; set; }
    public string PageContent { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        Node currNode = Node.GetCurrent();

        PageContent = GetProperty(currNode, "pageContent");
        litMessage.Text = "<span class=\"messageArea\">" + PageContent + "</span>";

        pnlSubmissionMessage.Visible = false;
        pnlApplication.Visible = true;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                SaveAndSend();
                pnlApplication.Visible = false;

                Node currNode = Node.GetCurrent();
                this.SubmitMessage = GetProperty(currNode, "submitMessage");
                litMessage.Text = "<span class='important'>" + this.SubmitMessage + "</span>";
                pnlSubmissionMessage.Visible = true;
            }
            catch (Exception ex)
            {
                 string errEmail = ConfigurationManager.AppSettings["errEmail"];
                litMessage.Text = ex.Message + ex.StackTrace;
                string data = "Info: " + ex.Message + ex.StackTrace;
                umbraco.library.SendMail("err@nerinc.org", errEmail, "NER - Error with emp application", data, true);
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

    private void SaveAndSend()
    {
        try
        {
            Node currNode = Node.GetCurrent();
            this.EmailFrom = GetProperty(currNode, "emailFrom");
            this.EmailTo = GetProperty(currNode, "emailTo");
        Application app;


        app = new Application(EmailFrom, EmailTo);
        app.FirstName = GetTextBoxVal(txtFirst);
        app.LastName = GetTextBoxVal(txtLast);
        app.ApplicantAddress.StrAddress = GetTextBoxVal(txtAddress);
        app.ApplicantAddress.City = GetTextBoxVal(txtCity);
        app.ApplicantAddress.State = GetTextBoxVal(txtState);
        app.ApplicantAddress.Zip = GetTextBoxVal(txtZip);
        app.ApplicantAddress.Phone = GetTextBoxVal(txtPhone);
        app.HeardAbout = rdoFindOut.SelectedValue == null || rdoFindOut.SelectedValue == "" ? "NA" : rdoFindOut.SelectedValue;
        app.HeardDetails = GetDetails(rdoFindOut.SelectedValue);
        app.Position = GetTextBoxVal(txtPosition);

        app.ApplicantEmail = GetTextBoxVal(txtEmail);

        app.OtherRelevantExperience = GetTextBoxVal(txtOtherRelevant);
                 
        string hours = "";
        if (chkFullTime.Checked) hours += "Full Time ";
        if (chkPart.Checked) hours += "Part Time";
        if(hours == "") hours = "NA";

        app.HourType = hours;
        SetHoursAvailable(ref app);

        //app.Hours = GetTextBoxVal(txtHours);

        app.College.Name = GetTextBoxVal(txtCollege);
        app.College.Location = GetTextBoxVal(txtCollegeLoc);
        app.College.Years = GetTextBoxVal(txtCollYears);

        app.HighSchool.Name = GetTextBoxVal(txtHighSchool);
        app.HighSchool.Location = GetTextBoxVal(txtHighSchoolLoc);
        app.HighSchool.Years = GetTextBoxVal(txtHighSchoolYears);

        app.TradeSchool.Name = GetTextBoxVal(txtBusSchool);
        app.TradeSchool.Location = GetTextBoxVal(txtBusSchoolLoc);
        app.TradeSchool.Years = GetTextBoxVal(txtBusSchoolYears);

        app.AreaOfStudy = GetTextBoxVal(txtAreaOfStudy);
        app.AdditionalTraining = GetTextBoxVal(txtAdditionalTraining);

        app.LegalRight = GetCheckBoxVal(chkListLegalRight);
        app.ProofRequired = GetCheckBoxVal(chkListLegalProof);
        app.ValidLicense = GetCheckBoxVal(chkListDriversLic);
        app.LegalAge = GetCheckBoxVal(chkListLegalAge);

        app.AppliedBefore = GetCheckBoxVal(chkListAppliedBefore);
        app.AppliedWhen = GetTextBoxVal(txtAppliedWhen);
        app.WorkedBefore = GetCheckBoxVal(chkListWorkedBefore);
        app.WorkedSite = GetTextBoxVal(txtWorkedBeforeSite);
        app.WorkedWhen = GetTextBoxVal(txtWorkedwhen);
       //     app.OldPosition = GetTextBoxVal(

        app.History = new List<WorkHistory>();

        WorkHistory job1 = new WorkHistory();
        job1.CompanyAddress = new Address();
        job1.CompanyAddress.Name = GetTextBoxVal(txtCompanyName1);
        job1.CompanyAddress.StrAddress = GetTextBoxVal(txtCompanyAdd1);
        job1.CompanyAddress.City = GetTextBoxVal(txtCompanyCity1);
        job1.CompanyAddress.State = GetTextBoxVal(txtCompanyState1);
        job1.CompanyAddress.Phone = GetTextBoxVal(txtCompanyPhone1);
        job1.EmployedFrom = GetTextBoxVal(txtEmplFrom1);
        job1.EmployedTo = GetTextBoxVal(txtEmplTo1);
        job1.ReasonForLeaving = GetTextBoxVal(txtReason1);
        job1.JobDescription = GetTextBoxVal(txtDescription1);
        job1.JobTitle = GetTextBoxVal(txtTitle1);
        job1.ContactAllowed = GetCheckBoxVal(chkListCompanyContact1);
        app.History.Add(job1);

        WorkHistory job2 = new WorkHistory();
        job2.CompanyAddress = new Address();
        job2.CompanyAddress.Name = GetTextBoxVal(txtCompanyName2);
        job2.CompanyAddress.StrAddress = GetTextBoxVal(txtCompanyAdd2);
        job2.CompanyAddress.City = GetTextBoxVal(txtCompanyCity2);
        job2.CompanyAddress.State = GetTextBoxVal(txtCompanyState2);
        job2.CompanyAddress.Phone = GetTextBoxVal(txtCompanyPhone2);
        job2.EmployedFrom = GetTextBoxVal(txtEmplFrom2);
        job2.EmployedTo = GetTextBoxVal(txtEmplTo2);
        job2.ReasonForLeaving = GetTextBoxVal(txtReason2);
        job2.JobDescription = GetTextBoxVal(txtDescription2);
        job2.JobTitle = GetTextBoxVal(txtTitle2);
        job2.ContactAllowed = GetCheckBoxVal(chkListCompanyContact2);

        app.History.Add(job2);

        WorkHistory job3 = new WorkHistory();
        job3.CompanyAddress = new Address();
        job3.CompanyAddress.Name = GetTextBoxVal(txtCompanyName3);
        job3.CompanyAddress.StrAddress = GetTextBoxVal(txtCompanyAdd3);
        job3.CompanyAddress.City = GetTextBoxVal(txtCompanyCity3);
        job3.CompanyAddress.State = GetTextBoxVal(txtCompanyState3);

        //job3.CompanyAddress.Zip = GetTextBoxVal(txtCompanyZip3);
        job3.CompanyAddress.Phone = GetTextBoxVal(txtCompanyPhone3);
        job3.EmployedFrom = GetTextBoxVal(txtEmplFrom3);
        job3.EmployedTo = GetTextBoxVal(txtEmplTo3);
        job3.ReasonForLeaving = GetTextBoxVal(txtReason3);
        job3.JobDescription = GetTextBoxVal(txtDescription3);
        job3.JobTitle = GetTextBoxVal(txtTitle3);
        job3.ContactAllowed = GetCheckBoxVal(chkListCompanyContact3);

            app.History.Add(job3);
            //send it off
            app.Submit();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message + ex.StackTrace + ex.TargetSite.ToString());
        }
    
    }

    private string GetTextBoxVal(TextBox txt)
    {
        if (txt.Text == null || txt.Text == "")
            return "NA";
        else
            return txt.Text;
    }

    private string GetCheckBoxVal(CheckBoxList chk)
    {
        if (chk.SelectedValue == null || chk.SelectedValue == "")
            return "NA";
        else
            return chk.SelectedValue;
    }

    private void SetHoursAvailable(ref Application currApp)
    {
        currApp.Hours = new List<string>();
        if (chk62Sun.Checked) currApp.Hours.Add("Sunday 6am- 2pm");
        if (chk210Sun.Checked) currApp.Hours.Add("Sunday 2pm- 10pm");
        if (chk108Sun.Checked) currApp.Hours.Add("Sunday 10pm- 8am");

        if (chk62Mon.Checked) currApp.Hours.Add("Monday 6am- 9am");
        if (chk210Mon.Checked) currApp.Hours.Add("Monday 2pm- 10pm");
        if (chk108Mon.Checked) currApp.Hours.Add("Monday 10pm- 8am");

        if (chk62Tues.Checked) currApp.Hours.Add("Tuesday 6am- 9am");
        if (chk210Tues.Checked) currApp.Hours.Add("Tuesday 2pm- 10pm");
        if (chk108Tues.Checked) currApp.Hours.Add("Tuesday 10pm- 8am");

        if (chk62Wed.Checked) currApp.Hours.Add("Wednesday 6am- 9amm");
        if (chk210Wed.Checked) currApp.Hours.Add("Wednesday 2pm- 10pm");
        if (chk108Wed.Checked) currApp.Hours.Add("Wednesday 10pm- 8am");

        if (chk62Thurs.Checked) currApp.Hours.Add("Thursday 6am- 9am");
        if (chk210Thurs.Checked) currApp.Hours.Add("Thursday 2pm- 10pm");
        if (chk108Thurs.Checked) currApp.Hours.Add("Thursday 10pm- 8am");

        if (chk62Fri.Checked) currApp.Hours.Add("Friday 6am- 9am");
        if (chk210Fri.Checked) currApp.Hours.Add("Friday 2pm- 10pm");
        if (chk108Fri.Checked) currApp.Hours.Add("Friday 10pm- 8am");

        if (chk62Sat.Checked) currApp.Hours.Add("Saturday 6am- 2pm");
        if (chk210Sat.Checked) currApp.Hours.Add("Saturday 2pm- 10pm");
        if (chk108Sat.Checked) currApp.Hours.Add("Saturday 10pm- 8am");

    }

    private string GetDetails(string heardFrom)
    {
        string ret = "";
        switch (heardFrom)
        {
            case "Referrel":
                ret = GetTextBoxVal(txtReferrel);
                break;
            case "Classifieds":
                ret =  GetTextBoxVal(txtClassifieds);
                break;
            case "Job Fair":
                ret=  GetTextBoxVal(txtFair);
                break;
            default:
                ret = GetTextBoxVal(txtOther);
                break;
        }

        if (ret == null) ret = "NA";
        return ret;
    }


}


public class Application
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string ApplicantEmail { get; set; }
    public Address ApplicantAddress { get; set; }
    public string HeardAbout { get; set; }
    public string HeardDetails { get; set; }
    public string Position { get; set; }
    public string HourType { get; set; }
    public List<string> Hours { get; set; }
    public School HighSchool { get; set; }
    public School College { get; set; }
    public School TradeSchool { get; set; }
    public string AreaOfStudy { get; set; }
    public string AdditionalTraining { get; set; }
    public string LegalRight { get; set; }
    public string ProofRequired { get; set; }
    public string ValidLicense { get; set; }
    public string LegalAge { get; set; }
    public string AppliedBefore { get; set; }
    public string WorkedBefore { get; set; }
    public string AppliedWhen { get; set; }
    //public string OldPosition { get; set; }
    public string WorkedWhen { get; set; }
    public string WorkedSite { get; set; }
    public string OtherRelevantExperience { get; set; }
    public string EmailFrom { get; set; }
    public string EmailTo { get; set; }
    public List<WorkHistory> History { get; set; }

    public Application(string pEmailFrom, string pEmailTo)
    {
        this.EmailFrom = pEmailFrom;
        this.EmailTo = pEmailTo;
        this.ApplicantAddress = new Address();
        this.Hours = new List<string>();
        this.HighSchool = new School();
        this.College = new School();
        this.TradeSchool = new School();
        this.History = new List<WorkHistory>();
    }

    private void Insert()
    {
        MySqlConnection conn = null;


        string commandStr = @"INSERT INTO mysql5_912296_ner._employment_application_submissions " +
            "(first_name, last_name, address, city, state, zip, heard_about, heard_details, position, hour_type, hours, highschool_name, " +
            " highschool_location, highschool_years, college_name, college_location, email, college_years, trade_name, " +
        "trade_location, trade_years, area_of_study, additional_training, legal_right, proof_required, valid_license, legal_age, applied_before," +
        "worked_when, worked_site, other_relevant_experience, email_from, email_to, history1_name, history1_add, history1_city, history1_state, " +
        "history1_phone, history1_employed_from, history1_employed_to, history1_contact_allowed, history1_reason_for_leaving, history1_job_title, " +
        "history1_job_description,history2_name, history2_add, history2_city, history2_state, " +
        "history2_phone, history2_employed_from, history2_employed_to, history2_contact_allowed, history2_reason_for_leaving, history2_job_title, " +
        "history2_job_description,history3_name, history3_add, history3_city, history3_state, " +
        " history3_phone, history3_employed_from, history3_employed_to, history3_contact_allowed, history3_reason_for_leaving, history3_job_title, " +
        "history3_job_description,worked_before, applied_when, dt) " +
            "VALUES (?first_name, ?last_name, ?address, ?city, ?state, ?zip, ?heard_about, ?heard_details, ?position, ?hour_type, ?hours, ?highschool_name, " +
            " ?highschool_location, ?highschool_years, ?college_name, ?college_location, ?email, ?college_years, ?trade_name, " +
        "?trade_location, ?trade_years, ?area_of_study, ?additional_training, ?legal_right, ?proof_required, ?valid_license, ?legal_age, ?applied_before," +
        "?worked_when, ?worked_site, ?other_relevant_experience, ?email_from, ?email_to, ?history1_name, ?history1_add, ?history1_city, ?history1_state, " +
        "?history1_phone, ?history1_employed_from, ?history1_employed_to, ?history1_contact_allowed, ?history1_reason_for_leaving, ?history1_job_title, " +
        "?history1_job_description,?history2_name, ?history2_add, ?history2_city, ?history2_state, " +
        "?history2_phone, ?history2_employed_from, ?history2_employed_to, ?history2_contact_allowed, ?history2_reason_for_leaving, ?history2_job_title, " +
        "?history2_job_description,?history3_name, ?history3_add, ?history3_city, ?history3_state, " +
        "?history3_phone, ?history3_employed_from, ?history3_employed_to, ?history3_contact_allowed, ?history3_reason_for_leaving, ?history3_job_title, " +
        "?history3_job_description,?worked_before,?applied_when,NOW());";

        string hours = "";
        for (var i = 0; i < this.Hours.Count; i++)
        {
            hours += this.Hours[i];
            if (i < this.Hours.Count - 1)
            {
                hours += ",";
            }
        }

        if (hours == "") hours = "NA";

        MySqlCommand cmd = new MySqlCommand();
        try
        {

            string connectionString = @"Server=mysql502.discountasp.net;Database=MYSQL5_912296_ner;Uid=nerincorg00;Pwd=neradmin1;";
            conn = new MySqlConnection(connectionString);

         
            cmd.Connection = conn;
            cmd.CommandText = commandStr;

            cmd.Parameters.AddWithValue("?worked_site", this.WorkedSite);
            cmd.Parameters.AddWithValue("?other_relevant_experience", this.OtherRelevantExperience);
            cmd.Parameters.AddWithValue("?email_from", this.EmailFrom);
            cmd.Parameters.AddWithValue("?email_to", this.EmailTo);
            cmd.Parameters.AddWithValue("?first_name", this.FirstName);
            cmd.Parameters.AddWithValue("?last_name", this.LastName);
            cmd.Parameters.AddWithValue("?address", this.ApplicantAddress.StrAddress);
            cmd.Parameters.AddWithValue("?city", this.ApplicantAddress.City);
            cmd.Parameters.AddWithValue("?state", this.ApplicantAddress.State);
            cmd.Parameters.AddWithValue("?zip", this.ApplicantAddress.Zip);
            cmd.Parameters.AddWithValue("?heard_about", this.HeardAbout);
            cmd.Parameters.AddWithValue("?heard_details", this.HeardDetails);
            cmd.Parameters.AddWithValue("?position", this.Position);
            cmd.Parameters.AddWithValue("?hour_type", this.HourType);
            cmd.Parameters.AddWithValue("?hours", hours);
            cmd.Parameters.AddWithValue("?highschool_name", this.HighSchool.Name);
            cmd.Parameters.AddWithValue("?highschool_location", this.HighSchool.Location);
            cmd.Parameters.AddWithValue("?highschool_years", this.HighSchool.Years);
            cmd.Parameters.AddWithValue("?college_name", this.College.Name);
            cmd.Parameters.AddWithValue("?college_location", this.College.Location);
            cmd.Parameters.AddWithValue("?email", this.ApplicantEmail);
            cmd.Parameters.AddWithValue("?college_years", this.College.Years);
            cmd.Parameters.AddWithValue("?trade_name", this.TradeSchool.Name);
            cmd.Parameters.AddWithValue("?trade_location", this.TradeSchool.Location);
            cmd.Parameters.AddWithValue("?trade_years", this.TradeSchool.Years);
            cmd.Parameters.AddWithValue("?area_of_study", this.AreaOfStudy);
            cmd.Parameters.AddWithValue("?additional_training", this.AdditionalTraining);
            cmd.Parameters.AddWithValue("?legal_right", this.LegalRight);
            cmd.Parameters.AddWithValue("?proof_required", this.ProofRequired);
            cmd.Parameters.AddWithValue("?valid_license", this.ValidLicense);
            cmd.Parameters.AddWithValue("?legal_age", this.LegalAge);
            cmd.Parameters.AddWithValue("?applied_before", this.AppliedBefore);
            cmd.Parameters.AddWithValue("?worked_when", this.WorkedWhen);

            cmd.Parameters.AddWithValue("?worked_before", this.WorkedBefore);
            cmd.Parameters.AddWithValue("?applied_when", this.AppliedWhen);
           // cmd.Parameters.AddWithValue("?old_position", this.OldPosition);

            cmd.Parameters.AddWithValue("?history1_name", this.History[0].CompanyAddress.Name);
            cmd.Parameters.AddWithValue("?history1_add", this.History[0].CompanyAddress.StrAddress);
            cmd.Parameters.AddWithValue("?history1_city", this.History[0].CompanyAddress.City);
            cmd.Parameters.AddWithValue("?history1_state", this.History[0].CompanyAddress.State);
            cmd.Parameters.AddWithValue("?history1_phone", this.History[0].CompanyAddress.Phone);
            cmd.Parameters.AddWithValue("?history1_employed_from", this.History[0].EmployedFrom);
            cmd.Parameters.AddWithValue("?history1_employed_to", this.History[0].EmployedTo);
            cmd.Parameters.AddWithValue("?history1_contact_allowed", this.History[0].ContactAllowed);
            cmd.Parameters.AddWithValue("?history1_reason_for_leaving", this.History[0].ReasonForLeaving);
            cmd.Parameters.AddWithValue("?history1_job_title", this.History[0].JobTitle);
            cmd.Parameters.AddWithValue("?history1_job_description", this.History[0].JobDescription);

            cmd.Parameters.AddWithValue("?history2_name", this.History[1].CompanyAddress.Name);
            cmd.Parameters.AddWithValue("?history2_add", this.History[1].CompanyAddress.StrAddress);
            cmd.Parameters.AddWithValue("?history2_city", this.History[1].CompanyAddress.City);
            cmd.Parameters.AddWithValue("?history2_state", this.History[1].CompanyAddress.State);
            cmd.Parameters.AddWithValue("?history2_phone", this.History[1].CompanyAddress.Phone);
            cmd.Parameters.AddWithValue("?history2_employed_from", this.History[1].EmployedFrom);
            cmd.Parameters.AddWithValue("?history2_employed_to", this.History[1].EmployedTo);
            cmd.Parameters.AddWithValue("?history2_contact_allowed", this.History[1].ContactAllowed);
            cmd.Parameters.AddWithValue("?history2_reason_for_leaving", this.History[1].ReasonForLeaving);
            cmd.Parameters.AddWithValue("?history2_job_title", this.History[1].JobTitle);
            cmd.Parameters.AddWithValue("?history2_job_description", this.History[1].JobDescription);

            cmd.Parameters.AddWithValue("?history3_name", this.History[2].CompanyAddress.Name);
            cmd.Parameters.AddWithValue("?history3_add", this.History[2].CompanyAddress.StrAddress);
            cmd.Parameters.AddWithValue("?history3_city", this.History[2].CompanyAddress.City);
            cmd.Parameters.AddWithValue("?history3_state", this.History[2].CompanyAddress.State);
            cmd.Parameters.AddWithValue("?history3_phone", this.History[2].CompanyAddress.Phone);
            cmd.Parameters.AddWithValue("?history3_employed_from", this.History[2].EmployedFrom);
            cmd.Parameters.AddWithValue("?history3_employed_to", this.History[2].EmployedTo);
            cmd.Parameters.AddWithValue("?history3_contact_allowed", this.History[2].ContactAllowed);
            cmd.Parameters.AddWithValue("?history3_reason_for_leaving", this.History[2].ReasonForLeaving);
            cmd.Parameters.AddWithValue("?history3_job_title", this.History[2].JobTitle);
            cmd.Parameters.AddWithValue("?history3_job_description", this.History[2].JobDescription);

            conn.Open();
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            string data = "";
            foreach (MySqlParameter par in cmd.Parameters)
            {
                data += par.ParameterName + ": " + par.Value + " |";
            }
            data += " CMD " + cmd.CommandText;
            data += " paramater count = " + cmd.Parameters.Count;

            throw new Exception("Application.Insert " + ex.Message + "Data: " + data);
        }
        finally
        {
            conn.Close();
        }
    }

    private void Email()
    {
        try
        {
            String strBody = "";

            strBody += "<table>";
            strBody += "<tr><td colspan='2'>Personal Information</td></tr>";
            strBody += String.Format("<tr><td>First Name:</td><td>{0}</td></tr>", this.FirstName);
            strBody += String.Format("<tr><td>Last Name:</td><td>{0}</td></tr>", this.LastName);
            strBody += String.Format("<tr><td>Street Address:</td><td>{0}</td></tr>", this.ApplicantAddress.StrAddress);
            strBody += String.Format("<tr><td>City:</td><td>{0}</td></tr>", this.ApplicantAddress.City);
            strBody += String.Format("<tr><td>State:</td><td>{0}</td></tr>", this.ApplicantAddress.City);
            strBody += String.Format("<tr><td>Zip:</td><td>{0}</td></tr>", this.ApplicantAddress.Zip);
            strBody += String.Format("<tr><td>Phone:</td><td>{0}</td></tr>", this.ApplicantAddress.Phone);
            strBody += String.Format("<tr><td>Email:</td><td>{0}</td></tr>", this.ApplicantEmail);
            strBody += String.Format("<tr><td>How did you find out about NER?</td><td>{0}</td></tr>", this.HeardAbout);
            strBody += String.Format("<tr><td>More information: </td><td>{0}</td></tr>", this.HeardDetails);
            strBody += String.Format("<tr><td>Position applied for:</td><td>{0}</td></tr>", this.Position);
            strBody += String.Format("<tr><td>Interested in:</td><td>{0}</td></tr>", this.HourType);
            strBody += String.Format("<tr><td>Shifts available to work:</td><td>{0}</td></tr>", ListToString(this.Hours));
            strBody += "<tr><td colspan='2'>Education/td></tr>";
            strBody += String.Format("<tr><td>High School:</td><td>{0}</td></tr>", this.HighSchool.Name);
            strBody += String.Format("<tr><td>Location:</td><td>{0}</td></tr>", this.HighSchool.Location);
            strBody += String.Format("<tr><td>Years Attended</td><td>{0}</td></tr>", this.HighSchool.Years);
            strBody += String.Format("<tr><td>College:</td><td>{0}</td></tr>", this.College.Name);
            strBody += String.Format("<tr><td>Location:</td><td>{0}</td></tr>", this.College.Location);
            strBody += String.Format("<tr><td>Years attended:</td><td>{0}</td></tr>", this.College.Years);
            strBody += String.Format("<tr><td>Trade School:</td><td>{0}</td></tr>", this.TradeSchool.Name);
            strBody += String.Format("<tr><td>Location:</td><td>{0}</td></tr>", this.TradeSchool.Location);
            strBody += String.Format("<tr><td>Years attended:</td><td>{0}</td></tr>", this.TradeSchool.Years);
            strBody += String.Format("<tr><td>Major Area of Study:</td><td>{0}</td></tr>", this.AreaOfStudy);
            strBody += String.Format("<tr><td>Additional Training:</td><td>{0}</td></tr>", this.AdditionalTraining);
            strBody += String.Format("<tr><td>Legal right to be employed in US?</td><td>{0}</td></tr>", this.LegalRight);
            strBody += String.Format("<tr><td>Proof required?</td><td>{0}</td></tr>", this.LegalRight);
            strBody += String.Format("<tr><td>Valid drivers license?</td><td>{0}</td></tr>", this.ValidLicense);
            strBody += String.Format("<tr><td>Of legal age to work?</td><td>{0}</td></tr>", this.LegalAge);
            strBody += String.Format("<tr><td>Applied before?</td><td>{0}</td></tr>", this.AppliedBefore);
            if (this.AppliedBefore.ToLower().Contains("yes")) strBody += String.Format("<tr><td>When?</td><td>{0}</td></tr>", this.AppliedWhen);
            strBody += String.Format("<tr><td>Worked for NER before?</td><td>{0}</td></tr>", this.WorkedBefore);
            if (this.WorkedBefore.ToLower().Contains("yes"))
            {
                strBody += String.Format("<tr><td>When?</td><td>{0}</td></tr>", this.WorkedWhen);
                strBody += String.Format("<tr><td>Which site?</td><td>{0}</td></tr>", this.WorkedSite);
            }
            strBody += "<tr><td colspan='2'>Work History</td></tr>";
            if (this.History.Count < 1)
            {
                strBody += "<tr><td colspan='2'>None Given</td></tr>";
            }
            else
            {
                WorkHistory job1 = this.History[0];
                strBody += String.Format("<tr><td>Company Name:</td><td>{0}</td></tr>", job1.CompanyAddress.Name);
                strBody += String.Format("<tr><td>Company Telephone:</td><td>{0}</td></tr>", job1.CompanyAddress.Phone);
                strBody += String.Format("<tr><td>Address: </td><td>{0}</td></tr>", job1.CompanyAddress.StrAddress);
                strBody += String.Format("<tr><td>City:</td><td>{0}</td></tr>", job1.CompanyAddress.City);
                strBody += String.Format("<tr><td>State: </td><td>{0}</td></tr>", job1.CompanyAddress.State);
                strBody += String.Format("<tr><td>Employed From: </td><td>{0}</td></tr>", job1.EmployedFrom);
                strBody += String.Format("<tr><td>Employed To: </td><td>{0}</td></tr>", job1.EmployedTo);
                strBody += String.Format("<tr><td>Permission to contact: </td><td>{0}</td></tr>", job1.ContactAllowed);
                strBody += String.Format("<tr><td>Reason For leaving: </td><td>{0}</td></tr>", job1.ReasonForLeaving);
                strBody += String.Format("<tr><td>Job title: </td><td>{0}</td></tr>", job1.JobTitle);
                strBody += String.Format("<tr><td>Description of Duties: </td><td>{0}</td></tr>", job1.JobDescription);

                if (this.History.Count > 1)
                {
                    WorkHistory job2 = this.History[1];
                    strBody += String.Format("<tr><td>Company Name:</td><td>{0}</td></tr>", job2.CompanyAddress.Name);
                    strBody += String.Format("<tr><td>Company Telephone:</td><td>{0}</td></tr>", job2.CompanyAddress.Phone);
                    strBody += String.Format("<tr><td>Address: </td><td>{0}</td></tr>", job2.CompanyAddress.StrAddress);
                    strBody += String.Format("<tr><td>City:</td><td>{0}</td></tr>", job2.CompanyAddress.City);
                    strBody += String.Format("<tr><td>State: </td><td>{0}</td></tr>", job2.CompanyAddress.State);
                    strBody += String.Format("<tr><td>Employed From: </td><td>{0}</td></tr>", job2.EmployedFrom);
                    strBody += String.Format("<tr><td>Employed To: </td><td>{0}</td></tr>", job2.EmployedTo);
                    strBody += String.Format("<tr><td>Permission to contact: </td><td>{0}</td></tr>", job2.ContactAllowed);
                    strBody += String.Format("<tr><td>Reason For leaving: </td><td>{0}</td></tr>", job2.ReasonForLeaving);
                    strBody += String.Format("<tr><td>Job title: </td><td>{0}</td></tr>", job2.JobTitle);
                    strBody += String.Format("<tr><td>Description of Duties: </td><td>{0}</td></tr>", job2.JobDescription);

                    if (this.History.Count > 2)
                    {
                        WorkHistory job3 = this.History[2];
                        strBody += String.Format("<tr><td>Company Name:</td><td>{0}</td></tr>", job3.CompanyAddress.Name);
                        strBody += String.Format("<tr><td>Company Telephone:</td><td>{0}</td></tr>", job3.CompanyAddress.Phone);
                        strBody += String.Format("<tr><td>Address: </td><td>{0}</td></tr>", job3.CompanyAddress.StrAddress);
                        strBody += String.Format("<tr><td>City:</td><td>{0}</td></tr>", job3.CompanyAddress.City);
                        strBody += String.Format("<tr><td>State: </td><td>{0}</td></tr>", job3.CompanyAddress.State);
                        strBody += String.Format("<tr><td>Employed From: </td><td>{0}</td></tr>", job3.EmployedFrom);
                        strBody += String.Format("<tr><td>Employed To: </td><td>{0}</td></tr>", job3.EmployedTo);
                        strBody += String.Format("<tr><td>Permission to contact: </td><td>{0}</td></tr>", job3.ContactAllowed);
                        strBody += String.Format("<tr><td>Reason For leaving: </td><td>{0}</td></tr>", job3.ReasonForLeaving);
                        strBody += String.Format("<tr><td>Job title: </td><td>{0}</td></tr>", job3.JobTitle);
                        strBody += String.Format("<tr><td>Description of Duties: </td><td>{0}</td></tr>", job3.JobDescription);
                    }
                }
            }

            strBody += "</table>";

            //Notification email
            umbraco.library.SendMail(EmailFrom, EmailTo, "Website Employment Application Submission", strBody, true);
        }
        catch (Exception ex)
        {
            throw new Exception("Application.Email" + ex.Message + ex.StackTrace);
        }
        //Responder email
        //umbraco.library.SendMail(AutoResponseEmailFrom, txtEmail.Text, AutoResponseEmailSubject, AutoResponseEmailBody, true);
    }

    public void Submit()
    {
        try
        {
            Insert();
            Email();
        }
        catch (Exception ex)
        {
            throw new Exception("Submit" + ex.Message + ex.StackTrace);
        }
    }

    private static string ListToString(List<string> inList)
    {
        string ret = "";
        for (var i = 0; i < inList.Count; i++)
        {
            ret += inList.ElementAt(i);
            if(i < inList.Count - 1){
                ret += ",";
            }
        }

        return ret;
    }

    private static string GetYesNo(bool input)
    {
        return input ? "Yes" : "No";
    }

   
}

public class Address
{
    public string Name { get; set; }
    public string StrAddress { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public string Phone { get; set; }
}

public class WorkHistory
{
    public Address CompanyAddress { get; set; }
    public string EmployedFrom { get; set; }
    public string EmployedTo { get; set; }
    public string ContactAllowed { get; set; }
    public string ReasonForLeaving { get; set; }
    public string JobTitle { get; set; }
    public string JobDescription { get; set; }
}

public class School
{
    public string Name { get; set; }
    public string Location { get; set; }
    public string Years { get; set; }
}

public class Reference
{
    public string Name { get; set; }
    public string Phone { get; set; }
    public string YearsKnown { get; set; }
}