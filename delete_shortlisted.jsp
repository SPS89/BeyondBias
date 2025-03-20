<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    
    String email = request.getParameter("email");

    String url = "jdbc:mysql://localhost:3306/beyondbias";
    String user = "root";
    String password = "root@bv1";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
       
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);

        String sql = "DELETE FROM shortlisted WHERE email = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, email);
        preparedStatement.executeUpdate();

        response.sendRedirect("view_shortlisted.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
   
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>