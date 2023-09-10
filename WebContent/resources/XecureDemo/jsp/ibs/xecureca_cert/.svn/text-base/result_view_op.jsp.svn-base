<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.exp.*" %>
<%@ page import="xecure.expcmp.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>XESign Demo V2.1 접수 처리 결과</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='/XecureExpDemoV2/image/back.gif'>
<center>

<img src='/XecureExpDemoV2/image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>접수 처리 결과 (not yet) </b></font></font></p>

<%
	String user_id = request.getParameter("user_id");
	String status;
	int	ra_result;

	XecureExpConfig xecConfig = new XecureExpConfig();
	XecureCAClient ca_client = new XecureCAClient ( xecConfig );

	ra_result = ca_client.viewRegisterUserResult ( user_id );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 오류</font></p>
		error code : <%=ca_client.getLastError()%> <br>
		error msg : <%=ca_client.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 성공</font></p>

		<table>
		<tr><td>응답메시지</td><td><%=ca_client.getResponseFromResultView("MESSAGE")%></td></tr>
		<tr><td>등록일시</td><td><%=ca_client.getResponseFromResultView("REGDATE")%></td></tr>
		<tr><td>접수일련번호</td><td><%=ca_client.getResponseFromResultView("REGSERIAL")%></td></tr>
		<tr><td>접수처리결과 타입코드</td><td><%=ca_client.getResponseFromResultView("REGTYPE")%> </td></tr>
		<tr><td colspan=2> <br><br> </td></tr>
<%
		if ( ca_client.getResponseFromResultView("REGTYPE").equals("1") ) {
%>
			<tr><td colspan=2> <b>사용자 등록후 인증서를 아직 발급받지 않은 경우</b> <br><br></td></tr>
			<tr><td>법인명</td><td><%=ca_client.getResponseFromResultView("COMPANY")%></td></tr>
			<tr><td>개인명,법인단체 세부명</td><td><%=ca_client.getResponseFromResultView("USERNAME")%></td></tr>
			<tr><td>개인(법인)ID</td><td><%=ca_client.getResponseFromResultView("USERID")%></td></tr>
			<tr><td>주민등록번호</td><td><%=ca_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>참조번호</td><td><%=ca_client.getResponseFromResultView("REFCODE")%></td></tr>
			<tr><td>인가코드</td><td><%=ca_client.getResponseFromResultView("AUTHCODE")%></td></tr>
<%
		}
		else {
%>		
			<tr><td colspan=2> <b> 사용자 등록후 인증서를 발급받은 경우 </b> <br><br></td></tr>
			<tr><td>이벤트발생일</td><td><%=ca_client.getResponseFromResultView("EVENTDATE")%></td></tr>
			<tr><td>인증서일련번호</td><td><%=ca_client.getResponseFromResultView("SERIAL")%></td></tr>
			<tr><td>이벤트타입코드</td><td><%=ca_client.getResponseFromResultView("EVENTTYPE")%></td></tr>
			<tr><td>유효기간시작</td><td><%=ca_client.getResponseFromResultView("VALIDFROM")%></td></tr>
			<tr><td>유효기간종료</td><td><%=ca_client.getResponseFromResultView("VALIDTO")%></td></tr>
			<tr><td>주민등록번호</td><td><%=ca_client.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>인증서 용도</td><td><%=ca_client.getResponseFromResultView("CERTTYPE")%></td></tr>
			<tr><td>인증서 등급</td><td><%=ca_client.getResponseFromResultView("CERTCLASS")%></td></tr>
<%
		}
%>
		</table>
<%
	}
%> 
</center>
</body>
<!---END_ENC--->
</html>
