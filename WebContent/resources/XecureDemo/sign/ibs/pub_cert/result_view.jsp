<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign  ���� ó�� ��� ��ȸ </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

 
<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>
<center>

<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>
<!--Title -->
<p><font size='6'><font color='#6699CC'><b>���� ó�� ��� ��ȸ</b></font></font></p>
<p><font color='#000000' size='5'>����� Ȯ���� ���ؼ� �Ʒ��� ������ �Է��� �ֽʽÿ�.</font></p>

<form name='form1' method=post action='result_view_op.jsp'>
<table>
	<tr><td>���¹�ȣ</td><td><input type=text name='account' size='20'></td></tr>
	<tr><td>���º�й�ȣ</td><td><input type=text name='ac_pwd' size='20'></td></tr>
	<tr><td>�н�����ī�� 15��° ����</td><td><input type=text name='pcard' size='20'></td></tr>

	<tr><td>����Ͻ�</td><td><input type=text name='reg_date' size='20'></td></tr>
	<tr><td>�����Ϸù�ȣ</td><td><input type=text name='reg_serial' size='20'></td></tr>
</table>

<p><input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>
</form>

</center>

</body> 
</html>
