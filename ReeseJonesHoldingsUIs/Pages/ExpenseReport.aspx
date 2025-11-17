<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpenseReport.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Pages.ExpenseReportPage" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfExpenseReports" runat="server" />

    <div class="form-card">
        <h2>Expense Report Management</h2>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">
            Create, edit, and delete expense entries. Click "Edit" to modify an entry or "Delete" to remove it.
        </p>

        <dx:ASPxLabel ID="lblMessage" runat="server" 
            Text="" 
            ForeColor="Green"
            Font-Bold="true"
            CssClass="message-label">
        </dx:ASPxLabel>

        <dx:ASPxGridView ID="gridExpenses" runat="server" 
            Theme="Office365" 
            Width="100%"
            KeyFieldName="Id"
            AutoGenerateColumns="False"
            OnRowInserting="gridExpenses_RowInserting"
            OnRowUpdating="gridExpenses_RowUpdating"
            OnRowDeleting="gridExpenses_RowDeleting">
            
            <SettingsEditing Mode="Inline" />
            <SettingsPager PageSize="10" />
            <Settings ShowFilterRow="False" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" />
            
            <Columns>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" ShowDeleteButton="true" Width="120px" ButtonRenderMode="Button">
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center" />
                </dx:GridViewCommandColumn>

                <dx:GridViewDataDateColumn FieldName="ExpenseDate" Caption="Date" Width="120px">
                    <PropertiesDateEdit DisplayFormatString="d">
                        <ValidationSettings Display="Dynamic" SetFocusOnError="true">
                            <RequiredField IsRequired="true" ErrorText="Date is required" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataComboBoxColumn FieldName="Category" Caption="Category" Width="150px">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Travel" Value="Travel" />
                            <dx:ListEditItem Text="Meals & Entertainment" Value="Meals & Entertainment" />
                            <dx:ListEditItem Text="Office Supplies" Value="Office Supplies" />
                            <dx:ListEditItem Text="Equipment" Value="Equipment" />
                            <dx:ListEditItem Text="Software" Value="Software" />
                            <dx:ListEditItem Text="Training" Value="Training" />
                            <dx:ListEditItem Text="Other" Value="Other" />
                        </Items>
                        <ValidationSettings Display="Dynamic" SetFocusOnError="true">
                            <RequiredField IsRequired="true" ErrorText="Category is required" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="Amount" Caption="Amount" Width="120px">
                    <PropertiesTextEdit DisplayFormatString="c2">
                        <ValidationSettings Display="Dynamic" SetFocusOnError="true">
                            <RequiredField IsRequired="true" ErrorText="Amount is required" />
                            <RegularExpression ValidationExpression="^\d+(\.\d{1,2})?$" ErrorText="Enter a valid amount" />
                        </ValidationSettings>
                        <MaskSettings Mask="&lt;0..999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                    </PropertiesTextEdit>
                    <HeaderStyle HorizontalAlign="Right" />
                    <CellStyle HorizontalAlign="Right" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Notes" Caption="Description">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic" SetFocusOnError="true">
                            <RequiredField IsRequired="true" ErrorText="Description is required" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <HeaderStyle HorizontalAlign="Left" />
                </dx:GridViewDataTextColumn>
            </Columns>

            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="Amount" SummaryType="Sum" DisplayFormat="Total: {0:c2}" />
            </TotalSummary>
        </dx:ASPxGridView>

        <div style="margin-top: 20px; padding: 15px; background: var(--light-bg); border-radius: 8px;">
            <dx:ASPxImage ID="imgInfo" runat="server" 
                IconID="actions_info_16x16"
                style="vertical-align: middle;">
            </dx:ASPxImage>
            <span style="margin-left: 8px; color: var(--text-secondary);">
                <strong>Tips:</strong> Click "New" to add an expense. Use "Edit" to modify entries or "Delete" to remove them. 
                The total amount is calculated automatically at the bottom.
            </span>
        </div>
    </div>
</asp:Content>
