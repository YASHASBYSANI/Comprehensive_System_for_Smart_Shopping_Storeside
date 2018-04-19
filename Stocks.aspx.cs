using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Stocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LoginStoreId"] == null)
                Response.Redirect("Login.aspx");
            else if (Session["LoginStoreManager"] == null)
                Response.Redirect("ManagerLogin.aspx");
        }
        else
        {

        }
        using (OracleConnection connection = new OracleConnection())
        {
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
            connection.Open();
            string query = "SELECT item_code AS grdStockViewItemCode, item_name AS grdStockViewItemName, item_price AS grdStockViewItemPrice, item_quantity AS grdStockViewItemQuantity, TO_CHAR(datetime_intake, 'DD-MON-YYYY') || ' ' || TO_CHAR(datetime_intake, 'HH24:MI:SS') AS grdStockViewIntakeDateTime ";
            query += "FROM products_" + Session["LoginStoreId"] + " ";
            query += "ORDER BY datetime_intake";
            OracleDataAdapter adapView = new OracleDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapView.Fill(ds, "GridView");
            grdStockView.DataSource = ds.Tables[0];
            grdStockView.DataBind();
            connection.Close();
        }
    }
}