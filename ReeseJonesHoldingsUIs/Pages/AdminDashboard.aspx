<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Pages.AdminDashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfLeaveRequests" runat="server" />
    <asp:HiddenField ID="hfUsers" runat="server" />
    <asp:HiddenField ID="hfUsersHeight" runat="server" />
    <asp:HiddenField ID="hfSessionsHeight" runat="server" />
    <asp:HiddenField ID="hfApprovalsHeight" runat="server" />

    <style>
        .bar-chart-column {
            border-radius: 8px 8px 0 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding-bottom: 10px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            min-height: 20%;
        }
        .bar-users {
            background: linear-gradient(to top, #0078D4, #67b4ff);
        }
        .bar-sessions {
            background: linear-gradient(to top, #28a745, #5cd67d);
        }
        .bar-approvals {
            background: linear-gradient(to top, #ffc107, #ffd454);
        }
    </style>

    <div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;">
        <div>
            <h2 style="margin: 0;">Admin Dashboard</h2>
            <p style="color: var(--text-secondary); margin: 5px 0 0 0;">
                Overview of key performance indicators and system metrics
            </p>
        </div>
        <dx:ASPxButton ID="btnRefresh" runat="server" 
            Text="Refresh Data" 
            
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

    <!-- Charts Row -->
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 30px;">
        
        <!-- System Performance -->
        <div class="dx-card">
            <h3 style="margin-top: 0; color: var(--dark);">System Performance</h3>
            <div style="display: flex; align-items: center; justify-content: center; padding: 40px;">
                <div style="position: relative; width: 200px; height: 200px;">
                    <!-- SVG Circular Gauge -->
                    <svg viewBox="0 0 200 200" style="transform: rotate(-90deg);">
                        <!-- Background circle -->
                        <circle cx="100" cy="100" r="80" fill="none" stroke="#e9ecef" stroke-width="15"/>
                        <!-- Red range (0-40%) -->
                        <circle cx="100" cy="100" r="80" fill="none" stroke="#dc3545" stroke-width="15"
                                stroke-dasharray="201 502" stroke-dashoffset="0"/>
                        <!-- Yellow range (40-70%) -->
                        <circle cx="100" cy="100" r="80" fill="none" stroke="#ffc107" stroke-width="15"
                                stroke-dasharray="151 502" stroke-dashoffset="-201"/>
                        <!-- Green range (70-100%) -->
                        <circle cx="100" cy="100" r="80" fill="none" stroke="#28a745" stroke-width="15"
                                stroke-dasharray="151 502" stroke-dashoffset="-352"/>
                        <!-- Progress indicator (75%) -->
                        <circle cx="100" cy="100" r="80" fill="none" stroke="#0078D4" stroke-width="4"
                                stroke-dasharray="377 502" stroke-dashoffset="0" opacity="0.8"/>
                    </svg>
                    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
                        <div style="font-size: 48px; font-weight: bold; color: #28a745;">75%</div>
                        <div style="font-size: 12px; color: var(--text-secondary); margin-top: 5px;">Overall Health</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Key Metrics Bar Chart -->
        <div class="dx-card">
            <h3 style="margin-top: 0; color: var(--dark);">Key Metrics Overview</h3>
            <div style="padding: 40px;">
                <!-- Vertical bar chart -->
                <div style="display: flex; align-items: flex-end; justify-content: space-around; height: 220px; gap: 20px;">
                    <div style="flex: 1; text-align: center; height: 100%; display: flex; flex-direction: column; justify-content: flex-end;">
                        <asp:Panel ID="barUsers" runat="server" CssClass="bar-chart-column bar-users">
                            <dx:ASPxLabel ID="lblChartTotalUsers" runat="server" Text="0" ForeColor="White" Font-Size="18px" Font-Bold="true" />
                        </asp:Panel>
                        <div style="font-size: 12px; color: var(--text-secondary); margin-top: 12px; font-weight: 600;">Total Users</div>
                    </div>
                    <div style="flex: 1; text-align: center; height: 100%; display: flex; flex-direction: column; justify-content: flex-end;">
                        <asp:Panel ID="barSessions" runat="server" CssClass="bar-chart-column bar-sessions">
                            <dx:ASPxLabel ID="lblChartActiveSessions" runat="server" Text="0" ForeColor="White" Font-Size="18px" Font-Bold="true" />
                        </asp:Panel>
                        <div style="font-size: 12px; color: var(--text-secondary); margin-top: 12px; font-weight: 600;">Active Sessions</div>
                    </div>
                    <div style="flex: 1; text-align: center; height: 100%; display: flex; flex-direction: column; justify-content: flex-end;">
                        <asp:Panel ID="barApprovals" runat="server" CssClass="bar-chart-column bar-approvals">
                            <dx:ASPxLabel ID="lblChartPendingApprovals" runat="server" Text="0" ForeColor="White" Font-Size="18px" Font-Bold="true" />
                        </asp:Panel>
                        <div style="font-size: 12px; color: var(--text-secondary); margin-top: 12px; font-weight: 600;">Pending Approvals</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

