<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Thanks.aspx.cs" Inherits="ShoppingCart.Thanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .thanksDiv {
            background: linear-gradient(rgba(255,255,255,.8), rgba(255,255,255,.8)), url('../image/Thank-You.jpg');
            min-height: 80vh;
            text-align: center;
        }

        h1 {
            font-family: fantasy;
            font-weight: bold;
            color: darkgreen;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="thanksDiv">
        <br />
        <br />
        <br />
        <br />
        <h1>Thank You for Shopping with us ! Keep Visiting...</h1>
        <h2><a href="Orders.aspx">Click to view your Order Status</a></h2>
    </div>
</asp:Content>
