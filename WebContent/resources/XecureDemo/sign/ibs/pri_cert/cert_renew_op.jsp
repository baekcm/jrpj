<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Softforum  ����� ������ ���� ��� </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<%
	String account = request.getParameter("account");
	String ac_pwd = request.getParameter("ac_pwd");
	String pcard = request.getParameter("pcard");
	String company_name = request.getParameter("cname");
	String company_unit = request.getParameter("cunit");
	String user_name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String caddress = request.getParameter("caddress");
	String cert_req = request.getParameter("cert_req");
	
	PrivateRA sfra = new PrivateRA (new XecureConfig() );
	Certificate user_cert;

	user_cert = sfra.renewCertificate ( cert_req, user_id, user_name, "KR", address, company_name, company_unit, email ); 

%>


<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
<%
	if ( user_cert != null ) {
%> 
  <p><font size="6"><font color="#6699CC"><b>����� ������ ���� ���</b></font></font></p>
  <p>&nbsp;</p>
    <p>����� : <%=user_name%> �� </p>
    <p>���¹�ȣ : <%=account%></p>
    <p>����� ID : <%=user_id%></p>
    <p><%=request.getParameter("user_name")%>'���� ����� �������� ����Ʈ���� ����������� ���� ���� �Ǿ����ϴ�. </p><br>

<script language='javascript'>
<%=user_cert.certInstallScript(user_cert.INSTALL_USER_CERT)%>
</script>

<%	}
	else {
%>
<p>		����� ������ ���� �����߽��ϴ�.</p>
���� �ڵ� : <%=sfra.getLastError()%><br>
���� �޽��� : <%=sfra.getLastErrorMsg()%><br>
<%	}
%> 

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp'><font color="#000000" size="5">������ ����</font></a> </p>

</center>

</body> 
</html>
