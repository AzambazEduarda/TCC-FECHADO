<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@page import="dao.EncomendadoceDAO"%>
<%@page import="dao.EncomendaDAO"%>
<%@page import="modelo.Encomenda"%>
<%@page import="modelo.Encomendadoce"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@include file="cabecalho.jsp" %>
<%
     //Se isso n�o existir eu vou redirecionar o usuario para a tela de login
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    //Se n�o existir carrinho vou redirecionar para index
    if (session.getAttribute("carrinho") == null) {
    response.sendRedirect("index.jsp");
    return;
    }
    
   //Pego as informa��es do carrinho
    List<Encomendadoce> carrinho;
    carrinho = (List<Encomendadoce>) session.getAttribute("carrinho");
    
    //Pego as informa��es do usuario 
    Usuario usu = (Usuario)session.getAttribute("usuario");
    
    //Total
    Encomenda encomenda = new Encomenda();
    encomenda.setIdusuario(usu);
    
    Float valor = 0.0f;
    for (Encomendadoce car : carrinho) 
    {
        ///Nesse caso poderia tirar a parte:"*car.getQuantidaade()", pois setamos no carrinho que a quantidade sempre ser� 1 
        valor = valor + car.getValorunitario()*car.getQuantidade();
    }
    encomenda.setValor(valor);
    
    EncomendaDAO encomendadao = new EncomendaDAO();
    Boolean certo = encomendadao.incluir(encomenda);
    //Se der certo adiciono os itens
    if(certo)
    {
        EncomendadoceDAO clDAO = new EncomendadoceDAO();
        for (Encomendadoce car : carrinho) 
        {
            DoceDAO doceDAO = new DoceDAO();
            ///Vou buscar novamente o doce que eu tenho pra poder fazer � refencia ao Banco de Dados, pois ele perde a refer�ncia quando coloco na sess�o
            Doce doce = doceDAO.buscarPorChavePrimaria(car.getIddoce().getIddoce()); //Pego o doce que est� no meu carrinho de encomendas
            car.setIddoce(doce);
            car.setIdencomenda(encomenda);
            clDAO.incluir(car); //Pesisto no Banco(Salvo no Banco)
        }
        //elimino meu carrinho, pois n�o quero encomendar a mesma coisa
        session.setAttribute("carrinho", null);
    }
    else
    {
        
    }
%>
<style>
    
    #botaoo{
        text-align: center;
    }
</style>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Final</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->
<!-- finalzinho -->
<div class="row">
    <div class="col-md-12">
        <div class="newsletter">
            <p>A doceria Paty's Candy <strong>Agradece a prefer�ncia!</strong></p>
        </div>
    </div>
</div>

<!--<form action="index.jsp" method="#">         
        <div class="">
            <button value="submit" id="botaoo" type="submit" class="primary-btn order-submit">Voltar ao in�cio</button>  
        </div>
    </form>-->
    <%@include file="rodape.jsp" %>