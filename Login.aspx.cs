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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click1(object sender, EventArgs e)
        {
            Session["Username"] = txtuser.Text;
            Session["Password"] = txtpwd.Text;

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ecart_user_h where Uname=@username and password=@password", con);
            cmd.Parameters.AddWithValue("@username", txtuser.Text);
            cmd.Parameters.AddWithValue("@password", txtpwd.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(),"validation", "<script language='javascript'>alert('invalid username and password')</script>");
            }
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}