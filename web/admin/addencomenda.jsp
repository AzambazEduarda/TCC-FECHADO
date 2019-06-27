<%@page import="modelo.Formapag"%>
<%@page import="dao.FormapagDAO"%>
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
<%    String msg = "";
    String classe = "";

    Encomenda obj = new Encomenda();
    EncomendaDAO edao = new EncomendaDAO();

    Date data = new Date();

    UsuarioDAO udao = new UsuarioDAO();
    List<Usuario> ulistar = udao.listar();
    Usuario u = new Usuario();

    DoceDAO ddao = new DoceDAO();
    List<Doce> dlistar = ddao.listar();
    Doce d = new Doce();

    FormapagDAO fdao = new FormapagDAO();
    List<Formapag> flistar = fdao.listar();
    Formapag f = new Formapag();

    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtIdEncomenda") != null) {

            obj.setIdencomenda(Integer.parseInt(request.getParameter("txtIdEncomenda")));
            obj.setQuantidade(Integer.parseInt(request.getParameter("txtQuantDoce")));
            f = fdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtFormaPag")));
            u = udao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtUsuarioNome")));
            d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDoceNome")));
            obj.setIdusuario(u);
            obj.setIddoce(d);
            obj.setIdforma(f);
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
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-1">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtIdEncomenda" required placeholder="Id do Encomenda">
                    </div>
                </div>
                <div class="col-md-5">
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
                <div class="col-md-4">
                    <div class="form-group">
                        <select type="text" class="form-control" name="txtFormaPag" required placeholder="Selecione a forma de Pagamento" />

                        <%
                            for (Formapag item : flistar) {
                        %>
                        <option value = "<%=item.getIdformapag()%>">
                            <%=item.getFormanome()%>
                        </option>
                        <%
                            }
                        %>
                        </select>
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
                        <input type="text" class="form-control" name="txtQuantDoce" required placeholder="Quantidade de doces">
                    </div>
                </div>       
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="date" class="form-control" name="txtDataPedido" required placeholder="Data do Pedido">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="date" class="form-control" name="txtDataEntrega" required placeholder="Data da Entrega">
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>

        <div class="row">          
            <div class="col-md-2"></div>             
            <div id="check" class="col-md-8">
                <div class="form-check form-check-inline">  
                    <%for (Doce item : dlistar) {%>
                    <label class="checkbox-inline" style="font-size: 18px;">
                        <input type="checkbox"  name="txtDoceNome" value="<%=item.getIddoce()%>"><%=item.getNomedoce()%>
                    </label>
                    <%}%>
                </div>
            </div>
            <div class="col-md-2"></div>

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
<form>

</form>

</body>
</html>
