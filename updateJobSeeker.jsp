<%-- 
    Document   : updateJobSeeker
    Created on : Feb 15, 2024, 8:09:39 PM
    Author     : LENOVO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Jobseeker</title>
    
</head>
<body>
    <div class="container">
        <h2>Update Jobseeker</h2>

        <% 
           
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String dob = request.getParameter("dob");
            String contact = request.getParameter("contact");
            String email= request.getParameter("email");
            String address = request.getParameter("address");
            String skill = request.getParameter("skill");
            String experience = request.getParameter("experience");
            String qualification = request.getParameter("qualification");
            String shift = request.getParameter("shift");
           
            
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "UPDATE jobseekerdata SET name=?, age=?,dob=?,contact=?, address=?, skill=?, experience=?, qualification=?,shift=? WHERE email=?";
                stmt = conn.prepareStatement(query);
              
                stmt.setString(1, name);
                stmt.setString(2, age);
                stmt.setString(3, dob);
                stmt.setString(4, contact);
               stmt.setString(5, address);
                stmt.setString(6, skill);
                 stmt.setString(7, experience);
                  stmt.setString(8, qualification);
                  stmt.setString(9, shift);
                   stmt.setString(10, email);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
        %>
                    <script>
                        alert("Jobseeker details updated successfully!");
                        window.location.href = "jobseekerhome.jsp"; 
                    </script>
        <% 
                } else {
        %>
                    <script>
                        alert("Failed to update jobseeker details.");
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
