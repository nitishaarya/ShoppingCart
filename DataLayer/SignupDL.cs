using DataLayer.Class;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class SignupDL
    {
        string cs = ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ToString();
        public int UserSignup(UserDataObject udo)
        {
            SqlConnection con = new SqlConnection(cs);
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert_Data", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fname", udo.firstName);
                cmd.Parameters.AddWithValue("@lname", udo.lastName);
                cmd.Parameters.AddWithValue("@email", udo.email);
                cmd.Parameters.AddWithValue("@mobile", udo.mobile);
                cmd.Parameters.AddWithValue("@gender", udo.gender);
                cmd.Parameters.AddWithValue("@dob", udo.dob);
                cmd.Parameters.AddWithValue("@add1", udo.address1);
                cmd.Parameters.AddWithValue("@add2", udo.address2);
                cmd.Parameters.AddWithValue("@city", udo.city);
                cmd.Parameters.AddWithValue("@state", udo.state);
                cmd.Parameters.AddWithValue("@pin", udo.pin);
                cmd.Parameters.AddWithValue("@password", udo.password);
                status = cmd.ExecuteNonQuery();

            }
            catch { }
            finally
            {
                con.Close();
            }
            return status;
        }
        public int checkEmail(string email)
        {
            SqlConnection con = new SqlConnection(cs);
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("countEmail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email",email);
                status =(Int32)cmd.ExecuteScalar();
            }
            catch { }
            finally
            {
                con.Close();
            }
            return status;
        }
        public int checkSecurity(string email)
        {
            SqlConnection con = new SqlConnection(cs);
            int realAnswer = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spSecurityAnswer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email",email);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    realAnswer = Convert.ToInt32(sdr["Pincode"].ToString());
                }
            }
            catch { }
            finally
            {
                con.Close();
            }
            return realAnswer;
        }
        public int updatePassword(string email,string password)
        {
            SqlConnection con = new SqlConnection(cs);
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spUpdatePassword", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@password",password);
                cmd.Parameters.AddWithValue("@email",email);
                status = cmd.ExecuteNonQuery();
            }
            catch { }
            finally
            {
                con.Close();
            }
            return status;
        }
    }
}
