
<!--NOT:BU SAYFADAKİ ALERT ARKA PLANDA KALDIĞI İÇİN SAYFA SÜRDÜRÜLMÜYO ALT TAB YAP ALERTE OK DE DÜZELİR... -->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datetimepicker.js" type="text/javascript"></script>
    <script src="js/bootstrap-datetimepicker.tr.js" type="text/javascript"></script>

    <title>İzin Al</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

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
            String yoneticim = session.getAttribute("yoneticim").toString();
            String yetki1 = session.getAttribute("yetki").toString();
            String yonetici = "";

            if (yetki1.equals("0") && !yetki1.equals(null)) {

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
                rs = st.executeQuery("SELECT ad FROM giris WHERE id=" + yoneticim);

                while (rs.next()) {
                    yonetici = rs.getString("ad");

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
                        İzin Al
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="kullanici.jsp">İzin Geçmişi</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> İzin Al
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-6">

                    <form role="form" action="izinEkle.jsp" method="POST">

                        <fieldset disabled>

                            <div class="form-group">
                                <label for="disabledSelect">Kullanıcı</label>
                                <input class="form-control" id="disabledInput" type="text" name="user" value=<%=ad%> disabled>
                            </div>

                            <div class="form-group">
                                <label for="disabledSelect"s>Yönetici</label>
                                <input class="form-control" id="disabledInput" type="text" name="admin" value=<%=yonetici%>  disabled>
                            </div>


                        </fieldset>

                        <fieldset>            
                            <div class="form-group" style="
                                 margin-bottom: 0px;
                                 ">
                                <label for="dtp_input2" class="col-md-4 control-label" style="
                                       padding-left: 0px;
                                       ">Başlangıç Tarihi</label>
                                <div class="input-group form-control date form_date col-md-5" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                    <input class="form-control" size="16" type="text" value="" readonly name="baslangictar">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="hidden" id="dtp_input2" value="" /><br/>
                            </div>
                            <div class="form-group" style="
                                 margin-bottom: 0px;
                                 ">
                                <label for="dtp_input3" class="col-md-4 control-label" style="
                                       padding-left: 0px;
                                       ">Bitiş Tarihi</label>
                                <div class="input-group form-control date form_date2 col-md-5" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
                                    <input class="form-control" size="16" type="text" value="" readonly name="bitistar">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="hidden" id="dtp_input3" value="" /><br/>
                            </div>
                        </fieldset>



                        <div class="form-group">
                            <label>İzin Nedeni</label>
                            <textarea class="form-control" rows="7"style="resize: none;" required maxlength="400" name="izinneden" placeholder="İzin sebebini yazınız..." ></textarea>
                        </div>

                        <button type="submit" id="izinal" class="btn btn-default">İzin Al</button>

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



<script type="text/javascript">
    $(function () {
        $('.form_date').datetimepicker({
            language: 'tr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            startDate: new Date(),
            forceParse: 0
        }).on('changeDate', function (selected) {
            var minDate = new Date(selected.date.valueOf());
            $('.form_date2').datetimepicker('setStartDate', minDate);
        });

        $('.form_date2').datetimepicker({
            language: 'tr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            startDate: new Date(),
            forceParse: 0
        });


    });

</script>



</body>
</html>
