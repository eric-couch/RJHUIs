<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyWizard.aspx.cs" Inherits="ReeseJonesHoldingsUIs.Pages.SurveyWizard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfSurveys" runat="server" />

    <div class="form-card">
        <h2>Customer Survey Wizard</h2>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">
            Complete the survey by progressing through each step. All fields are required.
        </p>

        <!-- Progress Indicator -->
        <div style="margin-bottom: 30px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <span id="progressText" style="font-weight: 600; color: var(--primary);">Step 1 of 3</span>
                <span id="progressPercent" style="color: var(--text-secondary); font-size: 0.9em;">33%</span>
            </div>
            <div style="width: 100%; height: 8px; background-color: #e9ecef; border-radius: 4px; overflow: hidden;">
                <div id="progressBar" style="width: 33%; height: 100%; background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); transition: width 0.3s ease;"></div>
            </div>
            <div style="display: flex; justify-content: space-between; margin-top: 8px; font-size: 0.85em; color: var(--text-secondary);">
                <span>Demographics</span>
                <span>Preferences</span>
                <span>Review</span>
            </div>
        </div>

        <dx:ASPxLabel ID="lblMessage" runat="server" 
            Text="" 
            ForeColor="Green"
            Font-Bold="true"
            CssClass="message-label">
        </dx:ASPxLabel>

        <dx:ASPxPageControl ID="pageControl" runat="server" 
            
            Width="100%"
            ActiveTabIndex="0"
            EnableCallBacks="true"
            ClientInstanceName="pageControl">
            
            <ClientSideEvents ActiveTabChanged="function(s, e) { updateProgress(s.GetActiveTabIndex()); }" />
            
            <TabPages>
                <dx:TabPage Text="Demographics">
                    <ContentCollection>
                        <dx:ContentControl>
                            <div style="padding: 20px;">
                                <h3 style="margin-top: 0; color: var(--primary);">Step 1: Personal Information</h3>
                                <p style="color: var(--text-secondary); margin-bottom: 20px;">
                                    Please provide your basic information below.
                                </p>

                                <dx:ASPxFormLayout ID="formDemographics" runat="server" >
                                    <Items>
                                        <dx:LayoutItem Caption="Full Name" RequiredMarkDisplayMode="Required">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxTextBox ID="txtName" runat="server" Width="100%" >
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                                            <RequiredField IsRequired="true" ErrorText="Name is required" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>

                                        <dx:LayoutItem Caption="Age" RequiredMarkDisplayMode="Required">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxSpinEdit ID="spinAge" runat="server" 
                                                        Width="100%" 
                                                        
                                                        MinValue="18"
                                                        MaxValue="120"
                                                        Number="25">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                                            <RequiredField IsRequired="true" ErrorText="Age is required" />
                                                        </ValidationSettings>
                                                    </dx:ASPxSpinEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>

                                        <dx:LayoutItem Caption="Location" RequiredMarkDisplayMode="Required">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxTextBox ID="txtLocation" runat="server" Width="100%" >
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                                            <RequiredField IsRequired="true" ErrorText="Location is required" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:ASPxFormLayout>

                                <div style="margin-top: 20px; text-align: right;">
                                    <dx:ASPxButton ID="btnNextDemographics" runat="server" 
                                        Text="Next Step" 
                                        
                                        OnClick="btnNextDemographics_Click"
                                        CssClass="btn-primary">
                                        <Image IconID="actions_next_16x16"></Image>
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Preferences">
                    <ContentCollection>
                        <dx:ContentControl>
                            <div style="padding: 20px;">
                                <h3 style="margin-top: 0; color: var(--primary);">Step 2: Your Preferences</h3>
                                <p style="color: var(--text-secondary); margin-bottom: 20px;">
                                    Tell us about your preferences and expectations.
                                </p>

                                <dx:ASPxFormLayout ID="formPreferences" runat="server" >
                                    <Items>
                                        <dx:LayoutItem Caption="How satisfied are you with our service?" RequiredMarkDisplayMode="Required">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxRadioButtonList ID="radioPreference" runat="server" 
                                                        
                                                        RepeatDirection="Vertical">
                                                        <Items>
                                                            <dx:ListEditItem Text="Very Satisfied" Value="Very Satisfied" />
                                                            <dx:ListEditItem Text="Satisfied" Value="Satisfied" />
                                                            <dx:ListEditItem Text="Neutral" Value="Neutral" />
                                                            <dx:ListEditItem Text="Dissatisfied" Value="Dissatisfied" />
                                                            <dx:ListEditItem Text="Very Dissatisfied" Value="Very Dissatisfied" />
                                                        </Items>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorDisplayMode="ImageWithTooltip">
                                                            <RequiredField IsRequired="true" ErrorText="Please select an option" />
                                                        </ValidationSettings>
                                                    </dx:ASPxRadioButtonList>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>

                                        <dx:LayoutItem Caption="Additional Comments">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxMemo ID="txtComments" runat="server" 
                                                        Width="100%" 
                                                        Height="100px" 
                                                        
                                                        NullText="Optional - Share any additional thoughts...">
                                                    </dx:ASPxMemo>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:ASPxFormLayout>

                                <div style="margin-top: 20px; display: flex; justify-content: space-between;">
                                    <dx:ASPxButton ID="btnPreviousPreferences" runat="server" 
                                        Text="Previous Step" 
                                        
                                        OnClick="btnPreviousPreferences_Click"
                                        CausesValidation="false">
                                        <Image IconID="actions_prev_16x16"></Image>
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnNextPreferences" runat="server" 
                                        Text="Next Step" 
                                        
                                        OnClick="btnNextPreferences_Click"
                                        CssClass="btn-primary">
                                        <Image IconID="actions_next_16x16"></Image>
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Confirmation">
                    <ContentCollection>
                        <dx:ContentControl>
                            <div style="padding: 20px;">
                                <h3 style="margin-top: 0; color: var(--primary);">Step 3: Review & Submit</h3>
                                <p style="color: var(--text-secondary); margin-bottom: 20px;">
                                    Please review your responses before submitting.
                                </p>

                                <div style="background: var(--light-bg); padding: 20px; border-radius: 8px; margin-bottom: 20px;">
                                    <h4 style="margin-top: 0; color: var(--primary);">Personal Information</h4>
                                    <div style="margin-bottom: 10px;">
                                        <strong>Name:</strong> <dx:ASPxLabel ID="lblConfirmName" runat="server" Text="" />
                                    </div>
                                    <div style="margin-bottom: 10px;">
                                        <strong>Age:</strong> <dx:ASPxLabel ID="lblConfirmAge" runat="server" Text="" />
                                    </div>
                                    <div style="margin-bottom: 10px;">
                                        <strong>Location:</strong> <dx:ASPxLabel ID="lblConfirmLocation" runat="server" Text="" />
                                    </div>

                                    <h4 style="margin-top: 20px; color: var(--primary);">Preferences</h4>
                                    <div style="margin-bottom: 10px;">
                                        <strong>Satisfaction:</strong> <dx:ASPxLabel ID="lblConfirmPreference" runat="server" Text="" />
                                    </div>
                                    <div style="margin-bottom: 10px;">
                                        <strong>Comments:</strong> <dx:ASPxLabel ID="lblConfirmComments" runat="server" Text="" />
                                    </div>
                                </div>

                                <div style="margin-top: 20px; display: flex; justify-content: space-between;">
                                    <dx:ASPxButton ID="btnPreviousConfirmation" runat="server" 
                                        Text="Previous Step" 
                                        
                                        OnClick="btnPreviousConfirmation_Click"
                                        CausesValidation="false">
                                        <Image IconID="actions_prev_16x16"></Image>
                                    </dx:ASPxButton>
                                    <div style="display: flex; gap: 10px;">
                                        <dx:ASPxButton ID="btnReset" runat="server" 
                                            Text="Reset Survey" 
                                            
                                            OnClick="btnReset_Click"
                                            CausesValidation="false">
                                            <Image IconID="actions_refresh_16x16"></Image>
                                        </dx:ASPxButton>
                                        <dx:ASPxButton ID="btnSubmit" runat="server" 
                                            Text="Submit Survey" 
                                            
                                            OnClick="btnSubmit_Click"
                                            CausesValidation="false"
                                            CssClass="btn-primary">
                                            <Image IconID="actions_apply_16x16"></Image>
                                        </dx:ASPxButton>
                                    </div>
                                </div>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
    </div>

    <script type="text/javascript">
        function updateProgress(tabIndex) {
            var totalSteps = 3;
            var currentStep = tabIndex + 1;
            var percentage = Math.round((currentStep / totalSteps) * 100);
            
            // Update text
            document.getElementById('progressText').textContent = 'Step ' + currentStep + ' of ' + totalSteps;
            document.getElementById('progressPercent').textContent = percentage + '%';
            
            // Update progress bar
            document.getElementById('progressBar').style.width = percentage + '%';
        }
        
        // Initialize on page load
        window.addEventListener('DOMContentLoaded', function() {
            if (typeof pageControl !== 'undefined') {
                updateProgress(pageControl.GetActiveTabIndex());
            }
        });
    </script>
</asp:Content>

