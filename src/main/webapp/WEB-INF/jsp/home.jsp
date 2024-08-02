<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #22092C, #872341);
            height: 100vh;
            margin: 0;
            text-align: center;
            color: #fff;
        }
        nav {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 0;
            backdrop-filter: blur(10px);
        }
        nav .app-name {
            font-size: 24px;
            font-weight: bold;
            margin-left: 15px;
        }
        nav .user-info {
            font-size: 18px;
            margin-right: 15px;
        }
        h2 {
            font-size: 2em;
            margin-bottom: 50px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
        .button-container {
            display: flex;
            gap: 20px;
        }
        button {
            padding: 15px 30px;
            font-size: 18px;
            color: #fff;
            background-color: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
            backdrop-filter: blur(10px);
        }
        button:hover {
            background-color: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }
        button:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
        }
    </style>
</head>
<body>
<nav>
    <div class="app-name">EmployeeMS</div>
    <div class="user-info">Welcome, <%= request.getAttribute("username") %></div>
</nav>
<h2>Welcome to Employee Management System</h2>
<div class="button-container">
    <button type="button" onclick="location.href='empform'">Add Employee</button>
    <button type="button" onclick="location.href='viewemp'">View Employees</button>
</div>

</body>
</html>


