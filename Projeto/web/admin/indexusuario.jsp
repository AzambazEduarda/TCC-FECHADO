<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    UsuarioDAO udao = new UsuarioDAO();
    List<Usuario> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = udao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se � excluir
        if (request.getParameter("codigo") != null) {
            Usuario obj = udao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                udao.excluir(obj);
            }
        }
        lista = udao.listar();
    }
%>
<div>

    <form action= "addusuario.jsp">
        <button type="submit" class="btn btn-info">
            Adicionar novo Usuario</button>
    </form>
</div>
           
</br>
</br>
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Rua</th>
                <th>CEP</th>
                <th>Bairro</th>
                <th>Celular</th>
                <th>Email</th>
                <th>A��es</th>
            </tr>
        </thead>
        <tbody>
            <%for (Usuario item : lista) {
            %>
            <tr>
                <td><%=item.getNomeusuario()%></td>
                <td><%=item.getRuausuario()%></td>
                <td><%=item.getCepusuario()%></td>
                <td><%=item.getBairrousuario()%></td>
                <td><%=item.getCelularusuario()%></td>
                <td><%=item.getEmailusuario()%></td>

                <td><a href="updusuario.jsp?codigo=<%=item.getIdusuario()%>" class="btn  btn-primary btn-sm">Alterar</a>
                    <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                            onclick="codigo =<%=item.getIdusuario()%>">Excluir</button>  
                </td>
            </tr>
            <% }%>
        </tbody>
    </table>

    <!-- /.table-responsive -->
</div>
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

<script>
    var codigo;
    function excluir(){
        document.location.href = "indexusuario.jsp?codigo="+codigo;
    }
</script>

