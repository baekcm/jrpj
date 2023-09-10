<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign 사용자 인증서 상태 조회 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<%

	String id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");
	PublicRA sfra = new PublicRA ( new XecureConfig() );
	String service_code, service_key;
	boolean invalid_input = false;
	int	i;
	int	ra_result;

	service_code = "2";
	service_key = "";

	if ( id != null && id.length() > 0 ) {
		service_code = "2";
		service_key = id;
	}
	else if ( ssn != null && ssn.length() > 0) {
		service_code = "3";
		service_key = ssn;
	}
	else invalid_input = true;

%>
 
<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>
<center>

<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>
<!--Title -->
<p><font size='6'><font color='#6699CC'><b>사용자 인증서 상태 조회</b></font></font></p>

<table border=1>
<%
	int start_rec_num = 0;
	int req_rec_num = 10;

	if ( !invalid_input ) {
		while ( true ) { 
			ra_result = sfra.viewCertificate ( "internet", service_code, service_key, start_rec_num, req_rec_num );
			if ( ra_result > 0 ) {
%>
	<tr>	<td colspan=6 align=center>총 레코드 수 : <%=ra_result%></td></tr>
	<tr><td>번호</td>
		<td>일련번호</td>
		<td>사용자 ID</td>
		<td>주민번호</td>
		<td>인증서 정보</td>
		<td>상태</td>
		<td>상태 변경</td>
	</tr>
<%
				for ( i=1; i<= ra_result; ++i ) {
%>
	<tr>
		<td><%=sfra.getResponseFromCertView("RECNUM",i)%></td>
		<td><%=sfra.getResponseFromCertView("SERIAL",i)%></td>
		<td><%=sfra.getResponseFromCertView("USERID",i)%></td>
		<td><%=sfra.getResponseFromCertView("SSN",i)%></td>
		<td>DN : <%=sfra.getResponseFromCertView("USERDN",i)%><br>
			유효기간 : <%=sfra.getResponseFromCertView("VALIDFROM",i)%> - <%=sfra.getResponseFromCertView("VALIDTO",i)%></td>
		<td><% 
			String cert_status = (String)sfra.getResponseFromCertView("STATUS",i);
			if ( cert_status.equals("10") ) out.println("유효");
			else if ( cert_status.equals("30") ) out.println("폐지");
			else if ( cert_status.equals("40") ) out.println("효력정지");
			else out.println("오류");

			%></td>
		<td><%
			if ( cert_status.equals("10") ) {
				out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&service=30'>폐지</a>");
				out.println("<br>");
				out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&service=40'>효력정지</a>");
			}
			else if ( cert_status.equals("40") ) {
				out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&service=30'>폐지</a>");
				out.println("<br>");
				out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&service=41'>효력회복</a>");

			}
			%></td>
	</tr>
<%				}
				if ( ra_result != req_rec_num ) break;
				start_rec_num = start_rec_num + req_rec_num;
			}
			else {
%>

	<tr><td>error code : <%=sfra.getLastError()%></td><td>error msg : <%=sfra.getLastErrorMsg()%>

<%
				break;
			}
		}
	}
	else {
%>
	<tr><td>error code : <%=sfra.getLastError()%></td><td>error msg : <%=sfra.getLastErrorMsg()%>
	<%
		}
	%>

</table>
<p>&nbsp;</p>

    <p><a href='cert_main.jsp' ><font color="#000000" size="5">인증서 관리</font></a> </p>

</center>

</body> 
</html>
