<%-- 
    Document   : application
    Created on : Mar 6, 2024, 10:16:55 PM
    Author     : LENOVO
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Seeker Dashboard</title>
<style>.container {
    width: 80%;
    margin: 0 auto;
}

.applications-table {
    width: 100%;
    border-collapse: collapse;
}

.applications-table th, .applications-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.applications-table th {
    background-color: #f2f2f2;
}
</style>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<div class="container">
    <h2>Job Seeker Dashboard</h2>

    <table class="applications-table">
        <thead>
            <tr>
                <th>Job ID</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
           
            String email ="vidhitunwal1486@gmail.com"; 

            
            String url = "jdbc:mysql://localhost:3306/beyondbias";
            String user = "root";
            String password = "root@bv1";

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
               
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, user, password);

               
                String sql = "SELECT * FROM application WHERE email = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                resultSet = preparedStatement.executeQuery();

               
                while (resultSet.next()) {
        %>
            <tr>
                <td><%= resultSet.getString("jobid") %></td>
                <td><%= resultSet.getBoolean("shortlisted") ? "Shortlisted" : "Not Shortlisted" %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
               
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (preparedStatement != null) {
                    try {
                        preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>










































































