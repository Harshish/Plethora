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
        string bookTitle = Request.QueryString["title"];
        string bookAuthor = Request.QueryString["author"];

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
        try
        {
            string searchQuery = String.Empty;
            SqlCommand cmd;
            if (bookTitle.Length == 0 && bookAuthor.Length > 0)
            {
                searchQuery = "SELECT [ISBN], [Title], [Author], [Price], [Publisher], [Copies] FROM [Book] WHERE Author=@author";
                cmd = new SqlCommand(searchQuery, con);
                cmd.Parameters.AddWithValue("@author", bookTitle);
            }
            else if (bookTitle.Length > 0 && bookAuthor.Length == 0)
            {
                searchQuery = "SELECT [ISBN], [Title], [Author], [Price], [Publisher], [Copies] FROM [Book] WHERE Title=@title";
                cmd = new SqlCommand(searchQuery, con);
                cmd.Parameters.AddWithValue("@title", bookTitle);
            }
            else
            {
                searchQuery = "SELECT [ISBN], [Title], [Author], [Price], [Publisher], [Copies] FROM [Book] WHERE [Author]=@author and [Title]=@title";
                cmd = new SqlCommand(searchQuery, con);
                cmd.Parameters.AddWithValue("@author", bookAuthor);
                cmd.Parameters.AddWithValue("@title", bookTitle);
            }
            /*using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    Console.WriteLine(String.Format("{0}", reader["id"]));
                }
            }*/
            DataSet dataset = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dataset);
            con.Open();
            cmd.ExecuteNonQuery();
            GridView1.DataSource = dataset;
            GridView1.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
        finally
        {

        }
    }
}