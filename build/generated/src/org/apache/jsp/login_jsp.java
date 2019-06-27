package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import util.Criptografia;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/bootstrap.min.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"js/jquery.min.js\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style2.css\"/>\n");
      out.write("        <title>Paty's Candy Admin</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"css/bootstrap.min.js\"></script>\n");
      out.write("        <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("        <!------ Include the above in your HEAD tag ---------->\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        h2{\n");
      out.write("            color: #ef233c;\n");
      out.write("        }   \n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.print(msg);
      out.write("\n");
      out.write("        <div class=\"login-reg-panel\">\n");
      out.write("            <div class=\"white-panel\">\n");
      out.write("                <div class=\"form-control\">\n");
      out.write("                    </br>\n");
      out.write("                    </br>\n");
      out.write("                    </br>\n");
      out.write("                    </br>\n");
      out.write("                    </br>\n");
      out.write("                    <h2>LOGIN</h2>\n");
      out.write("                    </br>\n");
      out.write("                    <form action=\"#\" method=\"post\">\n");
      out.write("                        <input type=\"text\" name=\"txtLogin\" placeholder=\"Email\">\n");
      out.write("                        <input type=\"password\" name=\"txtSenha\" placeholder=\"Password\">\n");
      out.write("                        </br>\n");
      out.write("                        </br>\n");
      out.write("                        <div class=\"add-to-cart\" >\n");
      out.write("                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i>LOGIN</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
