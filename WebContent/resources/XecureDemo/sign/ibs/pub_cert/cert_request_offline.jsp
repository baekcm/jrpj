<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign ����� ������ �߱� </title>
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
		confirm("���� ������ ��������������� ���� �������� �߱� �޾ҽ��ϴ�.");
}
</script>
<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">

<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
  <!--Title -->
  <p><font size="6"><font color="#6699CC"><b>����� ������ �߱�</b></font></font></p>
  <p>&nbsp;</p>

<br>���� �ڵ�� �ΰ� �ڵ带 �Է�����  'Ȯ��' ��ư�� �����ø� ���������� ��������������� ���� �������� �߱޹��� �� �ֽ��ϴ�.</p>

<form name='auth' onSubmit='cert_request(this); return false;'>
	���� �ڵ�:<input type=text name='ref_code' size=15 ><br>
	�ΰ� �ڵ�:<input type=text name='auth_code' size=40 ><br>
	<input type=image src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0">
</form>

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">������ ����</font></a> </p>

  </center>

</body> 
</html>
