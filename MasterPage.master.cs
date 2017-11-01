using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["Login"];
        if (cookie != null && cookie["Auth"]!="USER")
        {
            loginstatus.ForeColor = System.Drawing.Color.Green;
            string auth = cookie["Auth"];
            loginstatus.Text = "Logged in as " + auth;
        }
        else
        {
            loginstatus.ForeColor = System.Drawing.Color.Red;
            loginstatus.Text = "Logged Off";
        }
    }

}
