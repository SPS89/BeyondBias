<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%
   
    String url = "jdbc:mysql://localhost:3305/beyondbias";
    String user = "root";
    String password = "root@bv1";

  
    String jobtitle = request.getParameter("jobtitle");
    String jobid = request.getParameter("jobid");
    String description = request.getParameter("description");
    String criteria = request.getParameter("criteria");
    String vacancy = request.getParameter("vacancy");
    String deadline= request.getParameter("deadline");
    
    

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        
        Class.forName("com.mysql.jdbc.Driver");

     
        connection = DriverManager.getConnection(url, user, password);

      
        String insertQuery = "INSERT INTO job (jobtitle, jobid, description, criteria, vacancy,deadline) VALUES (?, ?, ?, ?, ?,?)";
        preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, jobtitle);
        preparedStatement.setString(2, jobid);
        preparedStatement.setString(3, description);
        preparedStatement.setString(4, criteria);
        preparedStatement.setString(5, vacancy);
        preparedStatement.setString(6, deadline);

      
        preparedStatement.executeUpdate();

       
        out.println("<script>");
        out.println("alert('Job added successfully!');");
        out.println("window.location.href = 'add_jobs.html';");
        out.println("</script>");

    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
        e.printStackTrace();
    } finally {
      
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
