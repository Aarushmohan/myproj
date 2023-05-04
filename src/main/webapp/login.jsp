<%@ page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    Statement stmt = conn.createStatement();
            
            // Prepare SQL query to check if username and password match
// String i= "SELECT * FROM USER WHERE username = ? AND password = ?";
         
            // Execute the query
             ResultSet rs = stmt.executeQuery("SELECT * FROM USER WHERE username = ? AND password = ?");
            
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
