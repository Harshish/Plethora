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

    }

    protected void btSearch_Click(object sender, EventArgs e)
    {
        if(tbAuthor.Text.Length > 0 || tbTitle.Text.Length > 0)
            Response.Redirect("Details.aspx?title=" + tbTitle.Text + "&author=" + tbAuthor.Text);
    }
}