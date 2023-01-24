<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShoppingCart.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Cart</title>
    <link href="css/style.css" rel="stylesheet" />  
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div class="row cartDiv">
        <h2 style="text-align:center">My Cart</h2>
        <h3 id="emptyCart" runat="server" style="text-align:center"></h3>
        <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
        <asp:GridView ID="CartGridView" runat="server" HorizontalAlign="Center" ShowFooter="True" Width="60%" OnRowDataBound="CartGridView_RowDataBound" AutoGenerateColumns="False" Height="148px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" OnRowDeleting="CartGridView_RowDeleting" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Row" HeaderText="S.No" InsertVisible="False" ReadOnly="True" SortExpression="CartID" />
                <asp:TemplateField HeaderText="Item Name" SortExpression="ItemName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbItemName" OnClick="lbItemName_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ItemBrand" HeaderText="Brand" SortExpression="ItemBrand" />
                <asp:BoundField DataField="ItemQuantity" HeaderText="Quantity" SortExpression="ItemQuantity" />
                <asp:TemplateField HeaderText="CartID" SortExpression="CartID">
                    <ItemTemplate>
                        <asp:Label ID="lblCartID" runat="server" Text='<%# Bind("CartID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lblPriceHeader" runat="server" Text="Price"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="hfPrice" Value='<%# Bind("TotalAmount") %>' runat="server" />
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("TotalAmount","{0:c}") %>' ></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblTotalAmount" ForeColor="Red" Font-Size="Large" runat="server" Text=""></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Availability">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfItemID" Value='<%# Bind("ItemID") %>' runat="server" />
                        <asp:Image ID="imgCartGrid" Width="50px" Height="50px" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" DeleteImageUrl="~/image/save-for-later.jpg" ControlStyle-CssClass="btnControl" DeleteText="Save for Later" >
<ControlStyle Height="50px" Width="150px"></ControlStyle>
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="White" Font-Size="Larger" ForeColor="#333333" />
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
