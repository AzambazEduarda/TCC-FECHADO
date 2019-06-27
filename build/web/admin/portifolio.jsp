<%@page import="java.util.List"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    DoceDAO ddao = new DoceDAO();

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
    .well{
        height:170px;
        width:170px;
        background-color: #D10024
    }
    .row{
        margin: 0px;
    }
    .col-sm-2{
        margin-right: 30px;
    }
</style>
<div class="container">
    <div class="row">
        <div class="text-center">
            <h2>DOCES</h2>
        </div>
        <div class="row">
            <%for (Doce item : lista) {
            %>
            <div class="well col-sm-2">
                <img class="thumbnail img-responsive" alt="Bootstrap template" src="../arquivos/<%=item.getImagemi()%>" height="150px"  width="150px"/> 
                <span>
                    <%=item.getNomedoce()%>
                </span>
            </div>
            <% }%>
        </div>
    </div>
</div>
</div>
</div>

</body>
</html>
