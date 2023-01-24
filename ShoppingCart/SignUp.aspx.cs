using BusinessLayer;
using BusinessLayer.Class;
using System;
using System.Web.UI;

namespace ShoppingCart
{
    public partial class SignUp : System.Web.UI.Page
    {
        SignupBL signupBl = new SignupBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.DefaultButton = this.btnSubmit.UniqueID;
            if (Session["userid"] != null)
            {
                Response.Redirect(Session["page"].ToString());
            }
            Control myControlMenu = Page.Master.FindControl("navDiv");
            if (myControlMenu != null)
            {
                myControlMenu.Visible = false;
            }
            lbGoBack.PostBackUrl = "default.aspx";
        }

        protected void insertData(object sender, EventArgs e)
        {
            UserBusinessObject ubo = new UserBusinessObject();
            ubo.fName = txtFName.Text;
            ubo.lName = txtLName.Text;
            ubo.email = txtEmail.Text;
            ubo.mobile =txtMobile.Text;
            ubo.gender = rbGender.Text;
            ubo.dob = Request.Form[txtDOB.UniqueID];
            ubo.address1 = txtAdd1.Text;
            ubo.address2 = txtAdd2.Text;
            ubo.city = txtCity.Text;
            ubo.state = ddlState.SelectedItem.Text;
            ubo.pin = Convert.ToInt32(txtPin.Text);
            ubo.password = txtPassword.Text;
            lblInfo.Visible = false;
            int status= signupBl.insertDetails(ubo);
            if (status == 0)
            {
                lblInfo.Text = "Registration Failed";
            }
            else
            {
                lblInfo.Text = "Registration Successful";
                clearField();
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {     
            clearField();
        }
        public void clearField() {

            txtFName.Text = String.Empty;
            txtLName.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtMobile.Text = String.Empty;
            rbGender.ClearSelection();
            txtDOB.Text = String.Empty;
            txtAdd1.Text = String.Empty;
            txtAdd2.Text = String.Empty;
            txtCity.Text = String.Empty;
            ddlState.ClearSelection();
            txtPin.Text = String.Empty;
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            int status= signupBl.checkEmail(email);
            if (status > 0)
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Email is Already Registered go to <a href='Login.aspx'>Login</a>";
                clearField();
            }
            else
            {
                lblInfo.Text = "";
            }
        }

       
    }
}