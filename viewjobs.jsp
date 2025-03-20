<%-- 
    Document   : viewjobs.jsp
    Created on : Feb 19, 2024, 3:56:34 PM
    Author     : LENOVO
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Jobs</title>
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
            box-shadow:20px -19px 8px rgb(0 0 0 / 24%);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1e5783;
        }

        .job-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .job-title {
            font-size: 18px;
            font-weight: bold;
            color: #1e5783;
            margin-bottom: 10px;
        }

        .job-details {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
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
            src=
"https://translate.google.com/translate_a/element.js?
cb=googleTranslateElementInit">
    </script>
    <img id="logo" src="Banasthali_Vidyapeeth_Logo.png" alt="Logo">
    </header>
<div class="container">
    <h1>View Jobs</h1>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias","root","root@bv1");
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM job";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
    %>
    <div class="job-box">
        <div class="job-title"><%= resultSet.getString("jobtitle") %></div>
        <div class="job-details">
            <strong>Job ID:</strong> <%= resultSet.getString("jobid") %><br>
            <strong>Description:</strong> <%= resultSet.getString("description") %><br>
            <strong>Criteria:</strong> <%= resultSet.getString("criteria") %><br>
            <strong>Vacancy:</strong> <%= resultSet.getString("vacancy") %><br>
             <strong>Deadline:</strong> <%= resultSet.getString("deadline") %><br>
        </div>
        <a href="applyform.html?jobid=<%= resultSet.getString("jobid") %>" class="apply-link">Apply</a>
    </div>
    
    <%
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
     <a href="homejobporatl.jsp" style="text-decoration: none; color: #0074D9; display: block; margin-bottom: 10px;" align="center">Back to Home</a>
</div>


</body>
</html>