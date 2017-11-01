using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void btRequest_Click(object sender, EventArgs e)
    {
       // List<Request> bookRequests;
        DataTable dt = new DataTable();

        if (Application["Requests"]==null)
        {
           // bookRequests = new List<Request>();
            dt.Columns.Add("Title");
            dt.Columns.Add("Author");
            dt.Columns.Add("Email");
        }
        else
        {
            //bookRequests = Application["Requests"] as List<Request>;
            dt = (DataTable)Application["Requests"];
        }
        //Request r = new Request(tbTitle.Text, tbAuthor.Text, tbEmail.Text);
        //bookRequests.Add(r);

        DataRow drow = dt.NewRow();
        drow["Title"] = tbTitle.Text.ToString();
        drow["Author"] = tbAuthor.Text.ToString();
        drow["Email"] = tbEmail.Text.ToString();

        dt.Rows.Add(drow);

        Application["Requests"] = dt;// bookRequests;
        Response.Redirect("Home.aspx");
    }
}