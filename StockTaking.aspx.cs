using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Net;
using System.IO;
using Newtonsoft.Json;

public class Product
{
    public string Status;
    public string ProductName;
    //public string BNum;
    //public string DateManufacture;
    public string Weight_Volume;
    public string Weight_VolumeUnit;
    public string Price;
    public string RequestedCode;
    public string RequestedStore;
}
public partial class StockTaking : System.Web.UI.Page
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
        if (txtStockTakingItemCode.Text.Trim() == "")
        {
            txtStockTakingItemCode.Focus();
            txtStockTakingItemName.ReadOnly = true;
            txtStockTakingItemName.Attributes.Add("disabled", "disabled");
            txtStockTakingItemWetWeight.ReadOnly = true;
            txtStockTakingItemWetWeight.Attributes.Add("disabled", "disabled");
            //txtStockTakingItemDateManufacture.ReadOnly = true;
            //txtStockTakingItemDateManufacture.Attributes.Add("disabled", "disabled");
            txtStockTakingItemQuantity.ReadOnly = true;
            txtStockTakingItemQuantity.Attributes.Add("disabled", "disabled");
            chkWeightRequired.Enabled = false;
            txtStockTakingItemWeight.ReadOnly = true;
            txtStockTakingItemWeight.Attributes.Add("disabled", "disabled");
            drpWeightUnit.Enabled = false;
            txtStockTakingItemPrice.ReadOnly = false;
            txtStockTakingItemPrice.Attributes.Add("disabled", "disabled");
            btnAddItem.Visible = false;
        }
    }

    protected void txtStockTakingItemCode_TextChanged(object sender, EventArgs e)
    {
        if (txtStockTakingItemCode.Text.Trim() == "")
        {
            txtStockTakingItemName.ReadOnly = true;
            txtStockTakingItemName.Attributes.Add("disabled", "disabled");
            txtStockTakingItemWetWeight.ReadOnly = true;
            txtStockTakingItemWetWeight.Attributes.Add("disabled", "disabled");
            //txtStockTakingItemDateManufacture.ReadOnly = true;
            //txtStockTakingItemDateManufacture.Attributes.Add("disabled", "disabled");
            txtStockTakingItemQuantity.ReadOnly = true;
            txtStockTakingItemQuantity.Attributes.Add("disabled", "disabled");
            chkWeightRequired.Enabled = false;
            txtStockTakingItemWeight.ReadOnly = true;
            txtStockTakingItemWeight.Attributes.Add("disabled", "disabled");
            drpWeightUnit.Enabled = false;
            txtStockTakingItemPrice.ReadOnly = false;
            txtStockTakingItemPrice.Attributes.Add("disabled", "disabled");
            btnAddItem.Visible = false;
        }
        else
        {
            txtStockTakingItemName.ReadOnly = false;
            txtStockTakingItemName.Attributes.Remove("disabled");
            txtStockTakingItemWetWeight.ReadOnly = false;
            txtStockTakingItemWetWeight.Attributes.Remove("disabled");
            //txtStockTakingItemDateManufacture.ReadOnly = false;
            //txtStockTakingItemDateManufacture.Attributes.Remove("disabled");
            txtStockTakingItemQuantity.ReadOnly = false;
            txtStockTakingItemQuantity.Attributes.Remove("disabled");
            chkWeightRequired.Enabled = true;
            chkWeightRequired.Checked = true;
            txtStockTakingItemWeight.ReadOnly = false;
            txtStockTakingItemWeight.Attributes.Remove("disabled");
            drpWeightUnit.Enabled = true;
            txtStockTakingItemPrice.ReadOnly = false;
            txtStockTakingItemPrice.Attributes.Remove("disabled");
            btnAddItem.Visible = true;

            using (OracleConnection connection = new OracleConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                connection.Open();
                string query = "SELECT COUNT(*) ";
                query += "FROM products_" + Session["LoginStoreId"].ToString() + " ";
                query += "WHERE item_code = " + txtStockTakingItemCode.Text;
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if (result >= 1)
                {
                    WebRequest request = WebRequest.Create("http://localhost:9999/Samy/php/get_product_details.php?store_id=" + Session["LoginStoreId"] + "&item_code=" + txtStockTakingItemCode.Text.Trim());
                    WebResponse response = request.GetResponse();
                    Stream dataStream = response.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    string jsonString = reader.ReadToEnd();
                    response.Close();

                    Product productDetails = JsonConvert.DeserializeObject<Product>(jsonString);
                    txtStockTakingItemName.Text = productDetails.ProductName;
                    //txtStockTakingItemBNum.Text = productDetails.BNum;
                    //txtStockTakingItemDateManufacture.Text = DateTime.ParseExact(productDetails.DateManufacture, "dd-MMM-yyyy", null).ToString("dd-MMM-yyyy");
                    txtStockTakingItemWeight.Text = productDetails.Weight_Volume;
                    drpWeightUnit.SelectedValue = productDetails.Weight_VolumeUnit;
                    txtStockTakingItemPrice.Text = productDetails.Price;
                }
                else
                {
                    txtStockTakingItemName.Text = "";
                    //txtStockTakingItemBNum.Text = "";
                    //txtStockTakingItemDateManufacture.Text = "";
                    txtStockTakingItemWeight.Text = "";
                    drpWeightUnit.SelectedValue = "--";
                    txtStockTakingItemPrice.Text = "";
                }
                connection.Close();
            }
        }
    }

    protected void chkWeightRequired_CheckedChanged(object sender, EventArgs e)
    {
        Panel pnl = (Panel)Master.FindControl("Err_modal");
        pnl.Style.Remove("display");
        pnl.Style.Add("display", "none");
        if (!chkWeightRequired.Checked)
        {
            txtStockTakingItemWeight.Text = "nil";
            txtStockTakingItemWeight.ReadOnly = true;
            txtStockTakingItemWeight.Attributes.Add("disabled", "disabled");
            drpWeightUnit.SelectedIndex = 0;
            drpWeightUnit.Enabled = false;
            divWeight.Style.Add("background-color", "#ECECEC");
        }
        else
        {
            txtStockTakingItemWeight.Text = "";
            txtStockTakingItemWeight.ReadOnly = false;
            txtStockTakingItemWeight.Attributes.Remove("disabled");
            txtStockTakingItemWeight.Focus();
            drpWeightUnit.SelectedIndex = 0;
            drpWeightUnit.Enabled = true;
            divWeight.Style.Remove("background-color");
        }
    }

    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        if (DataInputError())
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Stock Taking Data Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Data fields not filled up adequately.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "none");

            using (OracleConnection connection = new OracleConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
                connection.Open();
                string query = "SELECT COUNT(*) ";
                query += "FROM products_" + Session["LoginStoreId"].ToString() + " ";
                query += "WHERE item_code = " + txtStockTakingItemCode.Text + " ";
                //query += "AND item_bnum = '" + txtStockTakingItemBNum.Text.ToUpper().Trim() + "' ";
                //query += "AND item_datemanufacture = '" + txtStockTakingItemDateManufacture.Text.Trim() + "' ";
                query += "AND is_active = 1";
                OracleCommand command = new OracleCommand(query, connection);
                int result = int.Parse(command.ExecuteScalar().ToString());
                if (result == 0 || result == 1)
                {
                    query = "SELECT COUNT(*) ";
                    query += "FROM products_universal ";
                    query += "WHERE item_code = " + txtStockTakingItemCode.Text + " ";
                    query += "AND store_id ='" + Session["LoginStoreId"] + "'";
                    command = new OracleCommand(query, connection);
                    int check = int.Parse(command.ExecuteScalar().ToString());
                    if (check == 0)
                    {
                        query = "SELECT NVL(MAX(record_id),0) ";
                        query += "FROM products_universal";
                        command = new OracleCommand(query, connection);
                        int maxRecordId = int.Parse(command.ExecuteScalar().ToString());

                        query = "INSERT INTO products_universal ";
                        query += "VALUES (" + txtStockTakingItemCode.Text + ", '" + txtStockTakingItemName.Text + "', '" + Session["LoginStoreId"] + "', " + (maxRecordId + 1).ToString() + ", 1)";
                        command = new OracleCommand(query, connection);
                        command.ExecuteNonQuery();
                    }
                }
                if (result == 0)
                {
                    query = "SELECT NVL(MAX(record_id),0) ";
                    query += "FROM products_" + Session["LoginStoreId"].ToString();
                    command = new OracleCommand(query, connection);
                    int maxRecordId = int.Parse(command.ExecuteScalar().ToString());

                    query = "INSERT INTO products_" + Session["LoginStoreId"].ToString() + " ";
                    query += "VALUES (" + txtStockTakingItemCode.Text + ", '" + txtStockTakingItemName.Text + "', " + txtStockTakingItemQuantity.Text + ", ";
                    if (chkWeightRequired.Checked)
                        query += "1, " + txtStockTakingItemWeight.Text + ", '" + drpWeightUnit.SelectedValue + "', ";
                    else
                        query += "0, null, null ";
                    query += txtStockTakingItemPrice.Text + ", " + (maxRecordId + 1).ToString() + ", 1, TO_DATE('" + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "','DD-MON-YYYY HH24:MI:SS'), " + txtStockTakingItemWetWeight.Text + ")";
                    command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();

                    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('Item added to store inventory successfully.');", true);

                    txtStockTakingItemCode.Focus();
                    txtStockTakingItemName.ReadOnly = true;
                    txtStockTakingItemName.Attributes.Add("disabled", "disabled");
                    txtStockTakingItemWetWeight.ReadOnly = true;
                    txtStockTakingItemWetWeight.Attributes.Add("disabled", "disabled");
                    //txtStockTakingItemDateManufacture.ReadOnly = true;
                    //txtStockTakingItemDateManufacture.Attributes.Add("disabled", "disabled");
                    txtStockTakingItemQuantity.ReadOnly = true;
                    txtStockTakingItemQuantity.Attributes.Add("disabled", "disabled");
                    chkWeightRequired.Enabled = false;
                    txtStockTakingItemWeight.ReadOnly = true;
                    txtStockTakingItemWeight.Attributes.Add("disabled", "disabled");
                    drpWeightUnit.Enabled = false;
                    txtStockTakingItemPrice.ReadOnly = false;
                    txtStockTakingItemPrice.Attributes.Add("disabled", "disabled");
                    btnAddItem.Visible = false;
                    txtStockTakingItemName.Text = "";
                    txtStockTakingItemWetWeight.Text = "";
                    //txtStockTakingItemDateManufacture.Text = "";
                    txtStockTakingItemQuantity.Text = "";
                    txtStockTakingItemWeight.Text = "";
                    drpWeightUnit.SelectedValue = "--";
                    txtStockTakingItemPrice.Text = "";
                }
                else if (result == 1)
                {
                    query = "UPDATE products_" + Session["LoginStoreId"].ToString() + " ";
                    query += "SET item_quantity = item_quantity +  " + txtStockTakingItemQuantity.Text + " ";
                    query += "WHERE item_code = " + txtStockTakingItemCode.Text + " ";
                    //query += "AND item_bnum = '" + txtStockTakingItemBNum.Text.ToUpper().Trim() + "' ";
                    //query += "AND item_datemanufacture = '" + txtStockTakingItemDateManufacture.Text.Trim() + "' ";
                    query += "AND is_active = 1";
                    command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();

                    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('Item added to store inventory successfully.');", true);

                    txtStockTakingItemCode.Focus();
                    txtStockTakingItemName.ReadOnly = true;
                    txtStockTakingItemName.Attributes.Add("disabled", "disabled");
                    txtStockTakingItemWetWeight.ReadOnly = true;
                    txtStockTakingItemWetWeight.Attributes.Add("disabled", "disabled");
                    //txtStockTakingItemDateManufacture.ReadOnly = true;
                    //txtStockTakingItemDateManufacture.Attributes.Add("disabled", "disabled");
                    txtStockTakingItemQuantity.ReadOnly = true;
                    txtStockTakingItemQuantity.Attributes.Add("disabled", "disabled");
                    chkWeightRequired.Enabled = false;
                    txtStockTakingItemWeight.ReadOnly = true;
                    txtStockTakingItemWeight.Attributes.Add("disabled", "disabled");
                    drpWeightUnit.Enabled = false;
                    txtStockTakingItemPrice.ReadOnly = false;
                    txtStockTakingItemPrice.Attributes.Add("disabled", "disabled");
                    btnAddItem.Visible = false;
                    txtStockTakingItemName.Text = "";
                    //txtStockTakingItemBNum.Text = "";
                    //txtStockTakingItemDateManufacture.Text = "";
                    txtStockTakingItemQuantity.Text = "";
                    txtStockTakingItemWeight.Text = "";
                    drpWeightUnit.SelectedValue = "--";
                    txtStockTakingItemPrice.Text = "";
                }
                connection.Close();
            }
        }
    }

    private bool DataInputError()
    {
        bool error = false;
        if (txtStockTakingItemCode.Text == "" || txtStockTakingItemName.Text == "" || txtStockTakingItemQuantity.Text == "" || txtStockTakingItemPrice.Text == "")
            error = true;
        if (chkWeightRequired.Checked && (txtStockTakingItemWeight.Text == "" || drpWeightUnit.SelectedValue == "--"))
            error = true;
        return error;
    }
}