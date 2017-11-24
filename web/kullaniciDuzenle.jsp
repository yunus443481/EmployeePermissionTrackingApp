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
        
        <meta name="viewport" content="width=device-width">        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="newcss.css" rel="stylesheet" type="text/css"/>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Kullanıcı Düzenle</title>

        <!-- Bootstrap Core CSS -->
        
        <link href="css/bootstrap.min.css" rel="stylesheet">

            <!-- Custom CSS -->
            <link href="css/sb-admin.css" rel="stylesheet">

                <!-- Custom Fonts -->
                <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


                    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
                    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
                    <!--[if lt IE 9]>
                        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                    <![endif]-->

                    <script language="javascript">
                        function confirmDel() {
                            var agree = confirm("Bu içeriği silmek istediğinizden emin misiniz?\nBu işlem geri alınamaz!");
                            if (agree) {
                                return true;
                            } else {
                                return false;
                            }
                        }
                    </script>
                    
                    <style>
                    
                        #buton {
                            
                            bottom: 10px;
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

                                String id = session.getAttribute("id").toString();
                                String yetki1 = session.getAttribute("yetki").toString();
                                if (yetki1.equals("1") && !yetki1.equals(null)) {
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
                                <a class="navbar-brand" href="#">Admin</a>
                            </div>
                            <!-- Top Menu Items -->
                            <ul class="nav navbar-right top-nav">
                                
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Hesap <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="profil.jsp"><i class="fa fa-fw fa-user"></i> Profil </a>
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
                                        <a href="basarili.jsp"><i class="fa fa-fw fa-dashboard"></i> İzin Talepleri </a>
                                    </li>

                                    <li>
                                        <a href="kullaniciDuzenle.jsp"><i class="fa fa-fw fa-table"></i> Kullanıcı Düzenle</a>
                                    </li>
                                    
                    
                            </div>
                                    
                                    
                                    </nav>

                                    <div id="page-wrapper">

                                        <div class="container-fluid">

                                            <!-- Page Heading -->
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <h1 class="page-header">
                                                        Kullanıcı Düzenle
                                                    </h1>
                                                    <ol class="breadcrumb">
                                                        <li>
                                                            <i class="fa fa-dashboard"></i>  <a href="basarili.jsp"> İzin Talepleri </a>
                                                        </li>
                                                        <li class="active">
                                                            <i class="fa fa-table"></i> Kullanıcı Düzenle
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <!-- /.row -->

                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <h2>Kullanıcılar</h2>

                                                    <div class="container">

                                                        <!-- Trigger the modal with a button -->
                                                        <button type="button" id="buton"  data-toggle="modal" data-target="#myModal">Kullanıcı Ekle</button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="myModal" role="dialog">
                                                            <div class="modal-dialog">

                                                                <!-- Modal content-->
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal"></button>
                                                                        <h4 class="modal-title">Kullanıcı Ekle</h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <form action="ekle.jsp" method="POST">

                                                                            <div class="form-group">
                                                                                <label>Adı</label>
                                                                                <input class="form-control" name="ad" pattern="[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}" required maxlength="40" placeholder="Adı girin...">
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Soyadı</label>
                                                                                <input class="form-control" name="soyadi" pattern="[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}" required maxlength="40" placeholder="Soyadı girin...">
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Mail</label>
                                                                                <input type="email" class="form-control" name="mail" required maxlength="40" placeholder="Maili girin...">
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Şifre</label>
                                                                                <input id="sifre" type="password" class="form-control" name="sifre" required maxlength="10" placeholder="Şifreyi girin...">
                                                                                    <div class="checkbox">
                                                                                        <label>
                                                                                            <input type="checkbox" value="" onchange="document.getElementById('sifre').type = this.checked ? 'text' : 'password'">Şifreyi Göster   
                                                                                        </label>
                                                                                    </div>

                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Yetki</label>
                                                                                <select class="form-control" name="yetki">
                                                                                    <option value="" disabled="disabled" selected="selected">Seçiniz</option>
                                                                                    <option value="1">Admin</option>
                                                                                    <option value="0">Kullanıcı</option>
                                                                                </select>

                                                                            </div>

                                                                            <button type="submit" class="btn btn-info btn-lg">Kaydet</button>
                                                                        </form>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>




                                                </div>
                                            </div>


                                            <form action="guncelle.jsp">
                                                <div class="container">
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="guncelle" role="dialog">
                                                        <div class="modal-dialog">
                                                            <!-- Modal content-->
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Düzenle</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <!-- form aç-->
                                                                    <label for="ad">Adı</label>
                                                                    <input type="text"  class="form-control" id="g_adi" pattern="[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}" name="g_adi" required maxlength="40"/>
                                                                    </br>
                                                                    <label for="soyadi">Soyadı</label>
                                                                    <input type="text"  class="form-control" id="g_soyadi" pattern="[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}" name="g_soyadi" required maxlength="40"/>
                                                                    </br>
                                                                    <label for="mail">Mail</label>
                                                                    <input type="email"  class="form-control" id="g_mail" name="g_mail" required maxlength="40"/>
                                                                    </br>
                                                                    <label for="sifre">Şifre</label>
                                                                    <input type="password" class="form-control" id="g_sifre" name="g_sifre" required maxlength="11"/>
                                                                    <div class="checkbox">
                                                                        <label>
                                                                            <input type="checkbox" value="" onchange="document.getElementById('g_sifre').type = this.checked ? 'text' : 'password'">Şifreyi Göster   
                                                                        </label>
                                                                    </div>
                                                                    </br>
                                                                    <label for="yetki">Yetki</label>
                                                                    <select class="form-control" id="g_yetki" name="g_yetki" required maxlength="11" >
                                                                        <option value="" disabled="disabled" selected="selected">Seçiniz</option>
                                                                        <option value="1">Admin</option>
                                                                        <option value="0">Kullanıcı</option>
                                                                    </select>

                                                                    </br>


                                                                    <button   class="btn btn-primary btn-md btn-block" onclick="this.form.action = 'guncelle.jsp'" name="secileni_duzelt" id="secileni_duzelt" >Düzenle</button></form>

                                                                    <!-- kapat-->
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                                                </div>
                                                            </div>  
                                                        </div>
                                                    </div>
                                                </div> </form>

                                            <div style="overflow: visible;" class="table-responsive">

                                                <table  class="table table-bordered table-hover" style="">
                                                    <thead>
                                                        <tr>

                                                            <th>Ad</th>
                                                            <th>Soyad</th>
                                                            <th>Mail</th>
                                                            <th>Sil</th>
                                                            <th>Düzenle</th>    
                                                        </tr>
                                                    </thead>
                                                    <tbody>



                                                        <%
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
                                                            rs = st.executeQuery("SELECT * FROM giris WHERE yetki='0'");

                                                            while (rs.next()) {
                                                                String kulid = rs.getString("id");
                                                                session.setAttribute("kulid", kulid);

                                                        %>
                                                        <tr>

                                                            <td><%=rs.getString("ad")%></td>
                                                            <td><%=rs.getString("soyadi")%></td>
                                                            <td><%=rs.getString("mail")%></td>  
                                                            <td>
                                                                <a href="sil.jsp?kulid=<%=rs.getString("id")%>" rel="nofollow" onclick="return confirmDel();"><img src="images/delete.png" style="width:30px; height:30px;" /></a>
                                                            </td>  
                                                            <td>


                                                                <!-- Trigger the modal with a button -->
                                                                <button type="button" class="btn btn-success btn-rounded waves-effect waves-light" id='<%=rs.getString("id")%>,<%=rs.getString("ad")%>,<%=rs.getString("soyadi")%>,<%=rs.getString("mail")%>,<%=rs.getString("sifre")%>,<%=rs.getString("yetki")%>' onclick="myFunction(this)" data-toggle="modal" data-target="#guncelle" name="btn_guncelle" value="<%=rs.getString("id")%>,<%=rs.getString("ad")%>,<%=rs.getString("soyadi")%>,<%=rs.getString("mail")%>,<%=rs.getString("sifre")%>,<%=rs.getString("yetki")%>"  value="<%=rs.getString("id")%>" name="guncelle"action=(this)" data-toggle="modal" data-target="#guncelle" name="btn_guncelle" value="<%=rs.getString("id")%>,<%=rs.getString("ad")%>,<%=rs.getString("soyadi")%>,<%=rs.getString("mail")%>,<%=rs.getString("sifre")%>,<%=rs.getString("yetki")%>"  > <span class="glyphicon glyphicon-edit"></span> Düzenle</button>
                                                    <script>
                                                        function myFunction(elmnt) {
                                                            var val = document.getElementById(elmnt.id).value.split(',');

                                                            document.getElementById("g_adi").value = val[1];
                                                            document.getElementById("g_soyadi").value = val[2];
                                                            document.getElementById("g_mail").value = val[3];
                                                            document.getElementById("g_sifre").value = val[4];
                                                            document.getElementById("g_yetki").value = val[5];
                                                            document.getElementById("secileni_duzelt").setAttribute("value", val[0]);
                                                        }
                                                    </script>

                                                    </td>  
                                                    </tr>

                                                    <% }%>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    </div>

                                    <!-- /.row -->

                            </div>



                            <% } else {

                                        response.sendRedirect("index.jsp");
                                        /*Kullanıcı çıkış yaptıktan sonra geri gelmesini engelleme kodlarının devamı*/
                                    }
                                }
                            %>
                            





                            </body>

                            </html>
