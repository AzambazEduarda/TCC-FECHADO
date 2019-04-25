
<%@page import="util.StormData"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.EncomendaDAO"%>
<%@page import="modelo.Encomenda"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";

    Encomenda obj = new Encomenda();
    EncomendaDAO edao = new EncomendaDAO();

    UsuarioDAO udao = new UsuarioDAO();
    List<Usuario> ulistar = udao.listar();
    Usuario u = new Usuario();

    DoceDAO ddao = new DoceDAO();
    List<Doce> dlistar = ddao.listar();
    Doce d = new Doce();

    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtIdEncomenda") != null) {

            obj.setIdencomenda(Integer.parseInt(request.getParameter("txtIdEncomenda")));
            obj.setQuantidade(Integer.parseInt(request.getParameter("txtQuantDoce")));
            u = udao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtUsuarioNome")));
            d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDoceNome")));
            obj.setIdusuario(u);
            obj.setIddoce(d);
            obj.setDatapedido(StormData.formata(request.getParameter("txtDataPedido"), "yyyy-MM-dd"));
            obj.setDataentrega(StormData.formata(request.getParameter("txtDataEntrega"), "yyyy-MM-dd"));

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
<div class="alert <%=classe%>">
    <%=msg%>
</div>
<form action="../UploadWS" method="post" enctype="multipart/form-data">
    <div>
        <div class="row text-center">
            <h2>Novo Registro de Encomenda</h2>
        </div>



        <div>
            <label for="id" class="col-md-2">
                Id do Encomenda:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtIdEncomenda" required placeholder="Id do Encomenda">
            </div>
        </div>



        <div >
            <label for="usuario" class="col-md-2">
                Nome Usuário:
            </label>
            <div class="col-md-9">
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
            <label for="doce" class="col-md-2">
                Doces:
            </label>
            <div class="col-md-2">  
                <%for (Doce item : dlistar) {%>
                <input type="checkbox" class="col-md-9" name="txtDoceNome" value="<%=item.getIddoce()%>"><%=item.getNomedoce()%>
                <%}%>

            </div>
        </div>

        <div>
            <label for="quantidade" class="col-md-2">
                Quantidade:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="txtQuantDoce" required placeholder="Quantidade de doces">
            </div>
        </div>       


        <div>
            <label for="dataPedido" class="col-md-2">
                Data do Pedido:
            </label>
            <div class="col-md-9">
                <input type="date" class="form-control" name="txtDataPedido" required placeholder="Data do Pedido">
            </div>
        </div>



        <div>
            <label for="dataEntrega" class="col-md-2">
                Data da Entrega:
            </label>
            <div class="col-md-9">
                <input type="date" class="form-control" name="txtDataEntrega" required placeholder="Data da Entrega">
            </div>
        </div>



        <div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
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
