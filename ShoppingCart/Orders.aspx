<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ShoppingCart.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row cartDiv" style="min-height:76vh;text-align:center">
        <h1 style="text-align:center">Your Orders</h1>
        <h2 style="text-align:center" id="noOrder" runat="server"></h2>
        <asp:ImageButton ID="imgBtnCart" Width="300px" Height="100px" runat="server" />
        <br />
        <br />
        <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
        <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" OnRowDataBound="OrderGridView_RowDataBound" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" HorizontalAlign="Center" Width="75%" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="ItemBrand" HeaderText="ItemBrand" SortExpression="ItemBrand" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgOrder" runat="server" Height="50px" Width="50px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:TemplateField HeaderText="PaidAmount" SortExpression="PaidAmount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PaidAmount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PaidAmount","{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="status" HeaderText="Delivered" SortExpression="status" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" Font-Size="Large" HorizontalAlign="Center" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" Font-Size="Larger" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"></asp:SqlDataSource>
    </div>
</asp:Content>
