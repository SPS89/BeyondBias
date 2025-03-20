<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@ page import="java.sql.*, java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="javax.servlet.http.*" %>

<%

String url = "jdbc:mysql://localhost:3305/beyondbias";
String user = "root";
String password = "root@bv1";


String uploadDirectory = getServletContext().getRealPath("/") + File.separator + "uploads";
File uploadDir = new File(uploadDirectory);
if (!uploadDir.exists()) {
    uploadDir.mkdir();
}


try {
  
    RequestContext ctx = new ServletRequestContext(request);

    ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
    List<FileItem> items = upload.parseRequest(ctx);

    String name = null;
    String jobid = null;
    String email = null;
    int age = 0;
    String skills = null;
    String qualification = null;
    String experience = null;
    String contact = null;
    String address = null;
    String resume = null;

    for (FileItem item : items) {
        if (item.isFormField()) {
            String fieldName = item.getFieldName();
            String fieldValue = item.getString("UTF-8");

            if ("name".equals(fieldName)) {
                name = fieldValue;
            } else if ("jobid".equals(fieldName)) {
                jobid = fieldValue;
            } else if ("email".equals(fieldName)) {
                email = fieldValue;
            } else if ("age".equals(fieldName)) {
                age = Integer.parseInt(fieldValue);
            } else if ("skills".equals(fieldName)) {
                skills = fieldValue;
            } else if ("qualification".equals(fieldName)) {
                qualification = fieldValue;
            } else if ("experience".equals(fieldName)) {
                experience = fieldValue;
            } else if ("contact".equals(fieldName)) {
                contact = fieldValue;
            } else if ("address".equals(fieldName)) {
                address = fieldValue;
            }
        } else {
       
            if (item.getSize() > 0) {
                String fileName = new File(item.getName()).getName();
                resume = uploadDirectory + File.separator + fileName;
                File storeFile = new File(resume);
                item.write(storeFile);
            } else {
                resume = ""; 
            }
        }
    }

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");

        connection = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO application (name, jobid,  email, age, skills, qualification, experience, contact, address, resume) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, jobid);
        preparedStatement.setString(3, email);
        preparedStatement.setInt(4, age);
        preparedStatement.setString(5, skills);
        preparedStatement.setString(6, qualification);
        preparedStatement.setString(7, experience);
        preparedStatement.setString(8, contact);
        preparedStatement.setString(9, address);
        preparedStatement.setString(10, resume);

        int rowsAffected = preparedStatement.executeUpdate();

        preparedStatement.close();
        connection.close();

        if (rowsAffected > 0) {
%>
            <script>
                alert("Application submitted successfully! We will contact you further.");
                window.location.href = "jobseekerhome.jsp"; // Redirect to home job portal page
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error in Application Submission. Please try again later.");
            window.location.href = "applyform.html"; // Redirect to apply form page
        </script>
<%
    } finally {
        // Close the database resources
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
} catch (Exception e) {
    e.printStackTrace();
}
%>
