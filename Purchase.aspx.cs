using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string isbn = GridView1.SelectedRow.Cells[0].Text;
        string title = GridView1.SelectedRow.Cells[1].Text;
        string price = GridView1.SelectedRow.Cells[3].Text;
        TextBox tb = (TextBox) GridView1.SelectedRow.Cells[6].FindControl("tbqty");
        Book b = new Book(isbn,title, price, tb.Text);
//        HttpCookie cart = Request.Cookies["Bought"];
        if (Session["Books"] == null)
        {
            //cart = new HttpCookie("Bought");
            List<Book> booklist = new List<Book>();
            booklist.Add(b);
            Session["Books"] = booklist;
        }
        else
        {
            List<Book> booklist = (List<Book>) Session["Books"];
            booklist.Add(b);
        }
        //Response.Write(title + "  " + price + " " + tb.Text);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["Books"] != null)
        {
            List<Book> booklist = (List<Book>)Session["Books"];
            string constr = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            string updateQuery = "UPDATE [Book] SET [Copies] = [Copies] - @Copies WHERE ([Title] = @Title AND [Price] = @Price AND [ISBN] = @ISBN)";
            string insertQuery = "INSERT INTO [Sale] (ISBN,CopiesSold) values (@ISBN2,@Copies2)";
            foreach (Book b in booklist)
            {
                int purCopies = 0;
                int.TryParse(b.Quantity, out purCopies);
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@Copies", SqlDbType.Int).Value = purCopies;
                cmd.Parameters.AddWithValue("@Title", b.Title);
                cmd.Parameters.AddWithValue("@Price", b.Price);
                cmd.Parameters.AddWithValue("@ISBN", b.ISBN);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                cmd.CommandText = insertQuery;
                cmd.Parameters.AddWithValue("@Copies2", SqlDbType.Int).Value = purCopies;
                cmd.Parameters.AddWithValue("@ISBN2", b.ISBN);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("Receipt.aspx");
        }
        else
        {
            Response.Redirect("Home.aspx");
        }
    }
}