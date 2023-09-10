<html>
<head>
<title>암호화 데모 결과</title>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</head>
<body>

<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPageEnv"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<form name='xecure'><input type=hidden name='ep'></form>
<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>

<!---BEGIN_ENC--->

<p align='center'><big><strong>암호화된 클라이언트 Request 복호화 결과입니다. </strong></big></p>

<table border='1' width='100%'>
<tr>
<%
	String queryOrg =((XecureHttpServletRequest)request).req.getQueryString( );
	int qLen = (queryOrg==null)?0:queryOrg.length();
%>
<td width='17%'><strong>Client Request QueryString [<%=qLen%>] :</strong></td>
<td width='83%'><strong>
<%
	if(queryOrg!=null){
		for (int i = 0; i < qLen; i+=80 ) {
			if ( i + 80 < qLen ) 
				out.println ( queryOrg.substring( i, i+80 ) );
			else
				out.println ( queryOrg.substring( i, qLen ));
		}
	}
%>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Client Request QueryString abc:</strong></td>
<td width='83%'><strong>
<%=((XecureHttpServletRequest)request).req.getParameter("abc" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Client Request QueryString pop:</strong></td>
<td width='83%'><strong>
<%=((XecureHttpServletRequest)request).req.getParameter("pop" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted QueryString :</strong></td>
<td width='83%'><strong>
<%=request.getQueryString( ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted QueryString abc :</strong></td>
<td width='83%'><strong>
<%=request.getParameter("abc" ) %> 
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted QueryString pop :</strong></td>
<td width='83%'><strong>
<%=request.getParameter("pop" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted text_field1 :</strong></td>
<td width='83%'><strong>
<%=request.getParameter("text_field1" ) %>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>Decrypted text_field2 :</strong></td>
<td width='83%'><strong>
<%=request.getParameter("text_field2" ) %>
</strong></td>
</tr>
</table>
<p> </p>
<p align='center'><a href='/XecureDemo/jsp/enc_client_request.html'>이전 화면</a></p>
<!---END_ENC--->
</body>
</html>
