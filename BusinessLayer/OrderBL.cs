using BusinessLayer.Class;
using DataLayer;
using DataLayer.Class;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class OrderBL
    {
        OrderDL orderDl = new OrderDL();
        OrderDataObject odo = new OrderDataObject();
        public int placeOrder(OrderBusinessObject obo)
        {
            odo.itemId = obo.itemId;
            odo.userId = obo.userId;
            odo.quantity = obo.quantity;
            odo.paidAmount = obo.paidAmount;
            odo.address = obo.address;
            odo.status = obo.status;
            int status = orderDl.placeOrder(odo);
            return status;
        }

        public List<OrderBusinessObject> getItem(int id)
        {
            List<OrderDataObject> listPrev = orderDl.getItem(id);
            List<OrderBusinessObject> list = listPrev.ConvertAll(x=>convertlist(x));
            return list;
        }
        public OrderBusinessObject convertlist(OrderDataObject odo)
        {
            OrderBusinessObject obo = new OrderBusinessObject();
            obo.itemId = odo.itemId;
            obo.quantity = odo.quantity;
            obo.paidAmount = odo.paidAmount;
            return obo;
        }
        public int deleteItems(int id)
        {
            int status = orderDl.deleteItems(id);
            return status;
        }
        public int countItem(int userId)
        {
            return orderDl.countItem(userId);
        }
       
    }
}
