<%@ page contentType="text/xml; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>
<%
	XecureServlet xservlet=null;

	try {
		xservlet = new XecureServlet ( request, response );
	}
	 catch ( XecureServletConfigException e ) {
		/* 설정 오류 */
		out.print( e.toString() );
		out.flush();
		return;
	} catch ( XecureServletException e ) {
		/* 암호 세션 없음 */
		out.print( e.toString() );
		out.flush();
		return;
	}
%>
<%
	String abc = xservlet.request.getParameter("abc" );
	String pop = xservlet.request.getParameter("pop" );
	String text_field1 = xservlet.request.getParameter("text_field1" );
	String text_field2 = xservlet.request.getParameter("text_field2" );

	String resText = "암호화된 클라이언트 Request 복호화 결과입니다.\nDecrypted QueryString abc : " + abc
							+ "\nDecrypted QueryString pop : " + pop
							+ "\nDecrypted QueryString text_field1 : " + text_field1
							+ "\nDecrypted QueryString text_field2 : " + text_field2;
	String enc = xservlet.csEncrypt(resText);
	out.println(enc);
%>