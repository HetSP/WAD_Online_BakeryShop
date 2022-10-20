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
    public partial class ViewCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["Id"];
            string role = Session["Role"].ToString();
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
                try
                {
                    using (con)
                    {
                        string command = "SELECT * FROM [User]";
                        SqlCommand cmd = new SqlCommand(command, con);
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        GridViewCustomer.DataSource = rdr;
                        GridViewCustomer.DataBind();
                        rdr.Close();
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("Error :" + ex.Message); 
                }
            
        }
    }
}