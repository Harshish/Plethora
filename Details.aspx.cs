using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
            Server.Transfer("BNF.aspx");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            string ISBN = ((TextBox)GridView1.FooterRow.FindControl("tbISBNf")).Text;

            string Title = ((TextBox)GridView1.FooterRow.FindControl("tbTitle")).Text;

            string Author = ((TextBox)GridView1.FooterRow.FindControl("tbAuthor")).Text;

            string Price = ((TextBox)GridView1.FooterRow.FindControl("tbPrice")).Text;

            string Publisher = ((TextBox)GridView1.FooterRow.FindControl("tbPublisher")).Text;

            string Copies = ((TextBox)GridView1.FooterRow.FindControl("tbCopies")).Text;

            /*SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
            string insertq = "INSERT INTO [Book] ([ISBN], [Title], [Author], [Price], [Publisher], [Copies]) VALUES (@isbn, @title, @author, @price, @publisher, @copies)";
            SqlCommand cmd = new SqlCommand(insertq, con);
            cmd.Parameters.AddWithValue("@isbn", ISBN);
            cmd.Parameters.AddWithValue("@title", Title);
            cmd.Parameters.AddWithValue("@author", Author);
            cmd.Parameters.AddWithValue("@price", Price);
            cmd.Parameters.AddWithValue("@publisher", Publisher);
            cmd.Parameters.AddWithValue("@copies", Copies);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }*/
            SqlDataSource1.InsertParameters["ISBN"].DefaultValue = ISBN;
            SqlDataSource1.InsertParameters["Title"].DefaultValue = Title;
            SqlDataSource1.InsertParameters["Author"].DefaultValue = Author;
            SqlDataSource1.InsertParameters["Price"].DefaultValue = Price;
            SqlDataSource1.InsertParameters["Publisher"].DefaultValue = Publisher;
            SqlDataSource1.InsertParameters["Copies"].DefaultValue = Copies; 
            SqlDataSource1.Insert();
        }
    }
}