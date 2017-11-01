using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string auth = string.Empty;
            HttpCookie cookie = Request.Cookies["Login"];
            if (cookie != null)
                auth = cookie["Auth"];
            if (auth != "Owner")
                Response.Redirect("UA.aspx");

            string searchQuery = "SELECT * FROM [Sale]";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(searchQuery, con);
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            DateTime date = (DateTime)DataBinder.Eval(e.Row.DataItem,"Date");
            DateTime prev = date.AddDays(-7);
            string isbn = (string)DataBinder.Eval(e.Row.DataItem, "ISBN");
            int weeks = (int)DataBinder.Eval(e.Row.DataItem, "Weeks");
            int copies = 0;//(int)DataBinder.Eval(e.Row.DataItem, "CopiesSold");
            int rem = (int)DataBinder.Eval(e.Row.DataItem, "Copies");

            foreach(DataRow dr in dt.Rows)
            {
                DateTime rdate = (DateTime) dr["Date"];
                if(rdate >= prev && rdate <= date)
                {
                    copies++;
                }
            }

            int val = weeks * copies;
            Label label = e.Row.FindControl("IL") as Label;
            label.Text = val.ToString();
            if(rem < 3)
            {
                e.Row.BackColor = System.Drawing.Color.Red;
                //e.Row.ForeColor = System.Drawing.Color.Black;
            }
            
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        
    }
}