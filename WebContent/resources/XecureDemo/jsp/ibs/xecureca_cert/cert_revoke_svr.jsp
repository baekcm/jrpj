<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>XESign Demo V2.1 </title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script language=javascript src="/XecureExpObjectV2/xecure_exp_signtool_v2.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>
<body bgcolor="#FFFFFF" background="/XecureExpDemoV2/image/back.gif">

<script language='javascript'>
function cert_revoke(form)
{
   nRet = -1;
   var i;

   for(i=0; i<5; i++) {
      if ( form.reason[i].checked ) { 
	 nRet = RevokeCertificateSvr ( i + 1 );
	 if ( nRet == 0 ) { 
	    confirm('사용자 인증서가 폐기 되었습니다.');
	    break;
         } 
	 else {
	    confirm('사용자님의 인증서 폐기 오류');
	    break;
         }
      } 
   }
   if( form.reason[5].checked ) {
	 nRet = RevokeCertificate ( 6 );
	 if ( nRet == 0 ) 
	    confirm('사용자 인증서가 효력정지 되었습니다. 다시 사용하기 위해서는 인증서를 신청한 은행의 인증서 관리기능을 이용하십시요.'); 
	 else
	    confirm('사용자님의 인증서 효력정지 오류'); 
   }
	return false;
}
</script>

<center>

  <img src='/XecureExpDemoV2/image/demo_title.gif' width='523' height='74'> 
  <p><font size='6'><font color='#6699CC'><b>인증서 폐기 / 효력정지</b></font></font></p>

<form name='form1' onSubmit='cert_revoke(this); return false;'>
<table border=1>
<tr><td><b>Reason</td></tr>
<tr><td colspan=2>Key Compromise</b><input type=radio name='reason' checked value=1 ></td></tr>
<tr><td colspan=2>Ca Compromise</b><input type=radio name='reason' value=2 ></td></tr>
<tr><td colspan=2>Affiliation Changed</b><input type=radio name='reason' value=3 ></td></tr>
<tr><td colspan=2>Superseded</b><input type=radio name='reason' value=4 ></td></tr>
<tr><td colspan=2>Cessation Of Operation</b><input type=radio name='reason' value=5 ></td></tr>
<tr><td colspan=2>Certificate Hold</b><input type=radio name='reason' value=6 ></td></tr>
</table>

<br> 
   <input type=image src="/XecureExpDemoV2/image/button_ok.jpg" width="180" height="47" border="0">
</form>
  <p>&nbsp;</p>
  </center>
</body>
<!---END_ENC--->
</html>
