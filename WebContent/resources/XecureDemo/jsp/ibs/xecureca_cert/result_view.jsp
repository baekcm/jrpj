<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>XESign Demo V2.1 접수 처리 결과 조회</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='/XecureExpDemoV2/image/back.gif'>
<center>

<img src='/XecureExpDemoV2/image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>접수 처리 결과 조회</b></font></font></p>
<p><font color='#000000' size='5'>사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>
<form name='form1' method=post action='result_view_op.jsp' >
<table>
<tr><td>계좌번호</td><td><input type=text name='account' size='20'></td></tr>
<tr><td>계좌비밀번호</td><td><input type=text name='ac_pwd' size='20'></td></tr>
<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name='pcard' size='20'></td></tr>

<tr><td>사용자 ID</td><td><input type=text name='user_id' size='20'></td></tr>
</table>
<p><input type='image' src='/XecureExpDemoV2/image/button_ok.jpg' width='180' height='47' border='0'></p>
</form>
</center>
</body>
</html>
