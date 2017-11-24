<%-- 
    Document   : sil.jsp
    Created on : 09.Ağu.2017, 16:05:57
    Author     : YUNUS
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>   
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanıcı Ekle</title>
</head>
<body>

    <%
        boolean ayni = true;

        String yetki1 = session.getAttribute("yetki").toString();
        if (yetki1.equals("1")) {

            request.setCharacterEncoding("utf-8");
            String ad = request.getParameter("ad");

            String soyadi = request.getParameter("soyadi");

            String mail = request.getParameter("mail");

            String sifre = request.getParameter("sifre");

            String yetki = request.getParameter("yetki");
            
            String yonetid = session.getAttribute("id").toString();

            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/deneme?useUnicode=yes&characterEncoding=UTF-8";
            Connection con = null;
          
            Class.forName(driver);
            con = DriverManager.getConnection(url, "root", "");
            Statement ps = con.createStatement();
            
            ResultSet rs; //sanal tablo gibi bişey
            rs =ps.executeQuery("SELECT Count(*) as sayici FROM giris WHERE mail='"+mail+"'");
            int sayici = 0;
            while (rs.next()) {
                sayici= rs.getInt("sayici");
            }

            if (sayici==0) {
            
            PreparedStatement ps2 = null;
            ps2 = con.prepareStatement("INSERT INTO giris(ad,soyadi,mail,sifre,yetki,yoneticim) values(?,?,?,?,?,?) ");

            ps2.setString(1, ad);

            ps2.setString(2, soyadi);

            ps2.setString(3, mail);

            ps2.setString(4, sifre);

            ps2.setString(5, yetki);
            
            ps2.setString(6, yonetid);

            ps2.execute();

              }
            else{
                    
                        
                         JOptionPane.showMessageDialog(null, "Bu mail kullanılmaktadır!", "HATA", -1);
                    
                    }
             
            response.sendRedirect("kullaniciDuzenle.jsp");

        } else {

            response.sendRedirect("index.jsp");
        }


    %>


</body>
</html>
