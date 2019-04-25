
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    
    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    
    if(request.getMethod().equals("POST")){

    if (request.getParameter("txtIdUsuario") != null) {
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
        
        Boolean resultado = dao.incluir(obj);
        if (resultado){
            msg = "Registro cadastrado com sucesso";
            classe = "alert-sucess";
        }
        else{
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        String redirectURL = "indexusuario.jsp";
        response.sendRedirect(redirectURL);
    }
    dao.fecharConexao();
    }
%>
<div class="alert <%=classe%>">
    <%=msg%>
</div>
<form action="../UploadWS" method="post" enctype="multipart/form-data">
    <div>
        <div class="row text-center">
            <h2>Novo Registro de Usuario</h2>
        </div>
        <div>
            <label for="Id" class="col-md-2">
                Id Usuario:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtIdUsuario" required placeholder="Id  do Usuario" >
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>
        <div>
            <label for="name" class="col-md-2">
                Nome do Usuario:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtNome" required placeholder="Digite o nome do Usuario" >
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>        

        <div>
            <!--SELECT DA RUA-->
        </div>
        <div>
            <label for="rua" class="col-md-2">
                Rua:
            </label>
            <div class="col-md-9">
                <input type="rua" class="form-control" name="txtRua" required placeholder="Digite a rua do usuario" >

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
                <input type="text" class="form-control" name="txtCEP" required placeholder="Digite o CEP do Usuario">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="NCasa" class="col-md-2">
                Número da Casa:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtNCasa"  required placeholder="Digite o número da casa do Usuario">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>
        <div>
            <label for="CPF" class="col-md-2">
                CPF:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtCPF" required placeholder="Digite o cpf do Usuario" >
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="Bairro" class="col-md-2">
                Bairro:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtBairro" required placeholder="Digite o bairro do Usuario" >
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="Celular" class="col-md-2">
                Celular:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtCelular" required placeholder="Digite o celular do Usuario">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="Senha" class="col-md-2">
                Senha:
            </label>
            <div class="col-md-9">
                <input type="password" class="form-control" name="txtSenha" required placeholder="Digite a senha do Usuario">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>

            <label for="Email" class="col-md-2">
                Email:
            </label>

            <div class="col-md-9">
                <input type="text" class="form-control" name="txtEmail" required placeholder="Digite o email do Usuario" >
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
