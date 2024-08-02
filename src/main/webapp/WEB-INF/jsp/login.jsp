<%--&lt;%&ndash;<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!DOCTYPE html>&ndash;%&gt;--%>
<%--&lt;%&ndash;<html>&ndash;%&gt;--%>
<%--&lt;%&ndash;<head>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <title>Login</title>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta charset="UTF-8">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta name="viewport" content="width=device-width, initial-scale=1.0">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <style>&ndash;%&gt;--%>
<%--&lt;%&ndash;        body {&ndash;%&gt;--%>
<%--&lt;%&ndash;            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;&ndash;%&gt;--%>
<%--&lt;%&ndash;            display: flex;&ndash;%&gt;--%>
<%--&lt;%&ndash;            flex-direction: column;&ndash;%&gt;--%>
<%--&lt;%&ndash;            align-items: center;&ndash;%&gt;--%>
<%--&lt;%&ndash;            justify-content: center;&ndash;%&gt;--%>
<%--&lt;%&ndash;            height: 100vh;&ndash;%&gt;--%>
<%--&lt;%&ndash;            background: linear-gradient(135deg, #22092C, #872341);&ndash;%&gt;--%>
<%--&lt;%&ndash;            margin: 0;&ndash;%&gt;--%>
<%--&lt;%&ndash;            padding: 20px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            color: #fff;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        h2 {&ndash;%&gt;--%>
<%--&lt;%&ndash;            font-size: 2.5em;&ndash;%&gt;--%>
<%--&lt;%&ndash;            margin-bottom: 20px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        form {&ndash;%&gt;--%>
<%--&lt;%&ndash;            display: flex;&ndash;%&gt;--%>
<%--&lt;%&ndash;            flex-direction: column;&ndash;%&gt;--%>
<%--&lt;%&ndash;            align-items: center;&ndash;%&gt;--%>
<%--&lt;%&ndash;            width: 100%;&ndash;%&gt;--%>
<%--&lt;%&ndash;            max-width: 400px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            background-color: #fff;&ndash;%&gt;--%>
<%--&lt;%&ndash;            padding: 20px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-radius: 10px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);&ndash;%&gt;--%>
<%--&lt;%&ndash;            color: #333;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        input[type="text"], input[type="password"] {&ndash;%&gt;--%>
<%--&lt;%&ndash;            width: 100%;&ndash;%&gt;--%>
<%--&lt;%&ndash;            padding: 10px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            margin: 10px 0;&ndash;%&gt;--%>
<%--&lt;%&ndash;            border: 1px solid #ddd;&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-radius: 5px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            font-size: 16px;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        input[type="submit"] {&ndash;%&gt;--%>
<%--&lt;%&ndash;            width: 100%;&ndash;%&gt;--%>
<%--&lt;%&ndash;            padding: 10px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            background-color: #BE3144;&ndash;%&gt;--%>
<%--&lt;%&ndash;            border: none;&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-radius: 5px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            color: #fff;&ndash;%&gt;--%>
<%--&lt;%&ndash;            font-size: 16px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            cursor: pointer;&ndash;%&gt;--%>
<%--&lt;%&ndash;            transition: background-color 0.3s;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        input[type="submit"]:hover {&ndash;%&gt;--%>
<%--&lt;%&ndash;            background-color: #F05941;&ndash;%&gt;--%>
<%--&lt;%&ndash;            transform: scale(1.05);&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        .account-link {&ndash;%&gt;--%>
<%--&lt;%&ndash;            margin-top: 20px;&ndash;%&gt;--%>
<%--&lt;%&ndash;            font-size: 14px;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        .account-link a {&ndash;%&gt;--%>
<%--&lt;%&ndash;            color: #BE3144;&ndash;%&gt;--%>
<%--&lt;%&ndash;            text-decoration: none;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        .account-link a:hover {&ndash;%&gt;--%>
<%--&lt;%&ndash;            text-decoration: underline;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    </style>&ndash;%&gt;--%>
<%--&lt;%&ndash;</head>&ndash;%&gt;--%>
<%--&lt;%&ndash;<body>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>Login</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<form:form method="post" action="login">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <form:input path="username" placeholder="Username" /><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <form:password path="password" placeholder="Password" /><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <input type="submit" value="Login"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form:form>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="account-link">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <p>Don't have an account? <a href="register">Register</a></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>


<%--<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Login</title>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            background: linear-gradient(135deg, #22092C, #872341);--%>
<%--            height: 100vh;--%>
<%--            margin: 0;--%>
<%--            text-align: center;--%>
<%--            color: #fff;--%>
<%--        }--%>
<%--        h1 {--%>
<%--            font-size: 2.5em;--%>
<%--            margin-bottom: 20px;--%>
<%--            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);--%>
<%--        }--%>
<%--        .form-container {--%>
<%--            width: 90%;--%>
<%--            max-width: 500px;--%>
<%--            background-color: rgba(255, 255, 255, 0.2);--%>
<%--            padding: 30px;--%>
<%--            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);--%>
<%--            border-radius: 15px;--%>
<%--            backdrop-filter: blur(10px);--%>
<%--        }--%>
<%--        .form-group {--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>
<%--        .form-group input[type="text"],--%>
<%--        .form-group input[type="password"] {--%>
<%--            width: 100%;--%>
<%--            padding: 15px;--%>
<%--            box-sizing: border-box;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--            background: rgba(255, 255, 255, 0.6);--%>
<%--            color: #333;--%>
<%--            font-size: 16px;--%>
<%--        }--%>
<%--        .form-group input[type="text"]::placeholder,--%>
<%--        .form-group input[type="password"]::placeholder {--%>
<%--            color: #888;--%>
<%--        }--%>
<%--        .form-group input[type="submit"] {--%>
<%--            width: 100%;--%>
<%--            padding: 12px;--%>
<%--            font-size: 14px;--%>
<%--            color: #fff;--%>
<%--            background-color: #BE3144;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            transition: all 0.3s;--%>
<%--        }--%>
<%--        .form-group input[type="submit"]:hover {--%>
<%--            background-color: #F05941;--%>
<%--            transform: scale(1.05);--%>
<%--        }--%>
<%--        .form-group input[type="submit"]:focus {--%>
<%--            outline: none;--%>
<%--            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);--%>
<%--        }--%>
<%--        .error {--%>
<%--            color: #ff0000;--%>
<%--            margin-top: 5px;--%>
<%--            font-size: 0.9em;--%>
<%--        }--%>
<%--        .alert {--%>
<%--            color: red;--%>
<%--            font-weight: bold;--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script>--%>
<%--        function validateLoginForm() {--%>
<%--            let isValid = true;--%>
<%--            const username = document.getElementById("username");--%>
<%--            const password = document.getElementById("password");--%>
<%--            const usernameError = document.getElementById("usernameError");--%>
<%--            const passwordError = document.getElementById("passwordError");--%>

<%--            usernameError.innerHTML = "";--%>
<%--            passwordError.innerHTML = "";--%>

<%--            if (username.value.trim() === "") {--%>
<%--                usernameError.innerHTML = "Username is required";--%>
<%--                isValid = false;--%>
<%--            }--%>

<%--            if (password.value.trim() === "") {--%>
<%--                passwordError.innerHTML = "Password is required";--%>
<%--                isValid = false;--%>
<%--            }--%>

<%--            return isValid;--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Login</h1>--%>
<%--<div class="form-container">--%>
<%--    <form:form method="post" action="login" onsubmit="return validateLoginForm()">--%>
<%--        <div class="form-group">--%>
<%--            <form:input path="username" placeholder="Username" id="username"/>--%>
<%--            <div id="usernameError" class="error"></div>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <form:input path="password" placeholder="Password" id="password"/>--%>
<%--            <div id="passwordError" class="error"></div>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <input type="submit" value="Login"/>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <p>Don't have an account? <a href="register" style="color: #F05941;">Register here</a></p>--%>
<%--        </div>--%>
<%--    </form:form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
        .form-group input[type="password"] {
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
        .form-group input[type="password"]::placeholder {
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
        .con a{
            color: #F05941;
        }
        .alert {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
    <script>
        function validateLoginForm() {
            let isValid = true;
            const username = document.getElementById("username");
            const password = document.getElementById("password");
            const usernameError = document.getElementById("usernameError");
            const passwordError = document.getElementById("passwordError");

            usernameError.innerHTML = "";
            passwordError.innerHTML = "";

            if (username.value.trim() === "") {
                usernameError.innerHTML = "Username is required";
                isValid = false;
            }

            if (password.value.trim() === "") {
                passwordError.innerHTML = "Password is required";
                isValid = false;
            }

            return isValid;
        }

        function clearError(event) {
            const errorElement = document.getElementById(event.target.id + "Error");
            errorElement.innerHTML = "";
        }
    </script>
</head>
<body>
<h1>Login</h1>

<%
    // Retrieve the message attribute from the request
    String message = (String) request.getAttribute("message");
%>

<%
    if (message != null) {
%>
<script>
    alert('<%= message %>');
</script>
<%
    }
%>
<div class="form-container">
    <form:form method="post" action="login" modelAttribute="user" onsubmit="return validateLoginForm()">
        <div class="form-group">
            <form:input path="username" placeholder="Username" id="username" onfocus="clearError(event)"/>
            <div id="usernameError" class="error"></div>
        </div>
        <div class="form-group">
            <form:password path="password" placeholder="Password" id="password" onfocus="clearError(event)"/>
            <div id="passwordError" class="error"></div>
        </div>
        <div class="form-group">
            <input type="submit" value="Login"/>
        </div>
    </form:form>

    <div class="con">
        Don't have an account? <a href="register">Register here</a>
    </div>
</div>

</body>
</html>

