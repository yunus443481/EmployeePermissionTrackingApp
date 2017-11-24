package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public final class profil_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--NOT:BU SAYFADAKİ ALERT ARKA PLANDA KALDIĞI İÇİN SAYFA SÜRDÜRÜLMÜYO ALT TAB YAP ALERTE OK DE DÜZELİR... -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\n");
      out.write("                <script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n");
      out.write("                <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("                <title>İzin Al</title>\n");
      out.write("\n");
      out.write("                <!-- Bootstrap Core CSS -->\n");
      out.write("                <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("                    <!-- Custom CSS -->\n");
      out.write("                    <link href=\"css/sb-admin.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("                        <!-- Custom Fonts -->\n");
      out.write("                        <link href=\"font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("                            <style>\n");
      out.write("\n");
      out.write("                                #izinal {                       \n");
      out.write("                                    width: 120px;\n");
      out.write("                                    height: 40px;\n");
      out.write("                                    background: #66ccff;\n");
      out.write("                                    border-radius:10px;\n");
      out.write("                                    color:white;\n");
      out.write("                                }\n");
      out.write("                            </style>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            </head>\n");
      out.write("                            <body>\n");
      out.write("\n");
      out.write("                                ");

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

                                        if (!yetki1.equals(null)) {

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
                                                id=rs.getString("id");
                                                ad = rs.getString("ad");
                                                soyadi = rs.getString("soyadi");
                                                mail = rs.getString("mail");
                                                sifre = rs.getString("sifre");

                                            }

                                
      out.write("\n");
      out.write("                            <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("                                <!-- Navigation -->\n");
      out.write("                                <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("                                    <!-- Brand and toggle get grouped for better mobile display -->\n");
      out.write("                                    <div class=\"navbar-header\">\n");
      out.write("                                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\n");
      out.write("                                            <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                            <span class=\"icon-bar\"></span>\n");
      out.write("                                            <span class=\"icon-bar\"></span>\n");
      out.write("                                            <span class=\"icon-bar\"></span>\n");
      out.write("                                        </button>\n");
      out.write("                                        <a class=\"navbar-brand\" href=\"#\">Admin</a>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Top Menu Items -->\n");
      out.write("                                    <ul class=\"nav navbar-right top-nav\">\n");
      out.write("                                        <li class=\"dropdown\">\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-user\"></i> Hesap <b class=\"caret\"></b></a>\n");
      out.write("                                            <ul class=\"dropdown-menu\">\n");
      out.write("                                                <li>\n");
      out.write("                                                    <a href=\"profil.jsp\"><i class=\"fa fa-fw fa-user\"></i> Profil </a>\n");
      out.write("                                                </li>\n");
      out.write("\n");
      out.write("                                                <li class=\"divider\"></li>\n");
      out.write("                                                <li>\n");
      out.write("                                                    <a href=\"cıkıs.jsp\"><i class=\"fa fa-fw fa-power-off\"></i> Çıkış </a>\n");
      out.write("                                                </li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </li>\n");
      out.write("                                    </ul>\n");
      out.write("                                    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->\n");
      out.write("                                    <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\n");
      out.write("                                        <ul class=\"nav navbar-nav side-nav\">\n");
      out.write("                                            \n");
      out.write("                                            <li class=\"active\">\n");
      out.write("                                            <a href=\"basarili.jsp\"><i class=\"fa fa-fw fa-dashboard\"></i> İzin Talepleri </a>\n");
      out.write("                                        </li>\n");
      out.write("\n");
      out.write("                                        <li>\n");
      out.write("                                            <a href=\"kullaniciDuzenle.jsp\"><i class=\"fa fa-fw fa-table\"></i> Kullanıcı Düzenle</a>\n");
      out.write("                                        </li>\n");
      out.write("\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                </nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <div id=\"page-wrapper\">\n");
      out.write("\n");
      out.write("                                    <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("                                        <!-- Page Heading -->\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"col-lg-12\">\n");
      out.write("                                                <h1 class=\"page-header\">\n");
      out.write("                                                   Hesap Bilgileri\n");
      out.write("                                                </h1>\n");
      out.write("                                                <ol class=\"breadcrumb\">\n");
      out.write("                                                    \n");
      out.write("                                                    <li class=\"active\">\n");
      out.write("                                                        <i class=\"fa fa-table\"></i> Profil\n");
      out.write("                                                    </li>\n");
      out.write("                                                </ol>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- /.row -->\n");
      out.write("\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"col-lg-6\">\n");
      out.write("\n");
      out.write("                                                <form role=\"form\" action=\"profilGuncelle.jsp\" method=\"POST\">\n");
      out.write("\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Adı</label>\n");
      out.write("                                                        <input class=\"form-control\" name=\"ad\" pattern=\"[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}\" required maxlength=\"40\" value=");
      out.print(ad);
      out.write(">\n");
      out.write("                                                    </div>\n");
      out.write("\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Soyadı</label>\n");
      out.write("                                                        <input class=\"form-control\" name=\"soyadi\" pattern=\"[a-z]|[A-Z]|[a-Z]|[A-z]{1,25}\" required maxlength=\"40\" value=");
      out.print(soyadi);
      out.write(">\n");
      out.write("                                                    </div>\n");
      out.write("\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Mail</label>\n");
      out.write("                                                        <input type=\"email\" class=\"form-control\" name=\"mail\" required maxlength=\"40\" value=");
      out.print(mail);
      out.write(">\n");
      out.write("                                                    </div>\n");
      out.write("\n");
      out.write("                                                    <div class=\"form-group\">\n");
      out.write("                                                        <label>Şifre</label>\n");
      out.write("                                                        <input id=\"sifre\" type=\"password\" class=\"form-control\" name=\"sifre\" required maxlength=\"10\" value=");
      out.print(sifre);
      out.write(">\n");
      out.write("                                                            <div class=\"checkbox\">\n");
      out.write("                                                                <label>\n");
      out.write("                                                                    <input type=\"checkbox\" value=\"\" onchange=\"document.getElementById('sifre').type = this.checked ? 'text' : 'password'\">Şifreyi Göster   \n");
      out.write("                                                                </label>\n");
      out.write("                                                            </div>\n");
      out.write("\n");
      out.write("                                                    </div>\n");
      out.write("                                                            <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                    <button type=\"submit\" id=\"izinal\" class=\"btn btn-default\">Düzenle</button>\n");
      out.write("\n");
      out.write("                                                </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            ");
 } else {

                                        response.sendRedirect("index.jsp");
                                        /*Kullanıcı çıkış yaptıktan sonra geri gelmesini engelleme kodlarının devamı*/
                                    }
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            </body>\n");
      out.write("                            </html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
