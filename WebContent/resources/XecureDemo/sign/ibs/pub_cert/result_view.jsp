<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign  접수 처리 결과 조회 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

 
<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>
<center>

<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>
<!--Title -->
<p><font size='6'><font color='#6699CC'><b>접수 처리 결과 조회</b></font></font></p>
<p><font color='#000000' size='5'>사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>

<form name='form1' method=post action='result_view_op.jsp'>
<table>
	<tr><td>계좌번호</td><td><input type=text name='account' size='20'></td></tr>
	<tr><td>계좌비밀번호</td><td><input type=text name='ac_pwd' size='20'></td></tr>
	<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name='pcard' size='20'></td></tr>

	<tr><td>등록일시</td><td><input type=text name='reg_date' size='20'></td></tr>
	<tr><td>접수일련번호</td><td><input type=text name='reg_serial' size='20'></td></tr>
</table>

<p><input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>
</form>

</center>

</body> 
</html>
