/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2022-05-18 00:30:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class trade_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<script src=\"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js\"></script>\n");
      out.write("<link href=\"/resources/join.css\" rel=\"stylesheet\" >\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("   .join_title {\n");
      out.write("   font-size:40px;\n");
      out.write("   font-weight:50px;\n");
      out.write("   margin:auto;\n");
      out.write("   text-align:center;\n");
      out.write("   margin : 100px 0px 10px 0px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#join .title {\n");
      out.write("   display:inline-block;\n");
      out.write("   width:975px;\n");
      out.write("      font-size:30px;\n");
      out.write("      color:#4A4A4A;\n");
      out.write("      right:40%;\n");
      out.write("      margin-left : -570px;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<div style=\"text-align:center;position: relative; margin-bottom:70px;\">\n");
      out.write("\t<img src=\"/resources/join_img/join_banner.png\" style=\"height:500px; width:100%;\">\n");
      out.write("\t<div class=\"body_banner\"> \n");
      out.write("\t\t<div class=\"heading\">\n");
      out.write("\t\t  <div>\n");
      out.write("\t\t    <p id=\"banner_top\" class=\"slide-up\">마이페이지</p>\n");
      out.write("\t\t  </div>\n");
      out.write("\t\t  <div class=\"notosanskr\">\n");
      out.write("\t\t    <p id=\"banner_bottom\" class=\"slide-up\">새로운 인연,포포펫에서 함께 만들어 가겠습니다</p>\n");
      out.write("\t\t  </div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("  <div id=\"header_board\">\n");
      out.write("     <a href=\"/user/update?uid=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vo.uid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">개인정보수정</a>\n");
      out.write("     <a href=\"/user/trade?uid=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vo.uid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">구매내역</a>\n");
      out.write("  </div>\n");
      out.write("<div>\n");
      out.write("   <h2> 구매 내역 </h2>\n");
      out.write("   <table id=\"trade\"></table>\n");
      out.write("   <script id=\"temp\" type=\"text/x-handlebars-template\">\n");
      out.write("   {{#each .}}\n");
      out.write("      <tr bno=\"{{bno}}\">\n");
      out.write("         <td><img src=\"/display?fileName={{bimage}}\" width=150 class=\"image\"></td>\n");
      out.write("         <td>{{btitle}}</td>\n");
      out.write("       <td>{{baddress}}</td>\n");
      out.write("       <td>{{bdate}}</td>\n");
      out.write("       <td>{{bsum}} 원</td>\n");
      out.write("      </tr>\n");
      out.write("   {{/each}}\n");
      out.write("   </script>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("   var uid=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.uid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\n");
      out.write("   var manager=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${manager}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\n");
      out.write("   getTrade();\n");
      out.write("   \n");
      out.write("   \n");
      out.write("   function getTrade(){\n");
      out.write("      var manager=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vo.manager}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\n");
      out.write("      if(manager < 1) {\n");
      out.write("         $.ajax({\n");
      out.write("            type : \"get\",\n");
      out.write("            url : \"/user/trade.json\",\n");
      out.write("            data : {uid:uid},\n");
      out.write("            dataType : \"json\",\n");
      out.write("            success : function(data) {\n");
      out.write("               var template = Handlebars.compile($(\"#temp\").html());\n");
      out.write("               $(\"#trade\").html(template(data));\n");
      out.write("            }\n");
      out.write("         });\n");
      out.write("         \n");
      out.write("      }else {\n");
      out.write("         $.ajax({\n");
      out.write("            type : \"get\",\n");
      out.write("            url : \"/user/alltrade.json\",\n");
      out.write("            dataType : \"json\",\n");
      out.write("            success : function(data) {\n");
      out.write("               var template = Handlebars.compile($(\"#temp\").html());\n");
      out.write("               $(\"#trade\").html(template(data));\n");
      out.write("            }\n");
      out.write("         });\n");
      out.write("      }\n");
      out.write("   }\n");
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
