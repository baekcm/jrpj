<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.file.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<%

try{

//////////////////////////////////////////////////////////////////////////
//tomcat

/*	XecureFilePrintWriter file;
	XecureServlet xservlet = new XecureServlet(request, response);
	file = new XecureFilePrintWriter(xservlet.getXecureSession(),
	                                 xservlet.request,
	                                 xservlet.response,
	                                 response.getWriter());
*/
// ==============================
//other case

	XecureFileOutputStream file;
	file = new XecureFileOutputStream(xservlet.getXecureSession(),
	                                  xservlet.request,
	                                  xservlet.response,
	                                  response.getOutputStream());

//////////////////////////////////////////////////////////////////////////

	file.fileDownload();
///	file.fileDownload(xservlet.request.getParameter("/user2/jsbaek/xecureweb_ver4/demo/jsp/file_download.jsp"));
}
catch(FileNotFoundException e) {
	System.out.println("FileNotFoundException");
}
catch(IOException e) {
	System.out.println("IOException");
}
catch(XecureServletConfigException e) {
	System.out.println("XecureServletConfigException");
}
catch(XecureServletException e) {
	System.out.println("XecureServletException");
}
%>