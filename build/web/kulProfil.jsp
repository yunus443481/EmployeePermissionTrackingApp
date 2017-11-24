<%-- 
    Document   : kulProfil
    Created on : 04.Eki.2017, 23:43:54
    Author     : YUNUS
--%>

<!--NOT:BU SAYFADAKİ ALERT ARKA PLANDA KALDIĞI İÇİN SAYFA SÜRDÜRÜLMÜYO ALT TAB YAP ALERTE OK DE DÜZELİR... -->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
                <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <title>Kullanıcı Profil</title>

                <!-- Bootstrap Core CSS -->
                <link href="css/bootstrap.min.css" rel="stylesheet">

                    <!-- Custom CSS -->
                    <link href="css/sb-admin.css" rel="stylesheet">

                        <!-- Custom Fonts -->
                        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

                            <style>

                                #izinal {                       
                                    width: 120px;
                                    height: 40px;
                                    background: #66ccff;
                                    border-radius:10px;
                                    color:white;
                                }
                            </style>


                            </head>
                            <body>

                                <%
                                    if (session.getAttribute("yetki") == null) {
                                        response.sendRedirect("index.jsp");
                                    } else {
                                        /*Kullanıcı çıkış yaptıktan sonra geri gelmesini engelleme kodları*/

                                        String ad = session.getAttribute("ad").toString();
                                        String id = session.getAttribute("id").toString();
                                        String soyadi = session.getAttribute("soyadi").toString();
                                        String mail = session.getAttribute("mail").toString();
                                        String sifre = session.getAttribute("sifre").toString();

                                        String yetki1 = session.getAttribute("yetki").toString();

                                       if (yetki1.equals("0") && !yetki1.equals(null)){

                                            String driver = "com.mysql.jdbc.Driver";
                                            String url = "jdbc:mysql://localhost:3306/deneme?useUnicode=yes&characterEncoding=UTF-8";
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
                                            rs = st.executeQuery("SELECT * FROM giris WHERE id=" + id);

                                            while (rs.next()) {
                                                id = rs.getString("id");
                                                ad = rs.getString("ad");
                                                soyadi = rs.getString("soyadi");
                                                mail = rs.getString("mail");
                                                sifre = rs.getString("sifre");

                                            }

                                %>
                            <div id="wrapper">

                                <!-- Navigation -->
                                <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                        <a class="navbar-brand" href="#">Kullanıcı</a>
                                    </div>
                                    <!-- Top Menu Items -->
                                    <ul class="nav navbar-right top-nav">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Hesap <b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="kulProfil.jsp"><i class="fa fa-fw fa-user"></i> Profil </a>
                                                </li>

                                                <li class="divider"></li>
                                                <li>
                                                    <a href="cıkıs.jsp"><i class="fa fa-fw fa-power-off"></i> Çıkış </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                                        <ul class="nav navbar-nav side-nav">

                                            <li class="active">
                                                <a href="kullanici.jsp"><i class="fa fa-fw fa-dashboard"></i> İzin Geçmişi </a>
                                            </li>

                                            <li>
                                                <a href="#"><i class="fa fa-fw fa-table"></i> İzin Al </a>
                                            </li>

                                        </ul>
                                    </div>


                                </nav>




                                <div id="page-wrapper">

                                    <div class="container-fluid">

                                        <!-- Page Heading -->
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h1 class="page-header">
                                                    Hesap Bilgileri
                                                </h1>
                                                <ol class="breadcrumb">

                                                    <li class="active">
                                                        <i class="fa fa-table"></i> Profil
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                        <!-- /.row -->

                                        <div class="row">
                                            <div class="col-lg-6">

                                                <form role="form" action="kulProfilGuncelle.jsp" method="POST">

                                                    <div class="form-group">
                                                        <label>Adı</label>
                                                        <input class="form-control" name="ad" pattern="[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}" required maxlength="40" value=<%=ad%>>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Soyadı</label>
                                                        <input class="form-control" name="soyadi" pattern="[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}" required maxlength="40" value=<%=soyadi%>>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Mail</label>
                                                        <input type="email" class="form-control" name="mail" required maxlength="40" value=<%=mail%>>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Şifre</label>
                                                        <input id="sifre" type="password" class="form-control" name="sifre" required maxlength="10" value=<%=sifre%>>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" value="" onchange="document.getElementById('sifre').type = this.checked ? 'text' : 'password'">Şifreyi Göster   
                                                                </label>
                                                            </div>

                                                    </div>
                                                    <br>



                                                    <button type="submit" id="izinal" class="btn btn-default">Düzenle</button>

                                                </form>


                                            </div>

                                        </div>

                                    </div>
                                </div>

                            </div>


                            <% } else {

                                        response.sendRedirect("index.jsp");
                                        /*Kullanıcı çıkış yaptıktan sonra geri gelmesini engelleme kodlarının devamı*/
                                    }
                                }
                            %>


                            </body>
                            </html>

