using System;
using System.Web.UI;

namespace ShoppingCart
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (Convert.ToBoolean(Session["isAdmin"]))
                {
                    Response.Redirect("Admin.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            if (Session["userid"] == null)
            {
                lblProfile.Text = "You have not logged in";
                btnLogin.Visible = true;
                lbCart.Visible = false;
                lbOrder.Visible = false;
                lbWishlist.Visible = false;
            }
            else
            {
                imgProfile.Visible = true;
            }
        }
        public void getData(string name)
        {
            Session["username"]= null;
            Session["userid"] = null;
            Session["cart"] = 0;
        }

        protected void imgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = null;
            Session["userid"] = null;
            Response.Redirect("Profile.aspx");
        }
    }
}