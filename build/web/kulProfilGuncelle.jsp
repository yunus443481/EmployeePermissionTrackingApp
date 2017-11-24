<%-- 
    Document   : kulProfilGuncelle
    Created on : 05.Eki.2017, 01:36:14
    Author     : YUNUS
--%>

<%@page import="javax.swing.JOptionPane"%>
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
    <title>Profil Güncelle</title>
</head>
<body>
    <%

        String yetki1 = session.getAttribute("yetki").toString();
        if (yetki1 == null) {
            response.sendRedirect("index.jsp");
        } else {
            request.setCharacterEncoding("utf-8");
            try {
                request.setCharacterEncoding("utf-8");
                String id = session.getAttribute("id").toString();
                String adi = request.getParameter("ad");
                String soyadi = request.getParameter("soyadi");
                String mail = request.getParameter("mail");
                String sifre = request.getParameter("sifre");
              
                try {
                    String driver = "com.mysql.jdbc.Driver";
                    String vtUrl = "jdbc:mysql://localhost:3306/";
                    String vtName = "deneme";
                    String vt_id = "root";
                    String vtPass = "";
                    Connection con = null;

                    String url = "jdbc:mysql://localhost:3306/deneme?useUnicode=yes&characterEncoding=UTF-8";
                    String user = "root";
                    String password = "";

                    try {
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, user, password);

                        String sqlQuery = "UPDATE giris Set ad= ? ,soyadi = ?,mail = ?,sifre =?  WHERE id=?";

                        PreparedStatement pst = con.prepareStatement(sqlQuery);
                        pst.setString(1, adi);
                        pst.setString(2, soyadi);
                        pst.setString(3, mail);
                        pst.setString(4, sifre);
                        pst.setString(5, id.trim());
                        pst.execute();
                        JOptionPane.showMessageDialog(null, "Profiliniz düzenlenmiştir!", "Profil", -1);
                        response.sendRedirect("kulProfil.jsp");
                    } catch (SQLException ea) {
    %><center><h1 style="color: red;"> Bir Hata Oluştu </h1> </center> <%
                out.println(ea.toString());
                return;
            }

        } catch (Exception e) {

            out.println(e.toString());
        }

        // request.getRequestDispatcher("liste.jsp").forward(request, response);
    } catch (Exception hata) {
    %><center><h1 style="color: red;"> Bir Hata Oluştu </h1> </center> <%
                out.println(hata.toString());

                return;
            }

        }

    %>

</body>
</html>