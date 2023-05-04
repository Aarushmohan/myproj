<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
    <h1>Login Page</h1>
    <form method="post" action="login.jsp">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>

    <%-- Check if username and password are valid --%>
    <% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://10.12.124.82:3306/testdb1", 
    "testuser", "root");
    PreparedStatement stmt = conn.prepareStatement(sq);
            
            // Prepare SQL query to check if username and password match
            int i= stmt.execute(" SELECT * FROM USER WHERE username = ? AND password = ?");
         
            stmt.setString(1, username);
            stmt.setString(2, passwordInput);
            
            // Execute the query
             ResultSet rs = stmt.executeQuery();
            
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
