using System;
using System.Collections.Generic;
using System.Data;
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
        if (!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["Login"];
            if (cookie != null)
            {
                string auth = cookie["Auth"];
                if (auth == "Manager" || auth=="Owner")
                {
                    if (Application["Requests"] != null)
                    {
                        if(auth=="Manager")
                            GridView1.Columns.Clear();
                        BindMyGridview();
                    }
                    else
                    {
                        lblinfo.Text =  "No Requests found!";
                    }
                }
                else
                    lblinfo.Text = "Unauthorized Access!";
            }
        }
        
    }

    private void BindMyGridview()
    {
        if (Application["Requests"] != null)
        {
            DataTable dt = (DataTable)Application["Requests"];

            if ((dt != null) && (dt.Rows.Count > 0))
            {
                GridView1.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.Visible = false;
            }
        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        string pubname = popPubName.Text;
        string pubaddr = popPubAddress.Text;
        string title = string.Empty;
        string author = string.Empty;
        string email = string.Empty;
        DataTable dt = (DataTable)Application["Requests"];
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                if (row.Cells[1].Text == popTitle.Text)
                {
                    title = row.Cells[1].Text;
                    author = row.Cells[2].Text;
                    email = row.Cells[3].Text;
                    DataRow dr = dt.Rows[row.RowIndex];
                    dt.Rows.Remove(dr);
                    break;
                }
            }
        }
        BindMyGridview();
    }

    protected void cbOrder_CheckedChanged(object sender, EventArgs e)
    {
        if (((CheckBox)sender).Checked)
        {
            CheckBox btnsubmit = sender as CheckBox; 
            GridViewRow gRow = (GridViewRow)btnsubmit.NamingContainer;
            
            popTitle.Text = gRow.Cells[1].Text;
            popAuthor.Text = gRow.Cells[2].Text;
            this.ModalPopupExtender1.Show();
        }
    }
}