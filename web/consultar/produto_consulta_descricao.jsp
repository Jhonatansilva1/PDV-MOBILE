<%-- 
    Document   : produto_consulta_descricao
    Created on : 9 de nov. de 2023, 15:29:57
    Author     : Bruno Oliveira
--%>

<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="icon" type="image/png" href="../image/logoIcon.ico">

<%
    String descricao = request.getParameter("descricao");

    System.out.println("Parâmetro de descrição recebido: " + descricao);

    ProdutoDAO produtoDAO = new ProdutoDAO();
    List<Produto> resultados = produtoDAO.buscarPorDescricao(descricao);

    System.out.println("Número de resultados encontrados: " + resultados.size());

    // Exibir os resultados formatados como HTML
    for (Produto produto : resultados) {
        out.println("<p onclick='selecionarProduto(" + produto.getCodigo() + ", \"" + produto.getDescricao() + "\", " + produto.getPreco() + ")'>" + produto.getCodigo() + " - " + produto.getDescricao() + "</p>");
    }
%>



