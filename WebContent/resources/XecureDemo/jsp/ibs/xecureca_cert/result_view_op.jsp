<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.exp.*" %>
<%@ page import="xecure.expcmp.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>XESign Demo V2.1 ���� ó�� ���</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='/XecureExpDemoV2/image/back.gif'>
<center>

<img src='/XecureExpDemoV2/image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>���� ó�� ��� (not yet) </b></font></font></p>

<%
	String user_id = request.getParameter("user_id");
	String status;
	int	ra_result;

	XecureExpConfig xecConfig = new XecureExpConfig();
	XecureCAClient ca_client = new XecureCAClient ( xecConfig );

	ra_result = ca_client.viewRegisterUserResult ( user_id );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>���� ó�� ��ȸ ����</font></p>
		error code : <%=ca_client.getLastError()%> <br>
		error msg : <%=ca_client.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>���� ó�� ��ȸ ����</font></p>

		<table>
		<tr><td>����޽���</td><td><%=ca_client.getResponseFromResultView("MESSAGE")%></td></tr>
		<tr><td>����Ͻ�</td><td><%=ca_client.getResponseFromResultView("REGDATE")%></td></tr>
		<tr><td>�����Ϸù�ȣ</td><td><%=ca_client.getResponseFromResultView("REGSERIAL")%></td></tr>
		<tr><td>����ó����� Ÿ���ڵ�</td><td><%=ca_client.getResponseFromResultView("REGTYPE")%> </td></tr>
		<tr><td colspan=2> <br><br> </td></tr>
<%
		if ( ca_client.getResponseFromResultView("REGTYPE").equals("1") ) {
%>
			<tr><td colspan=2> <b>����� ����� �������� ���� �߱޹��� ���� ���</b> <br><br></td></tr>
			<tr><td>���θ�</td><td><%=ca_client.getResponseFromResultView("COMPANY")%></td></tr>
			<tr><td>���θ�,���δ�ü ���θ�</td><td><%=ca_client.getResponseFromResultView("USERNAME")%></td></tr>
			<tr><td>����(����)ID</td><td><%=ca_client.getResponseFromResultView("USERID")%></td></tr>
			<tr><td>�ֹε�Ϲ�ȣ</td><td><%=ca_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>������ȣ</td><td><%=ca_client.getResponseFromResultView("REFCODE")%></td></tr>
			<tr><td>�ΰ��ڵ�</td><td><%=ca_client.getResponseFromResultView("AUTHCODE")%></td></tr>
<%
		}
		else {
%>		
			<tr><td colspan=2> <b> ����� ����� �������� �߱޹��� ��� </b> <br><br></td></tr>
			<tr><td>�̺�Ʈ�߻���</td><td><%=ca_client.getResponseFromResultView("EVENTDATE")%></td></tr>
			<tr><td>�������Ϸù�ȣ</td><td><%=ca_client.getResponseFromResultView("SERIAL")%></td></tr>
			<tr><td>�̺�ƮŸ���ڵ�</td><td><%=ca_client.getResponseFromResultView("EVENTTYPE")%></td></tr>
			<tr><td>��ȿ�Ⱓ����</td><td><%=ca_client.getResponseFromResultView("VALIDFROM")%></td></tr>
			<tr><td>��ȿ�Ⱓ����</td><td><%=ca_client.getResponseFromResultView("VALIDTO")%></td></tr>
			<tr><td>�ֹε�Ϲ�ȣ</td><td><%=ca_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>������ �뵵</td><td><%=ca_client.getResponseFromResultView("CERTTYPE")%></td></tr>
			<tr><td>������ ���</td><td><%=ca_client.getResponseFromResultView("CERTCLASS")%></td></tr>
<%
		}
%>
		</table>
<%
	}
%> 
</center>
</body>
<!---END_ENC--->
</html>
