<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> ����Ʈ���� ������� :  ������ ���� ��ȸ ��û </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

 
<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

<img src="/XecureDemo/image/demo_title.gif" width="523" height="74"> 

<!-- Title -->
<p><font size="6"><font color="#6699CC"><b>����Ʈ���� ������� :  ������ ���� ��ȸ ��û</b></font></font></p>
<p><font color="#000000" size="5">��ȸ�� ����� ���̵� �Է��� �ֽʽÿ�.</font></p>

<form name="form1" method=post action='cert_get_op.jsp' >
	���̵� : <input type=text name="user_id" size="20"><br>
	<p><input type='image' src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0"></p> <!--Ȯ��-->
</form>

</center>

</body> 
</html>
