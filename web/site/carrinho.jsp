<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Encomenda"%>
<%@page import="modelo.Encomendadoce"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@include file="cabecalho.jsp" %>
<%    
    ///Se o produto não for para o carrinho, voltará para a página inicial
    if (request.getParameter("id") == null) {
        response.sendRedirect("index.jsp");
        return; //interrompe a execução
    }
    //Se o produto vier
    Integer id = Integer.parseInt(request.getParameter("id"));
    DoceDAO dao = new DoceDAO();
    Doce l = dao.buscarPorChavePrimaria(id);
    //Agora vou adicionar uma lista de doces novo ou adicionar a uma lista já existente
    Encomendadoce ed = new Encomendadoce();
    ed.setIddoce(l);
    ed.setValorunitario(l.getPrecodoce());
    ed.setQuantidade(1);
    List<Encomendadoce> carrinho;
    if (session.getAttribute("carrinho") != null)//Se existir uma sessão carrinho vou adicionar o Caompradoce dentro dele
    {
        carrinho = (List<Encomendadoce>) session.getAttribute("carrinho");
        carrinho.add(ed);
    } else { //Se  não existir uma sessão, ou seja, for o primeiro produto que eu adiciono ao carrinho
        carrinho = new ArrayList<Encomendadoce>();
        carrinho.add(ed);
    }
    session.setAttribute("carrinho", carrinho);

    //Total
    Encomenda encomenda = new Encomenda();
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
                <h3 class="breadcrumb-header">Carrinho</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->
</br>
</br>
<!-- Order Details -->
<div class="col-md-2">
</div>
<div class="col-md-8 order-details">
    <div class="section-title text-center">
        <h3 class="title">Sua Encomenda</h3>
    </div>
    <div class="order-summary">
        <div class="order-col">
            <div style="width:55%"><strong>PRODUTO</strong></div>
            <div style="width:12%"><strong>QUANT</strong></div>
            <div style="width:15%"><strong>PREÇO</strong></div>
            <div style="width:15%"><strong>ALTERAR</strong></div>
        </div>
        <% int cont = 0;
            for (Encomendadoce obj : carrinho) {

        %>
        <div class="order-col">
            <div style="width:55%"><%=obj.getIddoce()%></div>
            <div style="width:15%"><%=obj.getQuantidade()%></div>
            <div style="width:15%"><%=obj.getValorunitario()%></div>
            <div style="width:15%" class="qty-label">
                <div class="input-number">
                    <input type="number" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                    <span class="qty-up">+</span>
                    <span class="qty-down">-</span>
                </div>
            </div> 
        </div>       
        <%if (cont == (carrinho.size()) - 1) {%>        
        <div class="order-col">
            <div>Frete</div>
            <div><strong>GRÁTIS</strong></div>
        </div>
        <div class="order-col">
            <div><strong>TOTAL</strong></div>
            <div><a href="#"> <strong class="order-total">R$ <%=encomenda.getValor()%></strong></a></div>
        </div>
    </div>
    <%
            }
            cont++;
        }
    %>
    <div class="col-md-6">
        <a href="index.jsp" class="primary-btn order-submit">Continuar Comprando</a></div>
        <div class="col-md-6">
            <a href="login.jsp" class="primary-btn order-submit">Finalizar Encomenda</a></div> </br>
            <div class="col-md-12">
                <a href="index.jsp" class="primary-btn order-submit">Cancelar</a></div>
</div>
<%@include file="rodape.jsp" %>