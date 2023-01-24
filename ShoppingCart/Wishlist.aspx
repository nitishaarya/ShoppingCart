<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" EnableEventValidation="false" Inherits="ShoppingCart.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    <link href="css/style.css" rel="stylesheet" />
    <script src="script/cartScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row cartDiv" style="text-align:center;min-height:80vh">
        <h2 style="text-align:center">My Wishlist</h2>
        <h3 id="emptyCart" runat="server" style="text-align:center"></h3>
        <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
        <asp:GridView ID="WishlistGridView" runat="server" HorizontalAlign="Center" ShowFooter="True" Width="60%" AutoGenerateColumns="False" Height="148px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" OnRowDeleting="WishlistGridView_RowDeleting" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Row" HeaderText="S.No" InsertVisible="False" ReadOnly="True" SortExpression="CartID" />
                <asp:TemplateField HeaderText="Item Name" SortExpression="ItemName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbItemName" OnClick="lbItemName_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"><asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ItemBrand" HeaderText="Brand" SortExpression="ItemBrand" />
                <asp:BoundField DataField="ItemQuantity" HeaderText="Quantity" SortExpression="ItemQuantity" />
                <asp:TemplateField HeaderText="ID" SortExpression="CartID">
                    <ItemTemplate>
                        <asp:Label ID="lblWishID" runat="server" Text='<%# Bind("CartID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lblPriceHeader" runat="server" Text="Price"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("TotalAmount","{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Add to Cart">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbAddCart" CausesValidation="false" OnClick="lbAddCart_Click" runat="server" ToolTip="Add to Cart"><i class="fa fa-cart-arrow-down" style="font-size:40px;color:#40ae9f;padding:5px;" aria-hidden="true"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle Height="50px" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDeleteCart" runat="server" CausesValidation="False" CommandName="Delete" ToolTip="Delete from Wishlist"><i class="fa fa-trash-o" style="font-size:40px;color:red;padding:5px"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle Height="50px" Width="50px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" Font-Size="X-Large" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" Font-Size="Large" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" HorizontalAlign="Center" Font-Size="Larger" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:Button ID="btnCart" CssClass="button" runat="server"/>
    </div>
</asp:Content>
