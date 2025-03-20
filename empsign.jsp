<%-- 
    Document   : empsign
    Created on : Jan 11, 2024, 8:58:42 PM
    Author     : LENOVO
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <style>
      
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            align-items: center;
            justify-content: center;
        }

       
        .dialog-box {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
<%
   
    String url = "jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull";
    String user = "root";
    String password = "root@bv1";

    
    String email = request.getParameter("email");
    
    String Password = request.getParameter("password");
    String securityquestion = request.getParameter("securityquestion");


    if (!email.endsWith("@banasthali.in")) {
%>
    <div style='text-align:center; padding:20px;'>Invalid email format. Please enter a valid Gmail address. <a href="emps.html">Go back</a></div>
<%
    } else {
     
        Connection conn = null;
        Statement stmt = null;

        boolean registrationSuccessful = false;

        try {
            
            Class.forName("com.mysql.jdbc.Driver");

          
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull","root","root@bv1");

         
            stmt = conn.createStatement();
            String sql = "INSERT INTO empregistration (email, password, securityquestion) VALUES ('" + email + "', '" + Password + "', '" + securityquestion + "')";
            int rowsAffected = stmt.executeUpdate(sql);

         
            if (rowsAffected > 0) {
                registrationSuccessful = true;
            }

        } catch (SQLException se) {
           
            se.printStackTrace();
        } catch (Exception e) {
            
            e.printStackTrace();
        } finally {
         
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        if (registrationSuccessful) {
%>
            <div id="overlay" class="overlay">
                <div id="dialog-box" class="dialog-box">
                   
                </div>
            </div>

            <script>
                function showSuccessDialog() {
                   
                    document.getElementById("overlay").style.display = "flex";

                    document.getElementById("dialog-box").innerHTML = "Registration successful! Click <button onclick='closeDialog()'>OK</button> to go to the home page.";
                }

                function closeDialog() {
                   
                    document.getElementById("overlay").style.display = "none";

                    window.location.href = "homejobporatl.html"; 
                }

                document.addEventListener("DOMContentLoaded", function() {
                    showSuccessDialog();
                });
            </script>
<%
        } else {
%>
            <div style='text-align:center; padding:20px;'>Registration failed. Please try again. <a href="emps.html">Go back</a></div>
<%
        }
    }
%>
</body>
</html>
