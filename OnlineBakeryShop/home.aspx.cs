using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;

namespace OnlineBakeryShop
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["Id"];
            string role = Session["Role"].ToString();
            PanelOrderForm.Visible = false;
            PanelPlaceOrder.Visible = true;
            if (id == 0)
            {
                Response.Redirect("login.aspx");
            }
            string mainconn = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "select * from [Items]";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = sqlcomm;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            sqlconn.Close();
        }

        protected void onClickLogout(object sender, EventArgs e)
        {
            Session["Id"] = 0;
            Session["Role"] = "";
            Session["totalCost"] = 0;
            Response.Redirect("login.aspx");
        }

        protected void onClickOrder(object sender, EventArgs e)
        {
            PanelOrderForm.Visible = true;
            PanelPlaceOrder.Visible = false;
        }

        protected void onClickConfirmOrder(object sender, EventArgs e)
        {
            int totalCost = (int)Session["totalCost"];
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
            string query = "INSERT INTO [Orders] (UserId,Quntity,ItemId) VALUES (@UserId,@Quntity,@ItemId)";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["Id"]));
                        cmd.Parameters.AddWithValue("@Quntity", tbQuantity.Text);
                        cmd.Parameters.AddWithValue("@ItemId", ddlItemId.Text);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        int quantity = Convert.ToInt32(tbQuantity.Text);
                        string query1 = "SELECT Price FROM [Items] WHERE ItemId = " + ddlItemId.SelectedValue;
                        SqlCommand cmd1 = new SqlCommand(query1 , con);
                        int price = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
                        totalCost += (price * quantity);
                        Response.Write("Total cost was: " + totalCost.ToString());
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                tbQuantity.Text = String.Empty; 
                ddlItemId.SelectedIndex = 0;
            }
        }

        
    }
}