<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeUser.aspx.cs" Inherits="ReeseJonesHoldingsUIs.WelcomeUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Welcome User - Reese Jones Holdings</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .welcome-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            padding: 60px 40px;
            text-align: center;
            max-width: 500px;
            margin: 20px;
        }

        .welcome-icon {
            font-size: 64px;
            margin-bottom: 20px;
        }

        h1 {
            color: #333;
            font-size: 32px;
            margin: 0 0 10px 0;
        }

        .username {
            color: #667eea;
            font-weight: 600;
        }

        .role-badge {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            margin: 20px 0;
        }

        p {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin: 20px 0;
        }

        .back-link {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: background 0.3s;
        }

        .back-link:hover {
            background: #5568d3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="welcome-container">
            <h1>Welcome <span class="username"><asp:Literal ID="litUsername" runat="server"></asp:Literal></span></h1>
            <div class="role-badge">User</div>
            <p>You have successfully logged in as a User. This is your user dashboard area.</p>
            <a href="Default.aspx" class="back-link">Back to Home</a>
        </div>
    </form>
</body>
</html>
