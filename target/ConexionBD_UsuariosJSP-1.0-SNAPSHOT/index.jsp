<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Usuarios</title>
</head>
<body>
    <h1><%= "Listado de usuarios" %><%!
    %></h1><br/>
    <%-- Creamos la tabla que se visualizara en la pagiba web y tambien usaremos colores para poder
    pintar las cabeceras de la tabala--%>
        <table border="1" width="600">
            <tr bgcolor="aqua">
                <th>Código</th><th>Nombre</th><th>Edad</th><th>Sexo</th><th>Password</th>
            </tr>
            <%
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;

                //Inicializar el Driver
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection
                            ("jdbc:mysql://localhost/cursoJSP?user=root&password=");

                    //Para poder ejecutar la consulta
                    sta = cnx.createStatement();
                    //Lo que me devuelta en la tabla usuarios lo necesito guardar
                    rs = sta.executeQuery("select * from usuarios");

                    //Vaciar los datos del ResultSet a la página web de resultados
                    while (rs.next()){
                        %>
                            <tr>
                                <th><%= rs.getString(1) %></th>
                                <th><% rs.getString(2); %></th>
                                <th><% rs.getString(3); %></th>
                                <th><% rs.getString(4); %></th>
                                <th><% rs.getString(5); %></th>
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