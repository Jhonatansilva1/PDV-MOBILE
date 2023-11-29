<%-- 
    Document   : processar_cadastro_produto
    Created on : 8 de nov. de 2023, 14:17:14
    Author     : Bruno Oliveira
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
            <h1>PDV JBM - Cadastro Mercadoria</h1>
            <%
                
                Long codigoean = Long.parseLong(request.getParameter("codigoean"));
                String descricao = request.getParameter("descricao");
                Double preco = Double.parseDouble(request.getParameter("preco"));
                Integer qtd_estoque = Integer.parseInt(request.getParameter("qtd_estoque"));

                Produto produto = new Produto();
                
                produto.setCodigoean(codigoean);
                produto.setDescricao(descricao);
                produto.setPreco(preco);
                produto.setQtd_estoque(qtd_estoque);

                ProdutoDAO produtoDAO = new ProdutoDAO();

                if (produtoDAO.cadastrarProduto(produto)) {
            %>
            <script>

                // Mensagem de cliente cadastrado com sucesso
                alert("Mercadoria cadastrada com sucesso!");
                // Ao cadastrar encaminhar para o menu principal
                window.location.href = "../menu.jsp";
            </script>
            <%
            } else {
            %>
            <script>
                // Mostrar mensagem de erro ao cadastrar
                alert("Erro ao cadastrar mercadoria. Tente novamente.");
                // Encaminhamento para a página de cadastro para tentar novamente
                window.location.href = "../menu.jsp";
            </script>
            <%
                }
            %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>

