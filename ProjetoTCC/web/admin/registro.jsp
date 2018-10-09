<%@include file="cabecalho.jsp" %>
<div>
    <div class="row text-center">
        <h2>Novo Registro de Usuário</h2>
    </div>
    <div>
        <label for="name" class="col-md-2">
            Nome Completo:
        </label>
        <div class="col-md-9">
            <input type="text" class="form-control" id="name" placeholder="Digite seu nome">
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>        
    <div>
        <label for="telefone" class="col-md-2">
            Telefone:
        </label>
        <div class="col-md-9">
            <input type="telefone" class="form-control" id="telefone" placeholder="Digite seu telefone">
            <p class="help-block">
                Exemplo :(53)999707070
            </p>
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>
    <div>
        <label for="endereco" class="col-md-2">
            Endereco:
        </label>
        <div class="col-md-9">
            <input type="endereco" class="form-control" id="endereco" placeholder="Digite seu endereco">

        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>
    <div>
        <label for="bairro" class="col-md-2">
            Bairro:
        </label>
        <div class="col-md-9">
            <select name="bairro" id="bairro" class="form-control">
                <option>--Selecione por favor--</option>
                <option>Ivo Ferronato</option>
                <option>Centro</option>
                <option>Prado Velho</option>
                <option>Daer</option>
            </select>
        </div>            
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>
    <div>
        <label for="emailaddress" class="col-md-2">
            Email:
        </label>
        <div class="col-md-9">
            <input type="email" class="form-control" id="emailaddress" placeholder="Digite seu email">
            <p class="help-block">
                Exemplo: docinhospel@hotmail.com
            </p>
        </div>

    </div>
    <div>
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
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
</body>
</html>