<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="Login.aspx.cs" Inherits="ShoppingCart.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link href="css/LoginStyle.css" rel="stylesheet" />
    <link href="css/SignupStyle.css" rel="stylesheet" />
    <script>
        function myFunction() {
            var x = document.getElementById("myInput");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
</script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" DefaultButton="btnSubmit" runat="server">
    <div class="signupDiv row">  
        <div id="loginContainer" class="container">
            <div id="login-row" class="col-lg-12 well ContentDiv">
                <div id="login-column" class="row">
                    <div id="login-box" class="col-md-12 col-sm-12">
                        <div id="login-form" class="form">
                            <h2 class="text-center" style="margin-bottom:30px">Login with your credentials</h2>
                            <h5 style="text-align:center"><asp:Label ID="lblError" ForeColor="Red" CssClass="lblError" runat="server"></asp:Label></h5>
                            <div class="form-group">
                                <asp:TextBox ID="txtUsername" CssClass="form-control" placeholder="Username*" OnTextChanged="txtUsername_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revUsername" CssClass="secondErrorMsg" runat="server" ControlToValidate="txtUsername" ValidationExpression="^(?=.*?[a-z])(?=.*?[#?@.]).{8,}$" ErrorMessage="Enter Valid Email" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Password*"  CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPassword" CssClass="secondErrorMsg" ControlToValidate="txtPassword" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,14}$" ForeColor="Red" runat="server" ErrorMessage="Invalid Password"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label class="text-info" style="float:right;font-size:15px;font-weight:normal"><span><a href="Forgot.aspx">Forgot Password</a></span></label>                              
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-info btn-lg" OnClick="btnSubmitClick" Text="Submit" />
                                <h6 style="text-align:center"><a href="Signup.aspx" class="text-info" style="font-size:15px">Register here</a></h6><br />
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div> 
        <div style="text-align:center;margin-top:15px">
            <asp:LinkButton ID="lbGoBack" CausesValidation="false" ForeColor="#40ae9f"  Font-Size="20px" runat="server">
                <asp:Image ID="Image1" CssClass="GoBackArrow" ImageUrl="~/image/left-arrow.png"  runat="server" /> Go Back</asp:LinkButton>
        </div>
    </div>
</asp:Content>
