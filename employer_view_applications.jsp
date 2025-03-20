<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">
<title>Employer View Applications</title>
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
        max-width: 1500px;
        
        margin: 50px auto;
        background-image: linear-gradient(#a0c7da, white);
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    h2 {
        color: #1e5783;
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
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

    .delete-link {
        text-decoration: none;
        color: red;
    }
        input[type="submit"] {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color:#3ea5d5 ;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #1e5783;
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
<h2>Employer View Applications</h2>

<form action="shortlist_candidate.jsp" method="post"> 
    </div>
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

   
        String sql = "SELECT * FROM application";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
%>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>Skills</th>
        <th>Qualification</th>
        <th>Experience</th>
        <th>Contact</th>
        <th>Address</th>
        <th>Resume</th>
        <th>Select</th> 
    </tr>
<%
       
        while (resultSet.next()) {
%>
    <tr>
        <td><%= resultSet.getString("name") %></td>
        <td><%= resultSet.getString("email") %></td>
        <td><%= resultSet.getInt("age") %></td>
        <td><%= resultSet.getString("skills") %></td>
        <td><%= resultSet.getString("qualification") %></td>
        <td><%= resultSet.getString("experience") %></td>
        <td><%= resultSet.getString("contact") %></td>
        <td><%= resultSet.getString("address") %></td>
        <td><%= resultSet.getString("resume") %></td>
        <td><input type="checkbox" name="selectedCandidates" value="<%= resultSet.getString("email") %>"></td> <!-- Added a checkbox for each candidate -->
    </tr>
<%
        }
%>
</table>

<input type="submit" value="Shortlist Selected Candidates"> 
</form>
 <a href="homejobporatl.jsp" align="center" href="#">Home Page</a>

<%
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

</body>
</html>