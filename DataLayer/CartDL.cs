using DataLayer.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class CartDL
    {
        
        SqlConnection con = MyConnection.getConnection();
        public double getPrice(int itemid)
        {
            double price = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spCartItemPrice", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", itemid);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    price= Convert.ToDouble(sdr["Price"]);
                }
            }
            finally
            {
                con.Close();
            }
            return price;
        }
        public int getItemID(int id)
        {
            int itemid = 0;
            try
            {
                con.Open();
                SqlCommand cmds = new SqlCommand("spItemIdFromWishlist", con);
                cmds.CommandType = CommandType.StoredProcedure;
                cmds.Parameters.AddWithValue("@id", id);
                SqlDataReader sdr = cmds.ExecuteReader();
                while (sdr.Read())
                {
                    itemid = Convert.ToInt32(sdr["ItemID"].ToString());
                }
            }
            finally
            {
                con.Close();
            }
            return itemid;
        }
        public int addToCart(CartDataObject cdo)
        {
            int status = 0;
            
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insertCart",con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@itemID",cdo.itemId);
                cmd.Parameters.AddWithValue("@userID",cdo.userId);
                cmd.Parameters.AddWithValue("@quantity",cdo.itemQuantity);
                cmd.Parameters.AddWithValue("@total",cdo.totalAmount);
                status = cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return status;
        }
        public int countCartItem(int id)
        {
            Int32 count = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spCountcartItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", id);
                count=(Int32)cmd.ExecuteScalar();
            }
            finally
            {
                con.Close();
            }
            return count;
        }
        public List<CartDataObject> displayCartItem(int id)
        {
            List<CartDataObject> listCartItem = new List<CartDataObject>();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spDisplaycartItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", id);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    CartDataObject cdo = new CartDataObject();
                    cdo.row = Convert.ToInt32(sdr["Row"].ToString());
                    cdo.itemId = Convert.ToInt32(sdr["ItemID"].ToString());
                    cdo.cartId= Convert.ToInt32(sdr["CartID"].ToString());
                    cdo.itemName = sdr["ItemName"].ToString();
                    cdo.itemBrand = sdr["ItemBrand"].ToString();
                    cdo.itemQuantity= Convert.ToInt32(sdr["ItemQuantity"].ToString());
                    cdo.totalAmount= Convert.ToDouble(sdr["TotalAmount"].ToString());
                    listCartItem.Add(cdo);
                }
            }
            finally
            {
                con.Close();
            }
            return listCartItem;
        }
        public int saveForLater(int id)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spMoveToWishlist", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cartId", id);
                status= cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return status;
        }
    }
}
