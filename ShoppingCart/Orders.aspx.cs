using BusinessLayer;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderBL orderbl = new OrderBL();
            Session["page"] = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            int userid = 0;
            if (Session["userid"] != null)
            {
                userid = Convert.ToInt32(Session["userid"].ToString());
            }
            int count = orderbl.countItem(userid);
            if (Session["userid"] == null)
            {
                //lblCart.Text = "You have not Logged in!!";
                noOrder.InnerHtml = "You have not Logged in";
                imgBtnCart.ImageUrl = "~/image/login.png";
                imgBtnCart.PostBackUrl = "Login.aspx";

            }
            else if (count == 0)
            {
                noOrder.InnerHtml = "You have not Ordered anything";
                imgBtnCart.Visible = true;
                imgBtnCart.ImageUrl = "~/image/start-shopping.jpg";
                imgBtnCart.PostBackUrl = "Default.aspx";

            }
            else
            {
                noOrder.InnerHtml = "";
                imgBtnCart.Visible = false;
                SqlDataSource1.SelectCommand = "select orders.OrderID,Item.ItemName,item.ItemBrand,item.Image,orders.Quantity,orders.PaidAmount,Orders.Address,Orders.Date,Orders.status from Orders inner join item on Orders.ItemID=item.ItemID where userid="+userid;
            }
        }
        protected void OrderGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Image"]);
                (e.Row.FindControl("imgOrder") as Image).ImageUrl = imageUrl;
            }

        }
    }
}