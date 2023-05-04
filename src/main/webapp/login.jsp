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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username != null && password != null) {
            if(username.equals("myusername") && password.equals("mypassword")) {
                // Login successful
                response.sendRedirect("welcome.jsp");
            } else {
                // Login failed
                out.println("<p>Invalid username or password. Please try again.</p>");
            }
        }
    %>
</body>
</html>
