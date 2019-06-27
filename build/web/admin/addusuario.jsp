<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="util.Criptografia"%>
<%@include file="../cabecalho.jsp" %>
<%    String msg = "";
    String classe = "";

    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();

    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtIdUsuario") != null) {
            obj.setIdusuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
            obj.setNomeusuario(request.getParameter("txtNome"));
            obj.setRuausuario(request.getParameter("txtRua"));
            obj.setCepusuario(request.getParameter("txtCEP"));
            obj.setNumerocasausuario(Integer.parseInt(request.getParameter("txtNCasa")));
            obj.setComplementousuario(request.getParameter("txtComplemento"));
            obj.setBairrousuario(request.getParameter("txtBairro"));
            obj.setCelularusuario(request.getParameter("txtCelular"));
            obj.setSenhausuario(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
            obj.setEmailusuario(request.getParameter("txtEmail"));

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }
            String redirectURL = "indexusuario.jsp";
            response.sendRedirect(redirectURL);
        }
        dao.fecharConexao();
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
    <div class="alert <%=classe%>">
        <%=msg%>
    </div>
    <form action="../UploadWS" method="post" enctype="multipart/form-data">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row text-center">
                        <h2>REGISTRO DE USUÁRIO</h2>
                    </div>
                    </br>
                    </br>
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <input type="text" class="form-control" name="txtIdUsuario" required placeholder="Id" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" class="form-control" name="txtNome" required placeholder="Nome do Usuario" >
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <input type="text" class="form-control" name="txtCelular" required placeholder="Celular">
                        </div>
                    </div>
                    <div class="col-md-1"></div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-1"></div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <input class="form-control" name="txtCEP" type="text" id="cep" value=""  maxlength="9"
                                           onblur="pesquisacep(this.value);" placeholder="Informe seu CEP"/>
                                </div> 
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <input class="form-control" name="txtRua" type="text" id="rua" placeholder="Informe sua rua" />
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-1"></div>
                            

                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="txtNCasa"  required placeholder="Número da casa">
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <input class="form-control" name="txtBairro" type="text" id="bairro" placeholder="Informe seu bairro" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <input class="form-control" name="txtComplemento" type="text" id="complemento" placeholder="Complemento" />
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="txtEmail" required placeholder="Digite o email do Usuario" >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" name="txtSenha" required placeholder="Digite a senha do Usuario">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-5"></div>
                                    <div>
                                        <button type="submit" class="btn btn-info">
                                            Registrar
                                        </button>


                                        <button type="submit" class="btn btn-info">
                                            Cancelar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
                </form>

                </body>
                </html>
