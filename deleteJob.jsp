<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Job </title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Job </h2>

        <% 
            String jobid= request.getParameter("jobid");

            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "DELETE FROM job WHERE jobid=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, jobid);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
        %>
                    <script>
                        alert("Job deleted successfully!");
                        window.location.href = "homejobporatl.jsp"; 
                    </script>
        <% 
                } else {
        %>
                    <script>
                        alert("Failed to delete job .");
                        window.history.back(); 
                    </script>
        <% 
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
        %>
                <script>
                    alert("An error occurred. Please try again.");
                    window.history.back(); 
                </script>
        <% 
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>


