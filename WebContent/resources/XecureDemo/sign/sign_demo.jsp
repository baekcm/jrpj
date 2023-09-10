<!-- 서버에서 서명한 text를 클라이언트 쪽에서 복호화 한다.
     xecureweb_xp.js의 VerifySignedData(signed_msg)에서 복호화하여 alert창 띄움 -->

<!-- JSP 로 서버 쪽의 class들을 호출 -->
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script language=javascript src="/XecureObject/xecureweb_xp.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>

<body>
<h1>서버 서명 데모</h1>
<!-- 서버가 text에 서명하여 보냄 -->
<%
	XecureConfig xconfig=null;
	Signer	xsigner=null;
	xconfig = new XecureConfig();
	xsigner = new Signer(xconfig);
	String signed_data = xsigner.signMessage("서버가 서명해서 보냅니다요.");
%>

<center>
<p><BR><BR>
<table border='1' width='100%'>
<TR>
	<td width='17%'><strong>서버 서명문 : </strong></td>
	<td width='83%'><strong><pre>
	<%
	int i;
	for ( i = 0; i < signed_data.length(); i+=80 ) {
		if ( i + 80 < signed_data.length() ) 
			out.println ( signed_data.substring( i, i+80 ) );
		else
			out.println ( signed_data.substring( i, signed_data.length() ));
	}
	%>
	</pre></strong></td>
</TR>
</TABLE>

<!-- 복호화 , alert창 -->
<script>
<%
out.println("signed_msg = '"+signed_data +"';");
%>
VerifySignedData(signed_msg);
</script>

<br><br> 
<p align='center'><a href='javascript:history.back();'>이전 페이지로</a></p>
</center>
</body>

