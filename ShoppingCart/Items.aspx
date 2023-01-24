<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Items.aspx.cs" Inherits="ShoppingCart.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/defaultCss.css" />
    <script src="script/ItemScript.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        $(window).on('load', function () {
		$(".se-pre-con").fadeOut("slow");;
        });
    </script>
     <style>
        .no-js #loader { display: none;  }
        .js #loader { display: block; position: absolute; left: 100px; top: 0; }
        .se-pre-con {
	        position: fixed;
	        left: 0px;
	        top: 0px;
	        width: 100%;
	        height: 100%;
	        z-index: 9999;
	        background: url(image/Preloader1.gif) center no-repeat #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="se-pre-con"></div>
    <div class="divProduct" style="min-height:78vh">    
     <button type="button" id="btnShowPopup" style="display:none" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"></button>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <span style="font-size: 40px;font-family: cursive;color: green">Added to Cart</span>
                    </div>  
                </div>
            </div>
            </div>
        </div>
        
        <div class="itemDiv">
            <h2>
                <asp:Label ID="lblCategoryInfo" runat="server" Text="Label"></asp:Label></h2>
            <h3 style="text-align:center">
                <asp:Label ID="lblNoProduct" runat="server"></asp:Label></h3>
            <asp:DataList ID="ItemDataList" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" OnItemDataBound="ItemDataList_ItemDataBound" HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="ItemDataList_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:LinkButton ID="lbImage" OnClick="btnView_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"><asp:Image ID="Image1" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' GenerateEmptyAlternateText="True" runat="server" Height="250" Width="230" /></asp:LinkButton><br />
                    <h3><asp:LinkButton ID="lbViewDetails" OnClick="btnView_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"><%# Eval("ItemName") %></asp:LinkButton></h3>
                    <h5><strike> <%# Eval("NewPrice","{0:c}")%></strike>
                        <asp:HiddenField ID="hfID" Value='<%# Eval("ItemID") %>' runat="server" /></h5>
                    <h4 style="color:red"> <%# Eval("Price","{0:c}")%></h4>
                    <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="button" CommandArgument='<%# Eval("ItemID") %>' runat="server" Text="Add to Cart" />
                </ItemTemplate>
            </asp:DataList>
        </div>
   </div>
</asp:Content>
