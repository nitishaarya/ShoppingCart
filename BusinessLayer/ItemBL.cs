using DataLayer;
using DataLayer.Class;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class ItemBL
    {
        ItemDL itemDl = new ItemDL();
        public List<ItemDataObject> displayItems(int itemId)
        {
            List<ItemDataObject> list = new List<ItemDataObject>();
            list = itemDl.displayItems(itemId);
            return list;
        }
        public List<ItemDataObject> displayItemCategory(int itemId)
        {
            List<ItemDataObject> list = new List<ItemDataObject>();
            list = itemDl.displayItemCategory(itemId);
            return list;
        }
        public List<ItemDataObject> displayItemdetails(int id)
        {
            List<ItemDataObject> list = new List<ItemDataObject>();
            list = itemDl.displayItemdetails(id);
            return list;
        }
        public int getItemCount(int itemId)
        {
            return itemDl.getItemCount(itemId);
        }
    }
}
