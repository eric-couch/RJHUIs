using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ReeseJonesHoldingsUIs.Services
{
    public class LocalStorageService
    {
        private readonly Page _page;

        public LocalStorageService(Page page)
        {
            _page = page;
        }

        public List<T> GetData<T>(string storageKey, HiddenField hiddenField)
        {
            try
            {
                if (hiddenField != null && !string.IsNullOrEmpty(hiddenField.Value))
                {
                    var data = JsonConvert.DeserializeObject<List<T>>(hiddenField.Value);
                    return data ?? new List<T>();
                }
                
                // Register script to populate hidden field from localStorage
                string script = string.Format(@"
                    var data = getData('{0}');
                    if (data) {{
                        var hdnField = document.getElementById('{1}');
                        if (hdnField) {{
                            hdnField.value = data;
                        }}
                    }}
                ", storageKey, hiddenField?.ClientID);
                
                _page.ClientScript.RegisterStartupScript(_page.GetType(), "GetData_" + storageKey, script, true);
                
                return new List<T>();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting data from localStorage: " + ex.Message);
                return new List<T>();
            }
        }
        
        public void SetData<T>(string storageKey, List<T> data, HiddenField hiddenField)
        {
            try
            {
                string json = JsonConvert.SerializeObject(data);
                
                if (hiddenField != null)
                {
                    hiddenField.Value = json;
                }
                
                // Register script to save to localStorage
                string script = string.Format(@"
                    saveData('{0}', {1});
                ", storageKey, JsonConvert.SerializeObject(json));
                
                _page.ClientScript.RegisterStartupScript(_page.GetType(), "SetData_" + storageKey, script, true);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error setting data to localStorage: " + ex.Message);
                ShowError("Error saving data: " + ex.Message, null);
            }
        }
        
        public void ShowError(string message, DevExpress.Web.ASPxLabel lblMessage)
        {
            try
            {
                if (lblMessage != null)
                {
                    lblMessage.Text = message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    // Show via JavaScript alert as fallback
                    string script = string.Format("alert('{0}');", message.Replace("'", "\\'"));
                    _page.ClientScript.RegisterStartupScript(_page.GetType(), "ShowMessage", script, true);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error showing message: " + ex.Message);
            }
        }
    }
}
