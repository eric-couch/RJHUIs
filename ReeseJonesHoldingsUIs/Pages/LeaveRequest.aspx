<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveRequest.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Pages.LeaveRequestPage" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfLeaveRequests" runat="server" />

    <div class="form-card">
        <h2>Leave Request Submission</h2>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">
            Submit a new leave request with the details below. All fields are required.
        </p>

        <dx:ASPxLabel ID="lblMessage" runat="server" 
            Text="" 
            ForeColor="Green"
            Font-Bold="true"
            CssClass="message-label">
        </dx:ASPxLabel>

        <dx:ASPxFormLayout ID="formLayout" runat="server" >
            <Items>
                <dx:LayoutGroup Caption="Employee Information" ColCount="2">
                    <Items>
                        <dx:LayoutItem Caption="Employee Name" RequiredMarkDisplayMode="Required" ColSpan="2">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTextBox ID="txtEmployeeName" runat="server" Width="100%" >
                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="true" ErrorText="Employee name is required" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="Leave Type" RequiredMarkDisplayMode="Required">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxComboBox ID="cmbLeaveType" runat="server" Width="100%" 
                                        DropDownStyle="DropDownList" IncrementalFilteringMode="Contains">
                                        <Items>
                                            <dx:ListEditItem Text="Vacation" Value="Vacation" />
                                            <dx:ListEditItem Text="Sick Leave" Value="Sick Leave" />
                                            <dx:ListEditItem Text="Personal" Value="Personal" />
                                            <dx:ListEditItem Text="Maternity" Value="Maternity" />
                                            <dx:ListEditItem Text="Paternity" Value="Paternity" />
                                            <dx:ListEditItem Text="Bereavement" Value="Bereavement" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="true" ErrorText="Leave type is required" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="Start Date" RequiredMarkDisplayMode="Required">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxDateEdit ID="dateStart" runat="server" Width="100%" 
                                        UseMaskBehavior="true" DisplayFormatString="d" EditFormatString="d">
                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="true" ErrorText="Start date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="End Date" RequiredMarkDisplayMode="Required">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxDateEdit ID="dateEnd" runat="server" Width="100%" 
                                        UseMaskBehavior="true" DisplayFormatString="d" EditFormatString="d">
                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="true" ErrorText="End date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Request Details" ColCount="1">
                    <Items>
                        <dx:LayoutItem Caption="Reason for Leave" RequiredMarkDisplayMode="Required">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxMemo ID="txtReason" runat="server" Width="100%" Height="100px" >
                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="true" ErrorText="Reason is required" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>
                            <div style="display: flex; gap: 10px; justify-content: flex-end;">
                                <dx:ASPxButton ID="btnSubmit" runat="server" 
                                    Text="Submit Request" 
                                    
                                    OnClick="btnSubmit_Click"
                                    CssClass="btn-primary">
                                    <Image IconID="actions_apply_16x16"></Image>
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="btnClear" runat="server" 
                                    Text="Clear Form" 
                                    
                                    OnClick="btnClear_Click"
                                    CausesValidation="false">
                                    <Image IconID="actions_remove_16x16"></Image>
                                </dx:ASPxButton>
                            </div>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
    </div>

    <div class="form-card" style="margin-top: 30px;">
        <h3>Recent Leave Requests</h3>
        <p style="color: var(--text-secondary); margin-bottom: 15px;">
            Showing the 5 most recent submissions
        </p>

        <dx:ASPxGridView ID="gridRecentRequests" runat="server" 
            
            Width="100%"
            KeyFieldName="Id"
            AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EmployeeName" Caption="Employee" Width="150px">
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LeaveType" Caption="Type" Width="120px">
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="StartDate" Caption="Start Date" Width="100px">
                    <PropertiesDateEdit DisplayFormatString="d" />
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="EndDate" Caption="End Date" Width="100px">
                    <PropertiesDateEdit DisplayFormatString="d" />
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reason" Caption="Reason">
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="SubmittedDate" Caption="Submitted" Width="100px">
                    <PropertiesDateEdit DisplayFormatString="d" />
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataDateColumn>
            </Columns>
            <SettingsPager PageSize="5" />
            <Settings ShowFilterRow="False" ShowGroupPanel="False" />
            <SettingsBehavior AllowSelectByRowClick="false" />
        </dx:ASPxGridView>
    </div>
</asp:Content>
