using BusinessLayer;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["page"]=  System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            if (Session["userid"] == null)
            {
                emptyCart.InnerHtml = "You have not Logged in";
                btnCart.Text = "Login";
                btnCart.PostBackUrl = "Login.aspx"; 
            }
            else
            {
                CartBL cartbl = new CartBL();
                int count=cartbl.countCartItem(Convert.ToInt32(Session["userid"]));
                Session["cart"] = count.ToString();
                if (count == 0)
                {
                    emptyCart.InnerHtml = "Your Shopping Cart is Empty";
                    btnCart.Text = "Start Shopping";
                    btnCart.PostBackUrl = "Default.aspx";
                }
                else
                {
                    btnCart.Text = "Proceed to Payment";
                    btnCart.PostBackUrl = "Checkout.aspx";
                    emptyCart.InnerHtml = "You have " + count + " Items in your cart";
                    CartGridView.DataSource = cartbl.displayCartItem(Convert.ToInt32(Session["userid"]));
                    CartGridView.DataBind();
                    CalculateAmount();
                }
            }
        }
        private void CalculateAmount()
        {
            double total = 0;
            foreach (GridViewRow row in CartGridView.Rows)
            {

                var hfPrice = row.FindControl("hfPrice") as HiddenField;
                double number;
                if (double.TryParse(hfPrice.Value, out number))
                {
                    total += number;
                }

            }
            GridViewRow rows = CartGridView.FooterRow;
            var finalPrice = rows.FindControl("lblTotalAmount") as Label;
            finalPrice.Text = "Total Amount :  " + string.Format("{0:C}", total);
        }

        protected void CartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CartBL cartbl = new CartBL();
            var lblCartID = CartGridView.Rows[e.RowIndex].FindControl("lblCartID") as Label;
            int id = Convert.ToInt32(lblCartID.Text);
            int status = cartbl.saveForLater(id);
            CartGridView.DataSource = cartbl.displayCartItem(Convert.ToInt32(Session["userid"]));
            CartGridView.DataBind();
            CalculateAmount();
            if (status == 0)
                lblInfo.Text = "You can't move to wishlist";
            else
                lblInfo.Text = "You have Saved one Item to Checkout Later";
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void CartGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            CartBL cartbl = new CartBL();
            ItemBL itembl = new ItemBL();
            int itemid=0, count=0;
            bool eligibilityCheckout = true;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hfItemId = (e.Row.FindControl("hfItemID") as HiddenField);
                itemid =Convert.ToInt32(hfItemId.Value);
                count = itembl.getItemCount(itemid);
            }
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image img = (e.Row.FindControl("imgCartGrid") as Image);
                if (count == 0)
                {
                    img.ImageUrl = "~/image/outofstock.jpg";
                    eligibilityCheckout = false;
                }
                else
                {
                    img.ImageUrl = "~/image/available.png";
                }
            }
            if (!eligibilityCheckout)
            {
                btnCart.Attributes.CssStyle.Add("opacity", "0.4");
                btnCart.Enabled = false;
                btnCart.Attributes.CssStyle.Add("cursor", "not-allowed");
;                btnCart.ToolTip = "Remove OutOfStock items from your cart to checkout";
            }
        }

        protected void lbItemName_Click(object sender, EventArgs e)
        {
            int itemid = 0;
            LinkButton myButton = sender as LinkButton;
            if (myButton != null)
            {
                itemid = Convert.ToInt32(myButton.CommandArgument);
            }
            Session["getitem"] = itemid;
            Response.Redirect("ItemDetails.aspx");
        }
    }
}