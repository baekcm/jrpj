<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<script language=javascript src="/XecureObject/xecureweb_xp.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>

<html>
<head><title>���������κ��� �Է¹��� ����Դϴ�2</title>
</head>
<body>

<!--Title -->
<p align='center'><big><strong>���������κ��� �Է¹��� ����Դϴ�.</strong></big></p>	
<p>��</p>

<table border='1' width='100%%'>
	<tr>
	<td width='17%%'><strong>�����ȣ :</strong></td>
	<td width='83%%'><strong>
		<%= request.getParameter("ReserveNum")%>
	</strong></td>
	</tr>
	
	<tr>
	<td width='17%%'><strong>�ݾ� :</strong></td>
	<td width='83%%'><strong>
		<%= request.getParameter("fee" ) %>
	</strong></td>
	</tr>
	
	<tr>
	<td width='17%%'><strong>ī���ȣ :</strong></td>
	<td width='83%%'><strong>
		<%= request.getParameter("CreditNo" ) %>
	</strong></td>
	</tr>
	<tr>
	
	<td width='17%%'><strong>��ȿ�Ⱓ :</strong></td>
	<td width='83%%'><strong>
		<%=request.getParameter("Year" ) + "/" + request.getParameter("Month" )%>
	</strong></td>
	</tr>
	<tr>
	<td width='17%%'><strong>������ :</strong></td>
	<td width='83%%'><strong>
		<%=request.getParameter("Pay" )%>
	</strong></td>
	</tr>
</table>

<%
	EnvelopeData	Enveloper = new EnvelopeData ( new XecureConfig());
	String deEveloped = Enveloper.deEnvelopeData(request.getParameter("enveloped_msg"));

	if ( Enveloper.getLastError() != 0 ) {
		out.println("DeEnvelope ��� : " + Enveloper.getLastErrorMsg() + "<br>");
		out.println("���� ��ȣ : " + Enveloper.getLastError() + "<br>");
	}
	else {
		out.println("DeEnvelope ��� : DeEnvelope ����<br>");
	}

	out.println("Envelope�� <pre>\n");

	String em = request.getParameter("enveloped_msg");
	int i;
	for ( i = 0; i < em.length(); i+=80 ) {
		out.print( "\t\t");
		if ( i + 80 < em.length() ) 
			out.println ( em.substring( i, i+80 ) );
		else
			out.println ( em.substring( i, em.length() ));
	}
	out.println("</pre>\n"); 
	out.println("DeEnvelope�� �޽��� ���� : <pre>\n" + deEveloped + "\n</pre><br><br>");
	//�������� pem�� �׽�Ʈ�ϴ� �������� pem���� �����Ͽ� �׽�Ʈ �ϼ���.
	String pem1="";
		pem1 +="-----BEGIN CERTIFICATE-----\n";
		pem1 +="MIIDKjCCApOgAwIBAgIEC+vKZTANBgkqhkiG9w0BAQQFADBhMQswCQYDVQQGEwJL\n";
		pem1 +="UjELMAkGA1UECBMCYWExCzAJBgNVBAcTAmFhMQswCQYDVQQKEwJhYTELMAkGA1UE\n";
		pem1 +="CxMCYWExCzAJBgNVBAMTAmFhMREwDwYJKoZIhvcNAQkBFgJhYTAeFw0wMTA2MjIw\n";
		pem1 +="MDAwMDBaFw0wMjA2MjIxMTI4NTFaMHkxCzAJBgNVBAYTAktSMQ4wDAYDVQQHFAVu\n";
		pem1 +="bm5ubjEOMAwGA1UEChQFbm5ubm4xDjAMBgNVBAsUBW5ubm5uMQ4wDAYDVQQDFAVu\n";
		pem1 +="bm5ubjEUMBIGCSqGSIb3DQEJARYFbm5ubm4xFDASBgkqhkiG9w0BCQIWBW5ubm5u\n";
		pem1 +="MIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgEH2PINr/FgnE88AS7xuJV6kusqT\n";
		pem1 +="eWzb6MPiUuCEwzBJvwP7BK2xVevGwaGYUiZOBxTuIM5ZOmgipOQU0xnuB7SzKDq7\n";
		pem1 +="4vzCC7zkw/FKOkCBfaBEbmuk1q3z7j0TwtDvn+zxF+Kd/1dih/RzObmbazoQci1B\n";
		pem1 +="kDGc47dMKkmFUchjAgMBAAGjgdcwgdQwagYJYIZIAYb4QgENBF0WW1lvdXIgQ2Vy\n";
		pem1 +="dGlmaWNhdGUgaXMgZHVlIHVwdG8gMSB5ZWFyLiBZb3UgaGF2ZSB0byByZWlzc3Vl\n";
		pem1 +="IHlvdXIgY2VydGlmaWNhdGUgYmVmb3JlIGl0IGV4cGlyZXMwIgYJYIZIAYb4QgEC\n";
		pem1 +="BBUWE3d3dy5zb2Z0Zm9ydW0uY28ua3IwEQYJYIZIAYb4QgEBBAQDAgCAMC8GCWCG\n";
		pem1 +="SAGG+EICBQQiFiBkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZTANBgkq\n";
		pem1 +="hkiG9w0BAQQFAAOBgQCyebfQ9QTKLcgGpfgCy/u2GCQZkOd/fTdRhOkc3vhGowzS\n";
		pem1 +="rPI3UXoANLb3L/VqGti/eNsunJSOCLi+x6hHMzejm5z6052QsXIH5FjQMTHmV/sE\n";
		pem1 +="gBhx7tlMkZGMs7KHS29a2Oiwd3aA7FmqBsA9kHrLpo6EtLdf+vgzixnDhLMm7A==\n";
		pem1 +="-----END CERTIFICATE-----\n";
	String sem = "������ü�� ���������� �̷�������ϴ�.";
	String enveloped = Enveloper.envelopeData(pem1, sem);
%>
<%
	out.println("<script>");
	out.println("var devloped = UnsealData('" + enveloped + "');");
	out.println("alert(devloped);");
	out.println("</script>");
%>


<p>
<p align='center'><a href='javascript:history.back();'>���� ��������</a></p>
		
</body></html>

