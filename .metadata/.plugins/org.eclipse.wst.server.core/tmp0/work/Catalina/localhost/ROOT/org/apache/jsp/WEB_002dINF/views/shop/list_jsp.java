/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2022-05-18 00:28:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      out.write("<style>\r\n");
      out.write(".row {\r\n");
      out.write("\tdisplay:flex;\r\n");
      out.write("\tflex-direction:column;\r\n");
      out.write("\tfloat:left;\r\n");
      out.write("\tmargin:5px;\r\n");
      out.write("\twidth:320px;\r\n");
      out.write("\ttext-align:center;\r\n");
      out.write("\tborder: 1px solid #dedede;\r\n");
      out.write("\theight: 400px;\r\n");
      out.write("\tjustify-content:center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".row:hover {\r\n");
      out.write("\tcursor:pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".shop_image {\r\n");
      out.write("\twidth:300px;\r\n");
      out.write("\theight:300px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#shop {\r\n");
      out.write("\tmargin : 0px auto;\r\n");
      out.write("\twidth:1350px;\r\n");
      out.write("\tpadding-right:-10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".price {\r\n");
      out.write("\tfont-size:22px;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#banner_top {\r\n");
      out.write("\tmargin-left:130px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<div style=\"text-align:center;position: relative; margin-bottom:70px;\">\r\n");
      out.write("\t<img src=\"/resources/shop_banner.png\" style=\"height:500px; width:100%;\">\r\n");
      out.write("\t<div class=\"body_banner\"> \r\n");
      out.write("\t\t<div class=\"heading\">\r\n");
      out.write("\t\t  <div>\r\n");
      out.write("\t\t    <p id=\"banner_top\" class=\"slide-up\">상품구매</p>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"notosanskr\">\r\n");
      out.write("\t\t    <p id=\"banner_bottom\" class=\"slide-up\">반려동물을 위한 다양한 상품들을 구매하세요</p>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div> \r\n");
      out.write("</div>\r\n");
      out.write("<div style=\"text-align:center;\">\r\n");
      out.write("\t<p class=\"small_title\">포포펫의 상품을 소개합니다</p>\r\n");
      out.write("\t<p class=\"big_title\">Shop</p>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"page\">\r\n");
      out.write("\t<table id=\"shop\"></table>\r\n");
      out.write("\t<script id=\"temp\" type=\"text/x-handlebars-template\">\r\n");
      out.write("   {{#each list}}\r\n");
      out.write("      <tr class=\"row\" id=\"{{id}}\">\r\n");
      out.write("         <td><img src=\"/display?fileName={{image}}\" class=\"shop_image\"></td><br>\r\n");
      out.write("         <td class=\"title\">{{title}}</td><br>\r\n");
      out.write("\t\t <td class=\"price\">{{price}}</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("   {{/each}}\r\n");
      out.write("   </script>\r\n");
      out.write("\t<div class=\"pagination\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tvar page = 1;\r\n");
      out.write("\tgetList();\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getList() {\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\ttype : \"get\",\r\n");
      out.write("\t\t\turl : \"/shop/list.json\",\r\n");
      out.write("\t\t\tdata : {page : page},\r\n");
      out.write("\t\t\tdataType : \"json\",\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\tvar template = Handlebars.compile($(\"#temp\").html());\r\n");
      out.write("\t\t\t\t$(\"#shop\").html(template(data));\r\n");
      out.write("\t\t\t\t$(\".pagination\").html(getPagination(data));\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//row를 클릭한경우\r\n");
      out.write("\t   $(\"#shop\").on(\"click\", \".row\", function(){\r\n");
      out.write("\t     var id=$(this).attr(\"id\");\r\n");
      out.write("\t     location.href=\"read?id=\" + id + \"&page=\" + page;\r\n");
      out.write("\t   });\r\n");
      out.write("\r\n");
      out.write("\t$(\".pagination\").on(\"click\", \"a\", function(e) {\r\n");
      out.write("\t\te.preventDefault();\r\n");
      out.write("\t\tpage = $(this).attr(\"href\");\r\n");
      out.write("\t\tgetList();\r\n");
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
