<%-- 
    Document   : sil.jsp
    Created on : 09.Ağu.2017, 16:05:57
    Author     : YUNUS
--%>

<%@page import="java.sql.*"%>
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanıcı Sil</title>
</head>
<body>

    <%

        String yetki1 = session.getAttribute("yetki").toString();
        if (yetki1.equals("1")) {

            request.setCharacterEncoding("utf-8");
            String kulid = request.getParameter("kulid");

            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/deneme?useUnicode=yes&characterEncoding=UTF-8";
            Connection con = null;

            try {
                Class.forName(driver);
                con = DriverManager.getConnection(url, "root", "");
                PreparedStatement ps = con.prepareStatement("DELETE FROM giris WHERE id=" + kulid);
                ps.execute();
   
                PreparedStatement ps1 = con.prepareStatement("DELETE FROM izin WHERE kullaniciId=" +kulid+" AND izindurum='bekleniyor'");
                ps1.execute();
                
            } catch (Exception e) {
                System.exit(0);
            }
            response.sendRedirect("kullaniciDuzenle.jsp");

        } else {

            response.sendRedirect("index.jsp");
        }

    %>


</body>
</html>
