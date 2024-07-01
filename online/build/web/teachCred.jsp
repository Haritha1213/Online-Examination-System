<%-- 
    Document   : teachCred
    Created on : 02-Apr-2024, 2:43:13 am
    Author     : lenovo
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Validation</title>
    </head>
    <body>
        <%
            String uid = request.getParameter("uname");
            String psw = request.getParameter("psw");
            
            // Database details:
            String dbUrl = "jdbc:mysql://localhost:3306/mysql"; 
            String dbUser = "root";
            String dbPass = "Haritha@19";
            
            String sql = "SELECT * FROM teacher123 WHERE uid = ? AND pass = ?"; 
            boolean isAuthenticated = false;
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");

                  conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, uid);
                pstmt.setString(2, psw);
                
                rs = pstmt.executeQuery();
                
               
                isAuthenticated = rs.next();
                
            } 
                finally {
                
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
           
            if (isAuthenticated) {
                
                session.setAttribute("uid", uid);
                response.sendRedirect("teacherPortal.jsp");
            } else {
                response.sendRedirect("Teacher.jsp");
            }
        %>
    </body>
</html>
