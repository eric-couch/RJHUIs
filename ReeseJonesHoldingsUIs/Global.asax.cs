using System;
using System.IO;
using System.Web;

namespace ReeseJonesHoldingsUIs
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            
            // Activate DevExpress license from environment variable
            ActivateDevExpressLicense();
        }
        
        private void ActivateDevExpressLicense()
        {
            try
            {
                // Check for license key in environment variable (set in Azure App Settings)
                string licenseKey = Environment.GetEnvironmentVariable("DEVEXPRESS_LICENSE_KEY");
                
                if (!string.IsNullOrWhiteSpace(licenseKey))
                {
                    // Create DevExpress config directory
                    string appDataPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
                    string dxConfigPath = Path.Combine(appDataPath, "DevExpress");
                    
                    if (!Directory.Exists(dxConfigPath))
                    {
                        Directory.CreateDirectory(dxConfigPath);
                    }
                    
                    // Write license file
                    string licensePath = Path.Combine(dxConfigPath, "DevExpress_License.txt");
                    File.WriteAllText(licensePath, licenseKey);
                    
                    System.Diagnostics.Debug.WriteLine($"DevExpress license activated from environment variable at: {licensePath}");
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("DEVEXPRESS_LICENSE_KEY environment variable not found - using evaluation mode");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Failed to activate DevExpress license: {ex.Message}");
                // Don't throw - let the app run even if license activation fails
            }
        }

        void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends
        }
    }
}
