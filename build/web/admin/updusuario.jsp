<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="util.Criptografia"%>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";

    UsuarioDAO udao = new UsuarioDAO();
    Usuario obj = new Usuario();
    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        obj.setIdusuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
        obj.setNomeusuario(request.getParameter("txtNome"));
        obj.setRuausuario(request.getParameter("txtRua"));
        obj.setCepusuario(request.getParameter("txtCEP"));
        obj.setNumerocasausuario(Integer.parseInt(request.getParameter("txtNCasa")));
        obj.setComplementousuario(request.getParameter("txtComplemento"));
        obj.setBairrousuario(request.getParameter("txtBairro"));
        obj.setCelularusuario(request.getParameter("txtCelular"));
        obj.setSenhausuario(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        obj.setEmailusuario(request.getParameter("txtEmail"));

        Boolean resultado = udao.alterar(obj);

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
            response.sendRedirect("indexusuario.jsp");
            return;
        }

        udao = new UsuarioDAO();
        obj = udao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("indexusuario.jsp");
            return;
        }
    }
%>
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
                <div class="col-md-1">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtIdUsuario" 
                               value="<%=obj.getIdusuario()%>"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtNome" 
                               value="<%=obj.getNomeusuario()%>"/>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtCelular" 
                               value="<%=obj.getCelularusuario()%>"/>
                    </div> 
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtCEP" 
                               value="<%=obj.getCepusuario()%>"/>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtRua" 
                               value="<%=obj.getRuausuario()%>"/>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-2">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtNCasa" 
                               value="<%=obj.getNumerocasausuario()%>"/>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtBairro" 
                               value="<%=obj.getBairrousuario()%>"/>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtComplemento" 
                               value="<%=obj.getComplementousuario()%>"/>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtSenha" 
                               value="<%=obj.getSenhausuario()%>"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtEmail" 
                               value="<%=obj.getEmailusuario()%>"/>
                    </div>
                </div> 
                <div class="col-md-1"></div>
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