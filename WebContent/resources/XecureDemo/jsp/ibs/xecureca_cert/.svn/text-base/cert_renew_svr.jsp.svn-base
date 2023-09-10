<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>XESign Demo V2.1 </title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<!-- <script language=javascript src="/XecureExpObjectV2/xecure_exp_signtool_v2.js"></script>-->
<script language=javascript src="/XecureExpObjectV2/xecureweb.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>
<body bgcolor="#FFFFFF" background="/XecureExpDemoV2/image/back.gif">

<script language='javascript'>
function cert_renew(form)
{
	nRet = RenewCertificate ( );
	if ( nRet == 0 ) 
		confirm("사용자님의 인증서가 XecureCA 인증기관에서 갱신 되었습니다."); 
	else
		confirm("사용자님의 인증서가 갱신 오류"); 
	return false;
}
</script>

<center>

  <img src="/XecureExpDemoV2/image/demo_title.gif" width="523" height="74"> 
  <p><font size="6"><font color="#6699CC"><b>인증서 갱신</b></font></font></p>

<form name='form1' onSubmit='cert_renew(this); return false;'>	
확인을 누르면 인증서를 갱신합니다.
<br>
<br> 
   <input type=image src="/XecureExpDemoV2/image/button_ok.jpg" width="180" height="47" border="0">
</form>
  <p>&nbsp;</p>
  </center>
</body>
</html>
