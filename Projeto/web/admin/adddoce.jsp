

<%@page import="dao.DoceDAO"%>
<%@page import="modelo.Doce"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    Doce obj = new Doce();
    DoceDAO dao = new DoceDAO();
    if(request.getMethod().equals("POST")){

    if (request.getParameter("txtIdDoce") != null) {

        obj.setIddoce(Integer.parseInt(request.getParameter("txtIdDoce")));
        obj.setNomedoce(request.getParameter("txtNome"));
        obj.setPrecodoce(Float.parseFloat(request.getParameter("txtPreco")));
        obj.setPesodoce(Float.parseFloat(request.getParameter("txtPeso")));
        obj.setDescricaodoce(request.getParameter("txtDescricao"));
        obj.setIngredientes(request.getParameter("txtIngredientes"));
        obj.setComentariodoce(request.getParameter("txtComentarios"));
        obj.setImagemi(request.getParameter("txtImagem1"));
        obj.setImagemii(request.getParameter("txtImagem2"));
        obj.setImagemiii(request.getParameter("txtImagem3"));
        obj.setQntddoce(Integer.parseInt(request.getParameter("txtQuantidade")));

        Boolean resultado = dao.incluir(obj);
        if (resultado){
            msg = "Registro cadastrado com sucesso";
            classe = "alert-sucess";
        }
        else{
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        String redirectURL = "indexdoce.jsp";
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
            <h2>Novo Registro de Doce</h2>
        </div>
        <div>
            <label for="id" class="col-md-2">
                Id do Doce:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtIdDoce" required placeholder="Id do Doce">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>
        <div>
            <label for="name" class="col-md-2">
                Nome do Doce:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtNome" required placeholder="Digite o nome do Doce">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>        

        <div>
            <label for="preco" class="col-md-2">
                Preço:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtPreco" required placeholder="Digite o preço do Doce">

            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>
        <div>
            <label for="peso" class="col-md-2">
                Peso:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtPeso" required placeholder="Digite o peso do Doce">

            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>

        <div>
            <label for="descricao" class="col-md-2">
                Descricao:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtDescricao" required placeholder="Digite a descrição do Doce">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>
        <div>
            <label for="comentario" class="col-md-2">
                Comentário:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtComentarios" required placeholder="Digite o comentário do Doce">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="ingredientes" class="col-md-2">
                Ingredientes:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtIngredientes" required placeholder="Digite os ingredientes do Doce">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>
        <div>
            <label for="Imagem I" class="col-md-2">
                Imagem I:
            </label>
            <div class="col-md-9">
                <input type="file" class="form-control" name="txtImagem1" required placeholder="Selecione sua imagem I">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="Imagem II" class="col-md-2">
                Imagem II:
            </label>
            <div class="col-md-9">
                <input type="file" class="form-control" name="txtImagem2" required placeholder="Selecione sua imagem II">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>

        <div>
            <label for="Imagem III" class="col-md-2">
                Imagem III:
            </label>
            <div class="col-md-9">
                <input type="file" class="form-control" name="txtImagem3" required  placeholder="Selecione sua imagem III">
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div> 
        </div>


        <div>
            <label for="Quantidade" class="col-md-2">
                Quantidade:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtQuantidade" required placeholder="Atualize sua quantidade">
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
