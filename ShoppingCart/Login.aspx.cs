using BusinessLayer;
using BusinessLayer.Class;
using System;
using System.Web.UI;

namespace ShoppingCart
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.DefaultButton = this.btnSubmit.UniqueID;
            Control myControlMenu = Page.Master.FindControl("navDiv");
            if (myControlMenu != null)
            {
                myControlMenu.Visible = false;
            }
            if (Session["userid"] != null)
            {
                Session["username"] = null;
                Session["userid"] = null;
            }
            lbGoBack.PostBackUrl ="default.aspx";
        }

        protected void btnSubmitClick(object sender, EventArgs e)
        {
            LoginBL loginBl = new LoginBL();
            LoginBusinessObject lbo = new LoginBusinessObject();
            lbo.username = txtUsername.Text;
            lbo.password = txtPassword.Text;
            lbo = loginBl.checkCredentials(lbo);
            CartBL cartBl = new CartBL();
            if (lbo !=null)
            {
                bool isAdmin = lbo.isAdmin;
                string name = lbo.name;
                int userId = lbo.userId;
                if (isAdmin)
                {
                    Session["username"] = name;
                    Session["userid"] = userId;
                    Session["isAdmin"] = true;
                    int count = cartBl.countCartItem(Convert.ToInt32(Session["userid"]));
                    Session["cart"] = count.ToString();
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    Session["username"] = name;
                    Session["userid"] = userId;
                    Session["isAdmin"] = false;
                    int count = cartBl.countCartItem(Convert.ToInt32(Session["userid"]));
                    Session["cart"] = count.ToString();
                    if (Session["page"] != null)
                        Response.Redirect(Session["page"].ToString());
                    else
                        Response.Redirect("Default.aspx");
                }
            }
            else
                lblError.Text = "Email/Password is not Correct";
        }

        protected void btnCancelClick(object sender, EventArgs e)
        {
            txtUsername.Text = String.Empty;
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            SignupBL signupBl = new SignupBL();
            string email = txtUsername.Text;
            int status = signupBl.checkEmail(email);
            if (status == 0)
            {
                lblError.Text = "User is not Registered go to <a href='Signup.aspx'>Signup</a>";
            }
            else
            {
                lblError.Text = "";
            }
        }

       
    }
}


