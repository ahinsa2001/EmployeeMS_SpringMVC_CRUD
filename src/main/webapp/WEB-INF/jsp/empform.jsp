<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
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
            width: 98%;
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
            font-size: 21px;
            font-weight: bold;
            margin-left: 15px;
        }
        nav .user-info {
            display: flex;
            align-items: center;
            font-size: 16px;
            margin-right: 15px;
        }
        nav .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 12px;
        }
        nav .user-info button {
            margin-left: 12px;
            padding: 5px 10px;
            font-size: 15px;
            color: #fff;
            background-color: #BE3144;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        nav .user-info button:hover {
            background-color: #F05941;
            transform: scale(1.05);
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
        .form-container {
            width: 90%;
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            backdrop-filter: blur(10px);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.6);
            color: #333;
            font-size: 16px;
        }
        .form-group input[type="text"]::placeholder,
        .form-group input[type="number"]::placeholder {
            color: #888;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            color: #fff;
            background-color: #BE3144;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .form-group input[type="submit"]:hover {
            background-color: #F05941;
            transform: scale(1.05);
        }
        .form-group input[type="submit"]:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
        }
        .error {
            color: #ff0000;
            margin-top: 5px;
            font-size: 0.9em;
        }
        .alert {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.form-group input').forEach(function(input) {
                if (input.type === 'text' || input.type === 'number') {
                    if (input.value === '0.0' || input.value === '0') {
                        input.value = '';
                    }
                    input.addEventListener('focus', function() {
                        clearError(input);
                    });
                }
            });
        });

        function clearError(input) {
            const errorElement = input.nextElementSibling;
            if (errorElement && errorElement.classList.contains('error')) {
                errorElement.innerHTML = '';
            }
        }

        function validateForm() {
            let isValid = true;
            const name = document.getElementById("name");
            const salary = document.getElementById("salary");
            const designation = document.getElementById("designation");
            const nameError = document.getElementById("nameError");
            const salaryError = document.getElementById("salaryError");
            const designationError = document.getElementById("designationError");

            nameError.innerHTML = "";
            salaryError.innerHTML = "";
            designationError.innerHTML = "";

            if (name.value.trim() === "") {
                nameError.innerHTML = "Name is required";
                isValid = false;
            }

            if (salary.value.trim() === "" || isNaN(salary.value) || parseFloat(salary.value) <= 0) {
                salaryError.innerHTML = "Valid salary is required";
                isValid = false;
            }

            if (designation.value.trim() === "") {
                designationError.innerHTML = "Designation is required";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
<nav>
    <div class="app-name">EmployeeMS</div>
    <div class="user-info">
        <%--Profile image of user--%>
        <img src="<%= request.getAttribute("profileImageUrl") %>" alt="Profile Image">
        Welcome, <%= request.getAttribute("username") %>
        <form action="logout" method="post" style="margin: 0;">
            <button type="submit">Logout</button>
        </form>
    </div>
</nav>
<h1>Add New Employee</h1>
<div class="form-container">
    <form:form method="post" action="save" onsubmit="return validateForm()">
        <div class="form-group">
            <form:input path="name" placeholder="Name" id="name" maxlength="50"/>
            <div id="nameError" class="error"></div>
        </div>
        <div class="form-group">
            <form:input path="salary" placeholder="Salary" id="salary" maxlength="8"/>
            <div id="salaryError" class="error"></div>
        </div>
        <div class="form-group">
            <form:input path="designation" placeholder="Designation" id="designation" maxlength="50"/>
            <div id="designationError" class="error"></div>
        </div>
        <div class="form-group">
            <input type="submit" value="Save"/>
        </div>
    </form:form>
</div>
</body>
</html>



