<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Encomenda"%>
<%@page import="dao.EncomendaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    
    EncomendaDAO edao = new EncomendaDAO();
    List<Encomenda> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = edao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se � excluir
        if (request.getParameter("codigo") != null) {
            Encomenda obj = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                edao.excluir(obj);
            }
        }
        lista = edao.listar();
    }
%>

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
                    <th>A��es</th>
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


                    <td><a href="updencomenda.jsp?codigo=<%=item.getIdencomenda()%>" class="btn  btn-primary btn-sm">Alterar</a>
                        <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                onclick="codigo =<%=item.getIdencomenda()%>">Excluir</button>  
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

        <!-- /.table-responsive -->
    </div>
    <div>

        <form action= "addencomenda.jsp">
            <button type="submit" class="btn btn-info">
                Adicionar novo Encomenda</button>
        </form>
    </div>


    </br>
    </br>
    <!-- Button trigger modal -->
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Exclus�o</h4>
                </div>
                <div class="modal-body">
                    Tem certeza que deseja excluir?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="excluir()">Confirmar Exclus�o</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
    <script>
        var codigo;
        function excluir() {
            document.location.href = "indexencomendar.jsp?codigo=" + codigo;
        }
    </script>

