using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class MyMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                
            }
            else
            {
                loginLink.Visible = false;
                profileLink.Visible = true;
                if (Session["username"] != null)
                    lblUser.Text =" Hi, " +Session["username"].ToString();
                lblBadge.Text = Session["cart"].ToString();
                lblBadge.Visible = true;
                badgeValue.Style.Add("display","inline");
            }
        }
        protected void navigationMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
             Session["items"] = e.Item.Text;
             Response.Redirect("Items.aspx?item="+e.Item.Value);   
        }

        protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = null;
            Session["userid"] = null;
            lblBadge.Visible = false;
            Response.Redirect("Login.aspx");
        }

        protected void imgBtnProfile_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void imgBtnCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}