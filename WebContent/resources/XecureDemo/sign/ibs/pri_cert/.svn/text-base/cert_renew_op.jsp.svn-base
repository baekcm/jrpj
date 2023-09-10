<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Softforum  사용자 인증서 갱신 결과 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<%
	String account = request.getParameter("account");
	String ac_pwd = request.getParameter("ac_pwd");
	String pcard = request.getParameter("pcard");
	String company_name = request.getParameter("cname");
	String company_unit = request.getParameter("cunit");
	String user_name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String caddress = request.getParameter("caddress");
	String cert_req = request.getParameter("cert_req");
	
	PrivateRA sfra = new PrivateRA (new XecureConfig() );
	Certificate user_cert;

	user_cert = sfra.renewCertificate ( cert_req, user_id, user_name, "KR", address, company_name, company_unit, email ); 

%>


<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
<%
	if ( user_cert != null ) {
%> 
  <p><font size="6"><font color="#6699CC"><b>사용자 인증서 갱신 결과</b></font></font></p>
  <p>&nbsp;</p>
    <p>사용자 : <%=user_name%> 님 </p>
    <p>계좌번호 : <%=account%></p>
    <p>사용자 ID : <%=user_id%></p>
    <p><%=request.getParameter("user_name")%>'님의 사용자 인증서가 소프트포럼 인증기관으로 부터 갱신 되었습니다. </p><br>

<script language='javascript'>
<%=user_cert.certInstallScript(user_cert.INSTALL_USER_CERT)%>
</script>

<%	}
	else {
%>
<p>		사용자 인증서 갱신 실패했습니다.</p>
에러 코드 : <%=sfra.getLastError()%><br>
에러 메시지 : <%=sfra.getLastErrorMsg()%><br>
<%	}
%> 

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp'><font color="#000000" size="5">인증서 관리</font></a> </p>

</center>

</body> 
</html>
