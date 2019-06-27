
<%@page import="modelo.Comentario"%>
<%@page import="dao.ComentarioDAO"%>
<%@page import="dao.DoceDAO"%>
<%@page import="modelo.Doce"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";
    Doce obj = new Doce();
    DoceDAO dao = new DoceDAO();

    ComentarioDAO cdao = new ComentarioDAO();
    List<Comentario> clistar = cdao.listar();
    Comentario c = new Comentario();

    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtIdDoce") != null) {

            obj.setIddoce(Integer.parseInt(request.getParameter("txtIdDoce")));
            obj.setNomedoce(request.getParameter("txtNome"));
            obj.setPrecodoce(Float.parseFloat(request.getParameter("txtPreco")));
            obj.setPesodoce(Float.parseFloat(request.getParameter("txtPeso")));
            obj.setDescricaodoce(request.getParameter("txtDescricao"));
            obj.setIngredientes(request.getParameter("txtIngredientes"));
            obj.setImagemi(request.getParameter("txtImagem1"));
            obj.setImagemii(request.getParameter("txtImagem2"));
            obj.setImagemiii(request.getParameter("txtImagem3"));
            obj.setQntddoce(Integer.parseInt(request.getParameter("txtQuantidade")));

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
            } else {
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
            </br>
            <h2>REGISTRO DE DOCE</h2>
        </div>
        </br>
        </br>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-1">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtIdDoce" required placeholder="Id do Doce">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtNome" required placeholder="Informe o nome do Doce">
                    </div>
                </div> 
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtPreco" required placeholder="Informe o preço do Doce">
                    </div>
                </div> 
                <div class="col-md-1"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtPeso" required placeholder="Informe o peso do Doce">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtDescricao" required placeholder="Informe a descrição do Doce">
                    </div>
                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-1"></div>
                    <div class="col-md-7">
                        <div class="form-group">
                            <input type="text" class="form-control" name="txtIngredientes" required placeholder="Informe os ingredientes do Doce">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <input type="text" class="form-control" name="txtQuantidade" required placeholder="Atualize sua quantidade">
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
                            <input type="file" class="form-control" name="txtImagem1" required placeholder="Selecione sua imagem 1">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="file" class="form-control" name="txtImagem2" required placeholder="Selecione sua imagem 2">
                        </div>
                    </div>  
                    <div class="col-md-3">
                        <div class="form-group">
                            <input type="file" class="form-control" name="txtImagem3" required  placeholder="Selecione sua imagem 3">
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>


            <div>
                <div>
                </div>
                <label class="col-md-5"></label>
                <div class="col-md-6">
                    <button type="submit" class="btn btn-info">
                        Registra
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
