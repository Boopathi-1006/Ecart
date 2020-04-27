using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECart_shopping
{
    public partial class Placeorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");

            }
        }

        protected void btnPlaceorder_Click1(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Ordered Placed Successfully')</script>");
            txtuser.Text = "";
            txtAdd.Text = "";
        }

        protected void btnHome_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");

        }
    }
}