<%@include file="cabecalho.jsp" %>
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

<!-- COMEÇA AQUI O QUE EU NÃO SEI FAZER / ME AJUDA DEUS, AMÉM! -->
<div class="colorlib-shop">
    <div class="container">
        
       <!-- <div class="row row-pb-md">
            <div class="col-md-10 col-md-offset-1">
                <div class="process-wrap">
                    <div class="process text-center active">
                        <p><span>01</span></p>
                        <h3>Carrinho</h3>
                    </div>
                    <div class="process text-center">
                        <p><span>02</span></p>
                        <h3>Checkout</h3>
                    </div>
                    <div class="process text-center">
                        <p><span>03</span></p>
                        <h3>Final</h3>
                    </div>
                </div>
            </div>
        </div> -->
       
       
        <!-- Arrumar o tamanho do negocio letras style NÃO ESQUECER DE ARRUMAR-->
        <div class="row row-pb-md">
            <div class="col-md-10 col-md-offset-1">
                <div class="product-name">
                    <div id="breadcrumb" class="section">
                        <p style="">Nome</p>
                        <h4>Preço</h4>
                        <h4>Quantidade</h4>
                        <h4>Total</h4>
                        <h4>Remover</h4>
                    </div>
                </div>
                <div class="product-cart">
                    <div class="one-forth">
                        <div class="product-img" style="background-image: url(images/item-6.jpg);">
                        </div>
                        <div class="display-tc">
                            <h3>Product Name</h3>
                        </div>
                    </div>
                    <div class="one-eight ">
                        <div class="display-tc">
                            <span class="price">$68.00</span>
                        </div>
                    </div>
                    <div class="one-eight ">
                        <div class="display-tc">
                            <input type="text" id="quantity" name="quantity" class="form-control-feedback input-number text-center" value="7" min="1" max="100">
                        </div>
                    </div>
                    <div class="one-eight">
                        <div class="display-tc">
                            <span class="price">$120.00</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <a href="#" class="closed"></a>
                        </div>
                    </div>
                </div>
                <div class="product-cart">
                    <div class="one-forth">
                        <div class="product-img" style="background-image: url(images/item-7.jpg);">
                        </div>
                        <div class="display-tc">
                            <h3>Product Name</h3>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price">$68.00</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <form action="#">
                                <input type="text" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                            </form>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price">$120.00</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <a href="#" class="closed"></a>
                        </div>
                    </div>
                </div>
                <div class="product-cart">
                    <div class="one-forth">
                        <div class="product-img" style="background-image: url(images/item-8.jpg);">
                        </div>
                        <div class="display-tc">
                            <h3>Product Name</h3>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price">$68.00</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price">$120.00</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <a href="#" class="closed"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="total-wrap">
                    <div class="row">
                        <div class="col-md-8">
                            <form action="#">
                                <div class="row form-group">
                                    <div class="col-md-9">
                                        <input type="text" name="quantity" class="form-control input-number" placeholder="Your Coupon Number...">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="submit" value="Apply Coupon" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3 col-md-push-1 text-center">
                            <div class="total">
                                <div class="sub">
                                    <p><span>Subtotal:</span> <span>$200.00</span></p>
                                    <p><span>Delivery:</span> <span>$0.00</span></p>
                                    <p><span>Discount:</span> <span>$45.00</span></p>
                                </div>
                                <div class="grand-total">
                                    <p><span><strong>Total:</strong></span> <span>$450.00</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp" %>