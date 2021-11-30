<%--
  Created by IntelliJ IDEA.
  User: annelis
  Date: 29/11/21
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
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
</body>
</html>
