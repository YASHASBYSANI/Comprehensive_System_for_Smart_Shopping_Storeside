using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class ManagerConsole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LoginStoreId"] == null)
                Response.Redirect("Login.aspx");
            else if (Session["LoginStoreManager"] == null)
                Response.Redirect("ManagerLogin.aspx");
            else
            {
                using (OracleConnection connection = new OracleConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                    connection.Open();
                    string query = "SELECT t1.store_id, t1.store_name, (t1.location_city || ', ' || t1.location_state || ', ' || t1.location_zip) AS store_location, t1.licence_code, t2.manager_name, t2.manager_phone, t2.manager_email ";
                    query += "FROM storedetails t1, storemanagerdetails t2 ";
                    query += "WHERE t1.store_id = '" + Session["LoginStoreId"] + "' AND t2.store_id = t1.store_id";
                    OracleCommand command = new OracleCommand(query, connection);
                    OracleDataReader reader = command.ExecuteReader();
                    while(reader.Read())
                    {
                        txtStoreDetailsStoreId.Text = reader["STORE_ID"].ToString();
                        txtStoreDetailsStoreName.Text = reader["STORE_NAME"].ToString();
                        txtStoreDetailsStoreLocation.Text = reader["STORE_LOCATION"].ToString();
                        txtStoreDetailsStoreLicence.Text = reader["LICENCE_CODE"].ToString();

                        txtStoreDetailsStoreManagerName.Text = reader["MANAGER_NAME"].ToString();
                        txtStoreDetailsStoreManagerPhone.Text = reader["MANAGER_PHONE"].ToString();
                        txtStoreDetailsStoreManagerEmail.Text = reader["MANAGER_EMAIL"].ToString();
                    }
                }
            }
        }
        else
        {

        }
    }

    protected void btnManagerLogout_Click(object sender, EventArgs e)
    {
        Session["LoginStoreManager"] = null;
        Response.Redirect("Home.aspx");
    }

    protected void btnSaveStoreDetails_Click(object sender, EventArgs e)
    {
        if (txtStoreDetailsStoreName.Text == "")
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Store Details Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Store Name cannot be left empty.";
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
                string query = "UPDATE storedetails ";
                query += "SET store_name = '" + txtStoreDetailsStoreName.Text + "' ";
                query += "WHERE store_id = '" + Session["LoginStoreId"] + "'";
                OracleCommand command = new OracleCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
            }

            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('Store details changed successfully.');", true);
        }
    }

    protected void btnSaveStoreManagerDetails_Click(object sender, EventArgs e)
    {
        if (txtStoreDetailsStoreManagerName.Text == "" || txtStoreDetailsStoreManagerPhone.Text == "" || txtStoreDetailsStoreManagerEmail.Text == "")
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Manager Details Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Fields cannot be left empty.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else
        {
            Regex phone = new Regex(@"^\d{10}$");
            Regex email = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            if (!phone.IsMatch(txtStoreDetailsStoreManagerPhone.Text))
            {
                Label lbl = (Label)Master.FindControl("err_heading");
                lbl.Text = "Manager Details Error";
                lbl = (Label)Master.FindControl("err_msg");
                lbl.Text = "Manager phone is invalid.";
                Panel pnl = (Panel)Master.FindControl("Err_modal");
                pnl.Style.Remove("display");
                pnl.Style.Add("display", "block");
            }
            else if(!email.IsMatch(txtStoreDetailsStoreManagerEmail.Text))
            {
                Label lbl = (Label)Master.FindControl("err_heading");
                lbl.Text = "Manager Details Error";
                lbl = (Label)Master.FindControl("err_msg");
                lbl.Text = "Manager email is invalid.";
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
                    string query = "UPDATE storemanagerdetails ";
                    query += "SET manager_name = '" + txtStoreDetailsStoreManagerName.Text + "', manager_phone = " + txtStoreDetailsStoreManagerPhone.Text + ", manager_email = '" + txtStoreDetailsStoreManagerEmail.Text + "' ";
                    query += "WHERE store_id = '" + Session["LoginStoreId"] + "'";
                    OracleCommand command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('Store manager details changed successfully.');", true);
            }
        }
    }

    //protected void storePassTxtChanged(object sender, EventArgs e)
    //{
    //    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('" + sender + "');", true);
    //    if (txtStoreLoginCurrPass.Text == "" || txtStoreLoginNewPass1.Text == "" || txtStoreLoginNewPass2.Text == "")
    //        btnChangeStorePass.Visible = false;
    //    else
    //        btnChangeStorePass.Visible = true;
    //}

    protected void btnChangeStorePass_Click(object sender, EventArgs e)
    {
        if (txtStoreLoginCurrPass.Text == "" || txtStoreLoginNewPass1.Text == "" || txtStoreLoginNewPass2.Text == "")
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Store Password Change Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Feilds cannot be left empty.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else if(txtStoreLoginNewPass1.Text != txtStoreLoginNewPass2.Text)
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Store Password Change Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "New passwords do not match.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else
        {
            using (OracleConnection connection = new OracleConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                connection.Open();
                string query = "SELECT COUNT(*) ";
                query += "FROM storepassmapping ";
                query += "WHERE store_id = '" + Session["LoginStoreId"] + "' AND store_pass = '" + txtStoreLoginCurrPass.Text + "'";
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if(result == 0)
                {
                    Label lbl = (Label)Master.FindControl("err_heading");
                    lbl.Text = "Store Password Change Error";
                    lbl = (Label)Master.FindControl("err_msg");
                    lbl.Text = "Current Store Password is incorrect.";
                    Panel pnl = (Panel)Master.FindControl("Err_modal");
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "block");
                }
                else
                {
                    Panel pnl = (Panel)Master.FindControl("Err_modal");
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "none");

                    query = "UPDATE storepassmapping ";
                    query += "SET store_pass = '" + txtStoreLoginNewPass1.Text + "' ";
                    query += "WHERE store_id = '" + Session["LoginStoreId"] + "'";
                    command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();

                    txtStoreLoginCurrPass.Text = "";
                    txtStoreLoginNewPass1.Text = "";
                    txtStoreLoginNewPass2.Text = "";

                    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('Store password changed successfully.');", true);
                }
                connection.Close();
            }
        }
    }

    protected void btnChangeManagerPass_Click(object sender, EventArgs e)
    {
        if (txtManagerCurrPass.Text == "" || txtManagerNewPass1.Text == "" || txtManagerNewPass2.Text == "")
        {

            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Manager Password Change Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Feilds cannot be left empty.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else if (txtManagerNewPass1.Text != txtManagerNewPass2.Text)
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Manager Password Change Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "New passwords do not match.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else
        {
            using (OracleConnection connection = new OracleConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                connection.Open();
                string query = "SELECT COUNT(*) ";
                query += "FROM storepassmapping ";
                query += "WHERE store_id = '" + Session["LoginStoreId"] + "' AND store_managerpass = '" + txtManagerCurrPass.Text + "'";
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if (result == 0)
                {
                    Label lbl = (Label)Master.FindControl("err_heading");
                    lbl.Text = "Manager Password Change Error";
                    lbl = (Label)Master.FindControl("err_msg");
                    lbl.Text = "Current Manager Password is incorrect.";
                    Panel pnl = (Panel)Master.FindControl("Err_modal");
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "block");
                }
                else
                {
                    Panel pnl = (Panel)Master.FindControl("Err_modal");
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "none");

                    query = "UPDATE storepassmapping ";
                    query += "SET store_managerpass = '" + txtManagerNewPass1.Text + "' ";
                    query += "WHERE store_id = '" + Session["LoginStoreId"] + "'";
                    command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();

                    txtManagerCurrPass.Text = "";
                    txtManagerNewPass1.Text = "";
                    txtManagerNewPass2.Text = "";

                    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script1", "alert('Store manager password changed successfully.');", true);
                }
                connection.Close();
            }
        }
    }
}