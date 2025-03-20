<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <style>
        body {
            background-image: url('Women-Empowerment1.jpg');
            background-size: cover;
        }
        .container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        h2 {
            text-align: center;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #0074D9;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function showSuccessMessage(message) {
            alert(message);
            redirectToLogin();
        }
        function showErrorMessage(message) {
            alert(message);
        }
        function redirectToLogin() {
            window.location.href = 'login.html';
        }
    </script>
</head>
<body>

<%
    try {
        String newPassword = request.getParameter("newPassword");
        String email = request.getParameter("email");

        out.println("New Password: " + newPassword);
        out.println("Email: " + email);

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

            String updateQuery = "UPDATE jobseekerregistration SET Password=? WHERE email=?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, newPassword);
            stmt.setString(2, email);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
%>
                <script>
                    showSuccessMessage("Password updated successfully!");
                    redirectToLogin();
                </script>
<%
            } else {
%>
                <script>
                    showErrorMessage("Error updating password. Please try again.");
                </script>
<%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
         
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
