<%-- 
    Document   : listarUsuarios
    Created on : 01/06/2017, 11:11:47
    Author     : leoomoreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Usuarios</h1>
        <%
            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
            if (usuarios != null && usuarios.size() > 0) {
        %>
        <table border="1">
            <tr>
                <td>Código</td>
                <td>Nome</td>
                <td>Login</td>
                <td>Senha</td>
            </tr>
            <% for (Usuario p : usuarios) {%>
            <tr>
                <td><%= p.getId()%></td>
                <td><%= p.getNome()%></td>
                <td><%= p.getEmail()%></td>
                <td><%= p.getSenha()%></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <b>Não existem dados para exibir</b>
        <% }%>
    </body>
</html>
