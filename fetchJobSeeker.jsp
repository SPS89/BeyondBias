<%-- 
    Document   : fetchJobSeeker
    Created on : Jan 29, 2024, 11:19:58 PM
    Author     : LENOVO
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker Details</title>
     <style>
         
    header {
            padding: 20px;
            background-color: #3ea5d5;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        #logo {
            width: 120px;
            
            display: block;
            margin: 0 auto;
        }
         body {
            background-color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            
            margin: 0 auto;
            width: 300px;
            max-width: 500px; 
            padding: 20px;
            background-image: linear-gradient(#a0c7da, white);
            box-shadow:20px -19px 8px rgb(0 0 0 / 24%);
           
            border-radius: 10px;
            margin-top: 50px;
        }
        h2 {
            text-align: center;
            color: #1e5783;;
        }
        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="qualification"]
        {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
     
       
         button[type="submit"] {
            width: 100%;
            background-color:#3ea5d5;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
</style>

         
    
</head>
<body>
    <header>
       <div id="google_translate_element" align="left"></div>
 
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement(
                {pageLanguage: 'en'},
                'google_translate_element'
            );
        }
    </script>
 
    <script type="text/javascript"
            src=
"https://translate.google.com/translate_a/element.js?
cb=googleTranslateElementInit">
    </script>
        <img id="logo" src="Banasthali_Vidyapeeth_Logo.png" alt="Logo">
    </header>
    <div class="container">
        <h2>Job Seeker Details</h2>
        <% 
            String email = request.getParameter("email");
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "SELECT * FROM jobseekerdata WHERE email=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                if (rs.next()) {
        %>
                    <form action="updateJobSeeker.jsp" method="POST">
                        
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" required><br>
                         <label for="age">Age:</label>
                        <input type="text" id="age" name="age" value="<%= rs.getString("age") %>" required><br>
                         <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" value="<%= rs.getString("dob") %>" required><br>
                        <label for="contact">Contact:</label>
                        <input type="text" id="contact" name="contact" value="<%= rs.getString("contact") %>" required><br>
                        <input type="hidden" name="email" value="<%= rs.getString("email") %>">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="<%= rs.getString("address") %>" required><br>
                        <label for="skill">Skills:</label>
                        <input type="text" id="skill" name="skill" value="<%= rs.getString("skill") %>" required><br>
                        <label for="experience">Experience:</label>
                        <input type="text" id="info" name="experience" value="<%= rs.getString("experience") %>" required><br>
                        <label for="qualification">Qualification:</label>
                        <br><input type="qualification" id="qualification" name="qualification" value="<%= rs.getString("qualification") %>" required><br>
                        <label for="shift">Shift:</label>
                        <input type="text" id="shift" name="shift" value="<%= rs.getString("shift") %>" required><br>
                        
                        <button type="submit">Update</button>
                    </form>
                    <form action="deleteJobSeeker.jsp" method="POST">
                        <input type="hidden" name="email" value="<%= rs.getString("email") %>">
                        <br> <button type="submit">Delete</button>
                    </form>
        <% 
                } else {
        %>
                    <p>No job seeker found with the provided ID.</p>
        <% 
                }
            } catch (SQLException | ClassNotFoundException e) {
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


















