<!DOCTYPE html>
<%@page import="util.Criptografia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = "";
    if (request.getParameter("acao") != null){
        session.setAttribute("administrador", "");
    }
    ////login direto
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtLogin").equals("azambazeduarda")
                && (request.getParameter("txtSenha").equals("patys651"))) {
            session.setAttribute("administrador", request.getParameter("txtLogin"));
            ////vai pra pag inicial

            response.sendRedirect("admin/indexencomendar.jsp");
            return;
        } else {
            msg = "Login/Senha errados cabeça ôca";
        }
    }
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="js/jquery.min.js"/>
        <link rel="stylesheet" type="text/css" href="css/style2.css"/>
        <title>Paty's Candy Admin</title>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="css/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->
    </head>
    <style>
        h2{
            color: #ef233c;
        }   
    </style>
    <body>
        <%=msg%>
        <div class="login-reg-panel">
            <div class="white-panel">
                <div class="form-control">
                    </br>
                    </br>
                    </br>
                    </br>
                    </br>
                    <h2>LOGIN</h2>
                    </br>
                    <form action="#" method="post">
                        <input type="text" name="txtLogin" placeholder="Email">
                        <input type="password" name="txtSenha" placeholder="Password">
                        </br>
                        </br>
                        <div class="add-to-cart" >
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>LOGIN</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>