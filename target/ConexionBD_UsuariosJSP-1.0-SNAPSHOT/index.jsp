<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <h1><%= "Listado de usuarios" %></h1><br/>
    <%-- Creamos la tabla que se visualizara en la pagiba web y tambien usaremos colores para poder pintar
las cabeceras de la tabala--%>
        <table border="1" width="600">
            <tr bgcolor="aqua">
                <th>Código</th><th>Nombre</th><th>Edad</th><th>Sexo</th><th>Password</th>
            </tr>
        </table>
<a href="hello-servlet">Hello Servlet</a>
    </body>
</html>