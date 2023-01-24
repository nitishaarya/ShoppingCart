<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ShoppingCart.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Profile</title>
    <link href="css/Profie.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row profileDiv">
        <h1 style="display: inline-block"></h1>
        <h2>
            <asp:Label ID="lblProfile" runat="server" Text=""></asp:Label></h2>
        <asp:Button ID="btnLogin" runat="server" Visible="false" PostBackUrl="~/Login.aspx" CssClass="button" Text="Login" />
        <asp:Image ID="imgProfile" ImageUrl="~/image/profile.png" Height="150px" Width="200px"  Visible="false" runat="server" />
        <asp:DataList ID="profileDataList" Width="20%" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center" BackColor="White" BorderStyle="None" CssClass="auto-style2">
            <ItemStyle Font-Bold="True" Font-Size="Large" />
            <ItemTemplate>
                <h2><%# Eval("FirstName") %> <%# Eval("LastName") %></h2>
                <br />
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell> Mobile: </asp:TableCell>
                        <asp:TableCell><%# Eval("Mobile") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Email: </asp:TableCell>
                        <asp:TableCell><%# Eval("Email") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Gender:</asp:TableCell>
                        <asp:TableCell><%# Eval("Gender") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>D.O.B:</asp:TableCell>
                        <asp:TableCell><%# Eval("DOB") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Address:</asp:TableCell>
                        <asp:TableCell><%# Eval("City") %>, <%# Eval("State") %>, <%# Eval("Pincode") %></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [Email], [Mobile], [Gender], [DOB], [Address1], [Address2], [City], [State], [Pincode] FROM [Users] WHERE ([UserID] = @UserID)">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <a class="lnkBtn" id="lbCart" runat="server" href="Cart.aspx">View your Cart</a><a class="lnkBtn" id="lbOrder" runat="server" href="Orders.aspx">View your Orders</a><a class="lnkBtn" id="lbWishlist" runat="server" href="Wishlist.aspx">View your WishList</a>
    </div>
</asp:Content>
