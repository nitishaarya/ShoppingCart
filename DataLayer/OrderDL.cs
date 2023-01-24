using DataLayer.Class;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DataLayer
{
    public class OrderDL
    {
        SqlConnection con = MyConnection.getConnection();
        public int placeOrder(OrderDataObject odo)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spPlaceOrder", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", odo.userId);
                cmd.Parameters.AddWithValue("itemId",odo.itemId);
                cmd.Parameters.AddWithValue("@quantity",odo.quantity);
                cmd.Parameters.AddWithValue("@paidAmount",odo.paidAmount);
                cmd.Parameters.AddWithValue("@address",odo.address);
                cmd.Parameters.AddWithValue("@status",odo.status);
                status = cmd.ExecuteNonQuery();
            }
            catch(Exception e)
            {
                
            }
            finally
            {
                con.Close();
            }
            return status;
        }
        public List<OrderDataObject> getItem(int id)
        {
            List<OrderDataObject> listOrderItem = new List<OrderDataObject>();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spSelectCartItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId",id);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    OrderDataObject odo = new OrderDataObject();
                    odo.itemId= Convert.ToInt32(sdr["ItemID"].ToString());
                    odo.quantity= Convert.ToInt32(sdr["ItemQuantity"].ToString());
                    odo.paidAmount= Convert.ToDouble(sdr["TotalAmount"].ToString());
                    listOrderItem.Add(odo);
                }
            }
            catch { }
            finally
            {
                con.Close();
            }
            return listOrderItem;
        }

        public int deleteItems(int userId)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spDeleteOrderedItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", userId);
                status = cmd.ExecuteNonQuery();
            }
            catch { }
            finally
            {
                con.Close();
            }
            return status;
        }
        public int countItem(int userId)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("countOrderedItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId",userId);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    status = Convert.ToInt32(sdr["Count"].ToString());
                }
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
