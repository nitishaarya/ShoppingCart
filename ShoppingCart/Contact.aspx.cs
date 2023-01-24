using System;
using System.Net.Mail;

namespace ShoppingCart
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            this.Form.DefaultButton = this.Submit.UniqueID;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string senderMail = txtEmail.Text;
            try
            {
                SendMail();
            }
            catch (Exception ex)
            {
                Response.Write("Could not send the e-mail - error: " + ex.Message);
            }
            clearField();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        }

        public void SendMail()
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("akhilesh5045@gmail.com");

            mail.From = new MailAddress("akumar2@talentquest.com");
            mail.Subject = txtEmail.Text;
            string Body = "Name : "+txtName.Text+" Message : "+txtMessage.Text;
            mail.Body = Body;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("abhirazz11@gmail.com", "aksh143kisuu");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        public void clearField()
        {
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
        
    }
}