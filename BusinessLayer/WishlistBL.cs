using DataLayer;
using DataLayer.Class;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class WishlistBL
    {
        WishlistDL wishDl = new WishlistDL();
        public List<CartDataObject> displayWishlistItem(int id)
        {
            List<CartDataObject> list = new List<CartDataObject>();
            list = wishDl.displayWishlistItem(id);
            return list;
        }
        public int countCart(int id)
        {

            return wishDl.countCart(id);

        }
        public int deleteItem(int id)
        {
            int status = wishDl.deleteItem(id);
            return status;
        }
    }
}
