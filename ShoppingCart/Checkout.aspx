<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="Checkout.aspx.cs" Inherits="ShoppingCart.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Checkout.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="checkoutDiv">
        <div class="container">
            <div class="row">
                <div class="col-50">
                    <h3>Shippping Details</h3>
                    <label for="fname"><i class="fa fa-user"></i> Full Name*</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="checkout" placeholder="Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvname" ControlToValidate="txtName" Display="Dynamic" runat="server" ErrorMessage="Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="email"><i class="fa fa-envelope"></i> Email*</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="checkout" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="^(?=.*?[a-z])(?=.*?[#?@.]).{8,}$" ErrorMessage="Enter Valid Email" ForeColor="Red">*</asp:RegularExpressionValidator>
                    <label for="adr"><i class="fa fa-address-card-o"></i> Address*</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="checkout" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="txtAddress" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                    <label for="city"><i class="fa fa-institution"></i> City*</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="checkout" placeholder="City"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" ControlToValidate="txtCity" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="City Name is Required"></asp:RequiredFieldValidator>
                    <div class="row">
                        <div class="col-50">
                            <label for="state">State*</label>
                            <asp:TextBox ID="txtState" runat="server" CssClass="checkout" placeholder="State"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvState" ControlToValidate="txtState" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="State is Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-50">
                            <label for="pin">Pincode*</label>
                            <asp:TextBox ID="txtPin" runat="server" CssClass="checkout" placeholder="Pincode"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPin" ControlToValidate="txtPin" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="PIN is Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPIN" runat="server" ControlToValidate="txtPin" ValidationExpression="\d{6}" Display="Dynamic" ErrorMessage="Enter 6 digit PinCode!" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="col-50">
                    <h3>Payment</h3>
                    <label for="fname">Accepted Cards</label>
                    <div class="icon-container" style="margin-bottom: 22px">
                        <i class="fa fa-cc-visa" style="color: navy;"></i>
                        <i class="fa fa-cc-amex" style="color: blue;"></i>
                        <i class="fa fa-cc-mastercard" style="color: red;"></i>
                        <i class="fa fa-cc-discover" style="color: orange;"></i>
                    </div>
                    <label for="cname">Name on Card</label>
                    <asp:TextBox ID="txtcardName" CssClass="checkout" placeholder="Name on Card" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCardName" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Card Holder name is Required" ControlToValidate="txtCardname"></asp:RequiredFieldValidator>
                    <label for="ccnum">Card number*</label>
                    <asp:TextBox ID="txtCardNumber" CssClass="checkout" runat="server" MaxLength="16" placeholder="1111-2222-3333-4444"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCardNumber" ControlToValidate="txtCardNumber" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Card number is Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCardNumber" runat="server" ControlToValidate="txtCardNumber" Display="Dynamic" ValidationExpression="\d{16}" ErrorMessage="Enter 16 digit card number" ForeColor="Red"></asp:RegularExpressionValidator>
                    <label for="expmonth">Exp Month/Year*</label>
                    <asp:TextBox ID="txtExpMonth" CssClass="checkout" runat="server" placeholder="MM/yyyy"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvExpMonth" ControlToValidate="txtExpMonth" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Enter Expiry Date"></asp:RequiredFieldValidator>
                    <label for="cvv">CVV*</label>
                    <asp:TextBox ID="txtCuv" CssClass="checkout" runat="server" MaxLength="3" placeholder="cvv"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCuv" ControlToValidate="txtCuv" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Enter 3-digit CVV"></asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Continue to checkout" Width="100%" CssClass="button" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
