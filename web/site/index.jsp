<%@page import="modelo.Email"%>
<%@page import="dao.EmailDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Doce"%>
<%@page import="dao.DoceDAO"%>
<%@include file="cabecalho.jsp" %>
<%    
    DoceDAO ddao = new DoceDAO();
    List<Doce> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = ddao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            Doce obj = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                ddao.excluir(obj);
            }
        }
        lista = ddao.listar();
    }
%>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Doces</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <!-- product -->
                                <%for (Doce item : lista) {
                                %>
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../arquivos/<%=item.getImagemi()%>" alt="">
                                        <div class="product-label">
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="#"><%=item.getNomedoce()%></a></h3>
                                        <h4 class="product-price">R$ <%=item.getPrecodoce()%></h4>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product-btns">

                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Favoritar</span></button>
                                            <!--<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">Comparar</span></button> -->
                                            <form action="../site/detalhe.jsp?id=<%=item.getIddoce()%>" method="post">
                                                <button type="submit" class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Detalhar</span></button>
                                            </form>
                                        </div>
                                    </div>
                                    <form action="../site/carrinho.jsp?id=<%=item.getIddoce()%>" method="post">
                                        <div class="add-to-cart">
                                            <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Adicionar ao carrinho</button>
                                        </div>
                                    </form>
                                </div>
                                <%
                                    }
                                %>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<%@include file="rodape.jsp" %>