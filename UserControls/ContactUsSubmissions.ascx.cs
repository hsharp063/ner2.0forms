using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class ContactUsSubmissions : System.Web.UI.UserControl
{
    string errEmail = ConfigurationManager.AppSettings["errEmail"];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadSubmissions();
        }
    }

    private void LoadSubmissions()
    {
        DataTable table = new DataTable();
        MySqlConnection conn = null;
        string commandStr = @"SELECT * FROM mysql5_912296_ner._contact_us_submissions";
        try
        {

            string connectionString = @"Server=mysql502.discountasp.net;Database=MYSQL5_912296_ner;Uid=nerincorg00;Pwd=neradmin1;";
            conn = new MySqlConnection(connectionString);


            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandStr;

            conn.Open();
            table.Load(cmd.ExecuteReader());
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message + ex.StackTrace;
            string data = "Info: " + ex.Message + ex.StackTrace;
            umbraco.library.SendMail("err@nerinc.org", errEmail, "NER - Error with contact us console", data, true);
        }
        finally
        {
            conn.Close();
        }


        this.gvSubmissions.DataSource = table;
        this.gvSubmissions.DataBind();

        btnExport.Dataview = table.DefaultView;
        btnExport.FileNameToExport = "ContactUsSubmissions-" + String.Format("{0:MMddyyyy}", DateTime.Now) + ".csv";
        btnExport.ExportType = PNayak.Web.UI.WebControls.ExportButton.ExportTypeEnum.CSV;
        btnExport.Separator = PNayak.Web.UI.WebControls.ExportButton.SeparatorTypeEnum.Comma;
    }



    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        LoadSubmissions();
        gvSubmissions.PageIndex = e.NewPageIndex;
        gvSubmissions.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            LoadSubmissions();
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.ToString();
        }
    }
}