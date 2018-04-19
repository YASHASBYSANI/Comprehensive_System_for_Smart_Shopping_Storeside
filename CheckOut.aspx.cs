using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Media;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
{
    private string transactionId = "";
    private bool weightError = true;
    private SoundPlayer s = new SoundPlayer();
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
        txtExpectedWeight.ReadOnly = true;
        txtExpectedWeight.Attributes.Add("disabled", "disabled");
    }

    protected void btnGetCheckOutDetails_Click(object sender, EventArgs e)
    {
        divCheckOutDetails.Visible = true;
        txtDetailsUserEmail.Text = txtUserName.Text;
        using (OracleConnection connection = new OracleConnection())
        {
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["SamyConnection"].ConnectionString;
            connection.Open();
            string query = "SELECT t1.name_full, t2.checkin_record_id, TO_CHAR(t3.checkin_datetime, 'HH24:MI:SS') AS checkin_time, t2.transaction_id ";
            query += "FROM userdetails t1, checkout_universal t2, checkin_universal t3 ";
            query += "WHERE t2.email_username = '" + txtUserName.Text.Trim() + "' ";
            query += "AND t2.store_id = '" + Session["LoginStoreId"] + "' ";
            query += "AND t1.email_username = t2.email_username ";
            query += "AND t3.email_username = t2.email_username ";
            query += "AND t3.store_id = t2.store_id ";
            query += "AND t3.record_id = t2.checkin_record_id ";
            query += "AND t2.record_id = (SELECT MAX(record_id) FROM checkout_universal WHERE email_username = '" + txtUserName.Text.Trim() + "' AND store_id = '" + Session["LoginStoreId"] + "')";
            OracleCommand command = new OracleCommand(query, connection);
            OracleDataReader reader = command.ExecuteReader();
            reader.Read();
            txtDetailsUserName.Text = reader["NAME_FULL"].ToString();
            txtDetailsCheckinId.Text = reader["CHECKIN_RECORD_ID"].ToString();
            txtDetailsCheckinTime.Text = reader["CHECKIN_TIME"].ToString();
            lblTransactionId.Text = reader["TRANSACTION_ID"].ToString();
            transactionId = reader["TRANSACTION_ID"].ToString();
            reader.Close();

            query = "SELECT SUM(t1.item_wetweight*t2.quantity) AS TOTAL_WET_WEIGHT ";
            query += "FROM products_" + Session["LoginStoreId"] + " t1, \"SYSTEM\".\"" + transactionId + "\" t2 ";
            query += "WHERE t1.item_code = t2.item_number";
            command = new OracleCommand(query, connection);
            reader = command.ExecuteReader();
            reader.Read();
            txtExpectedWeight.Text = reader["TOTAL_WET_WEIGHT"].ToString();
            reader.Close();

            query = "SELECT t1.item_number AS grdPurchaseDetailsItemCode, t2.item_name AS grdPurchaseDetailsItemName, (t2.item_weightvolume || ' ' || t2.item_weightvolumeunit) AS grdPurchaseDetailsItemWeight, t2.item_price AS grdPurchaseDetailsRate, t1.quantity AS grdPurchaseDetailsQuantity, (t2.item_price * t1.quantity) AS grdPurchaseDetailsPrice ";
            query += "FROM \"" + transactionId + "\" t1, products_" + Session["LoginStoreId"] + " t2 ";
            query += "WHERE t1.item_number = t2.item_code";
            OracleDataAdapter adapView = new OracleDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapView.Fill(ds, "GridView");
            grdPurchaseDetails.DataSource = ds.Tables[0];
            grdPurchaseDetails.DataBind();

            query = "SELECT samy_cash ";
            query += "FROM userdetails ";
            query += "WHERE email_username = '" + txtUserName.Text.Trim() + "'";
            command = new OracleCommand(query, connection);
            reader = command.ExecuteReader();
            reader.Read();
            float samyCash = float.Parse(reader["SAMY_CASH"].ToString());

            float totalAmount = 0;
            foreach (GridViewRow row in grdPurchaseDetails.Rows)
            {
                totalAmount += float.Parse(row.Cells[5].Text);
            }
            lblTotalAmount.Text = totalAmount.ToString();

            if (totalAmount <= samyCash)
            {
                lblSamyCashAmount.Text = lblTotalAmount.Text;
                lblCashAmount.Text = "0";
                chkPayementReceived.Checked = true;
                //chkPayementReceived.Visible = false;
                //chkPayementReceived.Enabled = false;
                //btnCheckOut.Visible = true;
            }
            else
            {
                lblSamyCashAmount.Text = samyCash.ToString();
                lblCashAmount.Text = (totalAmount - samyCash).ToString();
                chkPayementReceived.Checked = false;
                //chkPayementReceived.Visible = true;
                btnCheckOut.Visible = false;
            }
            connection.Close();
        }
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if(txtObservedWeight.Text=="" && (txtObservedWeight.Text.Substring(0, txtObservedWeight.Text.Length - 1) != txtExpectedWeight.Text.Substring(0, txtExpectedWeight.Text.Length - 1)))
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Checkout Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Observed Weight Error.";
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "block");
        }
        else if (!chkPayementReceived.Checked)
        {
            Label lbl = (Label)Master.FindControl("err_heading");
            lbl.Text = "Checkout Error";
            lbl = (Label)Master.FindControl("err_msg");
            lbl.Text = "Please receive payement.";
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
                string query = "UPDATE userdetails ";
                query += "SET samy_cash = samy_cash - " + lblSamyCashAmount.Text + " ";
                query += "WHERE email_username = '" + txtUserName.Text + "'";
                OracleCommand command = new OracleCommand(query, connection);
                command.ExecuteNonQuery();

                query = "UPDATE checkout_universal ";
                query += "SET checked_out = 1, total_purchase = " + lblTotalAmount.Text.Trim() + ", samycash_used = " + lblSamyCashAmount.Text.Trim();
                query += "WHERE transaction_id = '" + lblTransactionId.Text + "'";
                command = new OracleCommand(query, connection);
                command.ExecuteNonQuery();

                foreach (GridViewRow row in grdPurchaseDetails.Rows)
                {
                    query = "UPDATE products_" + Session["LoginStoreId"] + " ";
                    query += "SET item_quantity = item_quantity - " + row.Cells[4].Text + " ";
                    query += "WHERE item_code = " + row.Cells[0].Text;
                    command = new OracleCommand(query, connection);
                    command.ExecuteNonQuery();

                    query = "SELECT item_quantity ";
                    query += "FROM products_" + Session["LoginStoreId"] + " ";
                    query += "WHERE item_code = " + row.Cells[0].Text;
                    command = new OracleCommand(query, connection);
                    int item_quantity = int.Parse(command.ExecuteScalar().ToString());
                    if (item_quantity <= 0)
                    {
                        query = "DELETE FROM products_universal ";
                        query += "WHERE item_code = " + row.Cells[0].Text + " ";
                        query += "AND store_id = '" + Session["LoginStoreId"] + "'";
                        command = new OracleCommand(query, connection);
                        command.ExecuteNonQuery();
                    }
                }
                connection.Close();
            }
            clearForm();
        }
    }

    protected void chkPayementReceived_CheckedChanged(object sender, EventArgs e)
    {
        if (chkPayementReceived.Checked && txtObservedWeight.Text != "" && (txtObservedWeight.Text.Substring(0, txtObservedWeight.Text.Length - 1) == txtExpectedWeight.Text.Substring(0, txtExpectedWeight.Text.Length - 1)))
            btnCheckOut.Visible = true;
        else
            btnCheckOut.Visible = false;
    }

    protected void txtObservedWeight_TextChanged(object sender, EventArgs e)
    {
        //String expectedWeight = txtExpectedWeight.Text;
        //String originalWeight = txtObservedWeight.Text;
        if (txtObservedWeight.Text == "")
        {
            if (btnCheckOut.Visible == true)
                btnCheckOut.Visible = false;
            Panel pnl = (Panel)Master.FindControl("Err_modal");
            pnl.Style.Remove("display");
            pnl.Style.Add("display", "none");
            btnStopAlarm.Visible = false;
            stopAlarm();
        }
        else
        {
            if (txtObservedWeight.Text.Substring(0, txtObservedWeight.Text.Length - 1) != txtExpectedWeight.Text.Substring(0, txtExpectedWeight.Text.Length - 1))
            {
                if (btnCheckOut.Visible == true)
                    btnCheckOut.Visible = false;
                weightError = true;
                playAlarm();
                btnStopAlarm.Visible = true;
                Label lbl = (Label)Master.FindControl("err_heading");
                lbl.Text = "Checkout Error";
                lbl = (Label)Master.FindControl("err_msg");
                lbl.Text = "Weights do not match. Check items.";
                Panel pnl = (Panel)Master.FindControl("Err_modal");
                pnl.Style.Remove("display");
                pnl.Style.Add("display", "block");
            }
            else
            {
                if (btnCheckOut.Visible == false && chkPayementReceived.Checked)
                    btnCheckOut.Visible = true;
                weightError = false;
                stopAlarm();
                btnStopAlarm.Visible = false;
                Panel pnl = (Panel)Master.FindControl("Err_modal");
                pnl.Style.Remove("display");
                pnl.Style.Add("display", "false");
            }
        }
        //if(ds)
    }

    protected void btnStopAlarm_Click(object sender, EventArgs e)
    {
        stopAlarm();
    }

    private void playAlarm()
    {
        s.SoundLocation = Server.MapPath("Sounds/Alarm2.wav");
        s.PlayLooping();
    }

    private void stopAlarm()
    {
        s.Stop();
    }

    private void clearForm()
    {
        txtUserName.Text = "";
        divCheckOutDetails.Visible = false;
    }
}