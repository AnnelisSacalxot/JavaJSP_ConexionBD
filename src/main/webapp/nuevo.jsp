<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: annelis
  Date: 29/11/21
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%-- Esta página nos va a servir para poder añadir nuevos usuarios al listado de usuarios que ya
     se tenia--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Registro</title>
    </head>
    <h2 align="center">Registro de Usuarios</h2>
    <form action="">
        <table border="1" align="center" width="250">
            <tr>
                <td>Codigo: </td>
                <td><input type="text" name="txtCod" ></td>
            </tr>
            <tr>
                <td>Nombre: </td>
                <td><input type="text" name="txtNom" ></td>
            </tr>
            <tr>
                <td>Edad: </td>
                <td><input type="text" name="txtEdad" ></td>
            </tr>
            <tr>
                <td>Sexo: </td>
                <td><input type="text" name="txtSexo" ></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="text" name="txtPas" ></td>
            </tr>
            <tr>
                <th colspan="2"><input type="submit" name="btnGrabar" value="Grabar Usuario" ></th>
            </tr>
        </table>
    </form>
        <%
            //Irá el codigo para insertar los datos del formulario y solamente el boton va a actuar
            //cuando se envie algo y si no envia algo, pues no ingresa
            if (request.getParameter("btnGrabar") != null) {
                String cod = request.getParameter("txtCod");
                String nom = request.getParameter("txtNom");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                String sex = request.getParameter("txtSexo");
                String pass = request.getParameter("txtPas");

                //Conextamos con la base de datos

                try {
                    Connection cnx = null;
                    ResultSet rs = null;
                    Statement sta = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection
                            ("jdbc:mysql://localhost/cursoJSP?user=root&password=anne*Sistemas21");
                    sta = cnx.createStatement();
                    sta.executeUpdate("insert into usuarios values ('" + cod + "','" + nom + "'," + edad + ",'" + sex + "','" + pass + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                    cnx.close();
                    rs.close();
                    sta.close();

                } catch (Exception e) {
                    System.out.println("Error al registrar el driver de MySQL: " + e);
                }
            }
        %>
    </body>
</html>
