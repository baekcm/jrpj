<!-- Ŭ���̾�Ʈ���� ������ plain text�� ���� �ʿ��� ��ȣȭ �Ѵ�.
     xecure.crypto ��  SignVerifier ��ü-->

<!-- JSP �� ���� ���� class���� ȣ�� -->
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<%
	SignVerifier	verifier = new SignVerifier ( new XecureConfig(), request.getParameter("signed_msg") );
%>

<html>
<head><title>���� ���� ���� ���</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-Cache">
</head>
<body>

<!-- Title -->
<h1>���� ���� ����(����) ���</h1>
<p align='center'><big><strong>��������(Ŭ���̾�Ʈ)�κ��� �Է¹��� ����Դϴ�.</strong></big></p>	
<p>��</p>

<table border='1' width='100%'>
	<tr>
	<td width='17%'><strong>Decrypted Request 'plain' :</strong></td>
	<td width='83%'><strong>
	<pre>
	<%=request.getParameter("plain") %>
	</pre>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>Decrypted Request 'signed_msg' :</strong></td>
	<td width='83%'><strong>
	<pre>
	<%
	String sm = request.getParameter("signed_msg"); 
	int i;
	for ( i = 0; i < sm.length(); i+=80 ) {
		if ( i + 80 < sm.length() ) 
			out.println ( sm.substring( i, i+80 ) );
		else
			out.println ( sm.substring( i, sm.length() ));
	}
	%>
	</pre>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>���� ���� ���</strong></td>
	<td width='83%'><strong>
	<%
	if ( verifier.getLastError() != 0 ) {
		out.println("������ ������ �ֽ��ϴ�.<br>");
		out.println("���� ��ȣ : " + verifier.getLastError() + "<br>");
	}
	else {
		out.println("���� Ȯ�� ����<br>");
	}
	%>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>���� �޽��� ����</strong></td>
	<td width='83%'><strong>
	<pre>
	<%=verifier.getVerifiedMsg_Text()%>
	</pre>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>������ ������</strong></td>
	<td width='83%'><strong>
	<pre>
	<%=verifier.getSignerCertificate().getCertPem()%>
	</pre>
	</strong></td>
	</tr>
</table>

<p>
<p align='center'><a href='javascript:history.back();'>���� ��������</a></p>
		
</body></html>

