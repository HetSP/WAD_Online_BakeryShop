using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBakeryShop
{
    public partial class Item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            addItemPanel.Visible = false;
            PanelshowForm.Visible = true;
        }

        protected void ShowItem()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string command = "SELECT * FROM [Items]";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    //GridViewItem.DataSource = rdr;
                    GridViewItem.DataBind();
                    rdr.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }

        protected void onClickAddItem(object sender, EventArgs e)
        {
            addItemPanel.Visible = false;
            string filename = Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/images/" + filename));
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
            string query = "INSERT INTO [Items] (Name,imgPath,Flavour,Price) VALUES (@Name,@imgPath,@Flavour,@Price)";
            try
            {
                using (con)
                {
                    using(SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@Name", tbName.Text);
                        cmd.Parameters.AddWithValue("@imgPath","~/images/"+filename);
                        cmd.Parameters.AddWithValue("@Flavour", tbFlavour.Text);
                        cmd.Parameters.AddWithValue("@Price", tbPrice.Text);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
            finally
            {
                tbName.Text = String.Empty;
                tbFlavour.Text = String.Empty;
                tbPrice.Text = String.Empty;
            }
            ShowItem();
        }

        

        protected void showForm(object sender, EventArgs e)
        {
            addItemPanel.Visible =true;
            PanelshowForm.Visible = false;
        }

        
    }
}