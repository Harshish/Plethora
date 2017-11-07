using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DropDownList1.Items.Add("Book");
            DropDownList1.Items.Add("Sale");
            HttpCookie cookie = Request.Cookies["Login"];
            if (cookie != null)
                Label1.Text = cookie["Auth"];
           
            //CheckBoxList1.Visible = false;
        }
    }

    

    /* protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
     {
         if (DropDownList1.SelectedItem.Text == "Book")
         {
             CheckBoxList1.Visible = false;
             RadioButtonList1.Visible = true;
         }
         else if (DropDownList1.SelectedItem.Text == "Sale")
         {
             RadioButtonList1.Visible = false;
             CheckBoxList1.Visible = true;
         }
     }*/

    protected void Button1_Click1(object sender, EventArgs e)
    {
        TextBox1.Text = DropDownList1.SelectedValue;
       /* SqlConnection con = new SqlConnection();
        Response.Write("yo2");
        con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
        try
        {
            con.Open();

            SqlCommand cmd = null;



            if (DropDownList1.SelectedItem.Text == "Book")
            {
                cmd = new SqlCommand("select * from Book"); //where Title=" + RadioButtonList1.SelectedItem.Text, con);
                //Response.Write(RadioButtonList1.SelectedItem.Text);
            }

            if (DropDownList1.SelectedItem.Text == "Sale")

            {
                cmd = new SqlCommand("select * from Sale");// where TransactionID=" + CheckBoxList1.SelectedItem.Text, con);

            }


            this.GridView1.DataSource = cmd.ExecuteReader();

            this.GridView1.DataBind();
        }
        catch (Exception ex) { Console.WriteLine(ex.Message); }
        finally { con.Close(); }*/
    }
}