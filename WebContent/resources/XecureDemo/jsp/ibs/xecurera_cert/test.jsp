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
<p><font size='6'><font color='#6699CC'><b>Test Any</b></font></font></p>

<%
	
	XecureConfig	xecConfig = new XecureConfig("/user2/jsbaek/xecureweb_ver4/conf/xecure_servlet.conf");
%>
		
		getLogFile : <%=xecConfig.getLogFile()%> <br>
		getXecureCaHost : <%=xecConfig.getXecureCaHost()%> <br>
 
</center>
</body>
</html>
