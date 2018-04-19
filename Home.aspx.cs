using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LoginStoreId"] == null)
                Response.Redirect("Login.aspx");
        }
        else
        {

        }
        using (OracleConnection connection = new OracleConnection())
        {
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
            connection.Open();
            string query = "SELECT t1.store_id, t1.store_name, (t1.location_city || ', ' || t1.location_state || ', ' || t1.location_zip) AS store_location, t2.manager_name, t2.manager_phone, t2.manager_email ";
            query += "FROM storedetails t1, storemanagerdetails t2 ";
            query += "WHERE t1.store_id = '" + Session["LoginStoreId"] + "' AND t2.store_id = t1.store_id";
            OracleCommand command = new OracleCommand(query, connection);
            OracleDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                txtStoreDetailsStoreId.Text = reader["STORE_ID"].ToString();
                txtStoreDetailsStoreName.Text = reader["STORE_NAME"].ToString();
                txtStoreDetailsStoreLocation.Text = reader["STORE_LOCATION"].ToString();

                txtStoreDetailsStoreManagerName.Text = reader["MANAGER_NAME"].ToString();
                txtStoreDetailsStoreManagerPhone.Text = reader["MANAGER_PHONE"].ToString();
                txtStoreDetailsStoreManagerEmail.Text = reader["MANAGER_EMAIL"].ToString();
            }
        }
    }
}