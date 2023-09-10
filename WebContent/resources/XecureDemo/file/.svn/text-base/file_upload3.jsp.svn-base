<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.file.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>


<%
int n;


try{
	XecureFileInputStream file;
	XecureServlet xservlet = new XecureServlet(request, response);

	file = new XecureFileInputStream(xservlet.getXecureSession(), xservlet.request);
	file.saveFileAsEnveloped("/user3/ucme/xecureweb_ver6/demo/file/signCert.der", // cert
	                         "/user3/ucme/xecureweb_ver6/demo/file/");             // store dir
%>
OK
<%

}
catch(XecureServletConfigException e) {
%>
SFE20
<%
}
catch(XecureServletException e) {
%>
SFE21	
<%
}
catch(IOException e) {
%>
SFE22	
<%
}
catch(Exception e) {
%>
SFE23	
<%
}
%>

