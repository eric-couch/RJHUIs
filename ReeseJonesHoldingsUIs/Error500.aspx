<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error500.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Error500" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="error-container">
        <dx:ASPxImage ID="imgError" runat="server" 
            IconID="actions_deletelist_32x32"
            CssClass="error-icon">
        </dx:ASPxImage>
        
        <h1 class="error-code">500</h1>
        <h2 class="error-title">Internal Server Error</h2>
        <p class="error-message">
            Oops! Something went wrong on our end. We're working to fix the issue.
        </p>
        <p class="error-message" style="font-size: 14px; color: var(--text-secondary);">
            Please try again later or contact support if the problem persists.
        </p>
        
        <div style="display: flex; gap: 10px; justify-content: center;">
            <dx:ASPxButton ID="btnHome" runat="server" 
                Text="Return to Home" 
                
                OnClick="btnHome_Click"
                CssClass="btn-primary">
                <Image IconID="actions_home_16x16"></Image>
            </dx:ASPxButton>
            <dx:ASPxButton ID="btnRetry" runat="server" 
                Text="Try Again" 
                
                OnClick="btnRetry_Click">
                <Image IconID="actions_refresh_16x16"></Image>
            </dx:ASPxButton>
        </div>
    </div>
</asp:Content>
