<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.exp.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='/XecureExpDemoV2/image/back.gif'>
<center>

<img src='/XecureExpDemoV2/image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>Random Number Generate</b></font></font></p>
<br><br><br>

<%
	String random = null;


	XecureExpConfig	xecConfig = new XecureExpConfig();
	XecureRandom xrd = new XecureRandom(xecConfig);

	byte[] brandom = xrd.getRandomBytes(20);

	if(brandom != null) {
		random = new String(brandom);
%>
	random value : <%= random %>

<%
	} else {
%>
	random value failed...	

<%
	}

%> 
</center>
</body>
</html>
