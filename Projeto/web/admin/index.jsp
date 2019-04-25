<%@include file="../cabecalho.jsp" %>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Pedidos</h3>
            </div>
            <div class="panel-body">
                <div id="shieldui-grid1"></div>
            </div>
        </div>
    </div>
</div>
 <!-- /#wrapper -->
    <script type="text/javascript">
        jQuery(function ($) {
            var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                visits = [123, 323, 443, 32],
                traffic = [
                {
                    Usu�rio: "Jurema", Bairro: "Centro", Doce: "Quindim", Quantidade: 7
                },
                {
                    Usu�rio: "Helena", Bairro: "Centro", Doce: "Olho de Sogra", Quantidade: 15
                },
                {
                    Usu�rio: "Paulo", Bairro: "S�o Martins", Doce: "Bem casado", Quantidade: 67
                },
                {
                    Usu�rio: "Lu�sa", Bairro: "Dam�", Doce: "Dois Amores", Quantidade: 100
                },
                {
                    Usu�rio: "Fernando", Bairro: "S�o Judas", Doce: "Torta de lim�o", Quantidade: 50
                },
                {
                    Usu�rio: "Maike Taisom", Bairro: "Pedra Branca", Doce: "Churros", Quantidade: 20
                },
                ];

            $("#shieldui-chart1").shieldChart({
                theme: "dark",

                primaryHeader: {
                    text: "Visitors"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "area",
                    collectionAlias: "Q Data",
                    data: performance
                }]
            });

            $("#shieldui-chart2").shieldChart({
                theme: "dark",
                primaryHeader: {
                    text: "Traffic Per week"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "pie",
                    collectionAlias: "traffic",
                    data: visits
                }]
            });

            $("#shieldui-grid1").shieldGrid({
                dataSource: {
                    data: traffic
                },
                sorting: {
                    multiple: true
                },
                rowHover: false,
                paging: false,
                columns: [
                { field: "Usu�rio", width: "170px", title: "Usu�rio" },
                { field: "Bairro", width: "170px", title: "Bairro" },
                { field: "Doce", width: "170px", title: "Doce" },                
                { field: "Quantidade", width: "170px", title: "Quantidade" }               
                ]
            });            
        });        
    </script>
</body>
</html>