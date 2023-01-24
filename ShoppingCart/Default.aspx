<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" EnableEventValidation="false" Inherits="ShoppingCart.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="script/ItemScript.js"></script>
    <link href="css/defaultCss.css" rel="stylesheet" />
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
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        $(window).on('load', function () {
		$(".se-pre-con").fadeOut("slow");;
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="se-pre-con"></div>
    <div class="container-fluid">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>
                <li data-target="#myCarousel" data-slide-to="7"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item">
                    <img src="image/slider1.jpg" class="img-responsive" alt="Summer sale" width="100%" />
                </div>
                <div class="item active">
                    <img src="image/slider.jpg " class="img-responsive" alt="Amazon sale" width="100%" />
                </div>
                <div class="item">
                    <img src="image/slider2.png" class="img-responsive" alt="Big Diwali sale" width="100%" />
                </div>
                <div class="item">
                    <img src="image/slider3.jpg" class="img-responsive" alt="Mobile sale" width="100%" />
                </div>
                <div class="item">
                    <img src="image/slider4.jpg" class="img-responsive" alt="Summer sale" width="100%" />
                </div>
                <div class="item">
                    <img src="image/slider5.jpg" class="img-responsive" alt="Summer sale" width="100%" />
                </div>
                <div class="item">
                    <img src="image/slider6.jpg" class="img-responsive" alt="Summer sale" width="100%" />
                </div>
                <div class="item">
                    <img src="image/slider7.png" class="img-responsive" alt="Summer sale" width="100%" />
                </div>


            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <button type="button" id="btnShowPopup" style="display: none" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
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
        <div class="itemDiv">
            <div id="mobileSection" class="itemSection">
                <h2>Trending Smartphones </h2>
                <br />
                <asp:DataList ID="MobileDataList" runat="server" OnItemDataBound="MobileDataList_ItemDataBound" RepeatDirection="Horizontal" RepeatColumns="5" HorizontalAlign="Center" Width="100%">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbImage" CommandArgument='<%# Eval("ItemID") %>' OnClick="btnView_Click" runat="server"><asp:Image ID="Image1" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' GenerateEmptyAlternateText="True" runat="server" Height="240" Width="220" /></asp:LinkButton><br />
                        <h3>
                            <asp:LinkButton ID="lbViewDetails" OnClick="btnView_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"> <%# Eval("ItemName") %></asp:LinkButton></h3>
                        <h5><strike> <%# Eval("NewPrice","{0:c}")%></strike><br />
                            <asp:HiddenField ID="hfID" Value='<%# Eval("ItemID") %>' runat="server" /></h5>
                         <h4 style="color:red"> <%# Eval("Price","{0:c}")%></h4>  
                            <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="button" CommandArgument='<%# Eval("ItemID") %>' runat="server" Text="Add to Cart" />
                    </ItemTemplate>
                </asp:DataList>
                <asp:LinkButton ID="lbViewMoreMobiles" CssClass="viewMore" OnClick="viewMoreMobiles" runat="server">View More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [ItemName], [Price], [Image], [ItemID] FROM [Item]"></asp:SqlDataSource>
            </div>
            <br />
            <div id="clothesSection" class="itemSection">
                <h2>Trending in Faishon</h2>
                <br />
                <asp:DataList ID="ClothesDataList" runat="server" OnItemDataBound="ClothesDataList_ItemDataBound" RepeatDirection="Horizontal" RepeatColumns="5" HorizontalAlign="Center" Width="100%">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbImage" CommandArgument='<%# Eval("ItemID") %>' OnClick="btnView_Click" runat="server"><asp:Image ID="Image1" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' GenerateEmptyAlternateText="True" runat="server" Height="240" Width="220" /></asp:LinkButton><br />
                        <h3>
                            <asp:LinkButton ID="lbViewDetails" OnClick="btnView_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"> <%# Eval("ItemName") %></asp:LinkButton></h3>
                        <h5><strike> <%# Eval("NewPrice","{0:c}")%></strike><br />
                            <asp:HiddenField ID="hfID" Value='<%# Eval("ItemID") %>' runat="server" />
                                <%--                <asp:Image ID="imgAvailable" runat="server" Height="80px" ImageAlign="Middle" Width="80px" />--%></h5>
                        <h4 style="color:red"> <%# Eval("Price","{0:c}")%></h4>
                            <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="button" CommandArgument='<%# Eval("ItemID") %>' runat="server" Text="Add to Cart" />
                    </ItemTemplate>
                </asp:DataList>
                <asp:LinkButton ID="lbViewMoreClothes" CssClass="viewMore" OnClick="viewMoreClothes" runat="server">View More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                <br />
            </div>
            <br />
            <div id="laptopSection" class="itemSection">
                <h2>Best Laptops in Middle Range </h2>
                <br />
                <asp:DataList ID="LaptopDataList" runat="server" RepeatDirection="Horizontal" OnItemDataBound="LaptopDataList_ItemDataBound" RepeatColumns="5" HorizontalAlign="Center" Width="100%">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbImage" CommandArgument='<%# Eval("ItemID") %>' OnClick="btnView_Click" runat="server"><asp:Image ID="Image1" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' GenerateEmptyAlternateText="True" runat="server" Height="180" Width="220" /></asp:LinkButton><br />
                        <h3>
                            <asp:LinkButton ID="lbViewDetails" OnClick="btnView_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"> <%# Eval("ItemName") %></asp:LinkButton></h3>
                        <h5><strike> <%# Eval("NewPrice","{0:c}")%></strike><br />
                            <asp:HiddenField ID="hfID" Value='<%# Eval("ItemID") %>' runat="server" /></h5>
                        <h4 style="color:red"> <%# Eval("Price","{0:c}")%></h4>
                            <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="button" CommandArgument='<%# Eval("ItemID") %>' runat="server" Text="Add to Cart" />
                    </ItemTemplate>
                </asp:DataList>
                <asp:LinkButton ID="lbViewMoreLaptop" CssClass="viewMore" OnClick="viewMoreLaptops" runat="server">View More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                <br />
            </div>
            <br />
            <div id="telivisionSection" class="itemSection">
                <h2>Trending LED TVs</h2>
                <br />
                <asp:DataList ID="TVDataList" runat="server" RepeatDirection="Horizontal" OnItemDataBound="TVDataList_ItemDataBound" RepeatColumns="5" HorizontalAlign="Center" Width="100%">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbImage" CommandArgument='<%# Eval("ItemID") %>' OnClick="btnView_Click" runat="server"><asp:Image ID="Image1" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' GenerateEmptyAlternateText="True" runat="server" Height="170" Width="210" /></asp:LinkButton><br />
                        <h3>
                            <asp:LinkButton ID="lbViewDetails" OnClick="btnView_Click" CommandArgument='<%# Eval("ItemID") %>' runat="server"> <%# Eval("ItemName") %></asp:LinkButton></h3>
                        <h5><strike> <%# Eval("NewPrice","{0:c}")%></strike><br />
                            <asp:HiddenField ID="hfID" Value='<%# Eval("ItemID") %>' runat="server" /></h5>
                        <h4 style="color:red"> <%# Eval("Price","{0:c}")%></h4>
                            <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="button" CommandArgument='<%# Eval("ItemID") %>' runat="server" Text="Add to Cart" />
                    </ItemTemplate>
                </asp:DataList>
                <asp:LinkButton ID="lbViewMoreTV" CssClass="viewMore" OnClick="viewMoreTV" runat="server">View More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                <br />
            </div>
            <br />
        </div>
    </div>

</asp:Content>
