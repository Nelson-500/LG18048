<%-- 
    Document   : mostrar
    Created on : 3 jul. 2020, 16:06:12
    Author     : nel500
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.progrados.lg18048.usuario"%>
<%@page import="com.progrados.lg18048.usuarioJpaController"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
    usuarioJpaController controler = new usuarioJpaController(emf);

    List<usuario> lista = new ArrayList<usuario>();
    //Hacer transacción
    lista = controler.findusuarioEntities();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>User Page</title>
    </head>
    <body>
        <h1>Usuarios Registrados</h1>
        <br>
        <br>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (usuario us : lista) {
                %>

                <tr>
                    <th scope="row"> <%= us.getId() %></th>
                    <td> <%= us.getNombre() %> </td>
                    <td> <%= us.getCorreo() %></td>
                    <td> <%=us.getContrasenia() %></td>
                    <td> <a href="/LG18048/servletEliminar?id=<%=us.getId() %>"><button class="btn btn-danger eliminar">Eliminar</button></td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>

    </body>
</html>
