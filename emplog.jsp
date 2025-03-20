<%--
    Document   : emplog
    Created on : Jan 14, 2024, 7:00:00 PM
    Author     : LENOVO
--%>
<%@page import="java.lang.String"%>
<%@ page import="javax.servlet.http.HttpSession" %>
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
            window.location.href = 'emps.html';
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
         <script>
        function showAlert(message) {
            alert(message);
        }
        function redirectToEmps() {
            window.location.href = 'emplog.html';
        }
    </script>
        <%
          
            String url = "jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull";
            String user = "root";
            String password = "root@bv1";

            String email = request.getParameter("email");
            String Password = request.getParameter("password");

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

                String query = "SELECT * FROM empregistration WHERE email=? AND password=?";
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
    response.sendRedirect("homejobporatl.jsp"); 
    out.println("login succefully"); 
}
                } else {
                   
        %>
                    <script>
                        showAlert("Error Incorrect credentials or Please register first.");
                  function redirectToEmps(){
            window.location.href = 'emps.html';
        };
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