<%
    ////VERIFICA SE TÁ LOGADO
    if (session.getAttribute("administrador").equals("")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <!--<link href="/site../img../logo9.png" rel="icon">-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Paty's Candy Admin</title>

        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/local.css" />

        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

        <!-- you need to include the shieldui css and js assets in order for the charts to work -->
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
        <link id="gridcss" rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/dark-bootstrap/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="./img/LOGO10.png" alt=""></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul id="active" class="nav navbar-nav side-nav">
                        <li><a href="portifolio.jsp"><i class="fa fa-photo"></i> Portfolio</a></li>
                        <li><a href="indexusuario.jsp"><i class="fa fa-user"></i> Registro de Usuário</a></li>
                        <li><a href="indexencomendar.jsp"><i class="fa fa-book"></i> Registro Encomenda </a></li>
                        <li><a href="indexdoce.jsp"><i class="fa fa-shopping-basket"></i> Registro de Doces</a></li>
                        <li><a href="indexformapag.jsp"><i class="fa fa-money"></i> Registro Forma Pagamento</a></li>
                        <li><a href="saida.jsp"><i class="fa fa-comment-o"></i> Saída</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="divider-vertical"></li>
                        <li>
                            <form action="#" method="post" class="navbar-search">
                                <input type="text" name="txtFiltro" placeholder="Pesquisar" class="form-control">
                            </form>
                        </li>
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("administrador")%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                
                                <li><a href="../login.jsp?acao=sair"><i class="fa fa-power-off"></i> Sair</a></li>
                                
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>