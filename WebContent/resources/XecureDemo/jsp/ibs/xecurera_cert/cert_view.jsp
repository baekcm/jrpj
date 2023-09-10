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


<%

	String cert_serial = request.getParameter("cert_serial");
	String id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");
	XecureConfig xecConfig = new XecureConfig();
	XecureRA ra_client = new XecureRA( xecConfig );
	String service_code, service_key;
	boolean invalid_input = false;
	int	i;
	int	ra_result;

	service_code = "2";
	service_key = "";

	if ( cert_serial != null && cert_serial.length() > 0 ) {
		service_code = "1";
		service_key = cert_serial;
	}
	else if ( id != null && id.length() > 0 ) {
		service_code = "2";
		service_key = id;
	}
	else if ( ssn != null && ssn.length() > 0) {
		service_code = "3";
		service_key = ssn;
	}
	else invalid_input = true;

%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='../../../image/back.gif'>
<center>

<img src='../../../image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>사용자 인증서 상태 조회</b></font></font></p>

<table border=1>
<%
	if ( !invalid_input ) {
		ra_result = ra_client.viewCertificate ( "internet", service_code, service_key, 0, 1 );
		if ( ra_result > 0 ) {
%>
<tr>	<td colspan=6 align=center>총 레코드 수 : <%=ra_result%></td></tr>
<tr>
	<td>번호</td>
	<td>일련번호</td>
	<td>사용자 ID</td>
	<td>주민번호</td>
	<td>인증서 용도</td>
	<td>인증서 등급</td>
	<td>인증서 정보</td>
	<td>상태</td>
	<td>상태 변경</td>
</tr>
<%
     for ( i=1; i<= ra_result; ++i ) {
%>
<tr>
	<td><%=ra_client.getResponseFromCertView("RECNUM",i)%></td>
	<td><%=ra_client.getResponseFromCertView("SERIAL",i)%></td>
	<td><%=ra_client.getResponseFromCertView("USERID",i)%></td>
	<td><%=ra_client.getResponseFromCertView("SSN",i)%></td>
	<td><%=ra_client.getResponseFromCertView("CERTTYPE",i)%></td>
	<td><%=ra_client.getResponseFromCertView("CERTCLASS",i)%></td>
	<td>DN : <%=ra_client.getResponseFromCertView("USERDN",i)%><br>
	    유효기간 : <%=ra_client.getResponseFromCertView("VALIDFROM",i)%> - <%=ra_client.getResponseFromCertView("VALIDTO",i)%></td>
	<td><% 
		String cert_status = (String)ra_client.getResponseFromCertView("STATUS",i);
		if ( cert_status.equals("10") ) out.println("유효");
		else if ( cert_status.equals("30") ) out.println("폐지");
		else if ( cert_status.equals("40") ) out.println("효력정지");
		else out.println("오류");

	    %></td>
	<td><%
		if ( cert_status.equals("10") ) {
			out.println("<a href='cert_man_op.jsp?serial=" + ra_client.getResponseFromCertView("SERIAL",i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
			out.println("<br>");
			out.println("<a href='cert_man_op.jsp?serial=" + ra_client.getResponseFromCertView("SERIAL",i) + "&service=40' onClick='return XecureLink(this);'>효력정지</a>");
		}
		else if ( cert_status.equals("40") ) {
			out.println("<a href='cert_man_op.jsp?serial=" + ra_client.getResponseFromCertView("SERIAL",i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
			out.println("<br>");
			out.println("<a href='cert_man_op.jsp?serial=" + ra_client.getResponseFromCertView("SERIAL",i) + "&service=41' onClick='return XecureLink(this);'>효력회복</a>");

		}
	    %></td>
</tr>
<%			}
		}
		else {
%>

<tr><td>error code : <%=ra_client.getLastError()%></td><td>error msg : <%=ra_client.getLastErrorMsg()%>

<%
		}
	}
	else {
%>
<tr><td>error code : <%=ra_client.getLastError()%></td><td>error msg : <%=ra_client.getLastErrorMsg()%>
<%
	}
%>

</table>
<p><input type='image' src='../../../image/button_ok.jpg' width='180' height='47' border='0'></p>
</form>
</center>
</body>
</html>
