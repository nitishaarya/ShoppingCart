<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCart.Master" AutoEventWireup="true" ValidateRequest="false" UnobtrusiveValidationMode="None" CodeBehind="SignUp.aspx.cs" Inherits="ShoppingCart.SignUp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
    <link href="/css/SignupStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="signupDiv">
        <div class="container"> 
            <div class="col-lg-12 well ContentDiv">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <h2>Register with your Details</h2>
                            <h5 style="text-align:center"><asp:Label ID="lblInfo" ForeColor="Red" Visible="false" runat="server"></asp:Label></h5>
                            <div class="col-sm-6 form-group">
                                <asp:TextBox ID="txtFName" placeholder="First Name*" CssClass="form-control form-textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName" Display="Dynamic" ErrorMessage="First Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revFName" runat="server" ControlToValidate="txtFName" Display="Dynamic" ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$" ErrorMessage="Enter Valid First Name" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-6 form-group">
                                <asp:TextBox ID="txtLName" placeholder="Last Name*" CssClass="form-control form-textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="Last Name is Required" Display="Dynamic" ControlToValidate="txtLName" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revLName" runat="server" ControlToValidate="txtLName" Display="Dynamic" ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$" ErrorMessage="Enter Valid Last Name" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <asp:TextBox ID="txtEmail" OnTextChanged="txtEmail_TextChanged" AutoPostBack="true" placeholder="Email*" CssClass="form-control form-textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is Required" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="^(?=.*?[a-z])(?=.*?[#?@.]).{8,}$" ErrorMessage="Enter Valid Email" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-6 form-group">
                                <asp:TextBox ID="txtMobile" placeholder="Mobile Number*" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMobile" ControlToValidate="txtMobile" runat="server" Display="Dynamic" ErrorMessage="Mobile number is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMobile" runat="server" Display="Dynamic"  ControlToValidate="txtMobile" ValidationExpression="\d{10}" ErrorMessage="Enter 10digit number" ForeColor="Red"></asp:RegularExpressionValidator>      
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <asp:RadioButtonList ID="rbGender" repeatdirection="Horizontal" runat="server">
                                    <asp:ListItem> Male </asp:ListItem>
                                    <asp:ListItem> Female </asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="rfvGender" Display="Dynamic" ControlToValidate="rbGender" runat="server" ErrorMessage="Select a gender" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-6 form-group">
                                <asp:LinkButton ID="lbCalendar" CausesValidation="false" CssClass="btnCalendar"  runat="server"><i class="fa fa-calendar" aria-hidden="true"></i></asp:LinkButton>
                                <asp:TextBox ID="txtDOB" CssClass="form-control" ReadOnly="true" Width="83%" placeholder="Your DOB*" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="ceDOB" TargetControlID="txtDOB"  StartDate="01-01-1950" Format="dd-MM-yyyy" EndDate="12-31-2010" PopupPosition="BottomRight" PopupButtonID="lbCalendar" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvDOB" ControlToValidate="txtDOB" runat="server" ErrorMessage="DOB is Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group fullLine">
                            <asp:TextBox ID="txtAdd1" placeholder="Address Line 1*" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="revAdd1" runat="server" ControlToValidate="txtAdd1" ErrorMessage="Address is Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group fullLine">
                            <asp:TextBox ID="txtAdd2" placeholder="Address Line 2" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <asp:TextBox ID="txtCity" placeholder="City*" CssClass="form-control"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="revCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rcvCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$" ForeColor="Red" ErrorMessage="Enter Valid city name"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-4 form-group">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="dropdown" Height="34px">
                                    <asp:ListItem Selected="True" Value="0">Select State</asp:ListItem>
                                    <asp:ListItem Value="1">Bihar</asp:ListItem>
                                    <asp:ListItem Value="2">Karnataka</asp:ListItem>
                                    <asp:ListItem Value="3">Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem Value="4">West Bengal</asp:ListItem>
                                    <asp:ListItem Value="5">Chhatishgarh</asp:ListItem>
                                    <asp:ListItem Value="6">Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem Value="7">Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem Value="8">Tamilnadu</asp:ListItem>
                                    <asp:ListItem Value="9">Punjab</asp:ListItem>
                                    <asp:ListItem Value="10">Jharkhand</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvDdlState" ControlToValidate="ddlState" Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Select State" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-4 form-group">
                                <asp:TextBox ID="txtPin" placeholder="Pincode*" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPin" ControlToValidate="txtPin" runat="server" Display="Dynamic" ErrorMessage="Pincode is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPin" runat="server" Display="Dynamic" ValidationExpression="\d{6}" ForeColor="Red" ControlToValidate="txtPin" ErrorMessage="Enter 6-digit Pincode"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group fullLine">
                            <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password*" CssClass="form-control" runat="server"></asp:TextBox>
                            <ajaxToolkit:PasswordStrength ID="psPassword" PreferredPasswordLength="8" TextStrengthDescriptions="Too Weak;Weak;Normal;Strong;Too Strong" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" DisplayPosition="BelowRight"  TargetControlID="txtPassword" RequiresUpperAndLowerCaseCharacters="true" runat="server"></ajaxToolkit:PasswordStrength>
                            <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" runat="server" Display="Dynamic" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rexPassword"  runat="server" Display="Dynamic" ControlToValidate="txtPassword" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$" ErrorMessage="Password must contain Uppercase,Lowercase,Numeric,special char and minimum 8 characters" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group fullLine">
                            <asp:TextBox ID="txtRePassword" TextMode="Password" placeholder="Retype Password*" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ErrorMessage="Type password again!" Display="Dynamic" ControlToValidate="txtRePassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvRePassword" runat="server" ControlToValidate="txtRePassword" Display="Dynamic" ControlToCompare="txtPassword" ErrorMessage="Password not matched" ForeColor="Red"></asp:CompareValidator>
                        </div>
                        <div class="form-group fullLine">
                            <asp:Button ID="btnSubmit" runat="server" OnClick="insertData" Width="100%" CssClass="btn btn-lg btn-info" Text="Submit" ForeColor="White" />
                        </div>
                        <h6 style="text-align:center"><a href="Login.aspx" class="text-info" style="font-size:15px">Go to Login Page</a></h6><br />
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
