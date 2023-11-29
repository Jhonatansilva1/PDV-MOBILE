<%-- 
    Document   : processar_cadastro_cliente
    Created on : 15 de set. de 2023, 15:09:45
    Author     : Bruno Oliveira
--%>

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

    <h1>PDV JBM - Cadastro Cliente</h1>
    <%
        String nome = request.getParameter("nome");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String cep = request.getParameter("cep");
        String rua = request.getParameter("rua");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");

        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setRg(rg);
        cliente.setCpf(cpf);
        cliente.setEmail(email);
        cliente.setTelefone(telefone);
        cliente.setCelular(celular);
        cliente.setEnderecoCep(cep);
        cliente.setEnderecoRua(rua);
        cliente.setEnderecoNumero(numero);
        cliente.setEnderecoComplemento(complemento);
        cliente.setEnderecoBairro(bairro);
        cliente.setEnderecoCidade(cidade);
        cliente.setEnderecoUf(uf);

        ClienteDAO clienteDAO = new ClienteDAO();

        if (clienteDAO.cadastrarCliente(cliente)) {
    %>
    <script>
        // Mensagem de cliente cadastrado com sucesso
        alert("Cliente cadastrado com sucesso!");
        // Ao cadastrar encaminhar para o menu principal
        window.location.href = "cadastro_cliente.jsp";
    </script>
    <%
    } else {
    %>
    <script>
        // Mostrar mensagem de erro ao cadastrar
        alert("Erro ao cadastrar cliente. Tente novamente.");
        // Encaminhamento para a página de cadastro para tentar novamente
        window.location.href = "cadastro_cliente.jsp";
    </script>
    <%
        }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
