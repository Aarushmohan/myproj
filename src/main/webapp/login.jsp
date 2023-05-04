<%@ page import="java.sql.*"%>


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

