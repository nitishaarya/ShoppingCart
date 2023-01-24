using System.Configuration;
using System.Data.SqlClient;

namespace DataLayer.Class
{
    public class MyConnection
    {
        public static SqlConnection getConnection()
        {
            string cs = ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ToString();
            SqlConnection con = new SqlConnection(cs);
            return con;
        }
    }
}
