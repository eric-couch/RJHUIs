<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Pages.AdminDashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfLeaveRequests" runat="server" />
    <asp:HiddenField ID="hfUsers" runat="server" />

    <div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;">
        <div>
            <h2 style="margin: 0;">Admin Dashboard</h2>
            <p style="color: var(--text-secondary); margin: 5px 0 0 0;">
                Overview of key performance indicators and system metrics
            </p>
        </div>
        <dx:ASPxButton ID="btnRefresh" runat="server" 
            Text="Refresh Data" 
            Theme="Office365"
            OnClick="btnRefresh_Click"
            CssClass="btn-primary">
            <Image IconID="actions_refresh_16x16"></Image>
        </dx:ASPxButton>
    </div>

    <dx:ASPxLabel ID="lblMessage" runat="server" 
        Text="" 
        ForeColor="Green"
        Font-Bold="true"
        CssClass="message-label">
    </dx:ASPxLabel>

    <!-- KPI Cards -->
    <div class="kpi-container">
        <div class="kpi-card kpi-primary">
            <dx:ASPxImage ID="imgUsers" runat="server" 
                IconID="people_employee_32x32">
            </dx:ASPxImage>
            <div class="kpi-content">
                <div class="kpi-value">
                    <dx:ASPxLabel ID="lblTotalUsers" runat="server" Text="0" />
                </div>
                <div class="kpi-label">Total Users</div>
            </div>
        </div>

        <div class="kpi-card kpi-success">
            <dx:ASPxImage ID="imgSessions" runat="server" 
                IconID="actions_apply_32x32">
            </dx:ASPxImage>
            <div class="kpi-content">
                <div class="kpi-value">
                    <dx:ASPxLabel ID="lblActiveSessions" runat="server" Text="0" />
                </div>
                <div class="kpi-label">Active Sessions</div>
            </div>
        </div>

        <div class="kpi-card kpi-warning">
            <dx:ASPxImage ID="imgPending" runat="server" 
                IconID="business_task_32x32">
            </dx:ASPxImage>
            <div class="kpi-content">
                <div class="kpi-value">
                    <dx:ASPxLabel ID="lblPendingApprovals" runat="server" Text="0" />
                </div>
                <div class="kpi-label">Pending Approvals</div>
            </div>
        </div>
    </div>
</asp:Content>
