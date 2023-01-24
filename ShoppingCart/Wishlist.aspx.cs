using BusinessLayer;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());


                Session["page"] = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                if (Session["userid"] == null)
                {
                    btnCart.Text = "Login";
                    btnCart.PostBackUrl = "Login.aspx";
                    emptyCart.InnerHtml = "You have not Logged in";
                }
                else
                {
                    WishlistBL wishbl = new WishlistBL();
                    int count = wishbl.countCart(Convert.ToInt32(Session["userid"]));
                    if (count == 0)
                    {
                        btnCart.Text = "Start Shopping";
                        btnCart.PostBackUrl = "Default.aspx";
                        emptyCart.InnerHtml = "Your Wish List is Empty";
                    }
                    else
                    {
                        btnCart.Text = "Go to Cart";
                        btnCart.PostBackUrl = "Cart.aspx";
                        emptyCart.InnerHtml = "You have " + count + " Items in Wishlist";
                        WishlistGridView.DataSource = wishbl.displayWishlistItem(Convert.ToInt32(Session["userid"]));
                        WishlistGridView.DataBind();
                    }
                }
            }
        }
        protected void WishlistGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            WishlistBL wishbl = new WishlistBL();
            var lblWishID = WishlistGridView.Rows[e.RowIndex].FindControl("lblWishID") as Label;
            int id = Convert.ToInt32(lblWishID.Text);
            int status = wishbl.deleteItem(id);
            WishlistGridView.DataSource = wishbl.displayWishlistItem(Convert.ToInt32(Session["userid"]));
            WishlistGridView.DataBind();
            Response.Redirect(Request.Url.AbsoluteUri);
            if (status == 1)
                lblInfo.Text = "You have removed One Item from Wish List";
            else
                lblInfo.Text = "You can't Remove It";
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

        protected void lbAddCart_Click(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                CartBL cartbl = new CartBL();
                WishlistBL wishbl = new WishlistBL();
                int userid = Convert.ToInt32(Session["userid"]);
                var lb = (LinkButton)sender;
                var row = (GridViewRow)lb.NamingContainer;
                var lbl = row.FindControl("lblWishID") as Label;
                int itemid = Convert.ToInt32(lbl.Text);
                int status = cartbl.addToCart(cartbl.getItemID(itemid), userid);
                wishbl.deleteItem(itemid);
                WishlistGridView.DataSource = wishbl.displayWishlistItem(Convert.ToInt32(Session["userid"]));
                WishlistGridView.DataBind();
                int wishCount= wishbl.countCart(Convert.ToInt32(Session["userid"]));
                emptyCart.InnerHtml = "You have " + wishCount + " Items in Wishlist";
                int count = cartbl.countCartItem(Convert.ToInt32(Session["userid"]));
                Label BadgeLabel = this.Master.FindControl("lblBadge") as Label;
                BadgeLabel.Text = count.ToString();
                Session["cart"] = count;
                if (status == 1)
                    lblInfo.Text = "You have added one item to cart";
                else
                    lblInfo.Text = "You can't add to cart";
                
                Response.Redirect(Request.Url.AbsoluteUri);

                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }
    }
}