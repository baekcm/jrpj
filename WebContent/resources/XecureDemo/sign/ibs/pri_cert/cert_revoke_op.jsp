<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> ����Ʈ���� ������� : ������ ��� ��� </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<%
	String account = request.getParameter("account");
	String ac_pwd = request.getParameter("ac_pwd");
	String pcard = request.getParameter("pcard");
	String user_name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");
	String revoke_msg;
	
	PrivateRA sfra = new PrivateRA (new XecureConfig() );

	revoke_msg = sfra.revokeCertificate ( user_id ); 

%>

  
<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
<%
	if ( revoke_msg != null ) {
%> 
  <!-- Title -->
  <p><font size="6"><font color="#6699CC"><b>����� ������ ��� ���</b></font></font></p>
  <p>&nbsp;</p>
    <p>����� : <%=user_name%> �� </p>
    <p>���¹�ȣ : <%=account%></p>
    <p>����� ID : <%=user_id%></p>
    <p><%=request.getParameter("user_name")%>'���� ����� �������� ����Ʈ���� ����������� ���� ��� �Ǿ����ϴ�. </p><br>

<%	}
	else {
%>
<p>		����� ������ ��� �����߽��ϴ�.</p>
���� �ڵ� : <%=sfra.getLastError()%><br>
���� �޽��� : <%=sfra.getLastErrorMsg()%><br>
<%	}
%> 

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">������ ����</font></a> </p>

</center>

</body> 
</html>
