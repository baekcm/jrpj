<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404">
<COMMENT>
        <EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'>
        <NOEMBED>
</COMMENT>
           No XecureWeb 4.0 PlugIn
        </NOEMBED>
        </EMBED>
</OBJECT>

<form name='xecure'><input type=hidden name='p'></form>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<html>
<head>
<title>���� ó�� ���</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='../../../image/back.gif'>
<center>

<img src='../../../image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>���� ó�� ���</b></font></font></p>

<%
	String user_id = request.getParameter("user_id");
	String status;
	int	ra_result;

	XecureConfig xecConfig = new XecureConfig();
	XecureRA ra_client = new XecureRA( xecConfig );

	ra_result = ra_client.viewRegisterUserResult ( user_id );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>���� ó�� ��ȸ ����</font></p>
		error code : <%=ra_client.getLastError()%> <br>
		error msg : <%=ra_client.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>���� ó�� ��ȸ ����</font></p>

		<table>
		<tr><td>����޽���</td><td><%=ra_client.getResponseFromResultView("MESSAGE")%></td></tr>
		<tr><td>����Ͻ�</td><td><%=ra_client.getResponseFromResultView("REGDATE")%></td></tr>
		<tr><td>�����Ϸù�ȣ</td><td><%=ra_client.getResponseFromResultView("REGSERIAL")%></td></tr>
		<tr><td>����ó����� Ÿ���ڵ�</td><td><%=ra_client.getResponseFromResultView("REGTYPE")%> </td></tr>
		<tr><td colspan=2> <br><br> </td></tr>
<%
		if ( ra_client.getResponseFromResultView("REGTYPE").equals("1") ) {
%>
			<tr><td colspan=2> <b>����� ����� �������� ���� �߱޹��� ���� ���</b> <br><br></td></tr>
			<tr><td>���θ�</td><td><%=ra_client.getResponseFromResultView("COMPANY")%></td></tr>
			<tr><td>���θ�,���δ�ü ���θ�</td><td><%=ra_client.getResponseFromResultView("USERNAME")%></td></tr>
			<tr><td>����(����)ID</td><td><%=ra_client.getResponseFromResultView("USERID")%></td></tr>
			<tr><td>�ֹε�Ϲ�ȣ</td><td><%=ra_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>������ȣ</td><td><%=ra_client.getResponseFromResultView("REFCODE")%></td></tr>
			<tr><td>�ΰ��ڵ�</td><td><%=ra_client.getResponseFromResultView("AUTHCODE")%></td></tr>
<%
		}
		else {
%>		
			<tr><td colspan=2> <b> ����� ����� �������� �߱޹��� ��� </b> <br><br></td></tr>
			<tr><td>�̺�Ʈ�߻���</td><td><%=ra_client.getResponseFromResultView("EVENTDATE")%></td></tr>
			<tr><td>�������Ϸù�ȣ</td><td><%=ra_client.getResponseFromResultView("SERIAL")%></td></tr>
			<tr><td>�̺�ƮŸ���ڵ�</td><td><%=ra_client.getResponseFromResultView("EVENTTYPE")%></td></tr>
			<tr><td>��ȿ�Ⱓ����</td><td><%=ra_client.getResponseFromResultView("VALIDFROM")%></td></tr>
			<tr><td>��ȿ�Ⱓ����</td><td><%=ra_client.getResponseFromResultView("VALIDTO")%></td></tr>
			<tr><td>�ֹε�Ϲ�ȣ</td><td><%=ra_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>������ �뵵</td><td><%=ra_client.getResponseFromResultView("CERTTYPE")%></td></tr>
			<tr><td>������ ���</td><td><%=ra_client.getResponseFromResultView("CERTCLASS")%></td></tr>
<%
		}
%>
		</table>
<%
	}
%> 
</center>
</body>

</html>
