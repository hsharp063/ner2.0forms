using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using umbraco.NodeFactory;
using MySql.Data.MySqlClient;


    public partial class NewsAlertSignup : System.Web.UI.UserControl
    {

        public string ControlURL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadSubmissions();
                //LoadSourcePageDDL();
            }
        }

        private void LoadSubmissions()
        {
            //string connectionString = System.Configuration.ConfigurationManager.AppSettings["umbracoDbDSN"];
           

            //using (SqlConnection clearConnection = new SqlConnection(connectionString))
            //{
            //    try
            //    {
            //        clearConnection.Open();
            //        DateTime dt = DateTime.Now;
            //        SqlCommand sql;

            //        sql = new SqlCommand("SELECT * FROM _newalertssignup", clearConnection);
            //        sql.CommandType = CommandType.StoredProcedure;

            //        table.Load(sql.ExecuteReader());
            //    }
            //    catch (Exception ex)
            //    {
            //        lblErr.Text = ex.ToString();
            //    }
            //    finally
            //    {
            //        clearConnection.Close();
            //    }
            //}
            
            DataTable table = new DataTable();
            MySqlConnection conn = null;
            string commandStr = @"SELECT * FROM mysql5_912296_ner._InterestSubmissions";
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
                lblErr.Text = ex.Message + ex.Source + ex.TargetSite + ex.StackTrace.ToString();
            }
            finally
            {
                conn.Close();
            }


            this.gvSubmissions.DataSource = table;
            this.gvSubmissions.DataBind();

            btnExport.Dataview = table.DefaultView;
            //btnExport.FileNameToExport = "LeadFormSubmissions-" + ddlSourcePage.SelectedItem.Text.Replace(" ", "_") + ".csv";
            btnExport.FileNameToExport = "LeadFormSubmissions-" + String.Format("{0:MMddyyyy}", DateTime.Now) + ".csv";
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
