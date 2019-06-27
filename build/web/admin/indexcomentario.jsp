<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Comentario"%>
<%@page import="dao.ComentarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    
    ComentarioDAO edao = new ComentarioDAO();
    List<Comentario> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = edao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            Comentario obj = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
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
            <h3 class="panel-title"><i class="fa fa-book"></i> Comentarios</h3>
        </div>
        <div>
            <div id="shieldui-grid1"></div>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Comentario</th>
                    <th>Usuario</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%for (Comentario item : lista) {
                %>
                <tr>
                    <td><%=item.getComen()%></td>
                    <td><%=item.getIdusuario()%></td>


                    <td>
                        <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                onclick="codigo =<%=item.getIdcomen()%>">Excluir</button>  
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

        <!-- /.table-responsive -->
    </div>
    <div>

        <form action= "addcomentario.jsp">
            <button type="submit" class="btn btn-info">
                Adicionar novo Comentario</button>
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
                    <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
                </div>
                <div class="modal-body">
                    Tem certeza que deseja excluir?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="excluir()">Confirmar Exclusão</button>
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
            document.location.href = "indexcomentario.jsp?codigo=" + codigo;
        }
    </script>

