using BusinessLayer;
using BusinessLayer.Class;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Items : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                ItemBL itembl = new ItemBL();
                lblCategoryInfo.Text = Session["items"].ToString();
                if (Convert.ToInt32(Request.QueryString["item"]) < 100)
                {
                    ItemDataList.DataSource = itembl.displayItems(Convert.ToInt32(Request.QueryString["item"]));
                    ItemDataList.DataBind();
                    if (ItemDataList.Items.Count != 0)
                    {
                        ItemDataList.Visible = true;
                    }
                    else
                    {
                        ItemDataList.Visible = false;
                        lblNoProduct.Text = "Currently Item of this Category is Not Available!";
                    }
                }
                else
                {
                    ItemDataList.DataSource = itembl.displayItemCategory(Convert.ToInt32(Request.QueryString["item"]));
                    ItemDataList.DataBind();
                    if (ItemDataList.Items.Count != 0)
                    {
                        ItemDataList.Visible = true;
                    }
                    else
                    {
                        ItemDataList.Visible = false;
                        lblNoProduct.Text = "Currently Item of this Category is Not Available!";
                    }
                }
            }
        }
        

        protected void ItemDataList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ItemDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            ItemBL itembl = new ItemBL();
            int itemId = 0, count = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hfCount = (HiddenField)e.Item.FindControl("hfID");
                itemId = Convert.ToInt32(hfCount.Value.ToString());
                count = itembl.getItemCount(itemId);
            }
            Button addBtn = (Button)e.Item.FindControl("btnAddToCart");
            if (count <= 0)
            {
                addBtn.Enabled = false;
                addBtn.Attributes.CssStyle.Add("opacity", "0.4");
                addBtn.Attributes.CssStyle.Add("cursor", "not-allowed");
                addBtn.ToolTip = "Out of Stock!";
            }
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                CartBL cartbl = new CartBL();
                int itemid = 0;
                int userid = Convert.ToInt32(Session["userid"]);
                Button myButton = sender as Button;
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
                    Label BadgeLabel = this.Master.FindControl("lblBadge") as Label;
                    BadgeLabel.Text = count.ToString();
                    Session["cart"] = count.ToString();
                    if (status != 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                    }
                }
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }

        }
        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
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
    }
}