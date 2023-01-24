using DataLayer.Class;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DataLayer
{
    public class ItemDL
    {
        SqlConnection con = MyConnection.getConnection();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="itemid"></param>
        /// <returns></returns>
        public List<ItemDataObject> displayItems(int itemid)
        {
            List<ItemDataObject> listItem = new List<ItemDataObject>();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spSubCategoryItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subCatId", itemid);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    ItemDataObject ido = new ItemDataObject();
                    ido.itemName = sdr["ItemName"].ToString();
                    ido.price = Convert.ToDouble( (sdr["Price"].ToString()));
                    ido.newPrice= Convert.ToDouble((sdr["NewPrice"].ToString()));
                    ido.image = (byte[])sdr["Image"];
                    ido.itemId = Convert.ToInt32(sdr["ItemID"].ToString());
                    listItem.Add(ido);
                }
            }
            
            finally
            {
                con.Close();
            }
            return listItem;
        }
        public List<ItemDataObject> displayItemCategory(int itemid)
        {
            List<ItemDataObject> listCategoryItem = new List<ItemDataObject>();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spCategoryItem", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@catId", itemid);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    ItemDataObject ido = new ItemDataObject();
                    ido.itemName = sdr["ItemName"].ToString();
                    ido.price = Convert.ToDouble(sdr["Price"].ToString());
                    ido.newPrice = Convert.ToDouble(sdr["NewPrice"].ToString());
                    ido.image = (byte[])sdr["Image"];
                    ido.itemId = Convert.ToInt32(sdr["ItemID"].ToString());
                    listCategoryItem.Add(ido);
                }
            }
            
            finally
            {
                con.Close();
            }
            return listCategoryItem;
        }
        public List<ItemDataObject> displayItemdetails(int id)
        {
            List<ItemDataObject> listItemDetail = new List<ItemDataObject>();
            ItemDataObject ido = new ItemDataObject();

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spItemDetails", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@itemId",id);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    ido.itemId = id;
                    ido.itemName= sdr["ItemName"].ToString();
                    ido.itemBrand= sdr["ItemBrand"].ToString();
                    ido.price= Convert.ToDouble(sdr["Price"].ToString());
                    ido.newPrice = Convert.ToDouble(sdr["NewPrice"].ToString());
                    ido.description = sdr["Description"].ToString();
                    ido.image= (byte[])sdr["Image"];
                    listItemDetail.Add(ido);
                }
            }
            
            finally
            {
                con.Close();
            }
            return listItemDetail;
        }
        public int getItemCount(int itemId)
        {
            int count = 0;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spItemCount",con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("itemId",itemId);
                count = (int)cmd.ExecuteScalar();
            }
            finally
            {
                con.Close();
            }
            return count;
        }
    }
}
