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
	    confirm('����� �������� ��� �Ǿ����ϴ�.');
	    break;
         } 
	 else {
	    confirm('����ڴ��� ������ ��� ����');
	    break;
         }
      } 
   }
   if( form.reason[5].checked ) {
	 nRet = RevokeCertificate ( 6 );
	 if ( nRet == 0 ) 
	    confirm('����� �������� ȿ������ �Ǿ����ϴ�. �ٽ� ����ϱ� ���ؼ��� �������� ��û�� ������ ������ ��������� �̿��Ͻʽÿ�.'); 
	 else
	    confirm('����ڴ��� ������ ȿ������ ����'); 
   }
	return false;
}
</script>

<center>

  <img src='/XecureExpDemoV2/image/demo_title.gif' width='523' height='74'> 
  <p><font size='6'><font color='#6699CC'><b>������ ��� / ȿ������</b></font></font></p>

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
