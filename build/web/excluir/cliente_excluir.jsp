<%-- 
    Document   : cliente_excluir.jsp
    Created on : 30 de ago. de 2023, 19:55:43
    Author     : Bruno Lucas
                 Jhonatan Nascimento
                 Maikon Sposito 
--%>
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../image/logoIcon.ico">
        <title>Deletar Cliente</title>
    </head>
    <body>
        <h1>Exclusão Cliente</h1>
        <%
            String cpf = request.getParameter("cpf");

            if (cpf != null && !cpf.isEmpty()) {
                try {
                    Cliente cliente = new Cliente();
                    cliente.setCpf(cpf);

                    ClienteDAO clienteDao = new ClienteDAO();

                    if (clienteDao.excluir(cliente)) {
        %>
        <script>
            alert("Cliente excluído com sucesso!");
            window.location.href = "../consultar/cliente_consulta_geral.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Erro ao excluir cliente. Tente novamente.");
            window.location.href = "../consultar/cliente_consulta_geral.jsp";
        </script>
        <%
                }
            } catch (Exception e) {
                // Trate a exceção aqui caso precisar
            }
        } else {
        %>
        <script>
            alert("CPF ausente na solicitação.");
            window.location.href = "../consultar/cliente_consulta_geral.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>


