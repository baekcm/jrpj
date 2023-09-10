<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script language='javascript' src='/XecureObject/xecure_exp_signtool_v2.js'></script>
<script language='javascript'>
PrintObjectTagE();
</script>
</head>
<script language='javascript'>
function cert_request( form )
{
	nRet = RequestCertificateE( form.ref_code.value, form.auth_code.value, form.class_id.value );
	if ( nRet == 0 )
		confirm("XecureCA 인증기관으로 부터 인증서를 발급 받았습니다.");
}
</script>
<body bgcolor="#FFFFFF" background="../../../image/back.gif">
<center>

  <img src="../../../image/demo_title.gif" width="523" height="74">
  
  <p><font size="6"><font color="#6699CC"><b>사용자 인증서 발급</b></font></font></p>
  <p>&nbsp;</p>
<br>참조 코드와 인가 코드를 입력한후  '확인' 버튼을 누르시면 금융결제원 공인인증기관으로 부터 인증서를 발급받을 수 있습니다.</p>
    <p><font color="#000000" size="5"> </font> </p>
<form name='auth' onSubmit='cert_request(this); return false;'>
참조 코드:<input type=text name='ref_code' size=15 ><br>
인가 코드:<input type=text name='auth_code' size=40 ><br>
인증서 등급:<input type=text name="class_id" size="20" value="0000" ><br><br>

<input type=image src="../../../image/button_ok.jpg" width="180" height="47" border="0">

</form>

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">인증서 관리</font></a> </p>
  </center>
</body>
</html>

