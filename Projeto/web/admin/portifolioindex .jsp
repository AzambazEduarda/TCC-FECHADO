<%@page import="../java.util.List"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@include file="cabecalho.jsp" %>
<%

    DoceDAO dao = new DoceDAO();
    List<Doce> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("idDoce") != null) {
            Doce obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("idDoce")));
            if (obj != null) {
                dao.excluir(obj);
            }
        }
        lista = dao.listar();
    }
%>
<div>

    <form action= "adddoce.jsp">
        <button type="submit" class="btn btn-info">
            Adicionar novo Doce</button>
    </form>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Imagem1</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%for (Doce item : lista) {
            %>
            <tr>
                <td><%=item.getIddoce()%></td>
                <td><%=item.getNomedoce()%></td>
                <td><%=item.getImagemi()%></td>

                <td><a href="upd.jsp?codigo=<%=item.getIddoce()%>" class="btn  btn-primary btn-sm">Alterar</a>
                    <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                            onclick="codigo =<%=item.getIddoce()%>">Excluir</button>  
                </td>
            </tr>
            <% }%>
        </tbody>
    </table>

    <!-- /.table-responsive -->
</div>