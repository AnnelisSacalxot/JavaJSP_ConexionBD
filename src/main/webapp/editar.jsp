<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: annelis
  Date: 1/12/21
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%-- Esta página nos va a servir para poder editar los usuarios por si alguno de los datos esta mal o
     simplemente se desean modificar--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
    <body>
    <h2 align="center">Editar Usuario</h2>
    <%
        //Con este atributo lo que se hace es traer los registros de la base de datos el codigo
        String cod = request.getParameter("cod");

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
            rs = sta.executeQuery("select * from usuarios where CodUsu= '"+cod+"'");

            //Vaciar los datos del ResultSet a la página web de resultados
            while (rs.next()){
                //Del resultSet nos permite vaciar el resultado hacia las cajas de texto
    %>
    <%-- Estamos listando los datos que ya fueron obtenidos de cada Usuario--%>
    <form action="">
        <table border="1" align="center" width="250">
        <tr>
            <td>Codigo: </td> <%-- El codigo no se va a poder editar, asi que solo sera de lectura--%>
            <td><input type="text" name="txtCod" value="<%= rs.getString(1) %>" readonly="readonly"></td>
        </tr>
        <tr>
            <td>Nombre: </td>
            <td><input type="text" name="txtNom" value="<%= rs.getString(2) %>"></td>
        </tr>
        <tr>
            <td>Edad: </td>
            <td><input type="text" name="txtEdad" value="<%= rs.getString(3) %>"></td>
        </tr>
        <tr>
            <td>Sexo: </td>
            <td><input type="text" name="txtSexo" value="<%= rs.getString(4) %>" ></td>
        </tr>
        <tr>
            <td>Password: </td>
            <td><input type="text" name="txtPas" value="<%= rs.getString(5) %>" ></td>
        </tr>
        <tr>
            <th colspan="2"><input type="submit" name="btnGrabar" value="Editar Usuario" ></th>
        </tr>
        </table>
    </form>
        <%
            }
    } catch (Exception e) {
            }
        %>
    </body>
</html>
