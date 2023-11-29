<%-- 
    Document   : produto_excluir_codigo
    Created on : 9 de nov. de 2023, 14:36:29
    Author     : Bruno Oliveira
--%>

<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../image/logoIcon.ico">
        <title>Deletar Produto</title>
    </head>
    <body>
        <h1>Exclusão Produto</h1>
        <%
            String codigoParam = request.getParameter("codigo");

            if (codigoParam != null && !codigoParam.isEmpty()) {
                try {
                    Integer codigo = Integer.parseInt(codigoParam);

                    Produto produto = new Produto();
                    produto.setCodigo(codigo);

                    ProdutoDAO produtoDAO = new ProdutoDAO();

                    if (produtoDAO.excluirProduto(produto)) {
        %>
        <script>
            alert("Produto excluído com sucesso!");
            window.location.href = "../consultar/produto_consulta_geral.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Produto não excluído!");
            window.location.href = "../consultar/produto_consulta_geral.jsp";
        </script>
        <%
            }
        } catch (NumberFormatException e) {
        %>
        <script>
            alert("Erro ao converter o código para um número inteiro.");
            window.location.href = "../consultar/produto_consulta_geral.jsp";
        </script>
        <%
            }
        } else {
        %>
        <script>
            alert("Código ausente na solicitação.");
            window.location.href = "../consultar/produto_consulta_geral.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>
