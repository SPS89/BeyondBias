<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Community</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            background-size: cover;
        }
        .container {
            margin: auto;
            background-image: linear-gradient(#a0c7da, white);
            box-shadow:20px -19px 8px rgb(0 0 0 / 24%);
            width: 80%;
            max-width: 500px; /* Set a maximum width */
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 50px;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-size: 14px;
            color: #333;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            width: 48%;
            background-color: #3ea5d5;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
            margin-right: 2%; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Community</h2>
        <% 
            String email = request.getParameter("email");
            String name= request.getParameter("name");
             String cname= request.getParameter("cname");
            String cpurpose = request.getParameter("cpurpose");
            String cmember= request.getParameter("cmember");
            String grouplink = request.getParameter("grouplink");
            String contact = request.getParameter("contact");

            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "UPDATE community SET email=?,name=?, cpurpose=?, cmember=?, grouplink=?, contact=? WHERE cname=?";
                stmt = conn.prepareStatement(query);
              stmt.setString(1, email);
                stmt.setString(2, name);
                stmt.setString(3, cpurpose);
                stmt.setString(4, cmember);
                stmt.setString(5, grouplink);
                stmt.setString(6, contact);
                stmt.setString(7, cname);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
        %>
                    <script>
                        alert("Community details updated successfully!");
                        window.location.href = "homejobporatl.jsp"; 
                    </script>
        <% 
                } else {
        %>
                    <script>
                        alert("Failed to update community details.");
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
