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
<title>������ ���º���</title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987"><style type="text/css">
<!--
.font1 { font-size: 9pt;color:#666666;}
td {  font-size: 9pt;color:#333333}
A:link    {font-size:9pt;color:#0108FF;text-decoration:none; }
A:active  {font-size:9pt;color:#010824;text-decoration:none; }
A:visited {font-size:9pt;color:#010824;text-decoration:none; }
A:hover   {font-size:9pt;color:#0066cc;text-decoration:none; }
-->
</style>
</head>

<img src='../../../img/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>����� ������ ���� ����</b></font></font></p>

<%
	String service = request.getParameter("service");
	String serial = request.getParameter("serial");
	String status;
	int	ra_result;

	XecureConfig xecConfig = new XecureConfig ();	
	XecureCA ca_client = new XecureCA ( xecConfig );

	if ( service.equals("30") ) status = "����";
	else if ( service.equals("40")) status = "ȿ������";
	else if ( service.equals("41")) status = "ȿ��ȸ��";
	else status = "�˼�����";

	ra_result = ca_client.modifyCertStatus ( "internet", serial, service );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>���� ���� ����</font></p>
		error code : <%=ca_client.getLastError()%> <br>
		error msg : <%=ca_client.getLastErrorMsg()%> <br>
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
