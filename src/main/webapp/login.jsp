<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        String url = "jdbc:mysql://localhost:3306/testdb1";
        String user = "your_username";
        String password = "your_password";
        String username = request.getParameter("username");
        String passwordInput = request.getParameter("password");
       // Connection conn = null;
       // PreparedStatement stmt = null;
        //ResultSet rs = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Get a connection to the database
           Connection conn = DriverManager.getConnection(url, testuser, root);
            
            // Prepare SQL query to check if username and password match
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
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
        } catch (ClassNotFoundException e) {
            out.println("<p>Could not load JDBC driver</p>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<p>Could not connect to the database testdb1</p>");
            e.printStackTrace();
        } finally {
            // Close the database connection
            if(rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
