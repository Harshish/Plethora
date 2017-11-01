using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Response.Cookies["Login"].Expires = DateTime.Now.AddDays(-1);
        HttpCookie cookie = Request.Cookies["Login"];
        if (cookie != null)
        {
            cookie["Auth"] = "USER";
            //Response.Cookies.Clear();
            Response.SetCookie(cookie);
        }
       // Session.Abandon();
        Response.Redirect("Home.aspx");   
    }
}