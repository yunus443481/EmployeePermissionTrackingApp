<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>   
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>İzin Ekle</title>
</head>
<body>

    <%
        boolean ayni = true;

        String yetki1 = session.getAttribute("yetki").toString();
        if (yetki1.equals("0")) {

            request.setCharacterEncoding("utf-8");

            String id = session.getAttribute("id").toString();

            String yoneticim = session.getAttribute("yoneticim").toString();

            String user = request.getParameter("user");

            String admin = request.getParameter("admin");

            String dateBaslangic = request.getParameter("baslangictar").toString();
            
            String dateBitis = request.getParameter("bitistar").toString();
           
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            
            LocalDate localBaslangic = LocalDate.parse(dateBaslangic,formatter);
            LocalDate localBitis = LocalDate.parse(dateBitis,formatter);
            
            String izinneden = request.getParameter("izinneden");

            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/deneme?useUnicode=yes&characterEncoding=UTF-8";
            Connection con = null;
            PreparedStatement ps = null;
            
            Class.forName(driver);
            con = DriverManager.getConnection(url, "root", "");

            String izindurum="bekleniyor";
            
            ps = con.prepareStatement("INSERT INTO izin(kullaniciId,yoneticiId,baslangictar,bitistar,izinneden,izindurum) values(?,?,?,?,?,?) ");

            ps.setString(1, id);

            ps.setString(2, yoneticim);

            ps.setDate(3, Date.valueOf(localBaslangic));

            ps.setDate(4, Date.valueOf(localBitis));
            
            ps.setString(5, izinneden);
            
            ps.setString(6,izindurum);

            ps.execute();

            JOptionPane.showMessageDialog(null, "İzin talebiniz alınmıştır!", "İZİN", -1);
            
            response.sendRedirect("izinAl.jsp");
            

        } else {

            response.sendRedirect("index.jsp");
        }


    %>


</body>
</html>
