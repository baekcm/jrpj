<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> 소프트포럼 인증기관 : 사용자 인증서 조회 결과 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<%
	String user_id = request.getParameter("user_id");
	Certificate user_cert;

	PrivateRA sfra = new PrivateRA (new XecureConfig() );

	user_cert = sfra.getCertificate ( user_id ); 

%>


<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
<%
	if ( user_cert != null ) {
%> 
  <!-- Title -->
  <p><font size="6"><font color="#6699CC"><b>사용자 인증서 조회 결과</b></font></font></p>
  <p>&nbsp;</p>
    <p>사용자 ID : <%=user_id%></p>
    <p><%=request.getParameter("user_name")%>'님의 사용자 인증서가 소프트포럼 인증기관으로 부터 조회 되었습니다. </p><br>
    <p><%=user_cert.getSubject()%></p><br>
    <p><%=user_cert.getIssuer()%></p><br>
<%	}
	else {
%>
<p>		사용자 인증서 조회 실패했습니다.</p>
에러 코드 : <%=sfra.getLastError()%><br>
에러 메시지 : <%=sfra.getLastErrorMsg()%><br>
<%=user_id%><br>
<%	}
%> 

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">인증서 관리</font></a> </p>

</center>

</body> 
</html>
