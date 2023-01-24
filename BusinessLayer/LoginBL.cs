using BusinessLayer.Class;
using DataLayer;
using DataLayer.Class;
using System;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class LoginBL
    {
        public LoginBusinessObject checkCredentials(LoginBusinessObject lbo) {
            LoginDataObject ldo = new LoginDataObject();
            ldo.username = lbo.username;
            ldo.password = lbo.password;
            LoginDL loginDl = new LoginDL();
            SqlDataReader sdr = null;
            sdr= loginDl.getData(ldo);
            while (sdr.Read())
            {
                lbo.username = sdr["Email"].ToString();
                lbo.password = sdr["Password"].ToString();
                lbo.userId = Convert.ToInt32(sdr["UserID"]);
                lbo.name = sdr["FirstName"].ToString();
                lbo.isAdmin =Convert.ToBoolean(sdr["IsAdmin"].ToString());
            }
            if (sdr.HasRows)
                return lbo;
            else
                return null;
        }
    }
}
