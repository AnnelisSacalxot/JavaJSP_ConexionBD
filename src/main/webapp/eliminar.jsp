<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%--
  Created by IntelliJ IDEA.
  User: annelis
  Date: 1/12/21
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%-- Esta página nos va a servir para poder eliminar usuarios al listado de usuarios que ya
     se tenia y que se actualice en la base de datos--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
    <title>Eliminar Usuario</title>
    </head>
    <body>
    <%
        //Buscara el codigo que va hacer lo principal para poder eliminar el registro
            String cod = request.getParameter("cod");

            //Conextamos con la base de datos

            try {
                Connection cnx = null;
                ResultSet rs = null;
                Statement sta = null;

                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection
                        ("jdbc:mysql://localhost/cursoJSP?user=root&password=anne*Sistemas21");
                sta = cnx.createStatement();
                sta.executeUpdate("delete from usuarios where CodUsu= '"+cod+"'");
                request.getRequestDispatcher("index.jsp").forward(request, response);

                cnx.close();
                rs.close();
                sta.close();

            } catch (Exception e) {
                System.out.println("Error al registrar el driver de MySQL: " + e);
            }
    %>
    </body>
</html>
