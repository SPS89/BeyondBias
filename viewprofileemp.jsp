<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String ID = request.getParameter("ID");

    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

        String query = "SELECT * FROM employeedata WHERE ID=?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, ID);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
          
            out.println("<h2>Employee Profile</h2>");
            out.println("<p>ID: " + rs.getString("ID") + "</p>");
            out.println("<p>Name: " + rs.getString("name") + "</p>");
            out.println("<p>Email: " + rs.getString("email") + "</p>");
            out.println("<p>Location: " + rs.getString("location") + "</p>");
            out.println("<p>Info: " + rs.getString("info") + "</p>");
            out.println("<p>Password: " + rs.getString("password") + "</p>");
            out.println("<p>Contact: " + rs.getString("contact") + "</p>");
        } else {
            out.println("<p>No profile found for ID: " + ID + "</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
       
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
