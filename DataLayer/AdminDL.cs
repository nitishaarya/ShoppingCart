using DataLayer.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class AdminDL
    {
       
        SqlConnection con = MyConnection.getConnection();
        public List<UserDataObject> displayUsers(int id)
        {
            
            List<UserDataObject> listUsers = new List<UserDataObject>();
            try
            {  
                con.Open();
                SqlCommand cmd = new SqlCommand("spDisplayUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId",id);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    UserDataObject udo = new UserDataObject();
                    udo.userID= Convert.ToInt32(sdr["UserID"].ToString());
                    udo.firstName= sdr["FirstName"].ToString();
                    udo.lastName= sdr["LastName"].ToString();
                    udo.email= sdr["Email"].ToString();
                    udo.mobile= sdr["Mobile"].ToString();
                    udo.gender= sdr["Gender"].ToString();
                    udo.address1= sdr["Address1"].ToString();
                    udo.address2= sdr["Address2"].ToString();
                    udo.city= sdr["City"].ToString();
                    udo.state= sdr["State"].ToString();
                    udo.pin= Convert.ToInt32(sdr["Pincode"].ToString());
                    udo.admin =Convert.ToBoolean(sdr["IsAdmin"].ToString());
                    listUsers.Add(udo);
                }  
            }
            finally
            {
                con.Close();
            }
            return listUsers;
        }


        public int deleteUser(int id)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("deleteUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId",id);
                status = cmd.ExecuteNonQuery();
            }
            finally {
                con.Close();
            }
            return status;
        }
        public int updateUser(UserDataObject udo)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("updateUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@admin", udo.admin);
                cmd.Parameters.AddWithValue("@id",udo.userID);
                status=cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return status;
        }
        public int insertItem(ItemDataObject ido)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert_Item",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@iName",ido.itemName);
                cmd.Parameters.AddWithValue("@iBrand",ido.itemBrand);
                cmd.Parameters.AddWithValue("@subCatID",ido.subCategoryId);
                cmd.Parameters.AddWithValue("@price",ido.price);
                cmd.Parameters.AddWithValue("@quantity",ido.quantity);
                cmd.Parameters.AddWithValue("@desc",ido.description);
                cmd.Parameters.AddWithValue("@image",ido.image);
                cmd.Parameters.AddWithValue("@adminId",ido.updatedAdminId);
                status = cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return status;
        }
        public List<ItemDataObject> displayItem()
        {
            List<ItemDataObject> itemList = new List<ItemDataObject>();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spDisplayItems",con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader sdr = cmd.ExecuteReader();
                int i = 0;
                while (sdr.Read())
                {
                    ItemDataObject ido = new ItemDataObject();
                    ido.itemId= Convert.ToInt32(sdr["ItemID"].ToString());
                    ido.itemName = sdr["ItemName"].ToString();
                    ido.itemBrand = sdr["ItemBrand"].ToString();
                    ido.subCategoryId= Convert.ToInt32(sdr["SubCategoryID"].ToString());
                    ido.price= Convert.ToDouble(sdr["Price"].ToString());
                    ido.quantity= Convert.ToInt32(sdr["Quantity"].ToString());
                    ido.description= sdr["Description"].ToString();
                    ido.updatedAdminId= Convert.ToInt32(sdr["UpdatedAdminID"].ToString());
                    ido.image= (byte[])sdr["Image"];
                    itemList.Add(ido);
                }
            }
            finally
            {
                con.Close();
            }
            return itemList;
        }

        public int deleteItem(int id)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spDeleteItemByAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@itemId", id);
                status = cmd.ExecuteNonQuery();
            }
            catch(SqlException se)
            {
                throw se;
            }
            finally
            {
                con.Close();
            }
            return status;
        }
        public int updateItem(ItemDataObject ido)
        {
            int status = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spUpdateItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@itemName",ido.itemName);
                cmd.Parameters.AddWithValue("@itemBrand", ido.itemBrand);
                cmd.Parameters.AddWithValue("@subCatId", ido.subCategoryId);
                cmd.Parameters.AddWithValue("@price",ido.price);
                cmd.Parameters.AddWithValue("@quantity", ido.quantity);
                cmd.Parameters.AddWithValue("@desc", ido.description);
                cmd.Parameters.AddWithValue("@adminId",ido.updatedAdminId);
                cmd.Parameters.AddWithValue("@itemId", ido.itemId);
                status = cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return status;
        }
    }
}
