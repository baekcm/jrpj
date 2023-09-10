<%@ include file="/XecureObject/xecure_tld.jsp" %>

<html>
<head>
<meta http-equiv='Content-Type' content='text/html; '>
<title>XecureServlet 클래스를 이용한 클라이언트 암호문 복호, 서버 평문 암호 데모</title>
</head>
<body>


<p align='center'><big><strong>클라이언트 Request 복호화 </strong></big></p>
<xecure:enc xecobj='<%=xservlet %>'>
<p align='center'><big><strong>암호화된 클라이언트 Request 복호화 결과입니다. </strong></big></p>


<table border='1' width='100%'>
<tr>
<td width='17%'><strong>Client Request QueryString :</strong></td>
<td width='83%'><strong>
<%=request.getQueryString( ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Client Request QueryString abc:</strong></td>
<td width='83%'><strong>
<%=request.getParameter("abc" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Client Request QueryString pop:</strong></td>
<td width='83%'><strong>
<%=request.getParameter("pop" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted QueryString :</strong></td>
<td width='83%'><strong>
<%=xservlet.request.getQueryString( ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted QueryString abc :</strong></td>
<td width='83%'><strong>
<%=xservlet.request.getParameter("abc" ) %> 
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted QueryString pop :</strong></td>
<td width='83%'><strong>
<%=xservlet.request.getParameter("pop" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted text_field1 :</strong></td>
<td width='83%'><strong>
<%=xservlet.request.getParameter("text_field1" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted text_field2 :</strong></td>
<td width='83%'><strong>
<%=xservlet.request.getParameter("text_field2" ) %>
</strong></td>
</tr>
</table>


<p> </p>
<p align='center'><a href='/XecureDemo/jsp/enc_client_request.html'>이전 화면</a></p>

</xecure:enc>
</body></html>

