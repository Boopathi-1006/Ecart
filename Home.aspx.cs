using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;


namespace ECart_shopping
{
    public partial class Home : System.Web.UI.Page
    {
        //string username = Session["Username"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"]==null)
            {
                Response.Redirect("Login.aspx");

            }
            else
            { 
            lblname.Text = "Welcome " + Session["Username"];
            if(!IsPostBack)
            {
                Gridbind();
            }
            }
        }

        protected void Gridbind()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ecart_Product_h", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Grdproduct.DataSource = dt;
                Grdproduct.DataBind();
            }
            SqlConnection con1 = new SqlConnection(constr);
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("CartDetails_devp", con1);
            cmd1.Parameters.AddWithValue("@username", Session["Username"]);
            cmd1.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                GridCart.DataSource = dt1;
                GridCart.DataBind();
            }
            else
            {
                DataTable empdt = new DataTable();
                GridCart.DataSource = empdt;
                GridCart.DataBind();
            }
        }

        protected void Grdproduct_Adding(object sender,GridViewCommandEventArgs e)
        {
                  //int productid = int.Parse(e.Row.Cells[0].Text);

            if (e.CommandName == "Select")
            {
                int rowindx = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = Grdproduct.Rows[rowindx];
                int productid = int.Parse(row.Cells[0].Text);
                string productname = row.Cells[1].Text;
                var qua = row.FindControl("txtgrdqunty") as TextBox;
                string quantity = qua.Text;
                decimal price = decimal.Parse(row.Cells[3].Text);
                //int rowindx = Convert.ToInt32(e.CommandArgument);
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                //SqlCommand cmd = new SqlCommand("insert into Ecart_Cart_h values (@productid,@productname,@quantiy,@price,@username)", con);
                SqlCommand cmd = new SqlCommand("AddCart_devp", con);
                cmd.Parameters.AddWithValue("@productid", productid);
                cmd.Parameters.AddWithValue("@productname", productname);
                cmd.Parameters.AddWithValue("@quantiy", qua.Text);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@username", Session["Username"]);
                cmd.CommandType = CommandType.StoredProcedure;

                //cmd.Parameters.AddWithValue("@city", txtcity.Text);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Added to cart')</script>");
                //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                SqlConnection con1 = new SqlConnection(constr);
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("CartDetails_devp", con1);
                cmd1.Parameters.AddWithValue("@username", Session["Username"]);
                cmd1.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    GridCart.DataSource = dt1;
                    GridCart.DataBind();
                }
            }
            //string productname = (string)Grdproduct.DataKeys[index].values["ProductName"];

        }

        protected void Grdcart_delete(object sender, GridViewCommandEventArgs e)
        {
            //int productid = int.Parse(e.Row.Cells[0].Text);

            if (e.CommandName == "Remove")
            {
                int rowindx = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = Grdproduct.Rows[rowindx];
                int productid = int.Parse(row.Cells[0].Text);
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Ecart_Cart_h where ProductId=@productid and Username=@username", con);
                //SqlCommand cmd = new SqlCommand("AddCart_devp", con);
                cmd.Parameters.AddWithValue("@productid", productid);
                cmd.Parameters.AddWithValue("@username", Session["Username"]);
                //cmd.CommandType = CommandType.StoredProcedure;

                //cmd.Parameters.AddWithValue("@city", txtcity.Text);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Removed from cart successfully')</script>");
                //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                SqlConnection con1 = new SqlConnection(constr);
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("CartDetails_devp", con1);
                cmd1.Parameters.AddWithValue("@username", Session["Username"]);
                cmd1.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    GridCart.DataSource = dt1;
                    GridCart.DataBind();
                }
                else
                {
                    DataTable empdt = new DataTable();
                    GridCart.DataSource = empdt;
                    GridCart.DataBind();
                }
            }
            //string productname = (string)Grdproduct.DataKeys[index].values["ProductName"];

        }

        protected void btnlogout_Click1(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Log Out Successfully')</script>");
            Response.Redirect("Login.aspx");

        }

        protected void btnorder_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Placeorder.aspx");

        }
    }
}