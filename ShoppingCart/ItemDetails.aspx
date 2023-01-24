<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" EnableEventValidation="false" Inherits="ShoppingCart.ItemDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ItemDetail.css" rel="stylesheet" />
    <script src="script/ItemScript.js"></script>
    <script src="script/ItemDetails.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.rawgit.com/elevateweb/elevatezoom/master/jquery.elevateZoom-3.0.8.min.js"></script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ItemDetailDIv">
        <asp:DataList ID="ItemDetailsDataList" runat="server" OnItemDataBound="ItemDetailsDataList_ItemDataBound" RepeatDirection="Horizontal" RepeatColumns="5" HorizontalAlign="Center" Width="97%">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' GenerateEmptyAlternateText="True" runat="server" Height="300" Width="250" /><br />
                <h2><%# Eval("ItemName") %></h2>
                <h3><%# Eval("ItemBrand")%></h3>
                <h4><strike>Price: <%# Eval("NewPrice","{0:c}")%></strike></h4>
                <h3 style="color:red"> <%# Eval("Price","{0:c}")%></h3>
                <br />
                <h4>Description: <%# Eval("Description")%></h4>
                <asp:HiddenField ID="hfID" Value='<%# Eval("ItemID") %>' runat="server" />
                <h1> <asp:Button ID="btnAddToCart" runat="server" CssClass="button" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("ItemID") %>' Text="Add to Cart" /> </h1>
            </ItemTemplate>
        </asp:DataList>
        <button type="button" id="btnShowPopup" style="visibility: hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <span style="font-size: 40px; font-family: cursive; color: green">Added to Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
