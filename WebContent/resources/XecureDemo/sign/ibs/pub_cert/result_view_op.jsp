<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign  접수 처리 결과 조회 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>
 
<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>
<center>

<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> 
<!--Title -->
<p><font size='6'><font color='#6699CC'><b>접수 처리 결과</b></font></font></p>

<%
	String reg_date = request.getParameter("reg_date");
	String reg_serial = request.getParameter("reg_serial");
	String status;
	int	ra_result;

	PublicRA sfra = new PublicRA ( new XecureConfig() );

	ra_result = sfra.viewRegisterUserResult ( reg_date, reg_serial );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 오류</font></p>
		error code : <%=sfra.getLastError()%> <br>
		error msg : <%=sfra.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 성공</font></p>

	<table>
		<tr><td>응답메시지</td><td><%=sfra.getResponseFromResultView("MESSAGE")%></td></tr>
		<tr><td>등록일시</td><td><%=sfra.getResponseFromResultView("REGDATE")%></td></tr>
		<tr><td>접수일련번호</td><td><%=sfra.getResponseFromResultView("REGSERIAL")%></td></tr>
		<tr><td>접수처리결과 타입코드</td><td><%=sfra.getResponseFromResultView("REGTYPE")%></td></tr>
<%
		if ( sfra.getResponseFromResultView("REGTYPE").equals("1") ) {
%>
			<tr><td colspan=2>사용자 등록후 인증서를 아직 발급받지 않은 경우</td></tr>
			<tr><td>법인명</td><td><%=sfra.getResponseFromResultView("COMPANY")%></td></tr>
			<tr><td>개인명,법인단체 세부명</td><td><%=sfra.getResponseFromResultView("USERNAME")%></td></tr>
			<tr><td>개인(법인)ID</td><td><%=sfra.getResponseFromResultView("USERID")%></td></tr>
			<tr><td>주민등록번호</td><td><%=sfra.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>참조번호</td><td><%=sfra.getResponseFromResultView("REFCODE")%></td></tr>
			<tr><td>인가코드</td><td><%=sfra.getResponseFromResultView("AUTHCODE")%></td></tr>
<%
		}
		else {
%>		
			<tr><td colspan=2>사용자 등록후 인증서를 발급받은 경우</td></tr>
			<tr><td>이벤트발생일</td><td><%=sfra.getResponseFromResultView("EVENTDATE")%></td></tr>
			<tr><td>인증서일련번호</td><td><%=sfra.getResponseFromResultView("SERIAL")%></td></tr>
			<tr><td>이벤트타입코드</td><td><%=sfra.getResponseFromResultView("EVENTTYPE")%></td></tr>
			<tr><td>유효기간시작</td><td><%=sfra.getResponseFromResultView("VALIDFROM")%></td></tr>
			<tr><td>유효기간종료</td><td><%=sfra.getResponseFromResultView("VALIDTO")%></td></tr>
			<tr><td>주민등록번호</td><td><%=sfra.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>전자서명검증키</td><td>
				<%
					String pubkey = sfra.getResponseFromResultView("PUBKEY");
					int i;
					for ( i = 0; i < pubkey.length(); i+=80 ) {
						if ( i + 80 < pubkey.length() )
							out.println ( pubkey.substring( i, i+80 ) );
						else
							out.println ( pubkey.substring( i, pubkey.length() ));
						out.println("<br>");
					}
				%>
			    </td></tr>
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
