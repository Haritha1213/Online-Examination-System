<%-- 
    Document   : teacherPortal
    Created on : 03-Apr-2024, 10:32:38 am
    Author     : lenovo
--%>

<%@page import="java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Portal</title>
        <style>
            h1{
                text-align: center;
                margin-top: 50px;
            }
            .box1{
                width: 300px; 
                height: 100px; 
                background-color: #f2f2f2; 
                border-radius: 10px; 
                margin-left: 20px; 
                padding: 20px;
                margin-bottom: 40px;
            }
            .container {
             display: flex;
             justify-content: space-evenly;
            
             }
                     
             .button:hover {
              background-color: #9dc6d8; 
              }
              .button {
                width: 300px;
                height: 300px;
                background-color:#f2f2f2;
                border-radius: 10px;
                text-align: center; 
                align-content: center;
                border: none; 
                font-size: 40px;
               
               }
               
            
        </style>
    </head>
    <body style="background-color:#e1c9d3">
        <%
    // Retrieve the username from the session
    String userid = (String) session.getAttribute("uid");
    String userName = null;
    
    // Database connection details
    String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
    String dbUser = "root";
    String dbPass = "Haritha@19";
    
    String sql = "SELECT uname FROM teacher123 WHERE uid = ?";
    
    try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        
        pstmt.setString(1, userid);
        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                userName = rs.getString("uname");
            }
        }
    } catch (SQLException e) {
        // Handle SQL exceptions
    }
    
    %>
    
    <h1>E Tantra - Teacher</h1>
    <div class ="box1">
        <h3>Hello <%= userName %></h3>
        <p>You haven't scheduled any exams...</p>
    </div>
       
        <div class="container">
            <form action="teachExam.jsp" method="get">
            <button class="button">Schedule new Exam</button> 
            </form>
            <form action="stuexam.jsp" method="get">
            <button class="button">View Exams</button> 
            </form>
            <% session.setAttribute("uid", "userid"); %>
            <form action="stuexam.jsp" method="get">
            <button class="button">Marks</button> 
            </form>
            
         </div>
        
    </body>
</html>
