using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBakeryShop
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onClickLogin(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
            string query = "SELECT COUNT(*) FROM [User] WHERE Email = '" + tbEmail.Text + "' AND Password = '" + tbPassword.Text + "'";
            try
            {
                using (con)
                {
                    using(SqlCommand cmd = new SqlCommand(query,con))
                    {
                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                        if(count == 1)
                        {
                            string idquery = "SELECT Id FROM [User] WHERE Email = '" + tbEmail.Text + "' AND Password = '" + tbPassword.Text + "'";
                            SqlCommand cmd2 = new SqlCommand(idquery,con);
                            int id = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
                            Session["Id"] = id;
                            string rquery = "SELECT Role FROM [User] WHERE Email = '" + tbEmail.Text + "' AND Password = '" + tbPassword.Text + "'";
                            SqlCommand cmd1 = new SqlCommand(rquery,con);
                            string role = cmd1.ExecuteScalar().ToString();
                            Session["Role"] = role;
                            if(role == "Admin")
                            {
                                Response.Redirect("adminhome.aspx");
                            }
                            else
                            {
                                Response.Redirect("home.aspx");
                            }
                        }
                        else
                        {
                            Response.Write("Invalid username and password");
                        }
                        con.Close();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}