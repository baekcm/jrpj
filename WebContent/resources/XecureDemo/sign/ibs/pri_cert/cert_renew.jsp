<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> 소프트포럼 인증기관 : 인증서 갱신 신청 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

<img src="/XecureDemo/image/demo_title.gif" width="523" height="74"> 

<!-- Title -->
<p><font size="6"><font color="#6699CC"><b>소프트포럼 인증기관 : 인증서 갱신 신청</b></font></font></p>
<p><font color="#000000" size="5">사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>

<form name="form1" method=post action='cert_renew_op.jsp' onSubmit='cert_req.value=GenCertReq();'>

<input type=hidden name="cert_req">
<table>
	<tr><td>계좌번호</td><td><input type=text name="account" size="20"></td></tr>
	<tr><td>계좌비밀번호</td><td><input type=text name="ac_pwd" size="20"></td></tr>
	<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name="pcard" size="20"></td></tr>

	<tr><td>이름</td><td><input type=text name="user_name" size="20"></td></tr>
	<tr><td>아이디</td><td><input type=text name="user_id" size="20"></td></tr>
	<tr><td>주민등록번호</td><td><input type=text name="ssn" size="20"></td></tr>
	<tr><td>전자우편</td><td><input type=text name="email" size="20"></td></tr>
	<tr><td>자택 주소</td><td><input type=text name="address" size="40"></td></tr>
	<tr><td>회사 명</td><td><input type=text name="cname" size="20"></td></tr>
	<tr><td>부서 명</td><td><input type=text name="cunit" size="20"></td></tr>
	<tr><td>회사 주소</td><td><input type=text name="caddress" size="40"></td></tr>
</table>

<p><input type='image' src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0"></p> <!--확인-->

</form>

</center>

</body> 
</html>
