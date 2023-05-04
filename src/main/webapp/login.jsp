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
    
    
   String uname=request.getAttribute("username");
   string password=request.getAttribute("password");
   String sql = "SELECT * FROM USER WHERE username = ? AND password = ?";
            stmt.setString(1, uname);
            stmt.setString(2, password);
    PreparedStatement stmt = conn.prepareStatement(sql);
            
            
            // Execute the query
           ResultSet rs = stmt.executeQuery();

         
            // Execute the query
             ResultSet rs = stmt.executeQuery("select * from USER where username = ? and password = ?");
            
            // Test the query result
            if(rs.next()) {
                // Login successful
                response.sendRedirect("welcome.jsp");
            } else {
                // Login failed
                out.println("<p>Invalid username or password. Please try again.</p>");
            }
           
            
        
    %>
 </body>
            </html>
