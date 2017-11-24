<%-- 
    Document   : giris
    Created on : 08.Ağu.2017, 09:59:40
    Author     : YUNUS
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giriş</title>
</head>
<body>

    <%
        String mail = request.getParameter("mail");
        String sifre = request.getParameter("sifre");

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost/deneme";
        Connection con = null;

        try {
            Class.forName(driver);
        } catch (Exception e) {
            System.exit(0);
        }
        try {
            con = DriverManager.getConnection(url, "root", "");
        } catch (Exception e) {
            System.exit(0);
        }

        Statement st = con.createStatement();
        /*bağlantı yapmak için con.open gibi*/

        ResultSet rs; //sanal tablo gibi bişey
        rs = st.executeQuery("SELECT * FROM giris WHERE mail='" + mail + "' and sifre='" + sifre + "'");

        if (rs.next()) {
            String yetki = rs.getString("yetki");
            String ad = rs.getString("ad");
            String soyadi = rs.getString("soyadi");
            
            
            
            String yoneticim = rs.getString("yoneticim");
            Integer id = rs.getInt("id");
            if (yetki.equals("1")) {

                session.setAttribute("yetki", yetki); 
                session.setAttribute("id", id);
                session.setAttribute("ad", ad);
                session.setAttribute("soyadi", soyadi);
                session.setAttribute("mail", mail);
                session.setAttribute("sifre", sifre);
                response.sendRedirect("./basarili.jsp");
                

            } else if (yetki.equals("0")) {
                session.setAttribute("yetki", yetki);
                session.setAttribute("id", id);
                session.setAttribute("ad", ad);
                session.setAttribute("soyadi", soyadi);
                session.setAttribute("mail", mail);
                session.setAttribute("sifre", sifre);
                session.setAttribute("yoneticim", yoneticim);
                response.sendRedirect("./kullanici.jsp");

            }

        } else {
            JOptionPane.showMessageDialog(null, "Hatalı giriş yaptınız!", "HATA", -1);
            //Thread.sleep(1000);

            response.sendRedirect("index.jsp");

        }

    %>

</body>
</html>
