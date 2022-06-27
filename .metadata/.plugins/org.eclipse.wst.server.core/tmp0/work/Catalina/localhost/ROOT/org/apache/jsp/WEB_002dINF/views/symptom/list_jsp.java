/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2022-05-18 02:29:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.symptom;

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

      out.write("<link href=\"/resources/board.css\" rel=\"stylesheet\" >\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write(".subject {\r\n");
      out.write("\twidth: 300px;\r\n");
      out.write("\tcolor: gray;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<div style=\"text-align:center;position: relative; margin-bottom:70px;\">\r\n");
      out.write("\t<img src=\"/resources/dog_img/dictionary_banner.png\" style=\"height:500px; width:100%;\">\r\n");
      out.write("\t<div class=\"body_banner\"> \r\n");
      out.write("\t\t<div class=\"heading\">\r\n");
      out.write("\t\t  <div>\r\n");
      out.write("\t\t    <p id=\"banner_top\" class=\"slide-up\">All PET</p>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"notosanskr\">\r\n");
      out.write("\t\t    <p id=\"banner_bottom\" class=\"slide-up\">반려동물의 정보들을 신속하게 알려드립니다</p>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div> \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"header_board\">\r\n");
      out.write("\t<a id=\"freeBoard\" href=\"/pet/list\">반려 지식백과</a>\r\n");
      out.write("\t<a id=\"petStar\" href=\"/symptom/list\">증상 지식백과</a>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"page\" style=\"text-align:center;\">\r\n");
      out.write("\t<p class=\"small_title\">증상 지식백과</p>\r\n");
      out.write("\t<p class=\"big_title\">반려동물들의 안전을 지켜주세요 </p>\r\n");
      out.write("\t<div style=\"border-bottom: 1px dotted gray; padding-bottom: 10px;\">\r\n");
      out.write("\t\t<div>\r\n");
      out.write("\t\t\t<input type=\"text\" id=\"keyword\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.keyword}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" size=40> \r\n");
      out.write("\t\t\t<input type=\"text\" name=\"aaa\" style=\"display: none;\"> \r\n");
      out.write("\t\t\t<input type=\"button\" id=\"search\" value=\"검색\">\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<table id=\"tbl_board\"></table>\r\n");
      out.write("\t<script id=\"temp\" type=\"text/x-handlebars-template\">\r\n");
      out.write("      <tr class=\"title\">\r\n");
      out.write("         <td width=100>No.</td>\r\n");
      out.write("\t\t <td width=200>분류</td>\r\n");
      out.write("         <td width=500>제목</td>\r\n");
      out.write("\t\t <td width=100>작성자</td>\r\n");
      out.write("      </tr>   \r\n");
      out.write("      {{#each list}}\r\n");
      out.write("      <tr class=\"row_board\" sno=\"{{sno}}\">\r\n");
      out.write("         <td class=\"sno\">{{sno}}</td>\r\n");
      out.write("\t\t <td>{{stype}}</td>\r\n");
      out.write("\t\t <td>{{stitle}}</td>\r\n");
      out.write("\t\t <td>포포펫</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      {{/each}}\r\n");
      out.write("   </script>\r\n");
      out.write("\t<div class=\"pagination\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\tvar page = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.page==null?1:param.page}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("\tvar keyword = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.keyword==null?'':param.keyword}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("\tgetList();\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#insert\").on(\"click\", function() {\r\n");
      out.write("\t\tlocation.href = \"insert\";\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\tfunction getList() {\r\n");
      out.write("\t\tkeyword = $(\"#keyword\").val();\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\ttype : \"get\",\r\n");
      out.write("\t\t\turl : \"/symptom/list.json\",\r\n");
      out.write("\t\t\tdata : {\r\n");
      out.write("\t\t\t\tpage : page,\r\n");
      out.write("\t\t\t\tkeyword : keyword\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tdataType : \"json\",\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\tvar temp = Handlebars.compile($(\"#temp\").html());\r\n");
      out.write("\t\t\t\t$(\"#tbl_board\").html(temp(data));\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t//페이지목록출력\r\n");
      out.write("\t\t\t\t$(\".pagination\").html(getPagination(data));\r\n");
      out.write("\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t//row를 클릭한경우\r\n");
      out.write("\t$(\"#tbl_board\").on(\r\n");
      out.write("\t\t\t\"click\",\r\n");
      out.write("\t\t\t\".row_board\",\r\n");
      out.write("\t\t\tfunction() {\r\n");
      out.write("\t\t\t\tvar sno = $(this).find(\".sno\").html();\r\n");
      out.write("\t\t\t\tlocation.href = \"read?sno=\" + sno + \"&page=\" + page\r\n");
      out.write("\t\t\t\t\t\t+ \"&keyword=\" + keyword;\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t//검색버튼을 클릭한 경우\r\n");
      out.write("\t$(\"#search\").on(\"click\", function() {\r\n");
      out.write("\t\tpage = 1;\r\n");
      out.write("\t\tgetList();\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t//검색어상자에서 엔터를 친경우\r\n");
      out.write("\t$(\"#keyword\").on(\"keypress\", function(e) {\r\n");
      out.write("\t\tif (e.keyCode == 13)\r\n");
      out.write("\t\t\t$(\"#search\").click();\r\n");
      out.write("\t});\r\n");
      out.write("\t//페이지 번호를 클릭한 경우\r\n");
      out.write("\t$(\".pagination\").on(\"click\", \"a\", function(e) {\r\n");
      out.write("\t\te.preventDefault();\r\n");
      out.write("\t\tpage = $(this).attr(\"href\");\r\n");
      out.write("\t\tgetList();\r\n");
      out.write("\t});\r\n");
      out.write("</script>");
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
