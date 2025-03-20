<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
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
            font-family: Arial, sans-serif;
             background-image: linear-gradient(#a0c7da, white);
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        

        h2 {
            color: #1e5783;
            align : center;
        }


table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

table th {
    background-color: #3ea5d5;
    color: white;
}

       
    </style>
</head>
<body bgColor="pink" >
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
    <h2 align="center" > Feedback </h2>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Feedback</th>
        </tr>
        <%
            String url = "jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull";
            String user = "root";
            String password = "root@bv1";
             Connection conn = null;
             Statement stmt = null;
             ResultSet rs = null;


            try {
             
                Class.forName("com.mysql.jdbc.Driver");
             
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");

                 stmt = conn.createStatement();

                String query = "SELECT * FROM feedback";
                 rs = stmt.executeQuery(query);

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("feedback") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                  
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
   
    
</body>
</html>
