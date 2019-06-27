<%@page import="modelo.Comentario"%>
<%@page import="dao.ComentarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";

    DoceDAO ddao = new DoceDAO();
    Doce obj = new Doce();

    ComentarioDAO cdao = new ComentarioDAO();
    List<Comentario> clistar = cdao.listar();
    Comentario c = new Comentario();
    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        obj.setIddoce(Integer.parseInt(request.getParameter("txtIdDoce")));
        obj.setNomedoce(request.getParameter("txtNome"));
        obj.setPrecodoce(Float.parseFloat(request.getParameter("txtPreco")));
        obj.setPesodoce(Float.parseFloat(request.getParameter("txtPeso")));
        obj.setDescricaodoce(request.getParameter("txtDescricao"));
        obj.setIngredientes(request.getParameter("txtIngredientes"));
        obj.setQntddoce(Integer.parseInt(request.getParameter("txtQuantidade")));
        obj.setImagemi(request.getParameter("txtImagem1"));
        obj.setImagemii(request.getParameter("txtImagem2"));
        obj.setImagemiii(request.getParameter("txtImagem3"));

        if (request.getParameter("txtImagem1") != null) {

            obj.setImagemi(request.getParameter("txtImagem1"));
        } else {
            obj.setImagemi(request.getParameter("txtImagemVelha1"));
        }

        if (request.getParameter("txtImagem2") != null) {

            obj.setImagemii(request.getParameter("txtImagem2"));
        } else {
            obj.setImagemii(request.getParameter("txtImagemVelha2"));
        }

        if (request.getParameter("txtImagem3") != null) {

            obj.setImagemiii(request.getParameter("txtImagem3"));
        } else {
            obj.setImagemiii(request.getParameter("txtImagemVelha3"));
        }

        Boolean resultado = ddao.alterar(obj);

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
            response.sendRedirect("indexdoce.jsp");
            return;
        }

        ddao = new DoceDAO();
        obj = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("indexdoce.jsp");
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
                        <input class="form-control" type="text" name="txtIdDoce" 
                               value="<%=obj.getIddoce()%>"/>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtNome" 
                               value="<%=obj.getNomedoce()%>"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtPreco" 
                               value="<%=obj.getPrecodoce()%>"/>
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
                        <input class="form-control" type="text" name="txtPeso" 
                               value="<%=obj.getPesodoce()%>"/>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtDescricao" 
                               value="<%=obj.getDescricaodoce()%>"/>
                    </div> 
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtIngredientes" 
                               value="<%=obj.getIngredientes()%>"/>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input class="form-control" type="text" name="txtQuantidade" 
                               value="<%=obj.getQntddoce()%>"/>
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
                        <input class="form-control" type="file" name="txtImagem3" 
                               value="<%=obj.getImagemiii()%>"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input class="form-control" type="file" name="txtImagem2" 
                               value="<%=obj.getImagemii()%>"/>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input class="form-control" type="file" name="txtImagem1" 
                               value="<%=obj.getImagemi()%>"/>
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
        </div>
</form>  