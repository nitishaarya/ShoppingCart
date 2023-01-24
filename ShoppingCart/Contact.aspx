<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" UnobtrusiveValidationMode="none" Inherits="ShoppingCart.Contact" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="css/defaultCss.css" />
    <link href="css/Contact.css" rel="stylesheet" />
    <script src="script/ItemScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="contactDiv">
            <h1>Contact Us</h1>
            <asp:TextBox ID="txtName" CssClass="form" runat="server" placeholder="Your Full Name*"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required!" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="txtMobile" CssClass="form" runat="server" placeholder="Your Mobile Number*"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMobile" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Mobile no. is Required"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="revMobile" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMobile" ValidationExpression="\d{10}" runat="server" ErrorMessage="Enter Valid 10 digit Number"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" CssClass="form" runat="server" placeholder="Your Email ID*"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMail" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="revMail" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^(?=.*?[a-z])(?=.*?[#?@.]).{8,}$" runat="server" ErrorMessage="Enter Valid Email"></asp:RegularExpressionValidator>            
            <asp:TextBox ID="txtMessage" CssClass="form" runat="server" placeholder="Write your Message*" Height="200px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMessage" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMessage" runat="server" ErrorMessage="Please enter few words"></asp:RequiredFieldValidator><br />
            <asp:Button ID="Submit" runat="server" CssClass="button" Width="100%" Text="Submit" OnClick="Submit_Click" />
            <button type="button" id="btnShowPopup" style="visibility: hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog vertical-align-center">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <span style="font-size: 40px; font-family: cursive; color: green">Thanks for Contact Us..We will get back to you soon..!!</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </div>
</asp:Content>
