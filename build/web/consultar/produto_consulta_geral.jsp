<%-- 
    Document   : produto_consulta_geral
    Created on : 9 de nov. de 2023, 09:08:48
    Author     : Bruno Oliveira
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.NumberFormat"%>
<!doctype html>
<html lang="pt-br">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Consulta Mercadoria JBM</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-25..200"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="icon" type="image/png" href="../image/logoIcon.ico">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <style>
            body,html{
                line-height:1.8;
                font-family:'Poppins',sans-serif;
                color:#555e58;
                text-transform:capitalize;
                font-weight:400;
                margin:0px;
                padding:0px;
            }

            @font-face {
                font-family: 'Material Icons';
                font-style: normal;
                font-weight: 400;
                src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
                src: local('Material Icons'),
                    local('MaterialIcons-Regular'),
                    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
                    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
                    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
            }



            .material-icons {
                font-family: 'Material Icons';
                font-weight: normal;
                font-style: normal;
                font-size: 24px;
                display: inline-block;
                line-height: 1;
                text-transform: none;
                letter-spacing: normal;
                word-wrap: normal;
                white-space: nowrap;
                direction: ltr;

                -webkit-font-smoothing: antialiased;

                text-rendering: optimizeLegibility;

                -moz-osx-font-smoothing: grayscale;

                font-feature-settings: 'liga';
            }

            .btn-block {
                width: 100%;
                height: auto; /* Ajuste a altura desejada aqui */
            }

            h1,h2,h3,h4,h5,h6,.h1,.h2,.h3,.h4{
                font-weight:400;
                line-height:1.5em;
            }

            p{
                font-size:15px;
                margin:12px 0 0;
                line-height:24px;
            }

            a{
                color:#333;
                font-weight:400;

            }


            button:focus{
                box-shadow:none;
                outline:none;
                border:none;
            }


            button{
                cursor:pointer;
            }

            ul,ol{
                padding:0px;
                margin:0px;
                list-style:none;
            }

            a,a:hover,a:focus{
                color:#333;
                text-decoration:none;
                transition:all 0.3s;
            }


            .wrapper{
                position:relative;
                width:100%;
                overflow:auto;
            }

            #sidebar{
                position:fixed;
                height:100%!important;
                top:0;
                left:0;
                bottom:0;
                z-index:11;
                width:260px;
                overflow:auto;
                transition:all 0.3s;
                background-color:#fff;
                box-shadow:0 0 30px 0 rgba(200 200 200 / 20%);
            }


            @media only screen and (min-width:992px){
                #sidebar.active{
                    left:-260px;
                    height:100%!important;
                    position:absolute!important;
                    overflow:visible!important;
                    top:0;
                    z-index:666;
                    float:left!important;
                    bottom:0!important;
                }

                #content{
                    width:calc(100% - 260px);
                    position:relative;
                    float:right;
                    transition:all 0.3s;
                }

                #content.active{
                    width:100%;
                }

            }


            #sidebar::-webkit-scrollbar{
                width:5px;
                border-radius:10px;
                background-color:#eee;
                display:none;
            }

            #sidebar::-webkit-scrollbar-thumbs{
                width:5px;
                border-radius:10px;
                background-color:#333;
                display:none;
            }

            #sidebar:hover::-webkit-scrollbar-thumbs{
                display:block;
            }

            #sidebar:hover::-webkit-scrollbar{
                display:block;
            }

            #sidebar .sidebar-header{
                padding:20px;
                background-color:#fff;
                border-bottom:1px solid #eee;
            }

            .sidebar-header h3{
                color:#333;
                font-size:17px;
                margin:0px;
                text-transform:uppercase;
                transition:all 0.5s ease;
                font-weight:600;
            }

            .sidebar-header h3 img{
                width:45px;
                margin-right:10px;
            }

            #sidebar ul li{
                padding:2px 0px;
            }

            #sidebar ul li.active> a{
                color:#4c7cf3;
                background-color:#DBE5FD;
            }


            #sidebar ul li.active> a i{
                color:#4c7cf3;
            }



            #sidebar ul li a:hover{
                color:#4c7cf3;
                background-color:#DBE5FD;
            }


            .dropdown-toggle::after{
                position:absolute;
                right:22px;
                top:18px;
                color:#777777;
            }

            #sidebar ul li.dropdown{
                position:sticky;
            }


            #sidebar ul.component{
                padding:20px 0px;
            }

            #sidebar ul li a{
                padding:5px 10px 5px 20px;
                line-height:30px;
                font-size:15px;
                position:relative;
                font-weight:400;
                display:block;
                color:#777777;
                text-transform:capitalize;
            }

            #sidebar ul li a i{
                position:relative;
                margin-right:10px;
                top:6px;
            }

            #content{
                position:relative;
                transition:all 0.5s;
                background-attachment:#f9fafc;
            }


            .top-navbar{
                width:100%;
                z-index:9;
                position:relative;
                padding:15px 30px;
                background-color:#353b48;
            }

            .xd-topbar{
                width:100%;
                position:relative;
            }

            input[type="search"]{
                background-color:#4a5263;
                color:#fff;
                padding-left:20px;
                border:none;
                border-radius:50px 0px 0px 50px;
            }

            .input-group-append{
                margin-left:-1px;
            }


            .xp-searchbar .btn{
                background-color:#4a5263;
                color:#fff;
                font-weight:600;
                font-size:16px;
                border-radius:0 50px 50px 0;
                padding:4px  15px;
            }


            .xp-breadcrumbbar .page-title{
                font-size:20px;
                color:#fff;
                margin-bottom:0;
                margin-top:0;
            }

            .breadcrumb{
                display:inline-flex;
                background-color:transparent;
                margin:0;
                padding:10px 0 0;
            }

            .breadcrumb .breadcrumb-item a{
                color:#777777;
            }

            .breadcrumb-item.active{
                color:#6c757d;
            }


            .breadcrumb-item+.breadcrumb-item{
                padding-left:.5rem;
            }

            .main-content{
                padding:30px 30px 0px 30px;
            }

            .navbar{
                background-color:#353B48;
                color:#fff;
            }

            .navbar-brand{
                color:#fff;
            }

            .navbar button{
                background-color:transparent;
                border:none;
            }

            .navbar button span{
                color:#fff;
            }

            .xp-menubar{
                border-radius:50%;
                width:45px;
                height:45px;
                line-height:45px;
                text-align:center;
                margin-right:20px;
                border:none;
                color:#fff;
                cursor:pointer;
                background-color:rgba(0,0,0,0.09);
            }


            .xp-menubar span{
                margin:9px;
                padding:0px;
                transform:rotate(90deg);
            }

            .navbar-nav > li.active{
                color:#fff;
                border-radius:4px;
                background-color:rgba(0,0,0,0.08);
            }
            .navbar-nav > li > a{
                color:#fff;
            }

            .navbar .notification{
                position:absolute;
                top:2px;
                right:3px;
                display:block;
                font-size:9px;
                border:0;
                background-color:#2bcd72;
                min-width:15px;
                text-align:center;
                padding:1px 5px;
                height:15px;
                border-radius:2px;
                line-height:14px;
            }

            @media (max-width:768px){
                .xp-searchbar{
                    margin-top:20px;
                }
            }

            .navbar-nav > li.show .dropdown-menu{
                transform:translate3d(0,0,0);
                opacity:1;
                display:block;
                visibility:visible;
            }

            .dropdown-menu{
                border:0;
                box-shadow:0 2px 5px 0 rgba(0 0 0 / 26%);
                transform:translate3d(0, -20px ,0);
                visibility:hidden;
                position:absolute!important;
                transition:all 150ms linear;
                display:block;
                min-width:15rem;
                right:0;
                left:auto;
                opacity:0;
            }

            .small-menu{
                min-width:10rem;
            }


            .dropdown-menu li > a{
                font-size:13px;
                padding:10px 20px;
                margin:0 5px;
                border-radius:2px;
                font-weight:400;
                transition:all 150ms linear;
            }


            .dropdown-menu li > a .material-icons{
                position:relative;
                top:3px;
                color:#777;
                margin-right:6px;
                font-size:16px;

            }

            .navbar-nav > .active > a:focus{
                color:#fff;
                background-color:rgba(0,0,0,0.08);
            }
            .navbar-nav li a{
                position:relative;
                display:block;
                padding:4px 10px!important;
            }

            .nav-item .nav-link .material-icons{
                position:relative;
                top:10px;
                font-size:19px;
            }

            .xp-user-live{
                position:absolute;
                bottom:5px;
                right:9px;
                width:12px;
                height:12px;
                border-radius:50%;
                border:2px solid #353b48;
                background-color:#4c7cf3;
            }

            .table-wrapper {
                background-color: #fff;
                /* padding: 20px 25px; */
                margin:6px 0px 40px 0px;
                width: 100%;
                overflow: auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
            }

            .table-title{
                background:#353b48;
                color:#fff;
                position:sticky;
                top:0;
                width:100%;
                left:0;
                padding:10px 30px;
                border-radius:0px 0px 0 0;
            }

            .table-title h2{
                margin:5px 0  0;
                font-size:17px;
            }

            .table-title .btn-group{
                float:right;
            }
            .table-title .btn{
                color:#fff;
                float:right;
                font-size:13px;
                border:none;
                min-width:50px;
                border-radius:2px;
                border:none;
                outline:none!important;
                margin-left:10px;
            }
            .table-title .btn i{
                float:left;
                font-size:21px;
                margin-right:5px;
            }

            .table-title .btn span{
                float:left;
                margin-top:2px;
            }

            table.table tr th, table.table tr td{
                border-color:#e9e9e9;
                padding:8px 15px;
                font-size:14px;
                font-weight: 400;
                vertical-align:middle;
            }

            table.table tr th:first-child{
                width:60px;
            }

            table.table tr th:last-child{
                width:100px;
            }

            table.table-stripped tbody tr:nth-of-type(odd){
                background-color:#fcfcfc;
            }

            table.table-stripped.table-hover tbody tr:hover{
                background-color:#f5f5f5;
            }

            table.table th i{
                font-size:17px;
                margin: 6px 5px;
                cursor:pointer;
            }

            table.table td:last-child{
                opacity:0.9;
                font-size:22px;
                margin:0px 5px;
            }

            table.table td a{
                font-weight:bold;
                color:#566787;
                display:inline-block;
                text-decoration:none;
                outline:none!important;
            }
            table.table td a:hover{
                color:#2196F3;
            }

            .edit{
                color:#FFC107;
            }

            .delete{
                color:#F44336;
            }

            table.table td  i{
                font-size:19px;
            }

            table.table .avatar{
                border-radius:50%;
                vertical-align:middle;
                margin-right:10px;
            }

            .pagination{
                float:right;
                margin:0 0 5px;
            }

            .pagination  li a{
                border:none;
                font-size:13px;
                min-width:30px;
                min-height:30px;
                color:#999;
                margin:0 2px;
                line-height:30px;
                border-radius:2px!important;
                text-align:center;
                padding:0 6px;
            }

            .pagination  li a:hover{
                color:#666;
            }


            .pagination li.disabled i{
                color:#ccc;

            }

            .pagination li i{
                font-size:16px;
                padding-top:6px;
            }

            .hint-text{
                float:left;
                margin-top:10px;
                font-size:13px;
            }

            .custom-checkbox{
                position:relative;
            }


            .custom-checkbox input[type="checkbox"]{
                opacity:0;
                position:absolute;
                margin:5px 0 0  3px;
                z-index:9;
            }


            .custom-checkbox label:before{
                width:18px;
                height:18px;
            }
            .custom-checkbox label:before{
                content:"";
                margin-right:10px;
                display:inline-block;
                vertical-align:text-top;
                background-color:#fff;
                border:1px solid #bbb;
                border-radius:2px;
                box-sizing:border-box;
                z-index:2;
            }


            .custom-checkbox input[type="checkbox"]:checked + label:after{
                content:"";
                position:absolute;
                left:6px;
                top:3px;
                width:6px;
                height:11px;
                border:solid #000;
                border-width:0 3px 3px 0;
                transform:inherit;
                z-index:3;
                transform:rotatez(45deg);
            }

            .custom-checkbox input[type="checkbox"]:checked + label:before{
                border-color:#03A9F4;
                background:#03A9F4;
            }


            .custom-checkbox input[type="checkbox"]:checked + label:after{
                border-color:#fff;
            }


            .custom-checkbox input[type="checkbox"]:disabled + label:before{
                color:#b8b8b8;
                cursor:auto;
                box-shadow:none;
                background:#ddd;
            }

            /*--table design end----*/
            /*-------modal-style start------*/
            .modal .modal-dialog{
                max-width:400px;
            }
            .modal .modal-header, .modal .modal-body,.modal .modal-footer{
                padding:20px 30px;
            }
            .modal .modal-content{
                border-radius:3px;
            }

            .modal .modal-footer{
                background:#ecf0f1;
                border-radius:0 0 3px 3px;
            }

            .modal .modal-title{
                display:inline-block;
            }

            .modal .form-control{
                border-radius:2px;
                box-shadow:none;
                border-color:#dddddd;
            }

            .modal textarea.form-control{
                resize:vertical;
            }

            .modal .btn{
                border-radius:2px;
                min-width:100px;
            }

            .modal form label{
                font-weight:normal;
            }

            footer{
                background-color:#353b48;
                color:#fff;
                text-align:center;
                padding:10px 30px;
                position:relative;
                width:100%;
            }

            #sidebar.show-nav, .body-overlay.show-nav{
                transform:translatex(0%);
                opacity:1;
                display:block;
                visibility:visible;
                z-index:15;
            }
            @media only screen and (max-width:992px){
                #sidebar{
                    position:fixed;
                    top:0;
                    bottom:0;
                    z-index:10;
                    width:260px;
                    transform:translatex(-100%);
                    transition:all 150ms linear;
                    box-shadow:none!important;
                }
                .body-overlay{
                    position:fixed;
                    top:0;
                    left:0;
                    width:100%;
                    height:100%;
                    display:none;
                    visibility:hidden;
                    opacity:0;
                    z-index:3;
                    transition:all 150ms linear;
                    background-color:rgba(0,0,0,0.5);
                }
            }

            .gray-background {
                background-color: #f2f2f2; /* Cor de fundo cinza */
                padding: 20px; /* Espaçamento interno para criar o retângulo */
                border-radius: 5px; /* Borda arredondada para criar um visual de retângulo */
                margin-bottom: 10px; /* Espaço entre os grupos de itens */
            }

        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="body-overlay"></div>
            <div id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="../image/logo.PNG" class="img-fluid"/><span>JBM </span></h3>
                </div>
                <ul class="list-unstyled component m-0">
                    <li class="active">
                        <a href="../menu.jsp" class="dashboard"><i class="material-icons">dashboard</i>dashboard </a>
                    </li>
                    <li class="dropdown">
                        <a href="#homeSubmenu1" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">groups3</i>Cliente
                        </a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu1">      
                            <li><a href="../cadastro/cadastro_cliente.jsp"><i class="material-icons">person_add</i> Novo Cliente</a></li>
                            <li><a href="../alterar/index_alterar_cliente.jsp"><i class="material-icons">person_add</i> Alterar Cliente</a></li>
                            <li><a href="../excluir/index_cliente_excluir.jsp"><i class="material-icons">person_remove</i> excluir Cliente</a></li>
                            <li><a href="../consultar/consulta_cliente_cpf.jsp"><i class="material-icons">search</i>Consultar [CPF]</a></li>
                            <li><a href="../consultar/cliente_consulta_geral.jsp"><i class="material-icons">search</i>Consulta Geral</a></li>
                        </ul>
                    </li> 
                    <li class="dropdown">
                        <a href="#homeSubmenu3" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">shopping_cart</i>PDV
                        </a>                   
                        <ul class="collapse list-unstyled menu" id="homeSubmenu3">
                            <li><a href="../abrir_pdv.jsp"><i class="material-icons">shopping_cart</i>Abrir PDV</a></li>
                            <li><a href="consulta_venda_periodo.jsp"><i class="material-icons">list_alt</i>Relátorio Caixa</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#homeSubmenu4" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">inventory</i>Mercadoria
                        </a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu4">
                            <li><a href="../cadastro/cadastro_produto.jsp"><i class="material-icons">add</i>Cadastrar Mercadoria</a></li>
                            <li><a href="produto_consulta_geral.jsp"><i class="material-icons">search</i>Consultar Estoque</a></li>
                            <li><a href="../alterar/index_alterar_produto.jsp"><i class="material-icons">search</i>Alterar Produto [Código EAN]</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="../consultar/consulta_calendario.jsp" class=""><i class="material-icons">date_range</i>Calendário </a>
                    </li>
                    <li class="">
                        <a href="../index.html" id="sair-link" class=""><i class="material-icons">exit_to_app</i>Sair </a>
                    </li>

                </ul>
            </div>
            <div id="content">
                <div class="top-navbar">
                    <div class="xd-topbar">
                        <div class="row">
                            <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                                <div class="xp-menubar">
                                    <span class="material-icons text-white">signal_cellular_alt</span>
                                </div>
                            </div>			 
                        </div>		 
                        <div class="xp-breadcrumbbar text-center">
                            <h4 class="page-title">CONSULTA MERCADORIA [GERAL]</h4>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">JBM</a></li>
                                <li class="breadcrumb-item active" aria-curent="page">CONSULTA MERCADORIA [GERAL]</li>
                            </ol>
                        </div>				 		 
                    </div>
                </div>
                <br>
                <%!
                    // Função para formatar o valor como dinheiro
                    public String formatarDinheiro(double valor) {
                        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance();
                        return formatoMoeda.format(valor);
                    }
                %>

                <%
                    ProdutoDAO produtoDAO = new ProdutoDAO();
                    List<Produto> listaProdutos = produtoDAO.consultarGeralProduto();

                    if (listaProdutos != null && !listaProdutos.isEmpty()) {
                %>
                <div id="tabela-produtos-container" >
                    <table id="products-table" class="table table-striped" >
                        <tr bgcolor="F3F3F3">
                            <th>Código EAN</th>
                            <th>Descrição</th>
                            <th>Preço</th>
                        </tr>
                        <%
                            int n_reg = 0;
                            for (Produto produto : listaProdutos) {
                        %>
                        <tr>
                            <td><%= produto.getCodigoean()%></td>
                            <td><%= produto.getDescricao()%></td>
                            <td><%= formatarDinheiro(produto.getPreco())%></td>
                        </tr>
                        <%
                                n_reg++;
                            }
                        %>
                    </table>
                </div>
                <%
                } else {
                %>
                <p>Nenhum produto encontrado.</p>
                <%
                    }
                %>

                <br><br><br><br><br>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
        <script type="text/javascript">
                                    //Bootstrap datatable para uma função detalhada da tabela
                                    $(document).ready(function () {
                                        // Verifica se a tabela já tem o DataTable aplicado
                                        if (!$.fn.DataTable.isDataTable('#products-table')) {
                                            // Inicializa o DataTable
                                            $('#products-table').DataTable({
                                                "paging": true,
                                                "lengthChange": true, // Habilita a opção de selecionar a quantidade de entradas por página
                                                "searching": true,
                                                "ordering": true,
                                                "info": true,
                                                "autoWidth": false,
                                                "language": {
                                                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Portuguese-Brasil.json"
                                                },
                                                "lengthMenu": [5, 10, 20, 50, 100], // Opções de quantidade de entradas por página
                                                "pageLength": 10, // Define a quantidade padrão de entradas por página
                                                "columns": [
                                                    null, // Código EAN
                                                    null, // Descrição
                                                    null, // Preço
                                                ]
                                            });
                                        }
                                    });

                                    /*function buscarProducts() {
                                     var searchTerm = $("#search").val().toLowerCase();
                                     
                                     // Ocultar todas as linhas da tabela
                                     $("#products-table tr").hide();
                                     
                                     // Iterar sobre as linhas da tabela e exibir aquelas que correspondem ao termo de busca
                                     $("#products-table tr").filter(function () {
                                     return $(this).text().toLowerCase().indexOf(searchTerm) > -1;
                                     }).show();
                                     }*/

                                    function confirmarExclusao(codigo) {
                                        var confirmacao = confirm("Tem certeza que deseja excluir o produto?");

                                        if (confirmacao) {
                                            window.location.href = "../excluir/produto_excluir_codigo.jsp?codigo=" + codigo;
                                        }
                                    }

                                    $(document).ready(function () {
                                        console.log("jQuery está funcionando.");

                                        $(".xp-menubar").on('click', function () {
                                            console.log("Clique no botão de menu.");
                                            $("#sidebar").toggleClass('active');
                                            $("#content").toggleClass('active');
                                        });

                                        $('.xp-menubar,.body-overlay').on('click', function () {
                                            console.log("Clique no botão de menu ou na sobreposição do corpo.");
                                            $("#sidebar,.body-overlay").toggleClass('show-nav');
                                        });
                                    });


                                    document.getElementById("sair-link").addEventListener("click", function (event) {
                                        event.preventDefault(); // Impede o comportamento padrão do link

                                        const confirmacao = confirm("Deseja realmente sair?");

                                        if (confirmacao) {
                                            window.location.href = "../index.html"; // Redireciona para index.html
                                        }
                                    });
        </script>
    </body>
</html>
