<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
     String phone = request.getParameter("phone");
      String classn = request.getParameter("classn");
       String name = request.getParameter("name");
        String passw = request.getParameter("passw");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.12.124.82:3306/testdb1", 
    "testuser", "root");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into student(student first name, student last name, phone number, class, school name, mail id, username, password, confirm password, regdate, time) values ('" + firstName + "','"
    + lastName + "',' " + phone + "',' " + classn + "',' " + name + "',' " + email + "','" + userName + "','" + password + "',' " + passw + "', CURDATE() , CURTIME())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
        
    } else {
        response.sendRedirect("index.jsp");
    }
%>
