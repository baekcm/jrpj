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

<html>
<head>
<title>접수 처리 결과</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='../../../image/back.gif'>
<center>

<img src='../../../image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>접수 처리 결과</b></font></font></p>

<%
	String user_id = request.getParameter("user_id");
	String status;
	int	ra_result;

	XecureConfig xecConfig = new XecureConfig();
	XecureRA ra_client = new XecureRA( xecConfig );

	ra_result = ra_client.viewRegisterUserResult ( user_id );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 오류</font></p>
		error code : <%=ra_client.getLastError()%> <br>
		error msg : <%=ra_client.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 성공</font></p>

		<table>
		<tr><td>응답메시지</td><td><%=ra_client.getResponseFromResultView("MESSAGE")%></td></tr>
		<tr><td>등록일시</td><td><%=ra_client.getResponseFromResultView("REGDATE")%></td></tr>
		<tr><td>접수일련번호</td><td><%=ra_client.getResponseFromResultView("REGSERIAL")%></td></tr>
		<tr><td>접수처리결과 타입코드</td><td><%=ra_client.getResponseFromResultView("REGTYPE")%> </td></tr>
		<tr><td colspan=2> <br><br> </td></tr>
<%
		if ( ra_client.getResponseFromResultView("REGTYPE").equals("1") ) {
%>
			<tr><td colspan=2> <b>사용자 등록후 인증서를 아직 발급받지 않은 경우</b> <br><br></td></tr>
			<tr><td>법인명</td><td><%=ra_client.getResponseFromResultView("COMPANY")%></td></tr>
			<tr><td>개인명,법인단체 세부명</td><td><%=ra_client.getResponseFromResultView("USERNAME")%></td></tr>
			<tr><td>개인(법인)ID</td><td><%=ra_client.getResponseFromResultView("USERID")%></td></tr>
			<tr><td>주민등록번호</td><td><%=ra_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>참조번호</td><td><%=ra_client.getResponseFromResultView("REFCODE")%></td></tr>
			<tr><td>인가코드</td><td><%=ra_client.getResponseFromResultView("AUTHCODE")%></td></tr>
<%
		}
		else {
%>		
			<tr><td colspan=2> <b> 사용자 등록후 인증서를 발급받은 경우 </b> <br><br></td></tr>
			<tr><td>이벤트발생일</td><td><%=ra_client.getResponseFromResultView("EVENTDATE")%></td></tr>
			<tr><td>인증서일련번호</td><td><%=ra_client.getResponseFromResultView("SERIAL")%></td></tr>
			<tr><td>이벤트타입코드</td><td><%=ra_client.getResponseFromResultView("EVENTTYPE")%></td></tr>
			<tr><td>유효기간시작</td><td><%=ra_client.getResponseFromResultView("VALIDFROM")%></td></tr>
			<tr><td>유효기간종료</td><td><%=ra_client.getResponseFromResultView("VALIDTO")%></td></tr>
			<tr><td>주민등록번호</td><td><%=ra_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>인증서 용도</td><td><%=ra_client.getResponseFromResultView("CERTTYPE")%></td></tr>
			<tr><td>인증서 등급</td><td><%=ra_client.getResponseFromResultView("CERTCLASS")%></td></tr>
<%
		}
%>
		</table>
<%
	}
%> 
</center>
</body>

</html>
