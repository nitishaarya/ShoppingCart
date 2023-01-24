using BusinessLayer.Class;
using DataLayer;
using DataLayer.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace BusinessLayer
{
    public class AdminBL
    {
        AdminDL adminDl = new AdminDL();
        ItemDataObject ido =new ItemDataObject();
        public List<UserDataObject> displayUsers(int id)
        {
            List<UserDataObject> list = new List<UserDataObject>();
            list = adminDl.displayUsers(id);
            return list; ;
        }

        public int deleteUser(int id)
        {
            int status= adminDl.deleteUser(id);

            return status;
        }
        public int updateUser(UserBusinessObject ubo)
        {
            UserDataObject udo = new UserDataObject();
            udo.userID = ubo.userId;
            udo.admin = ubo.admin;
            int status= adminDl.updateUser(udo);
            return status;
        }
        public int insertItem(ItemBusinessObject ibo)
        {
            ido.updatedAdminId = ibo.updatedAdminId;
            ido.itemName = ibo.itemName;
            ido.itemBrand = ibo.itemBrand;
            ido.subCategoryId = ibo.subCategoryId;
            ido.price = ibo.price;
            ido.quantity = ibo.quantity;
            ido.description = ibo.description;
            ido.image = ibo.image;
            int status = adminDl.insertItem(ido);
            return status;
        }

        public List<ItemBusinessObject> displayItem()
        {
            List<ItemBusinessObject> itemList = new List<ItemBusinessObject>();
            List<ItemDataObject> list = adminDl.displayItem();
            foreach (ItemDataObject ido in list)
            {
                ItemBusinessObject ibo = new ItemBusinessObject();
                ibo.itemId = ido.itemId;
                ibo.itemName = ido.itemName;
                ibo.itemBrand = ido.itemBrand;
                ibo.subCategoryId = ido.subCategoryId;
                ibo.price = ido.price;
                ibo.newPrice = ido.newPrice;
                ibo.quantity = ido.quantity;
                ibo.description = ido.description;
                ibo.image = ido.image;
                ibo.updatedAdminId = ido.updatedAdminId;
                itemList.Add(ibo);              
            }
            return itemList;
        }


        public int deleteItem(int id)
        {
            int status = 0;
            try
            {
                status = adminDl.deleteItem(id);
            }
            catch (Exception e)
            {
                
            }
            return status;
        }
        public int updateItem(ItemBusinessObject ibo)
        {
            ido.itemId = ibo.itemId;
            ido.subCategoryId = ibo.subCategoryId;
            ido.itemName = ibo.itemName;
            ido.itemBrand = ibo.itemBrand;
            ido.price = ibo.price;
            ido.quantity = ibo.quantity;
            ido.description = ibo.description;
            ido.updatedAdminId = ibo.updatedAdminId;
            int status = adminDl.updateItem(ido);
            return status;
        }
    }
}
