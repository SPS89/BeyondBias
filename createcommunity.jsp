<%-- 
    Document   : createcommunity
    Created on : Feb 26, 2024, 7:17:48 AM
    Author     : LENOVO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create community</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <h2>Create Community</h2>

        <%
             String email = request.getParameter("email");
            String name = request.getParameter("name");
            String cname = request.getParameter("cname");
            
            String cpurpose = request.getParameter("cpurpose");
            String cmember = request.getParameter("cmember");
            String grouplink = request.getParameter("grouplink");
             String contact = request.getParameter("contact");
            


            try {
                if (contact != null && !contact.isEmpty() && email != null && email.endsWith("@banasthali.in")) {
                  
                    if (Long.parseLong(contact) > 0) {
                      
                        Connection conn = null;
                        PreparedStatement insertStmt = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

                           
                             String insertQuery = "INSERT INTO community ( email,name, cname, cpurpose, cmember,grouplink,contact) VALUES ( ?,?, ?, ?, ?, ?,?)";
                            insertStmt = conn.prepareStatement(insertQuery);
                            insertStmt.setString(1, email);
                            insertStmt.setString(2, name);
                            insertStmt.setString(3, cname);
                            insertStmt.setString(4, cpurpose);
                            insertStmt.setString(5, cmember);
                             insertStmt.setString(6,grouplink); 
                             insertStmt.setString(7, contact);
                            
                           

                            int rowsAffected = insertStmt.executeUpdate();

                            if (rowsAffected > 0) {
        %>
                                <script>
                                    alert("Community created successfully!");
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
    </div>
</body>
</html>