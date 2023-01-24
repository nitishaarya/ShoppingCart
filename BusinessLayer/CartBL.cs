using BusinessLayer.Class;
using DataLayer;
using DataLayer.Class;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class CartBL
    {
        CartDL cartDl = new CartDL();
        public int addToCart(int itemId,int userId)
        {
            int status = 0;
            try
            {
                double price = cartDl.getPrice(itemId);
                CartBusinessObject cbo = new CartBusinessObject();
                CartDataObject cdo = new CartDataObject();
                cbo.itemId = itemId;
                cbo.userId = userId;
                cbo.itemQuantity = 1;
                cbo.totalAmount = price;
                cdo.itemId = cbo.itemId;
                cdo.userId = cbo.userId;
                cdo.itemQuantity = cbo.itemQuantity;
                cdo.totalAmount = cbo.totalAmount;
                status = cartDl.addToCart(cdo);
            }
            catch (Exception e)
            {
                throw e;
            }
            return status;
        }
        public int getItemID(int id)
        {
            return cartDl.getItemID(id);
        }
        public int countCartItem(int id)
        {
            return cartDl.countCartItem(id); 
        }
        public List<CartDataObject> displayCartItem(int id)
        {
            List<CartDataObject> list = new List<CartDataObject>();
            list = cartDl.displayCartItem(id);
            return list;
        }
        public int saveForLater(int id)
        {
            int status = cartDl.saveForLater(id);
            return status;
        }
    }
}
