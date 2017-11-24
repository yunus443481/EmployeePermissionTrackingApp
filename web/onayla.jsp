<%-- 
    Document   : onayla
    Created on : 24.Ağu.2017, 09:36:46
    Author     : YUNUS
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Onayla</title>
</head>
<body>
    <% 

             String yetki1 = session.getAttribute("yetki").toString();
             String izinId = request.getParameter("izinId");
             String izindurum="onaylandı";
             if (yetki1.equals("1")) {
                        

        request.setCharacterEncoding("utf-8");
         
       
            
                String driver = "com.mysql.jdbc.Driver";
                String vtUrl = "jdbc:mysql://localhost:3306/";
                String vtName = "deneme";
                String vt_id = "root";
                String vtPass = "";
                Connection con = null;
                
                String url = "jdbc:mysql://localhost:3306/deneme?useUnicode=yes&characterEncoding=UTF-8";
                String user = "root";
                String password = "";

              
                    Class.forName(driver);
                    con = DriverManager.getConnection(url, user, password);

                    String sqlQuery = "UPDATE izin Set izindurum=? WHERE izinId=?";

                    PreparedStatement pst = con.prepareStatement(sqlQuery);
                   
                    pst.setString(1, izindurum);
                    
                    pst.setString(2, izinId);
                    
                    pst.execute();
                    
                    request.getRequestDispatcher("basarili.jsp").forward(request, response);
                
  
 } else {
            
            response.sendRedirect("index.jsp");
        }
        
    %>

</body>
</html>