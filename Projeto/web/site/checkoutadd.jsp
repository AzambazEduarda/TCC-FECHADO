<%@include file="cabecalho.jsp" %>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Entrar</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-7">
                <!-- Billing Details -->
                <div class="billing-details">
                    <div class="section-title">
                        <h3 class="title">Dados do Usuário</h3>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="email" placeholder="E-mail">
                    </div>     
                    <div class="form-group">
                        <input class="input" type="password" name="senha" placeholder="Senha">
                    </div>
                    
                <a href="final.jsp" class="primary-btn order-submit">Finalizar Compra</a>
                <a href="index.jsp" class="primary-btn order-submit">Cancelar</a>
            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<%@include file="rodape.jsp" %>