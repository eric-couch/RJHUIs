<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Login" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Reese Jones Holdings</title>
    <link href="~/Content/Site.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 420px;
            padding: 40px;
            margin: 20px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .login-header h1 {
            margin: 0 0 10px 0;
            color: #333;
            font-size: 28px;
            font-weight: 600;
        }

        .login-header p {
            margin: 0;
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }

        .form-group label .required {
            color: #dc3545;
            margin-left: 3px;
        }

        .login-button {
            width: 100%;
            margin-top: 10px;
        }

        .error-message {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .login-footer {
            text-align: center;
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #e0e0e0;
            color: #666;
            font-size: 13px;
        }

        /* DevExpress Control Styling */
        .dxeEditArea_Office365 {
            border-radius: 6px !important;
        }

        .dx-btn {
            height: 44px !important;
            border-radius: 6px !important;
            font-size: 16px !important;
            font-weight: 500 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <h1>Welcome Back</h1>
                <p>Sign in to access your dashboard</p>
            </div>

            <asp:Panel ID="pnlError" runat="server" CssClass="error-message">
                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
            </asp:Panel>

            <div class="form-group">
                <label for="txtUsername">
                    Username<span class="required">*</span>
                </label>
                <dx:ASPxTextBox ID="txtUsername" runat="server" 
                    Width="100%" 
                    Height="44px"
                    Theme="Office365"
                    NullText="Enter your username">
                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="LoginValidation">
                        <RequiredField IsRequired="true" ErrorText="Username is required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </div>

            <div class="form-group">
                <label for="txtPassword">
                    Password<span class="required">*</span>
                </label>
                <dx:ASPxTextBox ID="txtPassword" runat="server" 
                    Width="100%" 
                    Height="44px"
                    Theme="Office365"
                    Password="true"
                    NullText="Enter your password">
                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="LoginValidation">
                        <RequiredField IsRequired="true" ErrorText="Password is required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </div>

            <div class="form-group">
                <label for="cboRole">
                    Role<span class="required">*</span>
                </label>
                <dx:ASPxComboBox ID="cboRole" runat="server" 
                    Width="100%" 
                    Height="44px"
                    Theme="Office365"
                    NullText="Select your role">
                    <Items>
                        <dx:ListEditItem Text="User" Value="User" />
                        <dx:ListEditItem Text="Admin" Value="Admin" />
                        <dx:ListEditItem Text="Super Admin" Value="SuperAdmin" />
                    </Items>
                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="LoginValidation">
                        <RequiredField IsRequired="true" ErrorText="Role is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </div>

            <div class="form-group">
                <dx:ASPxButton ID="btnLogin" runat="server" 
                    Text="Sign In" 
                    Theme="Office365"
                    CssClass="login-button"
                    OnClick="btnLogin_Click"
                    ValidationGroup="LoginValidation">
                    <ClientSideEvents Click="function(s, e) { 
                        if (!ASPxClientEdit.ValidateGroup('LoginValidation')) {
                            e.processOnServer = false;
                        }
                    }" />
                </dx:ASPxButton>
            </div>

            <div class="login-footer">
                <a href="Default.aspx" style="color: #667eea; text-decoration: none; font-weight: 500;">Back to Home</a>
                <div style="margin-top: 10px;">&copy; <%= DateTime.Now.Year %> Reese Jones Holdings. All rights reserved.</div>
            </div>
        </div>
    </form>
</body>
</html>
