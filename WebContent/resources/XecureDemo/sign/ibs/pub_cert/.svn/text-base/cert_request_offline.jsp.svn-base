<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign 사용자 인증서 발급 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<script language='javascript'>
function cert_request( form )
{
	nRet = RequestCertificate( form.ref_code.value, form.auth_code.value );
	if ( nRet == 0 )
		confirm("금융 결제원 공인인증기관으로 부터 인증서를 발급 받았습니다.");
}
</script>
<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">

<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
  <!--Title -->
  <p><font size="6"><font color="#6699CC"><b>사용자 인증서 발급</b></font></font></p>
  <p>&nbsp;</p>

<br>참조 코드와 인가 코드를 입력한후  '확인' 버튼을 누르시면 금융결제원 공인인증기관으로 부터 인증서를 발급받을 수 있습니다.</p>

<form name='auth' onSubmit='cert_request(this); return false;'>
	참조 코드:<input type=text name='ref_code' size=15 ><br>
	인가 코드:<input type=text name='auth_code' size=40 ><br>
	<input type=image src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0">
</form>

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">인증서 관리</font></a> </p>

  </center>

</body> 
</html>
