<html>
<head>
<title>암호화 데모 결과</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body>

<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404">
<!--
<OBJECT ID="XecureWeb" CLASSID="CLSID:4061C1B3-C405-11d4-B05C-00C04F0CD404">
-->
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

<!----BEGIN_ENC--->

<p align='center'><big><strong>암호화된 클라이언트 Request 복호화 결과입니다. </strong></big></p>

<table border='1' width='100%'>
<tr>
<td width='17%'><strong>Client Request QueryString :</strong></td>
<td width='83%'><strong>
<%=((XecureHttpServletRequest)request).req.getQueryString( ) %>
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
<%=request.getParameter("fromWhere" ) %> 
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
<!----END_ENC--->
</body>
</html>
