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
<title>Untitled Document</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='/../../../image/back.gif'>
<center>

<img src='../../../image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>����� ������ ���� ����</b></font></font></p>

<%
	String service = request.getParameter("service");
	String serial = request.getParameter("serial");
	String status;
	int	ra_result;

	XecureConfig	xecConfig = new XecureConfig();
	XecureRA ra_client = new XecureRA ( xecConfig );

	if ( service.equals("30") ) status = "����";
	else if ( service.equals("40")) status = "ȿ������";
	else if ( service.equals("41")) status = "ȿ��ȸ��";
	else status = "�˼�����";

	ra_result = ra_client.modifyCertStatus ( "internet", serial, service );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>���� ���� ����</font></p>
		error code : <%=ra_client.getLastError()%> <br>
		error msg : <%=ra_client.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>���� ���� ����</font></p>
		������ �Ϸù�ȣ '<%=serial%>' �� �������� ���°� '<%=status%>' �Ǿ����ϴ�.<br> 
<%
	}
%> 
</center>
</body>
</html>
