<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>
<script language='javascript'>
function cert_request( form )
{
	nRet = RecoverCertificate( 14, form.ref_code.value, form.auth_code.value );
	
	if ( nRet == 0 )
		confirm("XecureCA 인증기관으로 부터 정상적으로 복구 되었습니다.");
}
</script>
<body bgcolor="#FFFFFF" background="../../../image/back.gif">
<center>

  <img src="../../../image/demo_title.gif" width="523" height="74">
  
  <p><font size="6"><font color="#6699CC"><b>사용자 인증서 복구</b></font></font></p>
  <p>&nbsp;</p>
<br>참조 코드와 인가 코드를 입력한후  '확인' 버튼을 누르시면 XecureCA 인증기관으로 부터 인증서와 개인키가 복구됩니다.</p>
    <p><font color="#000000" size="5"> </font> </p>
<form name='auth' onSubmit='cert_request(this); return false;'>
참조 코드:<input type=text name='ref_code' size=15 ><br>
인가 코드:<input type=text name='auth_code' size=40 ><br><br>

<input type=image src="../../../image/button_ok.jpg" width="180" height="47" border="0">

</form>

 <p>&nbsp;</p>
 </center>
</body>
</html>

