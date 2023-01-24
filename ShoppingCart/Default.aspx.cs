using BusinessLayer;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Default : System.Web.UI.Page
    {
       
        ItemBL itembl = new ItemBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                Session["page"] = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                int id = 19;
                MobileDataList.DataSource = itembl.displayItems(id);
                MobileDataList.DataBind();
                ClothesDataList.DataSource = itembl.displayItems(1);
                ClothesDataList.DataBind();
                LaptopDataList.DataSource = itembl.displayItems(20);
                LaptopDataList.DataBind();
                TVDataList.DataSource = itembl.displayItems(21);
                TVDataList.DataBind();
            }
        }
        protected void imgBtnView_Click(object sender, ImageClickEventArgs e)
        {
            int itemid = 0;
            ImageButton myButton = sender as ImageButton;
            if (myButton != null)
            {
                itemid = Convert.ToInt32(myButton.CommandArgument);
            }
            Session["getitem"] = itemid;
            Response.Redirect("ItemDetails.aspx");
        }

        protected void imgBtnAddToCart_Click(object sender, ImageClickEventArgs e)
        {
            CartBL cartbl = new CartBL();
            int itemid = 0;
            int userid = Convert.ToInt32(Session["userid"]);
            ImageButton myButton = sender as ImageButton;
            if (myButton != null)
            {
                itemid = Convert.ToInt32(myButton.CommandArgument);
            }
            if (Session["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                int status = cartbl.addToCart(itemid, userid);
                int count = cartbl.countCartItem(Convert.ToInt32(Session["userid"]));
                Session["cart"] = count.ToString();
                if (status != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                }
            }
        }
        protected void viewMoreClothes(object sender, EventArgs e)
        {
            Session["items"] = "Shirts";
            Response.Redirect("Items.aspx?item=1");
        }
        protected void viewMoreMobiles(object sender, EventArgs e)
        {
            Session["items"] = "Mobiles";
            Response.Redirect("Items.aspx?item=19");
        }
        protected void viewMoreLaptops(object sender, EventArgs e)
        {
            Session["items"] = "Laptops";
            Response.Redirect("Items.aspx?item=20");
        }
        protected void viewMoreTV(object sender, EventArgs e)
        {
            Session["items"] = "Telivisions";
            Response.Redirect("Items.aspx?item=21");
        }
        
        public void availability(DataListItemEventArgs e)
        {
            int itemId = 0, count = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hfCount = (HiddenField)e.Item.FindControl("hfID");
                itemId = Convert.ToInt32(hfCount.Value.ToString());
                count = itembl.getItemCount(itemId);
               
            }
            Button btnAddToCart = (Button)e.Item.FindControl("btnAddToCart");
            if (count > 0)
            {
                 
            }
            else
            {
                btnAddToCart.Enabled = false;
                btnAddToCart.Attributes.CssStyle.Add("opacity", "0.4");
                btnAddToCart.Attributes.CssStyle.Add("cursor", "not-allowed");
                btnAddToCart.ToolTip = "Out of Stock!";
                 
            }
        }

        protected void MobileDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            availability(e);
        }

        protected void ClothesDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            availability(e);
        }
        protected void LaptopDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            availability(e);
        }
        protected void TVDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            availability(e);
        }

        protected void btnView_Click(object sender, EventArgs e)
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

        
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {

                int itemid = 0;
                Button myButton = sender as Button;
                if (myButton != null)
                {
                    itemid = Convert.ToInt32(myButton.CommandArgument);
                }
                int availableItem = itembl.getItemCount(itemid);
                Session["availableItem"] = availableItem;
                CartBL cartbl = new CartBL();
                int userid = Convert.ToInt32(Session["userid"]);
            if (Session["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {

                if (availableItem > 0)
                {
                    if (Page.IsPostBack)
                    {
                        int status = cartbl.addToCart(itemid, userid);
                        int count = cartbl.countCartItem(Convert.ToInt32(Session["userid"]));
                        Label BadgeLabel = this.Master.FindControl("lblBadge") as Label;
                        BadgeLabel.Text = count.ToString();
                        Session["cart"] = count.ToString();
                        if (status != 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                        }
                    }
                   
                }
                else
                {
                    myButton.Enabled = false;
                }
            }
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }
                else 
            {
               
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }

    }
}