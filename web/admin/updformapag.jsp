<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Formapag"%>
<%@page import="dao.FormapagDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";

    FormapagDAO fdao = new FormapagDAO();
    Formapag obj = new Formapag();

    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        obj.setIdformapag(Integer.parseInt(request.getParameter("txtIdForma")));
        obj.setFormanome(request.getParameter("txtForma"));

        Boolean resultado = fdao.alterar(obj);

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

        fdao = new FormapagDAO();
        obj = fdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("indexformapag.jsp");
            return;
        }
    }
%>
<style>
    #check{
        display:inline;
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
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtIdForma" 
                               value="<%=obj.getIdformapag()%>"/>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtForma" 
                               value="<%=obj.getFormanome()%>"/>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <div class="col-md-5">
        </div>
        <div class="col-md-5">
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