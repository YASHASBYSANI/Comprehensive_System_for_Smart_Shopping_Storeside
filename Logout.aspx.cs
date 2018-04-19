using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "store" && Session["LoginStoreId"] != null)
        {
            Session.Clear();
            Session.Abandon();
            if (Response.Cookies["SamyAutoLoginCookies"] != null)
                Response.Cookies["SamyAutoLoginCookies"].Expires = DateTime.Now.AddDays(-1);
            Timer tmr = new Timer();
            tmr.Interval = 5000;
            tmr.Tick += timerHandler;
            tmr.Enabled = true;
        }
        else if (Request.QueryString["action"] == "manager")
        {
            Session["LoginStoreManager"] = null;
            Response.Redirect("Home.aspx");
        }
    }
    protected void timerHandler(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}