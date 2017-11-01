using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string auth = "USER";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Application.RemoveAll();
        
            HttpCookie cookie = Request.Cookies["Login"];
            if (cookie != null)
                auth = cookie["Auth"];
        
    }

    protected void btSearch_Click(object sender, EventArgs e)
    {
        if (tbAuthor.Text.Length > 0 || tbTitle.Text.Length > 0)
        {
            if(auth=="Employee")
            {
                Response.Redirect("Purchase.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
            }
            else if(auth=="Owner")
            {
                Response.Redirect("Statistics.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
            }
            else
                Response.Redirect("Details.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
        }
        else
        {
            tbAuthor.ForeColor = System.Drawing.Color.Red;
            tbAuthor.Text = "*Required";
            tbTitle.ForeColor = System.Drawing.Color.Red;
            tbTitle.Text = "*Required";
            tbAuthor.ForeColor = System.Drawing.Color.Black;
            tbTitle.ForeColor = System.Drawing.Color.Black;
        }
    }

    protected void btSearchAll_Click(object sender, EventArgs e)
    {
        if (auth == "Employee")
        {
            Response.Redirect("Purchase.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
        }
        else if (auth == "Owner")
        {
            Response.Redirect("Statistics.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
        }
        else
            Response.Redirect("Details.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
    }
}