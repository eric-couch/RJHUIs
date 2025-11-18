using System;
using System.IO;
using System.Web;

namespace ReeseJonesHoldingsUIs
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Register DevExpress license
            RegisterDevExpressLicense();
        }

        private void RegisterDevExpressLicense()
        {
            try
            {
                // Check for license key in environment variable (Azure App Setting)
                string licenseKey = Environment.GetEnvironmentVariable("DEVEXPRESS_LICENSE_KEY");
                
                if (!string.IsNullOrWhiteSpace(licenseKey))
                {
                    // Ensure DevExpress directory exists
                    string devExpressDir = Path.Combine(
                        Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
                        "DevExpress"
                    );
                    
                    if (!Directory.Exists(devExpressDir))
                    {
                        Directory.CreateDirectory(devExpressDir);
                    }
                    
                    // Write license file
                    string licenseFile = Path.Combine(devExpressDir, "DevExpress_License.txt");
                    File.WriteAllText(licenseFile, licenseKey);
                    
                    System.Diagnostics.Debug.WriteLine("DevExpress license registered from environment variable");
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("DEVEXPRESS_LICENSE_KEY environment variable not found");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error registering DevExpress license: {ex.Message}");
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends
        }
    }
}
