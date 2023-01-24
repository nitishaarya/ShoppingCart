using System;

namespace DataLayer.Class
{
    public class CartDataObject
    {
        public int row
        {
            get;
            set;
        }
        public int cartId
        {
            get;
            set;
        }
        public int itemId
        {
            get;
            set;
        }
        public string itemName
        {
            get;
            set;
        }
        public string itemBrand
        {
            get;
            set;
        }
        public int userId
        {
            get;
            set;
        }
        public int itemQuantity
        {
            get;
            set;
        }
        public double totalAmount
        {
            get;
            set;
        }
        public DateTime date
        {
            get;
            set;
        }
    }
}
