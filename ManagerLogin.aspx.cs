using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagerLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LoginStoreId"] == null)
                Response.Redirect("Login.aspx");
            if (Session["LoginStoreManager"] != null)
                Response.Redirect("ManagerConsole.aspx");
        }
        else
        {

        }
    }

    protected void btnManagerLogin_Click(object sender, EventArgs e)
    {
        if (txtManagerLoginPass.Text == "" || txtManagerLoginStoreId.Text == "")
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Manager Login Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Feilds cannot be left empty.";
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
                string query = "SELECT COUNT(*) ";
                query += "FROM storepassmapping ";
                query += "WHERE store_id = '" + txtManagerLoginStoreId.Text + "' AND store_managerpass = '" + txtManagerLoginPass.Text + "'";
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if (result == 0)
                {
                    Label lbl = (Label)Master.FindControl("err_heading");
                    lbl.Text = "Manager Login Error";
                    lbl = (Label)Master.FindControl("err_msg");
                    lbl.Text = "Incorrect Store ID and/or Password.";
                    pnl = (Panel)Master.FindControl("Err_modal");
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "block");
                }
                else if (result == 1)
                {
                    Session["LoginStoreManager"] = true;
                    Response.Redirect("ManagerConsole.aspx");
                }
                connection.Close();
            }
        }
    }
}