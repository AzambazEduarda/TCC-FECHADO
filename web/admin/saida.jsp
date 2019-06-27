<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Encomenda"%>
<%@page import="dao.EncomendaDAO"%>
<%
    EncomendaDAO edao = new EncomendaDAO();
    List<Encomenda> lista;

    UsuarioDAO udao = new UsuarioDAO();
    Usuario u = new Usuario();
    

    if (request.getParameter("txtFiltro") != null) {
        lista = edao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            Encomenda obj = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                edao.excluir(obj);
            }
        }
        lista = edao.listar();
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

    <style>
        h3{
            text-align: left;
        }
        #botao{
            text-align: center;
        }
        th{
            font-family: montserrat;
            text-align: center;
        }

    </style>

    <div style="text-align: center" align="center">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-book"></i> Encomendas</h3>
            </div>
            <div>
                <div id="shieldui-grid1"></div>
            </div>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Doces</th>
                        <th>Quantidade</th>
                        <th>Data do Pedido</th>
                        <th>Data do Entrega</th>
                        <th>Forma de Pagamento</th>
                        <th>Endereço</th>
                        <th>Número/Comp.</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Encomenda item : lista) {
                    %>
                    <tr>
                        <td><%=item.getIdusuario()%></td>
                        <td><%=item.getIddoce()%></td>
                        <th><%=item.getQuantidade()%></th>
                        <td><%=StormData.formata(item.getDatapedido())%></td>
                        <td><%=StormData.formata(item.getDataentrega())%></td>
                        <td><%=item.getIdforma()%></td>
                        <td><%=item.getIdusuario().getRuausuario()%></td>
                        <td><%=item.getIdusuario().getNumerocasausuario()%>/<%=item.getIdusuario().getComplementousuario()%></td>
                    </tr>
                    <% 
                       }
                    %>
                </tbody>
            </table>
            <!-- /.table-responsive -->
        </div>
    </div>
    <script>
        var codigo;
        function excluir() {
            document.location.href = "indexencomendar.jsp?codigo=" + codigo;
        }
    </script>

