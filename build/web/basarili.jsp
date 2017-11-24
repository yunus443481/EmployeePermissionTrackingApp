
<!DOCTYPE html>

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

        <script src=https://code.jquery.com/jquery-1.12.4.js></script>
        <script src=https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
            <script>
                $(document).ready(function () {
                    $('#example').DataTable();
                });
            </script>

            <script>
                $(document).ready(function () {
                    $('#example1').DataTable();
                });
            </script>
            <script>
                $(document).ready(function () {
                    $('#example2').DataTable();
                });
            </script>

            <script>
                $(function () {
                    console.log($("td").width());
                });
            </script>


            <title>İzin Talep </title>

            <!-- Bootstrap Core CSS -->
            <link href="css/bootstrap.min.css" rel="stylesheet">

                <!-- Custom CSS -->
                <link href="css/sb-admin.css" rel="stylesheet">

                    <!-- Custom Fonts -->
                    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


                        <style>
                            .test {
                                width: 60px;
                                overflow: hidden;
                                white-space: nowrap;
                                text-overflow: ellipsis;
                                display: block;
                            }
                            .test.passive {
                                width: auto;
                                overflow: auto;
                                white-space: inherit;
                                text-overflow: inherit;
                            }
                        </style>
                        
                        <style>
                        button {
                        background:none!important;
                        border:none; 
                        padding:0!important;

                        /*optional*/
                        font-family:arial,sans-serif; /*input has OS specific font-family*/
                        color:#069;
                        text-decoration:underline;

                        </style>

                        </head>


                        <body>
                            <%
                                if (session.getAttribute("yetki") == null) {
                                    response.sendRedirect("index.jsp");
                                } else {

                                    String yetki1 = session.getAttribute("yetki").toString();
                                    String id = session.getAttribute("id").toString();
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

                                <div class="collapse navbar-collapse navbar-ex1-collapse">
                                    <ul class="nav navbar-nav side-nav">
                                        <li class="active">
                                            <a href="basarili.jsp"><i class="fa fa-fw fa-dashboard"></i> İzin Talepleri </a>
                                        </li>

                                        <li>
                                            <a href="kullaniciDuzenle.jsp"><i class="fa fa-fw fa-table"></i> Kullanıcı Düzenle</a>
                                        </li>


                                        </nav>

                                        <div id="page-wrapper">

                                            <div class="container-fluid">

                                                <!-- Page Heading -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <h1 class="page-header">
                                                            İzin Talepleri
                                                        </h1>
                                                        <ol class="breadcrumb">

                                                            <li class="active">
                                                                <i class="fa fa-table"></i> İzin Talepleri
                                                            </li>
                                                        </ol>
                                                    </div>
                                                </div>
                                                <!-- /.row -->

                                                <div class="row">
                                                    <div class="col-lg-12">

                                                        <form action="basarili.jsp">
                                                            <div class="container">
                                                                <!-- Modal -->
                                                                <div class="modal fade" id="aciklama" role="dialog">
                                                                    <div class="modal-dialog">
                                                                        <!-- Modal content-->
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                <h4 class="modal-title">Açıklama</h4>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <!-- form aç-->
                                                                                <label for="ad">Adı</label>
                                                                                <input type="text"  class="form-control" id="adi"  name="adi" disabled/>
                                                                                </br>
                                                                                <label for="soyadi">Soyadı</label>
                                                                                <input type="text"  class="form-control" id="soyadi"  name="soyadi" disabled/>
                                                                                </br>
                                                                                <label for="mail">Mail</label>
                                                                                <input type="text"  class="form-control" id="mail"  name="mail" disabled/>
                                                                                </br>
                                                                                <label for="baslangictar">Başlangıç Tarihi</label>
                                                                                <input type="text"  class="form-control" id="baslangictar" name="baslangictar" disabled/>
                                                                                </br>
                                                                                <label for="bitistar">Bitiş Tarihi</label>
                                                                                <input type="text" class="form-control" id="bitistar" name="bitistar" disabled/>
                                                                                </br> 
                                                                                <label for="izinneden">İzin Nedeni</label>
                                                                                <textarea type="text" class="form-control" rows="7"style="resize: none;" id="izinneden" name="izinneden" disabled></textarea>
                                                                                </br> 
                                                                                <label for="izindurum">Onay Durumu</label>
                                                                                <input type="text" class="form-control" id="izindurum" name="izindurum" disabled/>


                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                                                            </div>
                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                        </form>

                                                        <div  style="overflow:visible;" class="table-responsive">

                                                            <table  id="example" class="display" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>İzin No</th>
                                                                        <th>Adı</th>
                                                                        <th>Soyadı</th>
                                                                        <th>Mail</th>
                                                                        <th>Başlangıç Tarihi</th>
                                                                        <th>Bitiş Tarihi</th>
                                                                        <th>İzin Nedeni</th>
                                                                        <th>Onayla</th>
                                                                        <th>Reddet</th>   
                                                                    </tr>
                                                                </thead>
                                                                <tbody>



                                                                    <%  String driver = "com.mysql.jdbc.Driver";
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
                                                                        rs = st.executeQuery("SELECT G.id,G.ad,G.soyadi,G.mail,G.yoneticim,I.baslangictar,I.bitistar,I.izinneden,I.izinId,I.izindurum FROM giris G INNER JOIN izin I ON G.id=I.kullaniciId WHERE I.izindurum='bekleniyor' AND G.yoneticim='" + id + "'"); // hangi yönetici ile giriş yaparsa ona göre sıralanması için bide where kullanıcı adı yap

                                                                        while (rs.next()) {
                                                                            String izinId = rs.getString("izinId");
                                                                            session.setAttribute("izinId", izinId);

                                                                    %>
                                                                    <tr>




                                                                        <td> <button type="button" id='<%=rs.getString("izinId")%>,<%=rs.getString("ad")%>,<%=rs.getString("soyadi")%>,<%=rs.getString("mail")%>,<%=rs.getString("baslangictar")%>,<%=rs.getString("bitistar")%>,<%=rs.getString("bitistar")%>,<%=rs.getString("izinneden")%>,<%=rs.getString("izindurum")%>' onclick="myFunction3(this)" data-toggle="modal" data-target="#aciklama" name="btn_guncelle3" value="<%=rs.getString("izinId")%>,<%=rs.getString("ad")%>,<%=rs.getString("soyadi")%>,<%=rs.getString("mail")%>,<%=rs.getString("baslangictar")%>,<%=rs.getString("bitistar")%>,<%=rs.getString("izinneden")%>,<%=rs.getString("izindurum")%>"  value="<%=rs.getString("izinId")%>" name="guncelle"action="(this)" data-toggle="modal" data-target="#aciklama" name="btn_guncelle3" value="<%=rs.getString("izinId")%>,<%=rs.getString("ad")%>,<%=rs.getString("soyadi")%>,<%=rs.getString("mail")%>,<%=rs.getString("baslangictar")%>,<%=rs.getString("bitistar")%>,<%=rs.getString("izinneden")%>,<%=rs.getString("izindurum")%>"> <%=izinId%> </button></td>                                                                        

                                                                <script>
                                                                    function myFunction3(elmnt) {
                                                                        var val = document.getElementById(elmnt.id).value.split(',');

                                                                        document.getElementById("adi").value = val[1];
                                                                        document.getElementById("soyadi").value = val[2];
                                                                        document.getElementById("mail").value = val[3];
                                                                        document.getElementById("baslangictar").value = val[4];
                                                                        document.getElementById("bitistar").value = val[5];
                                                                        document.getElementById("izinneden").value = val[6];
                                                                        document.getElementById("izindurum").value = val[7];
                                                                        document.getElementById("izinId").setAttribute("value", val[0]);

                                                                    }
                                                                </script>



                                                                <td><%=rs.getString("ad")%></td>
                                                                <td><%=rs.getString("soyadi")%></td>
                                                                <td><%=rs.getString("mail")%></td> 
                                                                <td><%=rs.getString("baslangictar")%></td>
                                                                <td><%=rs.getString("bitistar")%></td>
                                                                <td class="test"><%=rs.getString("izinneden")%></td> 
                                                                <td><a href="onayla.jsp?izinId=<%=rs.getString("izinId")%>" rel="nofollow"><img src="images/ok.png" style="width:30px; height:30px;" /></a></td>
                                                                <td><a href="reddet.jsp?izinId=<%=rs.getString("izinId")%>" rel="nofollow"><img src="images/cancel.png" style="width:30px; height:30px;" /></td> 

                                                                </tr>

                                                                <% }%>

                                                                </tbody>
                                                            </table>

                                                        </div>

                                                        <h2>Onaylanan İzinler</h2>
                                                        <div style="overflow: visible;" class="table-responsive">

                                                            <table  id="example1" class="display" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>İzin No</th>
                                                                        <th>Adı</th>
                                                                        <th>Soyadı</th>
                                                                        <th>Mail</th>
                                                                        <th>Başlangıç Tarihi</th>
                                                                        <th>Bitiş Tarihi</th>
                                                                        <th>İzin Nedeni</th>
                                                                        <th>İzin Durumu</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>



                                                                    <%

                                                                        Statement st1 = con.createStatement();
                                                                        /*bağlantı yapmak için con.open gibi*/

                                                                        ResultSet rs1; //sanal tablo gibi bişey
                                                                        rs1 = st1.executeQuery("SELECT G.id,G.ad,G.soyadi,G.mail,G.yoneticim,I.baslangictar,I.bitistar,I.izinneden,I.izinId,I.izindurum FROM giris G INNER JOIN izin I ON G.id=I.kullaniciId WHERE I.izindurum='onaylandı' AND G.yoneticim='" + id + "'"); // hangi yönetici ile giriş yaparsa ona göre sıralanması için bide where kullanıcı adı yap

                                                                        while (rs1.next()) {
                                                                            String izinId = rs1.getString("izinId");
                                                                            session.setAttribute("izinId", izinId);

                                                                    %>
                                                                    <tr>

                                                                        <td> <button type="button" id='<%=rs1.getString("izinId")%>,<%=rs1.getString("ad")%>,<%=rs1.getString("soyadi")%>,<%=rs1.getString("mail")%>,<%=rs1.getString("baslangictar")%>,<%=rs1.getString("bitistar")%>,<%=rs1.getString("izinneden")%>,<%=rs1.getString("izindurum")%>' onclick="myFunction(this)" data-toggle="modal" data-target="#aciklama" name="btn_guncelle" value="<%=rs1.getString("izinId")%>,<%=rs1.getString("ad")%>,<%=rs1.getString("soyadi")%>,<%=rs1.getString("mail")%>,<%=rs1.getString("baslangictar")%>,<%=rs1.getString("bitistar")%>,<%=rs1.getString("izinneden")%>,<%=rs1.getString("izindurum")%>"  value="<%=rs1.getString("izinId")%>" name="guncelle"action="(this)" data-toggle="modal" data-target="#aciklama" name="btn_guncelle" value="<%=rs1.getString("izinId")%>,<%=rs1.getString("ad")%>,<%=rs1.getString("soyadi")%>,<%=rs1.getString("mail")%>,<%=rs1.getString("baslangictar")%>,<%=rs1.getString("bitistar")%>,<%=rs1.getString("izinneden")%>,<%=rs1.getString("izindurum")%>"><%=izinId%></button></td>                                                                        

                                                                <script>
                                                                    function myFunction(elmnt) {
                                                                        var val = document.getElementById(elmnt.id).value.split(',');

                                                                        document.getElementById("adi").value = val[1];
                                                                        document.getElementById("soyadi").value = val[2];
                                                                        document.getElementById("mail").value = val[3];
                                                                        document.getElementById("baslangictar").value = val[4];
                                                                        document.getElementById("bitistar").value = val[5];
                                                                        document.getElementById("izinneden").value = val[6];
                                                                        document.getElementById("izindurum").value = val[7];
                                                                        document.getElementById("izinId").setAttribute("value", val[0]);
                                                                    }
                                                                </script>
                                                                <td><%=rs1.getString("ad")%></td>
                                                                <td><%=rs1.getString("soyadi")%></td>
                                                                <td><%=rs1.getString("mail")%></td> 
                                                                <td><%=rs1.getString("baslangictar")%></td>
                                                                <td><%=rs1.getString("bitistar")%></td>
                                                                <td class="test"><%=rs1.getString("izinneden")%></td> 
                                                                <td><%=rs1.getString("izindurum")%></td> 

                                                                </tr>

                                                                <% }%>



                                                                </tbody>
                                                            </table>

                                                        </div>

                                                        <h2>Reddedilen İzinler</h2>
                                                        <div style="overflow: visible;" class="table-responsive">

                                                            <table id="example2" class="display" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>İzin No</th>
                                                                        <th>Adı</th>
                                                                        <th>Soyadı</th>
                                                                        <th>Mail</th>
                                                                        <th>Başlangıç Tarihi</th>
                                                                        <th>Bitiş Tarihi</th>
                                                                        <th>İzin Nedeni</th>
                                                                        <th>İzin Durumu</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>



                                                                    <%

                                                                        Statement st2 = con.createStatement();
                                                                        /*bağlantı yapmak için con.open gibi*/

                                                                        ResultSet rs2; //sanal tablo gibi bişey
                                                                        rs2 = st2.executeQuery("SELECT G.id,G.ad,G.soyadi,G.mail,G.yoneticim,I.baslangictar,I.bitistar,I.izinneden,I.izinId,I.izindurum FROM giris G INNER JOIN izin I ON G.id=I.kullaniciId WHERE I.izindurum='reddedildi' AND G.yoneticim='" + id + "'"); // hangi yönetici ile giriş yaparsa ona göre sıralanması için bide where kullanıcı adı yap

                                                                        while (rs2.next()) {
                                                                            String izinId = rs2.getString("izinId");
                                                                            session.setAttribute("izinId", izinId);

                                                                    %>
                                                                    <tr>

                                                                        <td> <button type="button" id='<%=rs2.getString("izinId")%>,<%=rs2.getString("ad")%>,<%=rs2.getString("soyadi")%>,<%=rs2.getString("mail")%>,<%=rs2.getString("baslangictar")%>,<%=rs2.getString("bitistar")%>,<%=rs2.getString("izinneden")%>,<%=rs2.getString("izindurum")%>' onclick="myFunction1(this)" data-toggle="modal" data-target="#aciklama" name="btn_guncelle2" value="<%=rs2.getString("izinId")%>,<%=rs2.getString("ad")%>,<%=rs2.getString("soyadi")%>,<%=rs2.getString("mail")%>,<%=rs2.getString("baslangictar")%>,<%=rs2.getString("bitistar")%>,<%=rs2.getString("izinneden")%>,<%=rs2.getString("izindurum")%>"  value="<%=rs2.getString("izinId")%>" name="guncelle" action="(this)" data-toggle="modal" data-target="#aciklama" name="btn_guncelle2" value="<%=rs2.getString("izinId")%>,<%=rs2.getString("ad")%>,<%=rs2.getString("soyadi")%>,<%=rs2.getString("mail")%>,<%=rs2.getString("baslangictar")%>,<%=rs2.getString("bitistar")%>,<%=rs2.getString("izinneden")%>,<%=rs2.getString("izindurum")%>"><%=izinId%></button></td>

                                                                <script>
                                                                    function myFunction1(elmnt) {
                                                                        var val = document.getElementById(elmnt.id).value.split(',');

                                                                        document.getElementById("adi").value = val[1];
                                                                        document.getElementById("soyadi").value = val[2];
                                                                        document.getElementById("mail").value = val[3];
                                                                        document.getElementById("baslangictar").value = val[4];
                                                                        document.getElementById("bitistar").value = val[5];
                                                                        document.getElementById("izinneden").value = val[6];
                                                                        document.getElementById("izindurum").value = val[7];
                                                                        document.getElementById("izinId").setAttribute("value", val[0]);
                                                                    }
                                                                </script>

                                                                <td><%=rs2.getString("ad")%></td>
                                                                <td><%=rs2.getString("soyadi")%></td>
                                                                <td><%=rs2.getString("mail")%></td> 
                                                                <td><%=rs2.getString("baslangictar")%></td>
                                                                <td><%=rs2.getString("bitistar")%></td>
                                                                <td class="test"><%=rs2.getString("izinneden")%></td> 
                                                                <td><%=rs2.getString("izindurum")%></td> 

                                                                </tr>

                                                                <% }%>

                                                                </tbody>
                                                            </table>

                                                        </div>  

                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                </div>

                                <% } else {

                                            response.sendRedirect("index.jsp");
                                        }
                                    }
                                %>
                                <script>
                                    $('#test').on('click', function () {
                                        $(this).toggleClass('passive');
                                    });
                                </script>

                                </body>

                                </html>
