<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<%
	String cert_pem = request.getParameter("cert_pem");
	Certificate cert = new Certificate(new XecureConfig(), cert_pem);
	int ret = cert.VerifyCertificate();
	
	if(ret==0){
%>
성공<br>
<%
		out.println("발급자 : "+cert.getIssuer()+"<br>");
		out.println("시리얼 : "+cert.getSerial()+"<br>");
		out.println("주체DN : "+cert.getSubject()+"<br>");
		String cn = cert.getSubject("cn");
		String kName = (new YessignCN(cn)).getKName();
		out.println("한글이름 : "+kName+"<br>");

	}else{
%>
실패<br>
<%
		out.println(cert.getLastError()+"<br>");
		out.println(cert.getLastErrorMsg()+"<br>");
	}
%>
