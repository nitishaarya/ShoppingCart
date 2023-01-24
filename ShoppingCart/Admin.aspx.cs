using BusinessLayer;
using BusinessLayer.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Admin : System.Web.UI.Page
    {
        AdminBL adminbl = new AdminBL();
        ItemBusinessObject ibo = new ItemBusinessObject();
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (! Convert.ToBoolean(Session["isAdmin"]))
                    Response.Redirect("Default.aspx");
            }
            else
                Response.Redirect("Default.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Control myControlMenu = Page.Master.FindControl("navDiv");
            if (myControlMenu != null)
            {
                myControlMenu.Visible = false;
            }
        }

        protected void imgBtnUser_Click(object sender, ImageClickEventArgs e)
        {
            if (IsPostBack)
            {
                UserGridView.Visible = true;
                products.Visible = false;
                searchDiv.Visible = false;
                ProductGridView.Visible = false;
                UserGridView.DataSource = adminbl.displayUsers(Convert.ToInt32(Session["userid"]));
                UserGridView.DataBind();              
            }
        }

        protected void imgBtnProduct_Click(object sender, ImageClickEventArgs e)
        {
            if (IsPostBack)
            {
                UserGridView.Visible = false;
                ProductGridView.Visible = true;
                searchDiv.Visible = true;
                products.Visible = true;
                ProductGridView.DataSource = adminbl.displayItem();
                ProductGridView.DataBind();
            }
        }

        protected void UserGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UserGridView.EditIndex = -1;
            UserGridView.DataSource= adminbl.displayUsers(Convert.ToInt32(Session["userid"]));
            UserGridView.DataBind();
        }

        protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(UserGridView.DataKeys[e.RowIndex].Values["UserID"]);
            int status = adminbl.deleteUser(id);
            UserGridView.DataSource = adminbl.displayUsers(Convert.ToInt32(Session["userid"]));
            UserGridView.DataBind();
            if (status == 1)
                lblInfo.Text = "One User is Deleted";
            else
                lblInfo.Text = "You can't Delete";
        }

        protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UserGridView.EditIndex = e.NewEditIndex;
            UserGridView.DataSource = adminbl.displayUsers(Convert.ToInt32(Session["userid"]));
            UserGridView.DataBind();
        }

        protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id =Convert.ToInt32( UserGridView.DataKeys[e.RowIndex].Values["UserID"]);
            CheckBox isadmin = (CheckBox)UserGridView.Rows[e.RowIndex].FindControl("chkAdmin");
            UserBusinessObject ubo = new UserBusinessObject();
            ubo.userId = id;
            ubo.admin = isadmin.Checked;
            int status =adminbl.updateUser(ubo);
            ClientScript.RegisterStartupScript(upUser.GetType(), "alert", "showLabel();", true);
            if (status == 1)
                lblInfo.Text = "You have updated one Record";
            else
                lblInfo.Text = "User not updated";
            
            UserGridView.EditIndex = -1;
            UserGridView.DataSource = adminbl.displayUsers(Convert.ToInt32(Session["userid"]));
            UserGridView.DataBind();     
        }

        protected void Insert_Item(object sender, EventArgs e)
        {
            ibo.updatedAdminId = Convert.ToInt32(Session["userid"]);
            ibo.itemName = txtName.Text;
            ibo.itemBrand = ddlBrand.SelectedItem.Text;
            ibo.subCategoryId =Convert.ToInt32( ddlSubCategoryInsert.SelectedValue);
            ibo.price =Convert.ToInt32( txtPrice.Text);
            ibo.quantity = Convert.ToInt32(txtQuantity.Text);
            ibo.description = txtDescription.Text;
            byte[] image = fuImage.FileBytes;
            ibo.image = image;
            int status=adminbl.insertItem(ibo);
            txtName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ProductGridView.DataSource = adminbl.displayItem();
            ProductGridView.DataBind();  
                if (status != 0)
                    lblInfo.Text = "You have added one new Item";
                else
                    lblInfo.Text = "Something went wrong...Item not added";   
        }

        protected void ProductGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProductGridView.EditIndex = -1;
            ProductGridView.DataSource = adminbl.displayItem();
            ProductGridView.DataBind();
        }

        protected void ProductGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(ProductGridView.DataKeys[e.RowIndex].Values["ItemID"]);
            int status = adminbl.deleteItem(id);
            ProductGridView.DataSource = adminbl.displayItem();
            ProductGridView.DataBind();
                if (status == 1)
                    lblInfo.Text = "You Deleted one Item";
                else
                    lblInfo.Text = "This Item is Added in Cart.. You Can't delete";
        }

        protected void ProductGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProductGridView.EditIndex = e.NewEditIndex;
            ProductGridView.DataSource = adminbl.displayItem();
            ProductGridView.DataBind();
        }

        protected void ProductGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int itemid = Convert.ToInt32(ProductGridView.DataKeys[e.RowIndex].Values["ItemID"]);
            DropDownList subcategoryID = (DropDownList)ProductGridView.Rows[e.RowIndex].FindControl("ddlSubCategory");
            TextBox Name = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("txtItemName");
            DropDownList brand = (DropDownList)ProductGridView.Rows[e.RowIndex].FindControl("ddlItemBrand");
            TextBox price = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("txtPrice");
            TextBox quantity = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("txtQuantity");
            TextBox description = (TextBox)ProductGridView.Rows[e.RowIndex].FindControl("txtDescription");
            ibo.subCategoryId = Convert.ToInt32( subcategoryID.SelectedValue);
            ibo.itemId = itemid;
            ibo.itemName = Name.Text;
            ibo.itemBrand = brand.SelectedItem.Text;
            ibo.price =Convert.ToDouble(price.Text);
            ibo.quantity = Convert.ToInt32(quantity.Text);
            ibo.description = description.Text;
            ibo.updatedAdminId= Convert.ToInt32(Session["userid"]);
            int status = adminbl.updateItem(ibo);
            ProductGridView.EditIndex = -1;
            ProductGridView.DataSource = adminbl.displayItem();
            ProductGridView.DataBind();
            if (status != 0)
            {
                if (IsCallback)
                {
                    lblInfo.Text = "You updated one Item";
                }
            }
            else
            {
                lblInfo.Text = "You can't update this Item";
            }
            
        }

        protected void lbSearch_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                UserGridView.Visible = false;
                ProductGridView.Visible = true;
                List<ItemBusinessObject> list = adminbl.displayItem();
                var searchs = list.Where(q => ((q.itemName+""+q.itemBrand+""+q.description).ToLower()).Contains(txtSearch.Text.ToLower())).ToList();
                ProductGridView.DataSource = searchs;
                ProductGridView.DataBind();
            }
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<ItemBusinessObject> list = adminbl.displayItem();
            if (ddlSort.SelectedValue == "Price")
            {
                var sortedByPrice = from item in list orderby item.price select item;
                ProductGridView.DataSource = sortedByPrice;
                ProductGridView.DataBind();
            }
            else if (ddlSort.SelectedValue == "Name")
            {
                var sortedByName = from q in list orderby q.itemName select q;
                ProductGridView.DataSource = sortedByName;
                ProductGridView.DataBind();
            }
            else if (ddlSort.SelectedValue == "Brand")
            {
                var sortedByBrand = from q in list orderby q.itemBrand select q;
                ProductGridView.DataSource = sortedByBrand;
                ProductGridView.DataBind();
            }
            else if (ddlSort.SelectedValue == "Quantity")
            {
                var sortedByQuantity = from q in list orderby q.quantity select q;
                ProductGridView.DataSource = sortedByQuantity;
                ProductGridView.DataBind();
            }
            else
            {
                ProductGridView.DataSource = list;
                ProductGridView.DataBind();
            }
        }

        protected void ddlCategoryInsert_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubCategoryInsert.Items.Clear();
            ddlBrand.Items.Clear();
        }

        protected void ddlSubCategoryInsert_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBrand.Items.Clear();
        }
    }
}