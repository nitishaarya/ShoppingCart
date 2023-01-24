<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" UnobtrusiveValidationMode="none" Inherits="ShoppingCart.Forgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>HForgot Password</title>
    <link href="css/LoginStyle.css" rel="stylesheet" />
     <link href="css/SignupStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="forgotDiv" style="min-height:80vh">
        <div class="signupDiv row">           
            <div id="loginContainer" class="container">
                <div id="login-row" class="row col-lg-12 well ContentDiv">
                    <div id="login-column" class="row">
                        <div id="login-box" class="col-md-12">
                            <div id="login-form" class="form" style="text-align: center">
                                <h2>Reset Password</h2>
                                <asp:Label ID="lblError" ForeColor="Red" CssClass="lblError" runat="server"></asp:Label>
                                <h5 style="text-align: center">
                                    <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Text=""></asp:Label></h5>
                                <asp:TextBox ID="txtEmail" placeholder="Your Email ID" CssClass="textbox form-control"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMail" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMail" ControlToValidate="txtEmail" ValidationExpression="^(?=.*?[a-z])(?=.*?[#?@.]).{8,}$"  Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Enter valid Email"></asp:RegularExpressionValidator>
                                <asp:Button ID="btnSubmit" runat="server" CssClass=" btn btn-info btn-lg" Text="Submit" OnClick="btnSubmit_Click" />
                                <div id="security" runat="server" visible="false">
                                    <asp:TextBox ID="txtPin" placeholder="Enter OTP" MaxLength="6" CssClass="textbox form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvOTP" runat="server" ControlToValidate="txtPin" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter your OTP!"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revOTP" runat="server" ControlToValidate="txtPin" ValidationExpression="\d{6}" Display="Dynamic" ErrorMessage="Enter valid OTP" ForeColor="Red"></asp:RegularExpressionValidator><br />
                                    <asp:Button ID="btnAnswer" runat="server" CssClass="btn btn-info btn-lg" Text="Submit" OnClick="btnAnswer_Click" />
                                </div>
                                <div id="newPassword" runat="server" visible="false">
                                    <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="New Password" CssClass="textbox form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" Display="Dynamic" ErrorMessage="Password must include UpperCase,LowerCase,Special char,numeric and minimum 8 characters" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtCnfPassword" runat="server" placeholder="Confirm Password" CssClass="textbox form-control" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvRePassword" ControlToValidate="txtCnfPassword" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Type Password again"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvPassword" ControlToCompare="txtPassword" ControlToValidate="txtCnfPassword" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Password not matched"></asp:CompareValidator>
                                    <br /> 
                                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-info btn-lg" Text="Submit" OnClick="btnUpdate_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
