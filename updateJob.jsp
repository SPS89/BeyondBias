<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Job</title>
 
</head>
<body>
    <div class="container">
        <h2>Update Job</h2>

        <% 
            String jobtitle = request.getParameter("jobtitle");
            String jobid = request.getParameter("jobid");
            String description = request.getParameter("description");
            String criteria = request.getParameter("criteria");
            String vacancy = request.getParameter("vacancy");
            String deadline = request.getParameter("deadline");
            
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "UPDATE job SET jobtitle=?, description=?, criteria=?, vacancy=?, deadline=? WHERE jobid=?";
                stmt = conn.prepareStatement(query);
              
                stmt.setString(1, jobtitle);
                stmt.setString(2, description);
                stmt.setString(3, criteria);
                stmt.setString(4, vacancy);
              
                if (deadline != null && !deadline.isEmpty()) {
                    Date deadlineDate = Date.valueOf(deadline);
                    stmt.setDate(5, deadlineDate);
                } else {
                    stmt.setDate(5, null); 
                }
                stmt.setString(6, jobid);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
        %>
                    <script>
                        alert("Job details updated successfully!");
                        window.location.href = "homejobporatl.jsp"; 
                    </script>
        <% 
                } else {
        %>
                    <script>
                        alert("Failed to update job details.");
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
