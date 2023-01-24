using BusinessLayer;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class ItemDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                ItemBL itemBl = new ItemBL();
                Session["page"] = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                ItemDetailsDataList.DataSource = itemBl.displayItemdetails(Convert.ToInt32(Session["getitem"].ToString()));
                ItemDetailsDataList.DataBind();
            }
        }
       
        protected void ItemDetailsDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            ItemBL itemBl = new ItemBL();
            int itemId = 0, count = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hfCount = (HiddenField)e.Item.FindControl("hfID");
                itemId = Convert.ToInt32(hfCount.Value.ToString());
                count = itemBl.getItemCount(itemId);
            }
            
            Button imgBtn = (Button)e.Item.FindControl("btnAddToCart");
            if (count < 1)
            {
                imgBtn.Enabled = false;
                imgBtn.Attributes.CssStyle.Add("opacity", "0.4");
                imgBtn.Attributes.CssStyle.Add("cursor", "not-allowed");
                imgBtn.ToolTip = "Out of Stock";
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
    }
}