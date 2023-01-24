using DataLayer.Class;
using System.Data.SqlClient;

namespace DataLayer
{
    public class LoginDL
    {
        SqlConnection con = MyConnection.getConnection();
        
        public SqlDataReader getData(LoginDataObject ldo)
        {
            string username = ldo.username;
            string password = ldo.password;
            SqlDataReader sdr = null;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spLogin", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username",username);
                cmd.Parameters.AddWithValue("@password",password);
                sdr = cmd.ExecuteReader();
            }
            finally {}
            
            return sdr;
            

        }

    }
}
