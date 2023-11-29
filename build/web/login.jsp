<%-- 
    Document   : login
    Created on : 5 de set. de 2023, 18:59:00
    Author     : Bruno Oliveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" %>
<%@page import="model.Usuario"%>
<%@page import="control.ControleUsuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema JBM - Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <%
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            ControleUsuario controleUsuario = new ControleUsuario();
            if (controleUsuario.logar(login, senha)) {
                // Redireciona para a página de menu se o login for bem-sucedido
        %>
        <script> window.location.href = 'menu.jsp';</script>
        <%
        } else {
            // Exibe uma mensagem de alerta se o login falhar
        %>
        <script>
            alert("Verifique usuário ou senha!");
            window.location.href = 'index.html';
        </script>
        <%
            }
        %>
    </body>
</html>
