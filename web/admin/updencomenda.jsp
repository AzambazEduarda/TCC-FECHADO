<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Encomenda"%>
<%@page import="dao.EncomendaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";

    EncomendaDAO edao = new EncomendaDAO();
    Encomenda obj = new Encomenda();

    UsuarioDAO udao = new UsuarioDAO();
    List<Usuario> ulistar = udao.listar();
    Usuario u = new Usuario();

    DoceDAO ddao = new DoceDAO();
    List<Doce> dlistar = ddao.listar();
    Doce d = new Doce();

    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        obj.setIdencomenda(Integer.parseInt(request.getParameter("txtIdEncomenda")));
        obj.setDatapedido(StormData.formata(request.getParameter("txtDataPedido")));
        obj.setDataentrega(StormData.formata(request.getParameter("txtDataEntrega")));

        u = udao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtUsuarioNome")));
        d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDoceNome")));
        obj.setIdusuario(u);
        obj.setIddoce(d);

        Boolean resultado = edao.alterar(obj);

        if (resultado) {
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }

    } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("indexencomenda.jsp");
            return;
        }

        edao = new EncomendaDAO();
        obj = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("indexencomenda.jsp");
            return;
        }
    }
%>
<style>
    #check{
        display:;
    }

</style>
<div class="alert <%=classe%>">
    <%=msg%>
</div>
<form action="../UploadWS" method="post" enctype="multipart/form-data">
    <div>
        <div class="row text-center">
            <h2>Novo Registro</h2>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <input class="form-control" type="text" name="txtIdEncomenda" 
                       value="<%=obj.getIdencomenda()%>"/>
            </div>
        </div>  
        <div class="col-md-6">
            <div class="form-group">
                <select type="text" class="form-control" name="txtUsuarioNome" required placeholder="Selecione o nome do Usuário" />
            </div>
            <%
                for (Usuario item : ulistar) {
            %>
            <option value = "<%=item.getIdusuario()%>">
                <%=item.getNomeusuario()%>
            </option>
            <%
                }
            %>
            </select>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <input class="form-control" type="date" name="txtDataPedido" 
                   value="<%=obj.getDatapedido()%>"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <input class="form-control" type="date" name="txtDataEntrega" 
                   value="<%=obj.getDatapedido()%>"/>
        </div>
    </div>
    <div id="check" class="col-md-3">
        <div class="form-group">  
            <%for (Doce item : dlistar) {%>
            <input type="checkbox" class="form-control" name="txtDoceNome" 
                   value="<%=item.getIddoce()%>"><%=item.getNomedoce()%>
            <%}%>
        </div>
    </div>
    <div>
        <div class="col-md-5">
        </div>
        <div class="col-md-6">
            <button type="submit" class="btn btn-info">
                Alterar
            </button>
            <button type="submit" class="btn btn-info">
                Cancelar
            </button>
        </div>
    </div>
</div>  
</form>