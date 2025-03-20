<%-- 
    Document   : emplog
    Created on : Jan 14, 2024, 7:00:00 PM
    Author     : LENOVO
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        <!-- Your CSS styles remain unchanged -->
    </style>
    <script>
        function showAlert(message) {
            alert(message);
        }
        function redirectToEmps() {
            window.location.href = 'sign.html'; 
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <%
       
            String url = "jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull";
            String usernameDB = "root";
            String passwordDB = "root@bv1";

            String email = request.getParameter("email");
            String Password = request.getParameter("password");

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

            
                String query = "SELECT * FROM jobseekerregistration WHERE email=? AND Password=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, email);
                stmt.setString(2, Password);
                 rs = stmt.executeQuery();
                boolean valid=rs.next();
          
                if (valid) {
                    if (valid) {
                 HttpSession ssession = request.getSession();
                 String loggedInUser = (String) session.getAttribute("loggedInUser");
                 session.setAttribute("loggedInUser", email); 
                 response.sendRedirect("jobseekerhome.jsp"); 
                 out.println("login succefully");
}
                    response.sendRedirect("jobseekerhome.jsp");
                } else {
             
        %>
                    <script>
                        showAlert("Error. Please try again. Please register first.");
                        redirectToEmps();
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
        %>
        
    </div>
</body>
</html>
