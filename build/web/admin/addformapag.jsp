
<%@page import="dao.FormapagDAO"%>
<%@page import="modelo.Formapag"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";
    Formapag obj = new Formapag();
    FormapagDAO dao = new FormapagDAO();
    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtIdForma") != null) {

            obj.setIdformapag(Integer.parseInt(request.getParameter("txtIdForma")));
            obj.setFormanome(request.getParameter("txtForma"));

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }
            String redirectURL = "indexformapag.jsp";
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
            <h2>FORMA PAGAMENTO</h2>
        </div>
        </br>
        </br>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtIdForma" required placeholder="Id Forma Pagamento">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtForma" required placeholder="Informe Nome">
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
