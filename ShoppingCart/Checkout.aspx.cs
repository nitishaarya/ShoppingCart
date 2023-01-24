using BusinessLayer;
using BusinessLayer.Class;
using System;
using System.Collections.Generic;

namespace ShoppingCart
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int status = 0;
            OrderBL orderBl = new OrderBL();
            List<OrderBusinessObject> list = new List<OrderBusinessObject>();
            OrderBusinessObject obo = new OrderBusinessObject();
            int userId = Convert.ToInt32(Session["userid"]);
            list = orderBl.getItem(userId);
            foreach (var item in list)
            {
                obo.userId = userId;
                obo.itemId = item.itemId;
                obo.quantity = item.quantity;
                obo.paidAmount = item.paidAmount;
                obo.address = txtAddress.Text + " " + txtCity.Text + " " + txtState.Text + " " + txtPin.Text;
                obo.status = false;
                status= orderBl.placeOrder(obo);
            }
            if (status == 0)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            { 
                orderBl.deleteItems(userId);
                Session["cart"] = 0;
                Response.Redirect("Thanks.aspx");
            }  
        }
        protected void cvCardNumber_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs e)
        {
            if (e.Value.Length == 16)
                e.IsValid = true;
            else
                e.IsValid = false;
        }
    }
}