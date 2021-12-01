<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Usuarios</title>
</head>
<body>
    <h1 align = "center"><%= "Listado de usuarios" %><%!
    %></h1><br/>
    <%-- Creamos la tabla que se visualizara en la pagiba web y tambien usaremos colores para poder
    pintar las cabeceras de la tabala--%>
        <table border="1" width="600" align="center">
            <tr bgcolor="aqua">
                <th COLSPAN="5">Mantenimiento de Usuarios</th>
                <th colspan="2"><a href="nuevo.jsp">
                    <img src = "Iconos/icons8-añadir-usuario-masculino-16.png" width="16" height="16"></a></th>
            </tr>
                 <tr bgcolor="aqua">
                 <th>Código</th><th>Nombre</th><th>Edad</th><th>Sexo</th><th>Password</th><th>Acción</th>
            </tr>
            <%
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;

                //Inicializar el Driver
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection
                    ("jdbc:mysql://localhost/cursoJSP?user=root&password=anne*Sistemas21");

                //Para poder ejecutar la consulta
                    sta = cnx.createStatement();
                //Lo que me devuelta en la tabla usuarios lo necesito guardar
                    rs = sta.executeQuery("select * from usuarios");

                //Vaciar los datos del ResultSet a la página web de resultados
                while (rs.next()){
            %>
             <tr>
                 <th><%= rs.getString(1) %></th>
                 <th><%= rs.getString(2) %></th>
                 <th><%= rs.getString(3) %></th>
                 <th><%= rs.getString(4) %></th>
                 <th><%= rs.getString(5) %></th>
                 <th>
                     <a href="editar.jsp?cod=<%= rs.getString(1) %>">
                     <img src = "Iconos/icons8-editar-usuario-masculino-48.png" width="20" height="20">||
                     </a>
                     <a href="eliminar.jsp?cod=<%= rs.getString(1) %>">
                     <img src = "Iconos/eliminar-usuaria-16.png" width="16" height="16">
                     </a>
                 </th>
             </tr>
         <%
     }
     sta.close();
     rs.close();
     cnx.close();

 }catch (Exception e){
     System.out.println("Error al registrar el driver de MySQL: " + e);
 }
%>
            </table>
</body>
</html>