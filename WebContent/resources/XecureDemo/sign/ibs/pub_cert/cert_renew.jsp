<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign  인증서 갱신 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

 
<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">

<script language='javascript'>
function cert_renew(form)
{
	nRet = RenewCertificate( );   // xecureweb.js
	if ( nRet == 0 ) 
		confirm("사용자님의 인증서가 금융결제원 인증기관에서 갱신 되었습니다."); 
	else
		confirm("사용자님의 인증서가 갱신 오류"); 
	return false;
}
</script>

<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74"> 
  <p><font size="6"><font color="#6699CC"><b>인증서 갱신</b></font></font></p>

<form name='form1' onSubmit='cert_renew(this); return false;'>	
확인을 누르면 인증서를 갱신합니다.
<br>
<br> 
   <input type=image src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0">
</form>

</center>

</body> 
</html>
