<%@page import="dao.FormapagDAO"%>
<%@page import="modelo.Formapag"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Encomenda"%>
<%@page import="modelo.Encomendadoce"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@include file="cabecalho.jsp" %>
<%
    //Se isso não existir eu vou redirecionar o usuario para a tela de login
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    //Se não existir carrinho vou redirecionar para index
    if (session.getAttribute("carrinho") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    //Pego as informações do carrinho
    List<Encomendadoce> carrinho;
    carrinho = (List<Encomendadoce>) session.getAttribute("carrinho");
    
    DoceDAO ddao = new DoceDAO();
    Doce d = new Doce();
    
    FormapagDAO fdao = new FormapagDAO();
    Formapag f = new Formapag();
    

    //Pego as informações do usuario 
    Usuario usu = (Usuario) session.getAttribute("usuario");

    //Total
    Encomenda encomenda = new Encomenda();
    encomenda.setIdusuario(usu);
    
    
    //AQUI DEVO POR  O DOCE 
    Float valor = 0.0f;
    for (Encomendadoce car : carrinho) {
        ///Nesse caso poderia tirar a parte:"*car.getQuantidaade()", pois setamos no carrinho que a quantidade sempre será 1 
        valor = valor + car.getValorunitario() * car.getQuantidade();
    }
    encomenda.setValor(valor);
%>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">DADOS DA COMPRA</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<div class="col-md-2"></div>
<div class="row">
    <div class="col-md-8 order-details">
        <div class="section-title text-center">
            <div class="billing-details">

                <!-- DADOS USUARIO-->
                <div class="col-md-6">
                    <h3 class="title">DADOS DO USUÁRIO</h3>
                    </br>
                    </br>
                    </br>
                    <form method="post" action="#">
                        <div class="form-group">
                            <label >Seu nome:</label>
                            <%=usu.getNomeusuario()%>
                        </div>  
                        <div class="form-group">
                            <label >Seu Celular:</label>
                            <%=usu.getCelularusuario()%>
                        </div>
                        <div class="form-group">
                            <label >Seu Email:</label>
                            <%=usu.getEmailusuario()%>
                        </div>
                        <div class="form-group">
                            <label >Seu CEP/Endereço:</label>
                            <%=usu.getCepusuario()%> / <%=usu.getRuausuario()%>
                        </div>
                        <!-- BOTAO-->
                    </form>
                </div>   

                <%for (Encomendadoce obj : carrinho) {


                %>
                <!-- DADOS COMPRA-->
                <div class="col-md-6">
                    <h3 class="title">DADOS DO PEDIDO</h3>
                    </br>
                    </br>
                    </br>
                    <form method="post" action="#">
                        <div class="form-group">
                            <label >Doce:</label>
                            <%=obj.getIddoce().getNomedoce()%>
                        </div> 
                        <div class="form-group">
                            <label ></label>
                            <img src="../arquivos/<%=obj.getIddoce().getImagemii()%>" height="75px"  width="100px">
                        </div>
                        <div class="form-group">
                            <label >Total:</label>
                            <%=encomenda.getValor()%>
                        </div>
                        <!-- BOTAO-->
                    </form>
                </div>
                <%
                    }
                %>
                <!-- BOTAO-->
            </div>
        </div>
    </div>
    <div class="col-md-5"></div>
    <form action="final.jsp" method="#">         
        <div class="col-md-4">
            <button value="submit" type="submit" class="primary-btn order-submit">Finalizar Compra</button>  
        </div>
    </form>
</div>
<%@include file="rodape.jsp" %>