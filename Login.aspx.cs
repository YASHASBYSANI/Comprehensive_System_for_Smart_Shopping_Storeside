using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["LoginStoreId"] != null)
        {
            Response.Redirect("Home.aspx");
        }
        else
        {
            if (Request.Cookies["SamyAutoLoginCookies"] != null)
            {
                string storeId = Request.Cookies["SamyAutoLoginCookies"]["StoreId"];
                string token = Request.Cookies["SamyAutoLoginCookies"]["Token"];
                using (OracleConnection connection = new OracleConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                    connection.Open();
                    string query = "SELECT COUNT(*) ";
                    query += "FROM storedetails t1, storepassmapping t2 ";
                    query += "WHERE t1.store_id = '" + storeId + "' AND t2.store_token = '" + token + "' AND t1.store_id = t2.store_id";
                    OracleCommand command = new OracleCommand(query, connection);
                    int result = int.Parse(command.ExecuteScalar().ToString());
                    if (result == 0)
                    {
                        Label lbl = (Label)Master.FindControl("err_heading");
                        lbl.Text = "Auto Login Error";
                        lbl = (Label)Master.FindControl("err_msg");
                        lbl.Text = "Auto login data is corrupt. Login using credentials.";
                        Panel pnl = (Panel)Master.FindControl("Err_modal");
                        pnl.Style.Remove("display");
                        pnl.Style.Add("display", "block");
                    }
                    else if (result == 1)
                    {
                        query = "SELECT t1.* ";
                        query += "FROM storedetails t1, storepassmapping t2 ";
                        query += "WHERE t1.store_id = '" + storeId + "' ";
                        query += "AND t2.store_token = '" + token + "' ";
                        query += "AND t1.store_id = t2.store_id";
                        command = new OracleCommand(query, connection);
                        OracleDataReader reader = command.ExecuteReader();
                        reader.Read();
                        Session["LoginStoreId"] = reader["store_id"].ToString();
                        Session["LoginStoreName"] = reader["store_name"].ToString();

                        string newToken = createToken();
                        query = "UPDATE storepassmapping ";
                        query += "SET store_token = '" + newToken + "' ";
                        query += "WHERE store_id = '" + storeId + "'";
                        command = new OracleCommand(query, connection);
                        command.ExecuteNonQuery();

                        int maxLogId = getMaxLogId();
                        query = "INSERT INTO log_storelogin (store_id, using_token, token, login_date_time, log_id) ";
                        query += "VALUES ('" + storeId + "', 1, '" + token + "', TO_DATE('" + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "','DD/MON/YYYY HH24:MI:SS'), " + (maxLogId + 1).ToString() + ")";
                        command = new OracleCommand(query, connection);
                        command.ExecuteNonQuery();
                        Response.Redirect("Home.aspx");
                    }
                    connection.Close();
                }
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtLoginStoreId.Text == "" || txtLoginStorePass.Text == "")
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Login Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Store ID or Password field is empty.";
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
                query += "FROM storedetails t1, storepassmapping t2 ";
                query += "WHERE t1.store_id = '" + txtLoginStoreId.Text + "' AND t2.store_pass = '" + txtLoginStorePass.Text + "' AND t1.store_id = t2.store_id";
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if(result == 0)
                {
                    Label lbl = (Label)Master.FindControl("err_heading");
                    lbl.Text = "Login Error";
                    lbl = (Label)Master.FindControl("err_msg");
                    lbl.Text = "Incorrect Store ID and/or Password.";
                    pnl = (Panel)Master.FindControl("Err_modal");
                    pnl.Style.Remove("display");
                    pnl.Style.Add("display", "block");
                    Response.Cookies["SamyAutoLoginCookies"].Expires = DateTime.Now.AddDays(-1);
                }
                else if(result == 1)
                {
                    query = "SELECT t1.* ";
                    query += "FROM storedetails t1, storepassmapping t2 ";
                    query += "WHERE t1.store_id = '" + txtLoginStoreId.Text + "' AND t2.store_pass = '" + txtLoginStorePass.Text + "' AND t1.store_id = t2.store_id";
                    command = new OracleCommand(query, connection);
                    OracleDataReader reader = command.ExecuteReader();
                    reader.Read();
                    Session["LoginStoreId"] = txtLoginStoreId.Text;
                    Session["LoginStoreName"] = reader["store_name"].ToString();
                    if(chkLoginRemember.Checked == true)
                    {
                        //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('hi');", true);
                        string newToken = createToken();
                        query = "UPDATE storepassmapping ";
                        query += "SET store_token = '" + newToken + "' ";
                        query += "WHERE store_id = '" + txtLoginStoreId.Text + "'";
                        command = new OracleCommand(query, connection);
                        command.ExecuteNonQuery();
                        Response.Cookies["SamyAutoLoginCookies"]["StoreId"] = txtLoginStoreId.Text;
                        Response.Cookies["SamyAutoLoginCookies"]["Token"] = newToken;
                        Response.Cookies["SamyAutoLoginCookies"].Expires = DateTime.Now.AddDays(1);
                    }
                    int maxLogId = getMaxLogId();
                    query = "INSERT INTO log_storelogin (store_id, using_token, login_date_time, log_id) ";
                    query += "VALUES ('" + txtLoginStoreId.Text + "', 0, TO_DATE('" + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "','DD/MON/YYYY HH24:MI:SS'), " + (maxLogId+1).ToString() + ")";
                    command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();
                    Response.Redirect("Home.aspx");
                }
                //string str = "ServerVersion: " + connection.ServerVersion + ", DataSource: " + connection.DataSource;
                //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('" + str + "');", true);
                connection.Close();
            }
        }
    }


    protected void iconVerCodeError_ServerClick(object sender, EventArgs e)
    {
        Label lbl = (Label)Master.FindControl("err_heading");
        lbl.Text = "Registration Error";
        lbl = (Label)Master.FindControl("err_msg");
        lbl.Text = "Licence code is invalid. Licence code must be of the form xxxxx-xxxxx-xxxxx-xxxxx-xxxxx";
        Panel pnl = (Panel)Master.FindControl("Err_modal");
        pnl.Style.Remove("display");
        pnl.Style.Add("display", "block");
        //txtRegisterStoreVerCode.Text = "";
        //txtRegisterStoreVerCode.Focus();
    }

    protected void iconZipError_Click(object sender, EventArgs e)
    {
        Label lbl = (Label)Master.FindControl("err_heading");
        lbl.Text = "Registration Error";
        lbl = (Label)Master.FindControl("err_msg");
        lbl.Text = "Zip Code is invalid.";
        Panel pnl = (Panel)Master.FindControl("Err_modal");
        pnl.Style.Remove("display");
        pnl.Style.Add("display", "block");
    }
    
    protected void btnRegister_Click(object sender, EventArgs e)
    {

    }
    private string createToken()
    {
        string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        char[] stringChars = new char[50];
        Random random = new Random();
        string token = "";
        while (true)
        {
            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }
            token = new String(stringChars);
            using (OracleConnection connection = new OracleConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                connection.Open();
                string query = "SELECT COUNT(*) ";
                query += "FROM storepassmapping ";
                query += "WHERE store_token = '" + token + "'";
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if (result == 0)
                {
                    return token;
                }
                connection.Close();
            }
        }
    }
    private int getMaxLogId()
    {
        using (OracleConnection connection = new OracleConnection())
        {
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
            connection.Open();
            string query = "SELECT NVL(MAX(log_id),0) ";
            query += "FROM log_storelogin";
            OracleCommand command = new OracleCommand(query, connection);
            int maxRecordId = int.Parse(command.ExecuteScalar().ToString());
            connection.Close();
            return maxRecordId;
        }
    }
    //protected void chkRegAgreement_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (chkRegAgreement.Checked)
    //        btnRegister.Visible = true;
    //    else
    //        btnRegister.Visible = false;
    //}
}