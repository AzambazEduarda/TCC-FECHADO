<%@include file="cabecalho.jsp" %>
<div>
    <div class="row text-center">
        <h2>Novo Registro de Doce</h2>
    </div>
    <div>
        <label for="name" class="col-md-2">
            Nome do Doce:
        </label>
        <div class="col-md-9">
            <input type="text" class="form-control" id="name" placeholder="Digite o nome do Doce">
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>        

    <div>
        <label for="preco" class="col-md-2">
            Preço:
        </label>
        <div class="col-md-9">
            <input type="preco" class="form-control" id="preco" placeholder="Digite o peso do Doce">

        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div>
    </div>

    <div>
        <label for="historia" class="col-md-2">
            História:
        </label>
        <div class="col-md-9">
            <input type="text" class="form-control" id="historia" placeholder="Digite a história do Doce">
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
        </div> 
    </div>
    <div>
        <label for="ingredientes" class="col-md-2">
            Ingredientes:
        </label>
        <div class="col-md-9">
            <input type="text" class="form-control" id="ingredientes" placeholder="Digite os ingredientes do Doce">
        </div>
        <div class="col-md-1">
            <i class="fa fa-lock fa-2x"></i>
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
