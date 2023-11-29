<%-- 
    Document   : processar_alteracao_produto
    Created on : 27 de nov. de 2023, 18:42:25
    Author     : 
--%>


<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <link rel="icon" type="image/png" href="../image/logoIcon.ico">

        <title>PDV JBM - Cliente</title>
    </head>
    <body>
        <div class="container">
            <h1>PDV JBM - Alterar Produto</h1>
            <%
                String codigoean = request.getParameter("codigoean");
                String descricao = request.getParameter("descricao");
                String precoStr = request.getParameter("preco");
                String qtd_estoqueStr = request.getParameter("qtd_estoque");

                // Convertendo para long e double
                long codigoeanLong = Long.parseLong(codigoean);
                double precoDouble = Double.parseDouble(precoStr);
                int qtd_estoqueInt = Integer.parseInt(qtd_estoqueStr);

                Produto produto = new Produto();
                produto.setCodigoean(codigoeanLong);
                produto.setDescricao(descricao);
                produto.setPreco(precoDouble);
                produto.setQtd_estoque(qtd_estoqueInt);

                ProdutoDAO produtoDAO = new ProdutoDAO();

                if (produtoDAO.alterarProduto(produto)) {
            %>
            <script>
                alert("Produto alterado com sucesso!");
                window.location.href = "../consultar/produto_consulta_geral.jsp";
            </script>
            <%
            } else {
            %>
            <script>
                alert("Produto não alterado!");
                window.location.href = "../consultar/produto_consulta_geral.jsp";
            </script>
            <%
                }
            %>
    </body>
</html>
