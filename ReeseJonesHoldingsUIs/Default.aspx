<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Default" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="hero-section">
        <h1>DevExpress UI Demonstrations</h1>
        <p class="lead">Explore interactive sample applications showcasing DevExpress Web Forms components with modern responsive design.</p>
    </div>

    <div class="cards-container">
        <div class="card">
            <dx:ASPxImage ID="imgLeaveRequest" runat="server" 
                IconID="scheduling_calendar_32x32" 
                CssClass="card-icon">
            </dx:ASPxImage>
            <h3>Leave Request Form</h3>
            <p>Submit and manage employee leave requests with date pickers, validation, and status tracking.</p>
            <dx:ASPxButton ID="btnLeaveRequest" runat="server" 
                Text="View Demo" 
                
                OnClick="btnLeaveRequest_Click"
                CssClass="btn-primary">
            </dx:ASPxButton>
        </div>

        <div class="card">
            <dx:ASPxImage ID="imgExpenseReport" runat="server" 
                IconID="reports_report_32x32" 
                CssClass="card-icon">
            </dx:ASPxImage>
            <h3>Expense Report Grid</h3>
            <p>Create, edit, and delete expense entries with inline editing and automatic totals calculation.</p>
            <dx:ASPxButton ID="btnExpenseReport" runat="server" 
                Text="View Demo" 
                
                OnClick="btnExpenseReport_Click"
                CssClass="btn-primary">
            </dx:ASPxButton>
        </div>

        <div class="card">
            <dx:ASPxImage ID="imgSurveyWizard" runat="server" 
                IconID="business_task_32x32" 
                CssClass="card-icon">
            </dx:ASPxImage>
            <h3>Survey Wizard</h3>
            <p>Multi-step survey form with tabbed navigation, form validation, and data persistence.</p>
            <dx:ASPxButton ID="btnSurveyWizard" runat="server" 
                Text="View Demo" 
                
                OnClick="btnSurveyWizard_Click"
                CssClass="btn-primary">
            </dx:ASPxButton>
        </div>

        <div class="card">
            <dx:ASPxImage ID="imgAdminDashboard" runat="server" 
                IconID="dashboards_gauge_32x32" 
                CssClass="card-icon">
            </dx:ASPxImage>
            <h3>Admin Dashboard</h3>
            <p>Executive dashboard with KPI metrics, interactive charts, and data visualizations.</p>
            <dx:ASPxButton ID="btnAdminDashboard" runat="server" 
                Text="View Demo" 
                
                OnClick="btnAdminDashboard_Click"
                CssClass="btn-primary">
            </dx:ASPxButton>
        </div>

        <div class="card">
            <dx:ASPxImage ID="imgLogin" runat="server" 
                IconID="security_key_32x32" 
                CssClass="card-icon">
            </dx:ASPxImage>
            <h3>Login Page</h3>
            <p>Role-based authentication with username, password, and role selection for user access.</p>
            <dx:ASPxButton ID="btnLogin" runat="server" 
                Text="View Demo" 
                
                OnClick="btnLogin_Click"
                CssClass="btn-primary">
            </dx:ASPxButton>
        </div>
    </div>

    <div style="margin-top: 40px; padding: 20px; background: var(--light-bg); border-radius: 8px; text-align: center;">
        <dx:ASPxImage ID="imgInfo" runat="server" 
            IconID="actions_info_16x16">
        </dx:ASPxImage>
        <p style="margin: 10px 0 0 0; color: var(--text-secondary);">
            <strong>Note:</strong> These demos use browser localStorage for data persistence. 
            Data is retained between sessions but is specific to your browser.
        </p>
    </div>
</asp:Content>
