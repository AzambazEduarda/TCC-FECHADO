<%@page import="dao.EmailDAO"%>
<%@page import="modelo.Email"%>
<%    
    String msg = "";
    String classe = "";
    Email obj = new Email();
    EmailDAO edao = new EmailDAO();
    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtEmail") != null) {
            obj.setEmail(request.getParameter("txtEmail"));

            Boolean resultado = edao.incluir(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
            } else {
                msg = "N�o foi poss�vel cadastrar";
                classe = "alert-danger";
            }
            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);
        }
        edao.fecharConexao();
    }
%>
<div class="alert <%=classe%>">
    <%=msg%>
</div>
<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Inscreva-se para receber <strong>NOVIDADES</strong></p>
                    <form action="#" method="post">
                        <input class="input" type="email" name="txtEmail" placeholder="Digite Seu Email">
                        <button type="submit" class="newsletter-btn"><i class="fa fa-envelope"></i> Inscreva-se</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-snapchat"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-youtube"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Sobre a Loja</h3>
                        <p>Entre em contato conosco, estamos aqui para melhor atend�-lo.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>651, Luiz Ad�o M�dici</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+053-9-99-62-47-50</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>patyscandy@gmail.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Servi�os</h3>
                        <ul class="footer-links">
                            <li><a href="#">Rastrear Pedido</a></li>
                            <li><a href="#">Atendimento ao Cliente</a></li>
                            <li><a href="#">Informa��es de Entrega</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Informa��es</h3>
                        <ul class="footer-links">
                            <li><a href="#">Sobre N�s</a></li>
                            <li><a href="#">Contato</a></li>
                            <li><a href="#">Pol�tica de Privacidade</a></li>
                            <li><a href="#">Suporte</a></li>
                            <li><a href="#">Termos e Condi��es</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Atendimento ao Consumidor</h3>
                        <ul class="footer-links">
                            <li><a href="carrinho.jsp">Carrinho</a></li>
                            <li><a href="#">Favoritos</a></li>
                            <li><a href="#">Site Maps</a></li>
                            <li><a href="#">Ajuda</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>

                    </ul>
                    <span class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <script>document.write(new Date().getFullYear());</script>| Desenvolvido por <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">DUD�O</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
