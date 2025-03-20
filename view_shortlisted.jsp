<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Shortlisted Candidates</title>
<style>
    header {
        padding: 20px;
        background-color: #3ea5d5;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    #logo {
        width: 120px;
        display: block;
        margin: 0 auto;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 50px auto;
        background-image: linear-gradient(#a0c7da, white);
        box-shadow: 20px -19px 8px rgb(0 0 0 / 24%);
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #1e5783;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f2f2f2;
    }

    .apply-link {
        text-decoration: none;
        color: #1e5783;
        cursor: pointer;
        display: inline-block;
        padding: 8px 12px;
        background-color: #eee;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .apply-link:hover {
        background-color: #3ea5d5;
        color: #fff;
    }
</style>
</head>
<body>
    <header>
        <div id="google_translate_element" align="left"></div>
        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement(
                    {pageLanguage: 'en'},
                    'google_translate_element'
                );
            }
        </script>
        <script type="text/javascript"
                src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
        </script>
        <img id="logo" src="Banasthali_Vidyapeeth_Logo.png" alt="Logo">
    </header>
    <div class="container">
        <h2>Shortlisted Candidates</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Job ID</th>
            </tr>
            <%  
                String url = "jdbc:mysql://localhost:3305/beyondbias";
                String user = "root";
                String password = "root@bv1";

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);

                    String sql = "SELECT * FROM shortlisted";
                    preparedStatement = connection.prepareStatement(sql);
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
            %>
                        <tr>
                            <td><%= resultSet.getString("name") %></td>
                            <td><%= resultSet.getString("email") %></td>
                            <td><%= resultSet.getString("jobid") %></td>
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
        </table>
        <br>
        <a href="jobseekerhome.jsp"style="text-decoration: none; color: #0074D9; display: block; margin-bottom: 20px;" <a href="#"> Home Page</a>
    </div>
        
</body>
</html>
