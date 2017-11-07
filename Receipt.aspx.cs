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
        if (Session["Books"] != null)
        {
            List<Book> booklist = (List<Book>)Session["Books"];
            GridView1.DataSource = booklist;
            GridView1.DataBind();
            int total = 0;
            foreach (Book b in booklist)
                total += b.Total;
            Label1.Text = "TOTAL PAYABLE AMOUNT: Rs " + total;
        }
    }
}