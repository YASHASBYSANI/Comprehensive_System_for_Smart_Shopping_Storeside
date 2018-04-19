using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LoginStoreId"] == null)
                Response.Redirect("Login.aspx");
            else
            {

            }
                //txtCheckinUsername.Focus();
        }
        else
        {
            //txtCheckinUsername.Focus();
        }
        //txtCheckinUsername.Focus();
    }

    //protected void txtCheckinUsername_TextChanged(object sender, EventArgs e)
    //{
    //    using (OracleConnection connection = new OracleConnection())
    //    {
    //        connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
    //        connection.Open();
    //        string query = "SELECT NVL(MAX(record_id),0) ";
    //        query += "FROM checkin_universal";
    //        OracleCommand command = new OracleCommand(query, connection);
    //        int maxRecordId = int.Parse(command.ExecuteScalar().ToString());

    //        query = "INSERT INTO checkin_universal ";
    //        query += "VALUES ('" + txtCheckinUsername.Text.Trim() + "', TO_DATE('" + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "','DD/MON/YYYY HH24:MI:SS'), " + (maxRecordId + 1).ToString() + ", '" + Session["LoginStoreId"] + "')";
    //        command = new OracleCommand(query, connection);
    //        command.ExecuteNonQuery();
    //        connection.Close();
    //    }
    //    txtCheckinUsername.Text = "";
    //    txtCheckinUsername.Focus();
    //}

    protected void btnGetCheckinData_Click(object sender, EventArgs e)
    {
        //string str = "drpStartDate.SelectedIndex = " + drpStartDate.SelectedIndex.ToString() + "          drpEndDate.SelectedIndex = " + drpEndDate.SelectedIndex.ToString() + "           txtStartDateSelecter.Text = " + txtStartDateSelecter.Text + "           txtEndDateSelecter.Text = " + txtEndDateSelecter.Text + "                    " + ((drpStartDate.SelectedIndex == 1 && txtStartDateSelecter.Text == "") || (drpEndDate.SelectedIndex == 1 && txtEndDateSelecter.Text == "")).ToString();
        //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('" + str + "');", true);
        if ((drpStartDate.SelectedIndex == 1 && txtStartDateSelecter.Text == "") || (drpEndDate.SelectedIndex == 1 && txtEndDateSelecter.Text == ""))
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Customer Checkin Data Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Start and End dates should be selected appropriately.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else
        {
            DateTime startDate = DateTime.Now, endDate = DateTime.Now;
            if (drpStartDate.SelectedIndex == 1)
                startDate = Convert.ToDateTime(txtStartDateSelecter.Text);
            else if (drpStartDate.SelectedIndex == 0)
                startDate = Convert.ToDateTime("11-Jan-1996");
            if (drpEndDate.SelectedIndex == 1)
                endDate = Convert.ToDateTime(txtEndDateSelecter.Text);
            else if (drpEndDate.SelectedIndex == 0)
                endDate = DateTime.Now;
            if (startDate > endDate)
            {
                Label lbl = (Label)Master.FindControl("err_heading");
                lbl.Text = "Customer Checkin Data Error";
                lbl = (Label)Master.FindControl("err_msg");
                lbl.Text = "Start date cannot be greater than End date.";
                Panel pnl = (Panel)Master.FindControl("Err_modal");
                pnl.Style.Remove("display");
                pnl.Style.Add("display", "block");
            }
            else
            {
                Panel pnl = (Panel)Master.FindControl("Err_modal");
                pnl.Style.Remove("display");
                pnl.Style.Add("display", "none");

                using (OracleConnection connection = new OracleConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                    connection.Open();
                    string query = "SELECT t1.email_username AS grdCheckinDateViewUsername, TO_CHAR(t1.checkin_datetime, 'DD-MON-YYYY') || ' ' || TO_CHAR(t1.checkin_datetime, 'HH24:MI:SS') AS grdCheckinDateViewCheckinDateTime, t1.record_id AS grdCheckinDateViewCheckinId, t2.name_full AS grdCheckinDateViewCustName, t2.mobile_num AS grdCheckinDateViewCustPhone ";
                    query += "FROM checkin_universal t1, userdetails t2 ";
                    query += "WHERE t1.email_username = t2.email_username ";
                    query+="AND store_id = '" + Session["LoginStoreId"] +  "' ";
                    query += "AND TO_DATE(TO_CHAR(t1.checkin_datetime, 'DD/MM/YYYY'), 'DD/MM/YYYY') >= TO_DATE('" + startDate.ToString("dd-MMM-yyyy") + "', 'DD/MM/YYYY') ";
                    query += "AND TO_DATE(TO_CHAR(t1.checkin_datetime, 'DD/MM/YYYY'), 'DD/MM/YYYY') <= TO_DATE('" + endDate.ToString("dd-MMM-yyyy") + "', 'DD/MM/YYYY') ";
                    query += "ORDER BY t1.checkin_datetime";
                    OracleDataAdapter adapView = new OracleDataAdapter(query, connection);
                    DataSet ds = new DataSet();
                    adapView.Fill(ds, "GridView");
                    grdCheckinDateView.DataSource = ds.Tables[0];
                    grdCheckinDateView.DataBind();
                    pnlView.Visible = true;
                    connection.Close();
                }
                if (grdCheckinDateView.Rows.Count == 0)
                {
                    Label lbl = (Label)Master.FindControl("err_heading");
                    lbl.Text = "Customer Checkin Data Error";
                    lbl = (Label)Master.FindControl("err_msg");
                    lbl.Text = "No check-ins from " + startDate.ToString("dd-MMM-yyyy") + " till " + endDate.ToString("dd-MMM-yyyy") + ".";
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "block");
                    pnlView.Visible = false;
                }
            }

            
            //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('" + startdate.ToString("dd-MMM-yyyy") + "');", true);
        }
    }

    protected void drpStartDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpStartDate.SelectedIndex == 0)
        {
            txtStartDateSelecter.Text = "";
            divStartDateSelecter.Style.Remove("display");
            divStartDateSelecter.Style.Add("display", "none");
        }
        else
        {
            divStartDateSelecter.Style.Remove("display");
            divStartDateSelecter.Style.Add("display", "block");
        }

    }

    protected void drpEndDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpEndDate.SelectedIndex == 0)
        {
            txtEndDateSelecter.Text = "";
            divEndDateSelecter.Style.Remove("display");
            divEndDateSelecter.Style.Add("display", "none");
        }
        else
        {
            divEndDateSelecter.Style.Remove("display");
            divEndDateSelecter.Style.Add("display", "block");
        }
    }
}