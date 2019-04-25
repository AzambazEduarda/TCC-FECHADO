<%@include file="cabecalho.jsp" %>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Checkout</h3>
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
                        <input class="input" type="text" name="nome" placeholder="Nome Completo">
                        <!-- <div class="col-md-1">
                            <i class="fa fa-lock fa-1x"></i>
                        </div> -->
                    </div>     
                    <div class="form-group">
                        <input class="input" type="text" name="cep" placeholder="CEP">
                    </div>
                    
                    <div class="form-group">
                        <select name="Endereço" id="endereco" class="form-control">
                            <option>Selecione seu bairro por favor</option>
                            <option>Rua de Covas Neves</option>
                            <option>Av. de Policarpo</option>
                            <option>Rua Lipideos no Sangue</option>
                            <option>Rua Fiz de Conta Que Não Vi</option>
                        </select>
                    </div>
                    
                    
                    <div class="form-group">
                        <select name="bairro" id="bairro" class="form-control">
                            <option>Selecione seu bairro por favor</option>
                            <option>Ivo Ferronato</option>
                            <option>Centro</option>
                            <option>Prado Velho</option>
                            <option>Daer</option>
                        </select>
                    </div>       
                    <div class="form-group">
                        <input class="input" type="text" name="celular" placeholder="Celular">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="numerocasa" placeholder="Número da Casa/Apto">
                    </div>
                    <div class="form-group">
                        <input class="input" type="date" name="data" placeholder="Data de entrega">
                    </div>
                    <div class="form-group">
                        <input class="input" type="password" name="senha" placeholder="Senha">
                    </div>
                    <!--
                        ARRUMAR ISSO AQUI
                    <p class="form-group">
                        A senha deve conter mais de 6 caracteres.
                    </p> -->
                    <div class="form-group">
                        <input class="input" type="password" name="confimarsenha" placeholder="Confirmar Senha">
                    </div>

                    <!--
                    <div class="form-group">
                        <select >
                            
                            <option>--Selecione a forma de pagamento--</option>
                            <option>PayPal</option>
                            <option>Cartão de Crédito</option>
                            <option>Boleto</option>
                            <option>Dinheiro</option>

                        </select>
                    </div>     
                    -->
                </div>
                <!-- /Billing Details -->
                <!-- /Shiping Details -->


            </div>

            <!-- Order Details -->
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Sua Compra</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUTO</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div class="order-products">
                        <div class="order-col">
                            <div>7x Quindim </div>
                            <div>R$28.00</div>
                        </div>
                    </div>
                    <div class="order-col">
                        <div>Frete</div>
                        <div><strong>GRÁTIS</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">R$28.00</strong></div>
                    </div>
                </div>
                <div class="payment-method">
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-1">
                        <label for="payment-1">
                            <span></span>
                            Cartão Crédito
                        </label>
                        <div class="caption">
                            <p>Textinho sobre alguma coisa.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-2">
                        <label for="payment-2">
                            <span></span>
                            Boleto
                        </label>
                        <div class="caption">
                            <p>Textinho sobre alguma coisa.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-2">
                        <label for="payment-2">
                            <span></span>
                            PayPal
                        </label>
                        <div class="caption">
                            <p>Textinho sobre alguma coisa.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-3">
                        <label for="payment-3">
                            <span></span>
                            Dinheiro
                        </label>
                        <div class="caption">
                            <p>Textinho sobre alguma coisa.</p>
                        </div>
                    </div>
                </div>
                <div class="input-checkbox">
                    <input type="checkbox" id="terms">
                    <label for="terms">
                        <span></span>
                        Aceito os<a href="#">Termos e condições</a>
                    </label>
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