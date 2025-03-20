<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Employee</h2>

        <% 
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String location = request.getParameter("location");
            String info = request.getParameter("info");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "UPDATE employeedata SET id=?, name=?, location=?, info=?, password=?, contact=? WHERE email=?";
                stmt = conn.prepareStatement(query);

                stmt.setString(1, id);
                stmt.setString(2, name);
                stmt.setString(3, location);
                stmt.setString(4, info);
                stmt.setString(5, password);
                stmt.setString(6, contact);
                stmt.setString(7, email);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
        %>
                    <script>
                        alert("Employee details updated successfully!");
                        window.location.href = "homejobporatl.jsp"; 
                    </script>
        <% 
                } else {
        %>
                    <script>
                        alert("Failed to update employee details.");
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
                    if (rs != null) rs.close();
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
