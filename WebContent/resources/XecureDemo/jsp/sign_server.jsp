<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>서버 서명 테스트</title>
</head>
<OBJECT ID="XPSign" CLASSID="CLSID:CAB55A2C-F27B-4B87-8B82-F43F9E37DD37" CODEBASE="/XecureObject/XPSign_install.cab#Version=1,0,0,1" >
</OBJECT>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<body bgcolor="#FFFFFF" >
<%
	String sign_msg = "서버에서 서명한 메세지입니다.";


	Signer	signer = new Signer ( new XecureConfig());
	String signed_msg = signer.signMessage(sign_msg);

	if ( signer.getLastError() != 0 ) {
		out.println("서명에 문제가 있습니다.<br>");
		out.println("오류 번호 : " + signer.getLastError() + "<br>");
	}
	else {
		out.println("서명 확인 성공<br>");

%>
<script language='javascript'>
var signed_msg='<%=signed_msg%>';
alert("서명메세지\n" + signed_msg);
org_msg = VerifySignedData(signed_msg);
alert("서명원문\n" + org_msg);
</script>
<%
	}
%>

		
</body></html>

