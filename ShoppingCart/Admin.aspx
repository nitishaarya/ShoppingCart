<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" EnableEventValidation="false" UnobtrusiveValidationMode="none" Inherits="ShoppingCart.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin</title>
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0)">
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)">
    <link href="css/Admin.css" rel="stylesheet" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        $(window).on('load', function () {
		$(".se-pre-con").fadeOut("slow");;
        });
    </script>
    <script>
        function showLabel() {
            function HideLabel() {
                document.getElementById('<%= lblInfo.ClientID %>').style.visibility = "hidden";
            }
            setInterval("HideLabel", 5000);
        }
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
	        background: url(image/Preloader1.gif) center no-repeat transparent;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="se-pre-con"></div>
    <div class="container-fluid adminDiv" style="min-height: 80vh" runat="server">
        <header>
            <h1 class="adminHeader"><span style="text-align:center;padding-left:100px">Admin Panel</span><span style="float:right"><asp:LinkButton ID="lbLogout" CssClass="btnLogout" CausesValidation="false" PostBackUrl="~/Login.aspx" runat="server">Logout</asp:LinkButton></span></h1>
        </header>
        <div class="row">
            <asp:ScriptManager ID="ScriptManager2" runat="server" EnablePageMethods="true"></asp:ScriptManager>
            <div class="col-lg-6 col-md-6" style="text-align: center">
                <asp:ImageButton ID="imgBtnUser" ImageUrl="~/image/user.png" CausesValidation="false" OnClick="imgBtnUser_Click" Height="200px" Width="300px" runat="server" /><br />
                <span class="userProduct" style="font-size: 20px; color: #40ae9f; font-family: inherit"><b>View/Manage Users</b></span>
            </div>
            <div class="col-lg-6 col-md-6" style="text-align: center">

                <asp:ImageButton ID="imgBtnProduct" CausesValidation="false" ImageUrl="~/image/product.png" OnClick="imgBtnProduct_Click" Height="200px" Width="300px" runat="server" /><br />
                <span class="userProduct" style="font-size: 20px; color: #40ae9f; font-family: inherit"><b>View/Manage Product</b></span>
                <br>
                <br>
                <br>
            </div>
        </div>
        <h4 runat="server" id="searchDiv" style="text-align: center" visible="false">
            <asp:UpdatePanel ID="upBtnSort" runat="server">
                <ContentTemplate>
                    Sort By:
                    <asp:DropDownList ID="ddlSort" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" runat="server" Height="28px">
                        <asp:ListItem Selected="True">ItemID</asp:ListItem>
                        <asp:ListItem>Price</asp:ListItem>
                        <asp:ListItem>Name</asp:ListItem>
                        <asp:ListItem>Brand</asp:ListItem>
                        <asp:ListItem>Quantity</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnSort" CssClass="btnSortSearch" CausesValidation="false" runat="server" Text="Sort" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:TextBox ID="txtSearch" Placeholder="Search Items here.." runat="server" OnTextChanged="lbSearch_Click" Font-Size="20px"></asp:TextBox><asp:LinkButton ID="lbSearch" OnClick="lbSearch_Click" CausesValidation="false" runat="server"><span class="fa fa-search btnSortSearch"></span></asp:LinkButton>
        </h4>
        <div class="users">
            <div>
                <asp:UpdatePanel ID="upUser" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="text-align:center">
                        <asp:Label ID="lblInfo" Visible="false" Font-Size="Large" Font-Bold="true" ForeColor="Red" runat="server"></asp:Label></div>
                        <asp:GridView ID="UserGridView" runat="server" Visible="False" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="UserID" Width="70%" OnSelectedIndexChanged="UserGridView_SelectedIndexChanged" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowDeleting="UserGridView_RowDeleting" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" HorizontalAlign="Center" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID">
                                    <ControlStyle Width="50" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFname" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLname" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="120px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address1" SortExpression="Address1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdd1" runat="server" Text='<%# Bind("Address1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address2" SortExpression="Address2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdd2" runat="server" Text='<%# Bind("Address2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City" SortExpression="City">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State" SortExpression="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pincode" SortExpression="Pincode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPin" runat="server" Text='<%# Bind("Pin") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IsAdmin" SortExpression="IsAdmin">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chkAdmin" runat="server" Checked='<%# Bind("Admin") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkAdmin" runat="server" Checked='<%# Bind("Admin") %>' Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" Width="500px" Wrap="False" />
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#40ae9f" Font-Bold="True" ForeColor="White" Font-Size="Larger" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle ForeColor="#333333" Font-Size="Small" HorizontalAlign="Center" BackColor="White" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [UserID], [FirstName], [LastName], [Email], [Mobile], [Gender], [Address1], [Address2], [City], [State], [Pincode], [IsAdmin] FROM [Users]"></asp:SqlDataSource>
            </div>
        </div>
        
        <div class="row" id="products" runat="server" visible="false">
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-10 col-md-10">
                <br />
                <br />
                <br />
                <asp:UpdatePanel ID="upSubcategory" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 100%; align-self: center">
                            <tr>
                                <td style="width: 150px">Item Name:<br />
                                    <asp:TextBox ID="txtName" runat="server" Width="100%" />
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" ErrorMessage="Item Name is Required!"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 150px">Category:<br />
                                    <asp:DropDownList ID="ddlCategoryInsert" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoryInsert_SelectedIndexChanged" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" Width="100%" DataTextField="CategoryName" DataValueField="CategoryID">
                                        <asp:ListItem Text="SelectCategory" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvDdlCategoryInsert" ControlToValidate="ddlCategoryInsert" Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Select Valid Category!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]"></asp:SqlDataSource>
                                </td>
                                <td style="width: 150px">SubCategory:<br />
                                    <asp:DropDownList ID="ddlSubCategoryInsert" runat="server" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="ddlSubCategoryInsert_SelectedIndexChanged" AppendDataBoundItems="true" DataTextField="SubCategoryName" Width="100%" DataValueField="SubCategoryID" AutoPostBack="True" Height="22px">
                                        <asp:ListItem Text="SelectSubCategory" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvDdlSubCategoryInsert" ControlToValidate="ddlSubCategoryInsert" Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Select Valid SubCategory!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [SubCategoryID], [SubCategoryName] FROM [SubCategory] WHERE ([CategoryID] = @CategoryID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCategoryInsert" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 150px">Item Brand:<br />
                                    <asp:DropDownList ID="ddlBrand" runat="server" DataSourceID="SqlDataSource5" AppendDataBoundItems="true" DataTextField="BrandName" Width="100%" DataValueField="BrandName">
                                        <asp:ListItem Text="SelectBrand" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvDdlBrand" ControlToValidate="ddlBrand" Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Select Valid Brand!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [BrandID], [BrandName] FROM [Brand] WHERE ([SubCategoryID] = @SubCategoryID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlSubCategoryInsert" Name="SubCategoryID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 100px">Price:<br />
                                    <asp:TextBox ID="txtPrice" TextMode="Number" runat="server" Width="100%" />
                                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is Required!" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice" Type="Double" MinimumValue="1"  MaximumValue="100000000" ErrorMessage="Enter valid Price!" Display="Dynamic" ForeColor="Red"></asp:RangeValidator>
                                </td>
                                <td style="width: 100px">Quantity:<br />
                                    <asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" Width="100%" />
                                    <asp:RequiredFieldValidator ID="rfvQuantity" ControlToValidate="txtQuantity" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Quantity must be given!"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rvQuantity" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" Type="Double" ForeColor="Red" MinimumValue="0" MaximumValue="1000000" ErrorMessage="Enter valid Quantity!"></asp:RangeValidator>
                                </td>
                                <td style="width: 250px">Description:<br />
                                    <asp:TextBox ID="txtDescription" runat="server" Width="100%" />
                                    <asp:RequiredFieldValidator ID="rfvDesc" ControlToValidate="txtDescription" runat="server" ErrorMessage="Give some description about item!" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 150px">Image:<br />
                                    <asp:FileUpload ID="fuImage" runat="server" />
                                </td>
                                <td style="width: 150px">
                                    <asp:Button ID="btnAdd" runat="server" CssClass="btnSortSearch" Text="Add" OnClick="Insert_Item" Width="100%" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlSubCategoryInsert" EventName="SelectedIndexChanged" />
                        <asp:PostBackTrigger ControlID="btnAdd" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <br />
                <asp:UpdateProgress ID="upProductSort" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="upBtnSort">
                    <ProgressTemplate>
                        <div id="overlay">
                            <div id="modalprogress">
                                <div id="theprogress">
                                    <asp:Image ID="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/image/lazyloader.gif" /><br />
                                    Sorting...
                                </div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdateProgress ID="upProductUpdate" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="upProductGrid">
                    <ProgressTemplate>
                        <div id="overlay">
                            <div id="modalprogress">
                                <div id="theprogress">
                                    <asp:Image ID="imgWaitIcons" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/image/lazyloader.gif" /><br />
                                    Please wait...
                                </div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="upProductGrid" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="False" BackColor="White" Width="100%" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ItemID" OnRowCancelingEdit="ProductGridView_RowCancelingEdit" OnRowDeleting="ProductGridView_RowDeleting" OnRowEditing="ProductGridView_RowEditing" OnRowUpdating="ProductGridView_RowUpdating" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                                <asp:TemplateField HeaderText="SubCategoryID" SortExpression="SubCategoryID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlSubCategory" runat="server" Width="100%" DataSourceID="SqlDataSource2" DataTextField="SubCategoryName" DataValueField="SubCategoryID" AutoPostBack="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [SubCategoryID], [SubCategoryName] FROM [SubCategory]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubCatID" runat="server" Text='<%# Bind("SubCategoryID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtItemName" runat="server" Text='<%# Bind("ItemName") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ItemBrand" SortExpression="ItemBrand">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlItemBrand" runat="server" DataSourceID="SqlDataSource1" DataTextField="BrandName" DataValueField="BrandName"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT [BrandID], [BrandName] FROM [Brand] WHERE ([SubCategoryID] = @SubCategoryID)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSubCategory" Name="SubCategoryID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemBrand" runat="server" Text='<%# Bind("ItemBrand") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price","{0:c}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UpdatedAdminID" HeaderText="Updated By" InsertVisible="False" ReadOnly="True" SortExpression="UpdatedAdminID" />
                                <asp:TemplateField HeaderText="Image">
                                    <EditItemTemplate>
                                        <asp:Image ID="imgAdminView" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' runat="server" Height="50px" Width="50px" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imgAdminView" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' runat="server" Height="50px" Width="50px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" CausesValidation="false" ShowEditButton="True" />
                                <asp:CommandField ButtonType="Button" CausesValidation="false" ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#40ae9f" Font-Bold="False" ForeColor="White" Font-Size="Larger" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSort" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-lg-1 col-md-1"></div>
        </div>
    </div>
</asp:Content>
