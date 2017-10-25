using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string auth = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["Login"];
        if(cookie!=null)
            auth = cookie["Auth"];
    }

    protected void btSearch_Click(object sender, EventArgs e)
    {
        if (tbAuthor.Text.Length > 0 || tbTitle.Text.Length > 0)
        {
            if(auth=="Manager")
            {

            }
            else if(auth=="Employee")
            {
                Response.Redirect("Purchase.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
            }
            else if(auth=="Owner")
            {

            }
            else
                Response.Redirect("Details.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
        }
    }
}