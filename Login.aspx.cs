using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(constr);
    }

    protected void managerBtn_Click(object sender, EventArgs e)
    {
        string query = "select count(*) from Manager where (Name=@name and Password=@pass)";
        cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@name", uname.Text);
        cmd.Parameters.AddWithValue("@pass", pw.Text);
        con.Open();
        int count = (int) cmd.ExecuteScalar();
        con.Close();
        if(count==1)
        {
            HttpCookie cookie = new HttpCookie("Login");
            //cookie.Expires.AddYears(1);
            cookie["Auth"] = "Manager";
            Response.SetCookie(cookie);
            Response.Redirect("Home.aspx");
        }
        else
        {
            Label3.Text = "Invalid Login <br /><br />";
        }
    }

    protected void employeeBtn_Click(object sender, EventArgs e)
    {
        string query = "select count(*) from Employee where (Name=@name and Password=@pass)";
        cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@name", uname.Text);
        cmd.Parameters.AddWithValue("@pass", pw.Text);
        con.Open();
        int count = (int)cmd.ExecuteScalar();
        con.Close();
        if (count == 1)
        {
            HttpCookie cookie = new HttpCookie("Login");
            //cookie.Expires.AddYears(1);
            cookie["Auth"] = "Employee";
            Response.SetCookie(cookie);
            Response.Redirect("Home.aspx");
        }
        else
        {
            Label3.Text = "Invalid Login <br /><br />";
        }
    }

    protected void ownerBtn_Click(object sender, EventArgs e)
    {
        string query = "select count(*) from Owner where (Name=@name and Password=@pass)";
        cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@name", uname.Text);
        cmd.Parameters.AddWithValue("@pass", pw.Text);
        con.Open();
        int count = (int)cmd.ExecuteScalar();
        con.Close();
        if (count == 1)
        {
            HttpCookie cookie = new HttpCookie("Login");
            //cookie.Expires.AddYears(1);
            cookie["Auth"] = "Owner";
            Response.SetCookie(cookie);
            Response.Redirect("Home.aspx");
        }
        else
        {
            Label3.Text = "Invalid Login <br /><br />";
        }
    }
}