using BusinessLayer;
using System;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace ShoppingCart
{
    public partial class Forgot : System.Web.UI.Page
    {
        SignupBL signupbl = new SignupBL();
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            int status = signupbl.checkEmail(email);
            if (status == 0)
            {
                lblInfo.Text = "This Email is not Registered Go to <a href='SignUp.aspx'> Signup Page</a>";
            }
            else
            {
                SendMail();
                txtEmail.Enabled = false;
                security.Visible = true;
                lblInfo.Visible = false;
                btnSubmit.Visible = false;
            }
        }

        protected void btnAnswer_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            int givenAnswer = Convert.ToInt32(txtPin.Text);
            int actualAnswer =Convert.ToInt32(Session["otp"].ToString());
            if (givenAnswer != actualAnswer)
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Please Enter Correct OTP Or <a href='SignUp.aspx'> SignUp </a> to continue";
                txtPin.Text = string.Empty;
            }
            else
            {
                lblInfo.Visible = false;
                security.Visible = false;
                newPassword.Visible = true;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            int status = signupbl.updatePassword(email,password);
            if (status == 0)
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Something went Wrong.. Try Again";
                txtEmail.Text = string.Empty;
                newPassword.Visible = false;
            }
            else
            {
                txtEmail.Visible = false;
                lblInfo.Visible = true;
                newPassword.Visible = false;
                lblInfo.Text = "Password Changed Successfully Go to <a href='Login.aspx'> Login</a>";
            }
        }
        public void SendMail()
        {
            try
            {
                Random rnd = new Random();
                int value = rnd.Next(100000, 999999);
                Session["otp"] = value;
                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text);
                mail.From = new MailAddress("akumar2@talentquest.com");
                mail.Subject = "Forgot Password!";
                string Body = "Enter this OTP to reset your Password :" + value;
                mail.Body = Body;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("abhirazz11@gmail.com", "aksh143kisuu");
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
            catch { }
        }
        public void SendSms()
        {
            string URL = "https://smsapi.engineeringtgr.com/send/?Mobile=9492040362&Password=Only4sms@&Message=text&To=6201226351&Key=GJAU4YJ4Q8XBKWRWILY9NIZDVB011SIR";

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.Method = "GET";
            request.ContentType = "application/json";
            request.ContentLength = 0;// DATA.Length;

            try
            {
                WebResponse webResponse = request.GetResponse();
                Stream webStream = webResponse.GetResponseStream();
                StreamReader responseReader = new StreamReader(webStream);
                string response = responseReader.ReadToEnd();
                Console.Out.WriteLine(response);
                responseReader.Close();
            }
            catch (Exception xe)
            {
                Console.Out.WriteLine("-----------------");
                Console.Out.WriteLine(xe.Message);
            }
        }
    }
}