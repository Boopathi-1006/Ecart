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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click1(object sender, EventArgs e)
        {
                Response.Redirect("Login.aspx");
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Ecart_user_h values (@username,@password,@mobilemo,@city)", con);
            cmd.Parameters.AddWithValue("@username", txtusername.Text);
            cmd.Parameters.AddWithValue("@password", txtpwd.Text);
            cmd.Parameters.AddWithValue("@mobilemo", txtmobileno.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.ExecuteNonQuery();
            //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('invalid username and password')</script>");

            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Regsitration Successfully')</script>");
            txtusername.Text = "";
            txtpwd.Text = "";
            txtmobileno.Text = "";
            txtcity.Text = "";
            txtrepwd.Text = "";
        }
    }
}