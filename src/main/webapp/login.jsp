<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body bgcolor="pink">


    <%-- Check if username and password are valid --%>
    <% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://10.12.124.82:3306/testdb1", 
    "testuser", "root");
    String name=String.valueOf(request.getAttribute("username"));
    String password=String.valueOf(request.getAttribute("password"));
    
   String sql = "SELECT * FROM USER WHERE username = ? AND password = ?";
           PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, password);
            
            // Execute the query
           ResultSet rs = stmt.executeQuery();

            // Test the query result
            if(rs.next()) {
                // Login successful
                 out.println("thank you for logging in....");
                
            } else {
                // Login failed
                 out.println("invalid ....");
            }
           
            
        
    %>
 </body>
</html>
