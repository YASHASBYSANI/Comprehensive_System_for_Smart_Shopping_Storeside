using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["LoginStoreId"] == null)
        {
            lblUser.Text = "Guest";
            lblUser.Style.Remove("display");
            lblUser.Style.Add("display", "block");
            btnStoreDetails.Style.Remove("display");
            btnStoreDetails.Style.Add("display", "none");
            pnlDashboard.Style.Remove("display");
            pnlDashboard.Style.Add("display", "none");
            btnLogout.Style.Remove("display");
            btnLogout.Style.Add("display", "none");
            linkAbout.Style.Remove("display");
            linkAbout.Style.Add("display", "block");
        }
        else
        {
            lblUser.Text = Session["LoginStoreName"].ToString();
            lblUser.Style.Remove("display");
            lblUser.Style.Add("display", "block");
            btnStoreDetails.Style.Remove("display");
            btnStoreDetails.Style.Add("display", "block");
            pnlDashboard.Style.Remove("display");
            pnlDashboard.Style.Add("display", "block");
            btnLogout.Style.Remove("display");
            btnLogout.Style.Add("display", "block");
            linkAbout.Style.Remove("display");
            linkAbout.Style.Add("display", "none");
        }
        if(Session["LoginStoreManager"] == null)
        {
            linkSales.Style.Remove("display");
            linkSales.Style.Add("display", "none");
            linkStocks.Style.Remove("display");
            linkStocks.Style.Add("display", "none");
            btnManagerLogout.Style.Remove("display");
            btnManagerLogout.Style.Add("display", "none");
        }
        else
        {
            linkSales.Style.Remove("display");
            linkSales.Style.Add("display", "block");
            linkStocks.Style.Remove("display");
            linkStocks.Style.Add("display", "block");
            btnManagerLogout.Style.Remove("display");
            btnManagerLogout.Style.Add("display", "block");
        }
    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }

    //protected void btnManagerLogout_ServerClick(object sender, EventArgs e)
    //{
    //    Session["LoginStoreManager"] = null;
    //    //string str = "";
    //    //for(int i=0;i<Request.Url.Segments.Length;i++)
    //    //{
    //    //    str += Request.Url.Segments[i] + "  ---  ";
    //    //}
    //    //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "my_script", "alert('" + str + "');", true);
    //    if(Request.Url.Segments[1]=="ManagerConsole" || Request.Url.Segments[1]=="ManagerConsole.aspx")
    //        Response.Redirect("ManagerLogin.aspx");
    //}
}