<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Error404" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="error-container">
        <dx:ASPxImage ID="imgError" runat="server" 
            IconID="actions_warning_32x32"
            CssClass="error-icon">
        </dx:ASPxImage>
        
        <h1 class="error-code">404</h1>
        <h2 class="error-title">Page Not Found</h2>
        <p class="error-message">
            The page you're looking for doesn't exist or has been moved.
        </p>
        
        <dx:ASPxButton ID="btnHome" runat="server" 
            Text="Return to Home" 
            
            OnClick="btnHome_Click"
            CssClass="btn-primary">
            <Image IconID="actions_home_16x16"></Image>
        </dx:ASPxButton>
    </div>
</asp:Content>
