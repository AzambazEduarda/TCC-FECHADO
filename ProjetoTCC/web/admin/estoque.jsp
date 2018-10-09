<%@include file="cabecalho.jsp" %>
<div class="row">
    <div class="col-md-8">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Disponível</h3>
            </div>
            <div class="panel-body">
                <div id="shieldui-chart1"></div>
            </div>
        </div>
    </div>

</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Mais frequentes</h3>
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
                    Bairro: "Centro", Doce: "Quindim", Percentual: 53
                },
                {
                    Bairro: "Centro", Doce: "Olho de Sogra", Percentual: 34
                },
                {
                    Bairro: "São Martins", Doce: "Bem casado", Percentual: 67
                },
                {
                    Bairro: "Damé", Doce: "Dois Amores", Percentual: 23
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
                { field: "Bairro", width: "170px", title: "Bairro" },
                { field: "Doce", title: "Doce" },                
                { field: "Percentual", title: "Percentual", format: "{0} %" }               
                ]
            });            
        });        
    </script>
</body>
</html>