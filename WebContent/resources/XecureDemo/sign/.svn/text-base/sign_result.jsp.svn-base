<!-- 클라이언트에서 서명한 plain text를 서버 쪽에서 복호화 한다.
     xecure.crypto 의  SignVerifier 객체-->

<!-- JSP 로 서버 쪽의 class들을 호출 -->
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<%
	SignVerifier	verifier = new SignVerifier ( new XecureConfig(), request.getParameter("signed_msg") );
%>

<html>
<head><title>서버 서명 검증 결과</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-Cache">
</head>
<body>

<!-- Title -->
<h1>전자 서명 데모(검증) 결과</h1>
<p align='center'><big><strong>웹브라우져(클라이언트)로부터 입력받은 결과입니다.</strong></big></p>	
<p>　</p>

<table border='1' width='100%'>
	<tr>
	<td width='17%'><strong>Decrypted Request 'plain' :</strong></td>
	<td width='83%'><strong>
	<pre>
	<%=request.getParameter("plain") %>
	</pre>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>Decrypted Request 'signed_msg' :</strong></td>
	<td width='83%'><strong>
	<pre>
	<%
	String sm = request.getParameter("signed_msg"); 
	int i;
	for ( i = 0; i < sm.length(); i+=80 ) {
		if ( i + 80 < sm.length() ) 
			out.println ( sm.substring( i, i+80 ) );
		else
			out.println ( sm.substring( i, sm.length() ));
	}
	%>
	</pre>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>서명 검증 결과</strong></td>
	<td width='83%'><strong>
	<%
	if ( verifier.getLastError() != 0 ) {
		out.println("서명문에 문제가 있습니다.<br>");
		out.println("오류 번호 : " + verifier.getLastError() + "<br>");
	}
	else {
		out.println("서명 확인 성공<br>");
	}
	%>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>서명 메시지 원본</strong></td>
	<td width='83%'><strong>
	<pre>
	<%=verifier.getVerifiedMsg_Text()%>
	</pre>
	</strong></td>
	</tr>

	<tr>
	<td width='17%'><strong>서명자 인증서</strong></td>
	<td width='83%'><strong>
	<pre>
	<%=verifier.getSignerCertificate().getCertPem()%>
	</pre>
	</strong></td>
	</tr>
</table>

<p>
<p align='center'><a href='javascript:history.back();'>이전 페이지로</a></p>
		
</body></html>

