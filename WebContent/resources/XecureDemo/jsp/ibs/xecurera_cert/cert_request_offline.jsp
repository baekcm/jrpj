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
		confirm("XecureCA ����������� ���� �������� �߱� �޾ҽ��ϴ�.");
}
</script>
<body bgcolor="#FFFFFF" background="../../../image/back.gif">
<center>

  <img src="../../../image/demo_title.gif" width="523" height="74">
  
  <p><font size="6"><font color="#6699CC"><b>����� ������ �߱�</b></font></font></p>
  <p>&nbsp;</p>
<br>���� �ڵ�� �ΰ� �ڵ带 �Է�����  'Ȯ��' ��ư�� �����ø� ���������� ��������������� ���� �������� �߱޹��� �� �ֽ��ϴ�.</p>
    <p><font color="#000000" size="5"> </font> </p>
<form name='auth' onSubmit='cert_request(this); return false;'>
���� �ڵ�:<input type=text name='ref_code' size=15 ><br>
�ΰ� �ڵ�:<input type=text name='auth_code' size=40 ><br>
������ ���:<input type=text name="class_id" size="20" value="0000" ><br><br>

<input type=image src="../../../image/button_ok.jpg" width="180" height="47" border="0">

</form>

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">������ ����</font></a> </p>
  </center>
</body>
</html>

