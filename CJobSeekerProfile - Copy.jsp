<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Job Seeker Profile</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <h2>Create Job Seeker Profile</h2>

        <%
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String dob = request.getParameter("dob");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String skill = request.getParameter("skill");
            String experience = request.getParameter("experience");
            String qualification = request.getParameter("qualification");
            String shift = request.getParameter("shift");

            try {
                // Validate email format
                if (contact != null && !contact.isEmpty() && email != null && email.endsWith("@gmail.com")) {
                    // Establish database connection
                    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                         PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO jobseekerdata (name, age, dob, contact, email, address, skill, experience, qualification, shift) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

                        // Set parameters for the SQL query
                        insertStmt.setString(1, name);
                        insertStmt.setString(2, age);
                        insertStmt.setString(3, dob);
                        insertStmt.setString(4, contact);
                        insertStmt.setString(5, email);
                        insertStmt.setString(6, address);
                        insertStmt.setString(7, skill);
                        insertStmt.setString(8, experience);
                        insertStmt.setString(9, qualification);
                        insertStmt.setString(10, shift);

                        // Execute the SQL query
                        int rowsAffected = insertStmt.executeUpdate();

                        // Check if the insertion was successful
                        if (rowsAffected > 0) {
        %>
                            <script>
                                alert("Profile created successfully!");
                                window.location.href = "jobseekerhome.jsp"; // Redirect to the home page
                            </script>
        <%
                        } else {
        %>
                            <script>
                                alert("Error creating profile. Please try again.");
                                window.location.href = "createprofileseeker.html"; // Go back to the previous page
                            </script>
        <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
        %>
                        <script>
                            alert("Error in database operation. Please try again.");
                            window.location.href = "createprofileseeker.html"; // Go back to the previous page
                        </script>
        <%
                    }
                } else {
        %>
                    <script>
                        alert("Invalid email format or email should end with '@gmail.com'. Please try again.");
                        window.location.href = "createprofileseeker.html"; // Go back to the previous page
                    </script>
        <%
                }
            } catch (NumberFormatException e) {
        %>
                <script>
                    alert("Error parsing age or contact number. Please enter valid numbers.");
                    window.location.href = "createprofileseeker.html"; // Go back to the previous page
                </script>
        <%
            }
        %>
    </div>
</body>
</html>
