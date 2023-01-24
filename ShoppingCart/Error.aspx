<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ShoppingCart.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="errorDiv">
        <asp:Panel ID="errorPanel" runat="server"></asp:Panel>
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </div>

</asp:Content>
