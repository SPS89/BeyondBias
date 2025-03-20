<%-- 
    Document   : securityquestion
    Created on : Jan 17, 2024, 1:29:53 PM
    Author     : LENOVO
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Security Question</title>
    <style>
      body {
            background-color: #f2f2f2;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
        }

        header {
            padding: 20px;
            background-color: #3ea5d5;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        #logo {
            width: 120px;
            height: auto;
        }

        .container {
            margin: auto;
            width: 80%;
            max-width: 500px; /* Set a maximum width */
            padding: 20px;
            background-image: linear-gradient(#a0c7da, white);
            box-shadow:20px -19px 8px rgb(0 0 0 / 24%);
            border-radius: 10px;
            margin-top: 50px;
        }

        .box {
            border: 1px solid #ccc;
            padding: 30px;
            margin-top: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
       
        
        .or-text {
            font-size: 18px;
            margin: 20px 0;
            color: #888;
        }

        form {
            text-align: left;
        }

        label {
            display: block;
            margin: 15px 0 5px;
            font-size: 14px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .forgot-password {
            font-size: 14px;
            color: #4285F4;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .submit {
            background-color: #3ea5d5;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .submit:hover{
            background-color: #338ab2;
        }
        input[type="submit"] {
    width: 100%;
    background-color: #3ea5d5;
    color: white;
    font-weight: bold;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
    </style>
    <script>
        function showErrorMessage(message) {
            alert(message);
            redirectToLogin();
        }
        function redirectToReset() {
            window.location.href = 'reset.html';
        }
        function redirectToLogin() {
            window.location.href = 'emplog.html';
        }
    </script>
</head>
<body>


<%
    String email= request.getParameter("email");
    String securityquestion = request.getParameter("securityquestion");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String correctsecurityquestion= "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

        String query = "SELECT securityquestion FROM empregistration WHERE email=?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, email);
        rs = stmt.executeQuery();

        if (rs.next()) {
            correctsecurityquestion= rs.getString("securityquestion");
        } else {
    %>
            <script>
                showErrorMessage("Invalid username. Please try again.");
            </script>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
       
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    if (correctsecurityquestion.equals(securityquestion)) {
    %>
        <script>
            redirectToReset();
        </script>
    <%
    } else {
    %>
        <script>
            showErrorMessage("Answer does not match. Please try again.");
        </script>
    <%
    }
%>

</body>
</html>
