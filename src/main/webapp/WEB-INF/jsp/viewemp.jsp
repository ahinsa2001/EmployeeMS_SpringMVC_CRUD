<%@ page import="com.demo.beans.Emp" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: linear-gradient(135deg, #22092C, #872341);
            margin: 0;
            padding: 20px;
            padding-bottom: 60px;
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
        /*p {*/
        /*    margin-top: 90px;*/
        /*    font-size: 0.9em;*/
        /*    margin-bottom: 30px;*/
        /*}*/
        table {
            border-collapse: collapse;
            width: 90%;
            font-size: 14px;
            max-width: 800px;
            margin-top: 30px;
            margin-bottom: 20px; /* Added margin-bottom for spacing */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            color: #333; /* Changed color for better readability */
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #22092C;
            color: #fff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .button, .action-button {
            display: inline-block;
            padding: 8px 12px; /* Reduced padding for smaller buttons */
            font-size: 12px;
            color: #fff;
            background-color: #BE3144;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
            text-decoration: none;
        }
        .button:hover, .action-button:hover {
            background-color: #F05941;
            transform: scale(1.05);
        }
        .action-button {
            margin: 0 5px;
        }
        .action-buttons {
            display: flex;
            justify-content: center; /* Align buttons to the left */
        }
        .search-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 80%;
            max-width: 400px;
            margin-bottom: 10px;
            margin-top: 110px;
        }
        #searchInput {
            padding: 8px;
            font-size: 12px;
            border-radius: 5px;
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex-grow: 1;
            margin-right: 30px;
        }
    </style>
</head>
<body>
<nav>
    <div class="app-name">EmployeeMS</div>
    <div class="user-info">
        Welcome, <%= request.getAttribute("username") %>
        <form action="logout" method="post" style="margin: 0;">
            <button type="submit">Logout</button>
        </form>
    </div>
</nav>

<%
    // Retrieve the lists attribute from the request
    List<Emp> lists = (List<Emp>) request.getAttribute("lists");
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

<%--<p>Total Employees: <%= lists != null ? lists.size() : 0 %></p>--%>

<div class="search-container">
    <input type="text" id="searchInput" placeholder="Search by name" onkeyup="searchEmployees()"/>
    <a href="empform" class="button">Add New Employee</a>
</div>


<% if (lists != null && !lists.isEmpty()) { %>
<table id="empTable">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Salary</th>
        <th>Designation</th>
        <th>Action</th>
    </tr>
    <% for (Emp emp : lists) { %>
    <tr>
        <td><%= emp.getId() %></td>
        <td><%= emp.getName() %></td>
        <td><%= emp.getSalary() %></td>
        <td><%= emp.getDesignation() %></td>
        <td class="action-buttons">
            <a href="<%= request.getContextPath() %>/editemp/<%= emp.getId() %>" class="action-button">Edit</a>
            <a href="<%= request.getContextPath() %>/deleteemp/<%= emp.getId() %>" class="action-button">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
<% } else { %>
<p>No employees found.</p>
<% } %>

<script>
    function searchEmployees() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("empTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>

</body>
</html>