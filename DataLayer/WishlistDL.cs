using DataLayer.Class;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DataLayer
{
    public class WishlistDL
    {
        SqlConnection con = MyConnection.getConnection();
        public int countCart(int id)
        {
            int count = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spCountWishlist", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", id);
                count = (Int32)cmd.ExecuteScalar();
            }
            catch { }
            finally
            {
                con.Close();
            }
            return count;
        }
        public List<CartDataObject> displayWishlistItem(int id)
        {
            List<CartDataObject> list = new List<CartDataObject>();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spWishlistItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", id);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    CartDataObject cdo = new CartDataObject();
                    cdo.row = Convert.ToInt32(sdr["Row"].ToString());
                    cdo.itemId= Convert.ToInt32(sdr["ItemID"].ToString());
                    cdo.cartId = Convert.ToInt32(sdr["ID"].ToString());
                    cdo.itemName = sdr["ItemName"].ToString();
                    cdo.itemBrand = sdr["ItemBrand"].ToString();
                    cdo.itemQuantity = Convert.ToInt32(sdr["ItemQuantity"].ToString());
                    cdo.totalAmount = Convert.ToDouble(sdr["TotalAmount"].ToString());
                    cdo.date =Convert.ToDateTime(sdr["Date"].ToString());
                    list.Add(cdo);
                }
            }
            catch { }
            finally
            {
                con.Close();
            }
            return list;
        }
        public int deleteItem(int id)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spDeleteWishlistItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
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
