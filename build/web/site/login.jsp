<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="util.Criptografia"%>
<%@include file="cabecalho.jsp" %>
<%    ///se os dois campos forem informados, é login    
    if (request.getParameter("txtEmail") != null
            && request.getParameter("txtSenha") != null) {

        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.logar(request.getParameter("txtEmail"),
                Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));;

        if (u != null) {
            session.setAttribute("usuario", u);
            response.sendRedirect("checkout.jsp");
            return;
        } else {
%>
<script> alert('login e/ou senha inválidos');
</script>
<% }
    }
    /// Se preencheu o cadastro
    if (request.getParameter("txtNome") != null
            && request.getParameter("txtCelular") != null
            && request.getParameter("txtCEP") != null
            && request.getParameter("txtRua") != null
            && request.getParameter("txtBairro") != null
            && request.getParameter("txtComplemento") != null
            && request.getParameter("txtEmail") != null
            && (request.getParameter("txtSenha")) != null
            && request.getParameter("txtNum") != null) {

        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = new Usuario();

        u.setNomeusuario(request.getParameter("txtNome"));
        u.setCelularusuario(request.getParameter("txtCelular"));
        u.setCepusuario(request.getParameter("txtCEP"));
        u.setRuausuario(request.getParameter("txtRua"));
        u.setBairrousuario(request.getParameter("txtBairro"));
        u.setComplementousuario(request.getParameter("txtComplemento"));
        u.setEmailusuario(request.getParameter("txtEmail"));
        u.setSenhausuario(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        u.setNumerocasausuario(Integer.parseInt(request.getParameter("txtNum")));

        dao.incluir(u);
        session.setAttribute("usuario", u);
        response.sendRedirect("checkout.jsp");
        return;
    }
%>
<html>
    <head>
        <title>ViaCEP Webservice</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- Adicionando Javascript -->
        <script type="text/javascript" >

            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
            ;
        </script>
    </head>
    <body>
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">

                        <h3 class="breadcrumb-header">Login</h3>

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
                    <div >
                        <!-- Billing Details -->
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <div class="billing-details">
                                    <div class="section-title">
                                        <h3 class="title">Informe Seus Dados</h3>
                                    </div>
                                    <form method="post" action="#">
                                        <div class="form-group">
                                            <input class="form-control" type="text" name="txtEmail" placeholder="Email" value="" required/>
                                        </div>     
                                        <div class="form-group">
                                            <input class="form-control" type="password" name="txtSenha" placeholder="Senha" value="" required/>
                                        </div>
                                        <button value="submit" type="submit" class="primary-btn order-submit">Entrar</button>                    
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-6 order-details">
                            <div class="section-title text-center">
                                <div class="billing-details">
                                    <div class="section-title">
                                        <h3 class="title">Não Tem Conta?</h3>
                                    </div>
                                    <div id="form" class="billing-details">
                                        <!-- Inicio do formulario -->
                                        <form method="post" action="#">

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input class="form-control" type="text" name="txtNome" id="nome" placeholder="Nome Completo" value="" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <input class="form-control" name="txtCEP" type="text" id="cep" value=""  maxlength="9"
                                                           onblur="pesquisacep(this.value);" placeholder="Informe seu CEP" value="" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input class="form-control" name="txtNum" type="text" id="num"  placeholder="Número da casa" value="" required/>
                                                </div>
                                            </div>


                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input class="form-control" name="txtRua" type="text" id="rua" placeholder="Informe sua rua" value="" required/>
                                                </div>
                                            </div>


                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input class="form-control" name="txtComplemento" type="text" id="complemento" placeholder="Complemento" value="" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <input class="form-control" name="txtBairro" type="text" id="bairro" placeholder="Informe seu bairro" value="" required/>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input class="form-control" type="text" name="txtCelular"  id="celular" placeholder="Celular" value="" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input class="form-control" type="password" name="txtSenha"  id="celular" placeholder="Senha" value="" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input class="form-control" type="text" name="txtEmail"  id="celular"  placeholder="Informe seu Email" value="" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <button id="b" value="submit" type="submit" class="primary-btn order-submit">Entrar</button>  
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%@include file="rodape.jsp" %>