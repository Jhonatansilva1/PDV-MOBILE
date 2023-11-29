<%-- 
    Document   : processar_vendas
    Created on : 12 de nov. de 2023, 14:52:24
    Author     : Bruno Oliveira
--%>

<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.VendasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../image/logoIcon.ico">
        <title>Finalização Vendas</title>
    </head>
    <body>
        <%
            if ("POST".equals(request.getMethod())) {
                // Recupera os parâmetros do formulário
                String totalCupom = request.getParameter("totalCupom");
                String codigoProduto = request.getParameter("codigoProduto");
                String quantidadeString = request.getParameter("quantidade");
                String formaPagamento = request.getParameter("formaPagamento");
                String trocoString = request.getParameter("troco");

                // Converte a quantidade e troco para valores numéricos (int), assume 0 se for nula ou vazia
                int quantidade = (quantidadeString != null && !quantidadeString.isEmpty()) ? Integer.parseInt(quantidadeString) : 0;
                double troco = (trocoString != null && !trocoString.isEmpty()) ? Double.parseDouble(trocoString) : 0.0;

                // Calcula a data atual
                String dataVenda = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

                // Chama o método do VendasDAO para adicionar a venda
                VendasDAO vendasDAO = new VendasDAO();
                double totalVendaValue = totalCupom != null ? Double.parseDouble(totalCupom) : 0.0;
                int idVenda = vendasDAO.adicionarVenda(dataVenda, Double.parseDouble(totalCupom), formaPagamento, troco);

                // Cria uma instância de ProdutoDAO
                ProdutoDAO produtoDAO = new ProdutoDAO();

                // Atualiza o estoque (subtrai a quantidade vendida)
                produtoDAO.atualizarEstoque(codigoProduto, quantidade);

                // Redireciona para uma página de sucesso ou outra ação desejada
                response.sendRedirect("../abrir_pdv.jsp");
            }
        %>

    </body>
</html>
