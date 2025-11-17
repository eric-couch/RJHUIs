# Quick Start Guide

## Initial Setup (5 minutes)

### Step 1: Set DevExpress API Key

Before building, set your DevExpress NuGet API key as an environment variable.

**Option A: PowerShell (Recommended)**
```powershell
$env:DEVEXPRESS_NUGET_KEY = "your-api-key-here"
```

**Option B: Visual Studio**
1. Right-click solution → Manage NuGet Packages
2. Add source: https://nuget.devexpress.com/api
3. Use your API key as password

Get your API key from: https://nuget.devexpress.com/

### Step 2: Build & Run

1. Open `ReeseJonesHoldingsUIs.sln` in Visual Studio 2022
2. Press **F5** to build and run
3. The application will open in your default browser

That's it! The sample data will auto-populate on first visit.

## What You'll See

### Default.aspx
Landing page with 4 demo cards linking to each UI sample.

### Page 1: Leave Request
- Fill out employee leave request form
- View recent submissions in grid
- Automatic validation

### Page 2: Expense Report
- Click "New" to add expenses
- Edit inline with "Edit" button
- Delete with confirmation
- See automatic total at bottom

### Page 3: Survey Wizard
- 3-step wizard with tabs
- Navigate with Next/Previous
- Review before submission

### Page 4: Admin Dashboard
- 4 KPI cards showing metrics
- Bar chart: Expenses by category
- Line chart: Expense trends
- Recent leave requests grid

## Testing Tips

### Clear Data
Open browser console (F12) and run:
```javascript
localStorage.clear();
location.reload();
```

### Modify Sample Data
Edit `Data/SampleDataGenerator.cs` and rebuild.

### Test Responsive Design
Press F12 → Toggle device toolbar (Ctrl+Shift+M in Chrome)

### Test Error Pages
Navigate to non-existent URL: http://localhost:xxxxx/NonExistent

## Troubleshooting

### NuGet Restore Fails
- Verify DEVEXPRESS_NUGET_KEY is set correctly
- Check API key is valid at https://nuget.devexpress.com/
- Restart Visual Studio after setting environment variable

### Build Errors
- Ensure .NET Framework 4.8 SDK is installed
- Clean solution (Build → Clean Solution) and rebuild
- Delete `bin/` and `obj/` folders manually

### Charts Don't Appear
- Verify DevExpress.Charts package is installed
- Check Web.config has DevExpress.XtraCharts assemblies
- Clear browser cache

### localStorage Not Working
- Check browser supports localStorage (all modern browsers)
- Ensure not in Incognito/Private mode
- Check browser console for JavaScript errors

## Next Steps

### Deploy to Azure

#### 1. Set Up GitHub Secrets
Go to your repository on GitHub: Settings → Secrets and variables → Actions → New repository secret

Add these secrets:
- **DEVEXPRESS_NUGET_KEY**: Your DevExpress NuGet API key (same value as your local environment variable)
- **AZURE_WEBAPP_PUBLISH_PROFILE**: Download from Azure Portal → Your Web App → Get publish profile

#### 2. Create Azure Web App
1. Create Azure Web App (Windows, .NET Framework 4.8)
2. Name it `ReeseJonesHoldingsUIs` (or update `AZURE_WEBAPP_NAME` in `.github/workflows/azure-deploy.yml`)

#### 3. Deploy
Push to main branch - the GitHub Actions workflow will automatically:
- Restore NuGet packages with DevExpress authentication
- Build the solution
- Deploy to Azure

### Verify GitHub Secrets Setup
Your DevExpress NuGet key should be the same value you use locally:
```powershell
# Check your local key (first 50 chars)
$env:DEVEXPRESS_NUGET_KEY.Substring(0, 50)
```

Copy the **entire** key value to GitHub Secrets as `DEVEXPRESS_NUGET_KEY`.

### Customize
- Modify `Content/Site.css` for styling
- Edit models in `Models/` folder
- Add pages in `Pages/` folder
- Update navigation in `Site.Master`

## Common Tasks

### Add New Page
1. Create `Pages/NewPage.aspx`
2. Set MasterPageFile="~/Site.Master"
3. Add navigation item in `Site.Master`
4. Create code-behind with localStorage logic

### Change Theme
In `Web.config`, find:
```xml
<theme theme="Office365" />
```
Change to: MaterialCompact, Material, etc.

### Add Form Fields
Use ASPxFormLayout with LayoutItems for consistent styling.

### Add Grid Columns
Edit ASPxGridView Columns collection in .aspx file.

## Performance Tips

- Use pagination on grids (default: 5-10 rows per page)
- Minimize localStorage data size
- Use dashboard refresh manually (not auto-refresh)
- Enable browser caching for static resources

## Support

- DevExpress Docs: https://docs.devexpress.com/AspNet/
- DevExpress Support: https://www.devexpress.com/support
- GitHub Issues: (Add your repo URL here)

---

**Enjoy building with DevExpress!** 🚀
