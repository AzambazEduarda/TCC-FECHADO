<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Formapag"%>
<%@page import="dao.FormapagDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    
    FormapagDAO fdao = new FormapagDAO();
    List<Formapag> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = fdao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se � excluir
        if (request.getParameter("codigo") != null) {
            Formapag obj = fdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                fdao.excluir(obj);
            }
        }
        lista = fdao.listar();
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
            <h3 class="panel-title"><i class="fa fa-money"></i> Formas de Pagamento</h3>
        </div>
        <div>
            <div id="shieldui-grid1"></div>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>A��es</th>
                </tr>
            </thead>
            <tbody>
                <%for (Formapag item : lista) {
                %>
                <tr>
                    <td><%=item.getIdformapag()%></td>
                    <td><%=item.getFormanome()%></td>

                    <td><a href="updformapag.jsp?codigo=<%=item.getIdformapag()%>" class="btn  btn-primary btn-sm">Alterar</a>
                        <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                onclick="codigo =<%=item.getIdformapag()%>">Excluir</button>  
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

        <!-- /.table-responsive -->
    </div>
    <div>

        <form action= "addformapag.jsp">
            <button type="submit" class="btn btn-info">
                Adicionar nova Forma de Pagamento</button>
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
            document.location.href = "indexformapag.jsp?codigo=" + codigo;
        }
    </script>

