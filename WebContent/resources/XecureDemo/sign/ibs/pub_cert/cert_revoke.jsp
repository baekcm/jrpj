<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign 사용자 인증서가 폐기 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>


<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">

<script language='javascript'>
function cert_revoke(form)
{
	nRet = -1;
   var jobcode, reason;
   if ( form.jobcode[0].checked ) jobcode = 256; else jobcode = 17; 
	if ( form.reason[0].checked ) reason=1; else reason=2; 
	nRet = RevokeCertificate( jobcode, reason );   // xecureweb.js
   if ( jobcode == 17 ) {
	    if ( nRet == 0 ) 
		confirm('사용자 인증서가 폐기 되었습니다.'); 
	    else
		confirm('사용자님의 인증서 폐기 오류'); 
   }
   else if ( jobcode == 256 ) {
	    if ( nRet == 0 ) 
		confirm('사용자 인증서가 효력정지 되었습니다. 다시 사용하기 위해서는 인증서를 신청한 은행의 공인인증서 관리기능을 이용하십시요.'); 
	    else
		confirm('사용자님의 인증서 효력정지 오류'); 
   }
	return false;
}
</script>

<center>

  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>
  <!--Title -->
  <p><font size='6'><font color='#6699CC'><b>인증서 폐기 / 효력정지</b></font></font></p>

<form name='form1' onSubmit='cert_revoke(this); return false;'>
<table border=1>
	<tr><td colspan=2><b>인증서 효력정지</b><input type=radio name='jobcode' checked value=4 ></td></tr>
	<tr><td colspan=2><b>인증서 폐기</b><input type=radio name='jobcode' value=3 ></td></tr>
	<tr><td>사유</td>
	<td><input type=radio name='reason' checked value=1> 사용자 키의 손상및 분실<br>
	<input type=radio name='reason' value=3> 사용자 키의 파기 <br>
	<input type=radio name='reason' value=5> 업무 중단으로 인한 효력 정지<br>
	<input type=radio name='reason' value=6> 인증서 기능 정지를 위한 효력 정지</td>
	</tr>
</table><br> 

   <input type=image src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0">
</form>

  <p>&nbsp;</p>
  </center>

</body> 
</html>
