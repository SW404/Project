/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2022-05-18 15:32:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.admin.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("jar:file:/C:/git/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project01/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1647577167351L));
    _jspx_dependants.put("jar:file:/C:/git/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project01/WEB-INF/lib/jstl-1.2.jar!/META-INF/fmt.tld", Long.valueOf(1153352682000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js\"></script>\r\n");
      out.write("<script src=\"/resources/pagination.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("@font-face {\r\n");
      out.write("    font-family: 'SBAggroL';\r\n");
      out.write("    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');\r\n");
      out.write("    font-weight: normal;\r\n");
      out.write("    font-style: normal;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#menu {\r\n");
      out.write("\tpadding:10px;\r\n");
      out.write("\tmargin: 0px auto;\r\n");
      out.write("\tfont-size: 30px;\r\n");
      out.write("\tfont-family: 'SBAggroL';\r\n");
      out.write("}\r\n");
      out.write("#menu td{\r\n");
      out.write("\tborder: 3px solid black;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("}\r\n");
      out.write(".pagination {\r\n");
      out.write("\twidth:100%;\r\n");
      out.write("   margin: 0px auto;\r\n");
      out.write("   text-align:center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".pagination a {\r\n");
      out.write("   padding: 10px 15px;\r\n");
      out.write("   text-decoration: none;\r\n");
      out.write("   margin:5px;\r\n");
      out.write("   color: gray;\r\n");
      out.write("   border : 1px solid #dedede;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".pagination .active {\r\n");
      out.write("\tbackground: gray;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".pagination a:hover {\r\n");
      out.write("   background-color: #E2E2E2;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<h1>\r\n");
      out.write("\t\t<a href=\"/admin/index\"><img src=\"/resources/AdminLogo.png\" style=\"width:90%; height :200px; margin:0px auto;\"></a>\r\n");
      out.write("\t</h1>\r\n");
      out.write("</head>\r\n");
      out.write("<table id=\"menu\" style=\"width:900px;\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td><a href=\"/admin/shop/insert\">상품 등록</a></td>\t\t\r\n");
      out.write("\t\t\t<td><a href=\"/admin/shop/list\">상품 목록</a></td>\r\n");
      out.write("\t\t\t<td><a href=\"/admin/shop/alltrade\">주문 목록</a></td>\r\n");
      out.write("\t\t\t<td><a href=\"/admin/user/userlist\">유저 목록</a></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<div style=\"margin:0px auto; text-align:center; font-family: 'SBAggroL';\">\r\n");
      out.write("\t<h1>상품 목록</h1>\r\n");
      out.write("\t<div id=\"shop\" style=\"margin:0px auto ;text-align:center; border:2px solid black;\"></div>\r\n");
      out.write("\t<script id=\"temp\" type=\"text/x-handlebars-template\">\r\n");
      out.write("\t\t{{#each shoplist}}\r\n");
      out.write("      \t\t<tr class=\"box\" id=\"{{id}}\">\r\n");
      out.write("\t\t\t\t<td width=200><img src=\"/display?fileName={{image}}\" style=width:200px;></td>\r\n");
      out.write("\t\t\t\t<td width=400><p>{{title}}</p></td>\r\n");
      out.write("\t\t\t\t<td width=100><p>{{display price}}</p></td>\r\n");
      out.write("\t\t\t\t<td width=100><button class=\"delete\">삭제</td>\r\n");
      out.write("\t\t\t\t<td width=100><button onClick=\"location.href='update?id={{id}}'\">수정</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("   \t\t{{/each}}\t\t\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tHandlebars.registerHelper(\"display\", function(price){\r\n");
      out.write("\t\t\treturn price.toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"pagination\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("<script>\t\r\n");
      out.write("\tvar page=1;\r\n");
      out.write("\tgetList();\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getList(){\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\ttype: \"get\",\r\n");
      out.write("\t\t\turl: \"/admin/list.json\",\r\n");
      out.write("\t\t\tdata: {page: page},\r\n");
      out.write("\t\t\tdataType: \"json\",\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t            var template = Handlebars.compile($(\"#temp\").html());\r\n");
      out.write("\t            $(\"#shop\").html(template(data));\r\n");
      out.write("\t            $(\".pagination\").html(getPagination(data));\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\".pagination\").on(\"click\", \"a\", function(e){\r\n");
      out.write("\t\te.preventDefault();\r\n");
      out.write("\t\tpage=$(this).attr(\"href\");\r\n");
      out.write("\t\tgetList();\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#shop\").on(\"click\", \".delete\", function(){\r\n");
      out.write("\t\tvar box = $(this).parent().parent();\r\n");
      out.write("\t\tvar id = box.attr(\"id\");\r\n");
      out.write("\t\talert(id);\r\n");
      out.write("\t\tif(!confirm(\"상품을 삭제하실래요?\")) return;\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\ttype: \"post\",\r\n");
      out.write("\t\t\turl: \"/admin/delete\",\r\n");
      out.write("\t\t\tdata: {id:id},\r\n");
      out.write("\t\t\tsuccess: function(){\r\n");
      out.write("\t\t\t\tgetList();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
