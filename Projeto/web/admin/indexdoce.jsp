<%@page import="java.util.List"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<%@include file="../cabecalho.jsp" %>
<%

    DoceDAO ddao = new DoceDAO();
    
    List<Doce> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = ddao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            Doce obj = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                ddao.excluir(obj);
            }
        }
        lista = ddao.listar();
    }
%>
<div>
    <form action= "adddoce.jsp">
        <button type="submit" class="btn btn-info">
            Adicionar novo Doce</button>
    </form>
</div>
           
</br>
</br>
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Preço</th>
                <th>Peso</th>
                <th>Qtd</th>
                <th>Ingredientes</th>
                <th>Imagem1</th>
                <th>Imagem2</th>
                <th>Imagem3</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%for (Doce item : lista) {
            %>
            <tr>
                <td><%=item.getNomedoce()%></td>
                <td><%=item.getPrecodoce()%></td>
                <td><%=item.getPesodoce()%></td>
                <td><%=item.getQntddoce()%></td>
                <td><%=item.getIngredientes()%></td>
                <td><img src="../arquivos/<%=item.getImagemi()%>" height="50px"  width="70px"/></td>
                <td><img src="../arquivos/<%=item.getImagemii()%>" height="50px"  width="70px"/></td>
                <td><img src="../arquivos/<%=item.getImagemiii()%>" height="50px"  width="70px"/></td>
                
                
                



                <td><a href="upddoce.jsp?codigo=<%=item.getIddoce()%>" class="btn  btn-primary btn-sm">Alterar</a>
                    <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                            onclick="codigo =<%=item.getIddoce()%>">Excluir</button>  
                </td>
            </tr>
            <% }%>
        </tbody>
    </table>

    <!-- /.table-responsive -->
</div>
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

<script>
    var codigo;
    function excluir(){
        document.location.href = "indexdoce.jsp?codigo="+codigo;
    }
</script>