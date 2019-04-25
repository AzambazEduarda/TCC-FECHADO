<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
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
        obj.setCpfusuario(request.getParameter("txtCPF"));
        obj.setBairrousuario(request.getParameter("txtBairro"));
        obj.setCelularusuario(request.getParameter("txtCelular"));
        obj.setSenhausuario(request.getParameter("txtSenha"));
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
    <div>
        <label for="id" class="col-md-2">
            Id do Usuário:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtIdUsuario" 
                   value="<%=obj.getIdusuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>  

    <div>
        <label for="nome" class="col-md-2">
            Nome:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtNome" 
                    value="<%=obj.getNomeusuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>
    <div>
        <label for="rua" class="col-md-2">
            Rua:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtRua" 
                   value="<%=obj.getRuausuario()%>"/>

        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>

    <div>
        <label for="cep" class="col-md-2">
            CEP:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtCEP" 
                   value="<%=obj.getCepusuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>

    <div>
        <label for="numerocasa" class="col-md-2">
            Número da Casa:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtNCasa" 
                   value="<%=obj.getNumerocasausuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>


    <div>
        <label for="cpf" class="col-md-2">
            CPF:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtCPF" 
                   value="<%=obj.getCpfusuario()%>" />
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>

    <div>
        <label for="bairro" class="col-md-2">
            Bairro:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtBairro" 
                    value="<%=obj.getBairrousuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>

    <div>
        <label for="celular" class="col-md-2">
            Celular:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtCelular" 
                   value="<%=obj.getCelularusuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>
    
    <div>
        <label for="senha" class="col-md-2">
            Senha:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="password" name="txtSenha" 
                    value="<%=obj.getSenhausuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>
        
        <div>
        <label for="email" class="col-md-2">
            Senha:
        </label>
        <div class="col-md-9">
            <input class="form-control" type="text" name="txtEmail" 
                   value="<%=obj.getEmailusuario()%>"/>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>
        
        
    <div>
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
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