<%-- 
    Document   : cıkıs
    Created on : 15.Ağu.2017, 14:26:45
    Author     : YUNUS
--%>

<%@page contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Çıkış</title>
</head>
<body>
   
    <%
    session.invalidate();
    response.sendRedirect("index.jsp");
    
    %>
    
</body>
</html>
