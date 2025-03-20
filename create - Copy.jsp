<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Employee Profile</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    
        <h2>Create Employee Profile</h2>

        <%
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            
            String location = request.getParameter("location");
            String info = request.getParameter("info");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");

            try {
                if (contact != null && !contact.isEmpty() && email != null && email.endsWith("@banasthali.in")) {
                    
                    if (Long.parseLong(contact) > 0) {
                       
                        Connection conn = null;
                        PreparedStatement insertStmt = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                                                                
                            String insertQuery = "INSERT INTO employeedata (id, name, email,location, info, password, contact) VALUES (?, ?, ?, ?, ?, ?, ?)";
                            insertStmt = conn.prepareStatement(insertQuery);
                            insertStmt.setString(1, id);
                            insertStmt.setString(2, name);
                            insertStmt.setString(3, email);
                            insertStmt.setString(4, location);
                            insertStmt.setString(5, info);
                            insertStmt.setString(6, password);
                            insertStmt.setString(7, contact); 

                            int rowsAffected = insertStmt.executeUpdate();

                            if (rowsAffected > 0) {
        %>
                                <script>
                                    alert("Profile created successfully!");
                                    window.location.href = "homejobporatl.jsp"; 
                                </script>
        <%
                            } else {
        %>
                                <script>
                                    alert("Error creating profile. Please try again.");
                                    window.history.back(); 
                                </script>
        <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
        %>
                            <script>
                                alert("Invalid email. Please try again.");
                                window.history.back();
                            </script>
        <%
                        } finally {
                         
                            try {
                                if (insertStmt != null) {
                                    insertStmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
        %>
                        <script>
                            alert("Contact number should be a positive long.");
                            window.history.back(); 
                        </script>
        <%
                    }
                } else {
        %>
                    <script>
                        alert("Invalid email format or email should end with '@banasthali.in'. Please try again.");
                        window.history.back(); 
                    </script>
        <%
                }
            } catch (NumberFormatException e) {
        %>
                <script>
                    alert("Error parsing contact number. Please enter a valid number.");
                    window.history.back(); 
                </script>
      
       
           <%
            }
        %>
       
    
</body>
</html>
