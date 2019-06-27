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
            <h3 class="panel-title"><i class="fa fa-shopping-basket"></i> Doces</h3>
        </div>
        <div>
            <div id="shieldui-grid1"></div>
        </div>
        <table  class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th style="width: 8%">Nome</th>
                    <th style="width: 3%">Preço</th>
                    <th style="width: 3%">Peso</th>
                    <th style="width: 3%">Qtd</th>
                    <th style="width: 12%">Ingredientes</th>
                    <th style="width: 8%">Imagem1</th>
                    <th style="width: 8%">Imagem2</th>
                    <th style="width: 8%">Imagem3</th>
                    <th style="width: 10%">Ações</th>
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
    </div>
    <!-- /.table-responsive -->
</div>
<div id="botao">
    <form action= "adddoce.jsp">
        <button type="submit" class="btn btn-info">
            Adicionar novo Doce</button>
    </form>
</div>

</br>
</br>
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
    function excluir() {
        document.location.href = "indexdoce.jsp?codigo=" + codigo;
    }
</script>