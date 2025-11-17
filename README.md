# ReeseJonesHoldingsUIs

DevExpress Web Forms demonstration project showcasing 5 interactive UI samples built with .NET Framework 4.8 and DevExpress v25.1.6.

## Project Overview

This project contains five sample UIs demonstrating DevExpress Web Forms components:

1. **Leave Request Form** - Submit and manage employee leave requests with validation and status tracking
2. **Expense Report Grid** - Create, edit, and delete expense entries with inline editing and totals
3. **Survey Wizard** - Multi-step survey form with tabbed navigation and data persistence
4. **Admin Dashboard** - Executive dashboard with KPI cards, charts, and data visualizations
5. **Error Pages** - Custom 404 and 500 error pages with DevExpress styling

## Technology Stack

- **.NET Framework 4.8** - Web Forms application
- **DevExpress v25.1.6** - UI components (Web, Bootstrap, Charts)
- **Newtonsoft.Json v13.0.3** - JSON serialization
- **localStorage** - Client-side data persistence
- **Office365 Theme** - DevExpress theme throughout

## Prerequisites

- Visual Studio 2022 (or later)
- .NET Framework 4.8 SDK
- DevExpress v25.1.6 trial or licensed account
- Git for version control

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/ReeseJonesHoldingsUIs.git
cd ReeseJonesHoldingsUIs
```

### 2. Configure DevExpress NuGet Feed

Set your DevExpress NuGet API key as an environment variable:

**Windows (PowerShell):**
```powershell
$env:DEVEXPRESS_NUGET_KEY = "your-devexpress-api-key"
```

**Windows (Command Prompt):**
```cmd
set DEVEXPRESS_NUGET_KEY=your-devexpress-api-key
```

You can get your API key from: https://nuget.devexpress.com/

### 3. Restore NuGet Packages

```bash
nuget restore ReeseJonesHoldingsUIs.sln
```

### 4. Build the Solution

Open `ReeseJonesHoldingsUIs.sln` in Visual Studio and build the solution (F6), or use MSBuild:

```bash
msbuild ReeseJonesHoldingsUIs.sln /p:Configuration=Debug
```

### 5. Run Locally

Press F5 in Visual Studio or set IIS Express as the startup project and run.

## Data Persistence

This application uses **browser localStorage** for data persistence. Sample data is automatically initialized on first visit:

- **5 Users** - Admin, managers, and employees
- **20 Leave Requests** - Various statuses and dates
- **25 Expense Reports** - Multiple categories and amounts
- **12 Surveys** - Completed survey responses

Data persists between sessions but is browser-specific. Clear localStorage to reset to sample data.

## Project Structure

```
ReeseJonesHoldingsUIs/
├── Content/
│   └── Site.css                 # Main stylesheet with responsive design
├── Data/
│   └── SampleDataGenerator.cs   # Generates realistic test data
├── Models/
│   ├── User.cs
│   ├── LeaveRequest.cs
│   ├── ExpenseReport.cs
│   ├── Survey.cs
│   └── KPI.cs
├── Pages/
│   ├── LeaveRequest.aspx        # Leave request submission form
│   ├── ExpenseReport.aspx       # Expense grid with CRUD operations
│   ├── SurveyWizard.aspx        # Multi-step survey wizard
│   └── AdminDashboard.aspx      # KPIs, charts, and data grid
├── Scripts/
│   └── localStorageHelper.js    # localStorage utility functions
├── Services/
│   └── LocalStorageService.cs   # Server-side localStorage bridge
├── Default.aspx                 # Landing page with demo cards
├── Site.Master                  # Master page with navigation
├── Error404.aspx                # Custom 404 error page
├── Error500.aspx                # Custom 500 error page
└── Web.config                   # DevExpress configuration
```

## Deployment to Azure

### Prerequisites

- Azure subscription with an App Service (Windows, .NET Framework 4.8)
- GitHub repository

### Configure GitHub Secrets

Add the following secrets to your GitHub repository (Settings → Secrets and variables → Actions):

1. **DEVEXPRESS_NUGET_KEY** - Your DevExpress NuGet API key
2. **AZURE_WEBAPP_PUBLISH_PROFILE** - Download from Azure Portal (App Service → Get publish profile)

### Deploy

Push to the `main` branch to trigger automatic deployment:

```bash
git add .
git commit -m "Deploy to Azure"
git push origin main
```

The GitHub Actions workflow will:
1. Build the solution with MSBuild
2. Restore DevExpress packages from the private feed
3. Create deployment package
4. Deploy to Azure Web App

## Key Features

### Leave Request Form
- ASPxFormLayout with validation
- ASPxDateEdit date pickers
- ASPxComboBox for leave types and status
- Recent submissions grid

### Expense Report Grid
- Inline editing with ASPxGridView
- CRUD operations (Create, Read, Update, Delete)
- Category dropdown with validation
- Automatic total calculation
- Currency formatting

### Survey Wizard
- ASPxPageControl with 3 steps
- Demographics, Preferences, Confirmation
- ViewState for multi-step data
- Review before submission

### Admin Dashboard
- 4 KPI cards (Users, Sessions, Approvals, Expenses)
- Bar chart - Expenses by Category
- Line chart - Expense Trends
- Recent leave requests grid
- Manual refresh button

## Browser Compatibility

- Chrome 90+
- Edge 90+
- Firefox 88+
- Safari 14+

## License

This is a demonstration project for educational purposes.

## Support

For DevExpress component issues, visit: https://www.devexpress.com/support

## Notes

- No authentication required (sample application)
- Data is stored in localStorage only
- Azure Free Tier has 60 CPU minutes/day limit
- Charts use DevExpress.XtraCharts
- Responsive design with media queries

## Screenshots

*(Add screenshots of each UI here after deployment)*

---

Built with ❤️ using DevExpress Web Forms
