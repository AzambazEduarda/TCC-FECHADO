<%@page import="dao.ComentarioDAO"%>
<%@page import="modelo.Comentario"%>
<%@page import="modelo.Formapag"%>
<%@page import="dao.FormapagDAO"%>
<%@page import="util.StormData"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp" %>
<%    
    String msg = "";
    String classe = "";

    Comentario obj = new Comentario();
    ComentarioDAO edao = new ComentarioDAO();
    
    Date data = new Date();

    UsuarioDAO udao = new UsuarioDAO();
    List<Usuario> ulistar = udao.listar();
    Usuario u = new Usuario();

    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtIdEncomenda") != null) {

            obj.setIdcomen(Integer.parseInt(request.getParameter("txtIdComentario")));
            obj.setComen((request.getParameter("txtComentario")));
            u = udao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtUsuarioNome")));
            obj.setIdusuario(u);

            Boolean resultado = edao.incluir(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }
            String redirectURL = "indexencomendar.jsp";
            response.sendRedirect(redirectURL);
        }
        edao.fecharConexao();
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
            <h2>REGISTRO DE ENCOMENDA</h2>
        </div>
        </br>
        </br>

        <div class="col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" name="txtIdComentario" required placeholder="Id do Comentario">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" name="txtComentario" required placeholder="Informe seu Comentario">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <select type="text" class="form-control" name="txtUsuarioNome" required placeholder="Selecione o nome do Usuário" />

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
        <div>
            <div class="col-md-5">
            </div>
            <div class="col-md-6">
                </br>
                </br>
                <button type="submit" class="btn btn-info">
                    Registrar
                </button>
                <button type="submit" class="btn btn-info">
                    Cancelar
                </button>
            </div>
        </div>
    </div>
</form>  


</body>
</html>
