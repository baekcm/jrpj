<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign 사용자 인증서 상태 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>
<center>

<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> 
<!--Title -->
<p><font size='6'><font color='#6699CC'><b>사용자 인증서 상태 변경</b></font></font></p>

<%
	String service = request.getParameter("service");
	String serial = request.getParameter("serial");
	String status;
	int	ra_result;

	PublicRA sfra = new PublicRA (new XecureConfig() );

	if ( service.equals("30") ) status = "폐지";
	else if ( service.equals("40")) status = "효력정지";
	else if ( service.equals("41")) status = "효력회복";
	else status = "알수없음";

	ra_result = sfra.modifyCertStatus ( "internet", serial, service );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>상태 변경 오류</font></p>
		error code : <%=sfra.getLastError()%> <br>
		error msg : <%=sfra.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>상태 변경 성공</font></p>
		인증서 일련번호 '<%=serial%>' 인 인증서의 상태가 '<%=status%>' 되었습니다.<br> 
<%
	}
%> 
</center>

</body>
</html>
