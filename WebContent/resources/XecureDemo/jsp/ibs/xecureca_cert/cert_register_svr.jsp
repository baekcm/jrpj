<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>XESign Demo V2.1 </title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
</head>
<body bgcolor="#FFFFFF" background="/XecureExpDemoV2/image/back.gif">
<center>

<img src="/XecureExpDemoV2/image/demo_title.gif" width="523" height="74"> 
<p><font size="6"><font color="#6699CC"><b>사용자 등록</b></font></font></p>
<p><font color='#000000' size='5'>!!!!!!!!!!!!!!!!!!!!!!!  주의 !!!!!!!!!!!!!!!!!!!!!!!.</font></p>
<p><font color='#000000' size='5'>이 페이지는 XecureCA 인증기관에 사용자를 등록하는 작업을 수행합니다. 반드시, 운영시스템에서는 이 페이지를 웹상에서 제거하고, 절대 운영시스템에서 수행하지 마십시요.</font></p>

<p><font color="#000000" size="5">사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>
<form name="form1" method=post action='cert_request_svr.jsp' >
<table>
<tr><td>계좌번호</td><td><input type=text name="account" size="20"></td></tr>
<tr><td>계좌비밀번호</td><td><input type=text name="ac_pwd" size="20"></td></tr>
<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name="pcard" size="20"></td></tr>

<tr><td>개인/법인/단체 구분</td><td>
	<input type=radio name="user_type" value="1" checked>개인
	<input type=radio name="user_type" value="2">법인
</td></tr>
<tr><td>법인명</td><td><input type=text name="company_name" size="40"></td></tr>
<tr><td>개인명 / 법인단체 세부명</td><td><input type=text name="user_name" size="40"></td></tr>
<tr><td>개인 (법인단체) ID ( 필수 )</td><td><input type=text name="user_id" size="20"></td></tr>
<tr><td>주민등록번호 ( 사업자 등록번호 ) ( 필수 ) </td><td><input type=text name="ssn" size="20"></td></tr>
<tr><td>전자우편 ( 옵션 )</td><td><input type=text name="email" size="20"></td></tr>
<tr><td>핸드폰 ( 옵션 )</td><td><input type=text name="cell_phone" size="20"></td></tr>
<tr><td>Fax ( 옵션 )</td><td><input type=text name="fax" size="20"></td></tr>
<tr><td>자택 우편번호 ( 옵션 )</td><td><input type=text name="zipcode" size="20"></td></tr>
<tr><td>자택 주소 ( 옵션 )</td><td><input type=text name="address" size="40"></td></tr>
<tr><td>자택 전화 ( 옵션 )</td><td><input type=text name="phone" size="20"></td></tr>
<tr><td>회사 우편번호 ( 옵션 )</td><td><input type=text name="czipcode" size="20"></td></tr>
<tr><td>회사 주소 ( 옵션 )</td><td><input type=text name="caddress" size="40"></td></tr>
<tr><td>회사 전화 ( 옵션 )</td><td><input type=text name="cphone" size="20"></td></tr>
<tr><td>인증서 용도 </td><td><input type=text name="cert_type" size="20" value="0000" ></td></tr>
<tr><td>인증서 등급 </td><td><input type=text name="cert_class" size="20" value="0000" ></td></tr>
</table>
<p><input type='image' src="/XecureExpDemoV2/image/button_ok.jpg" width="180" height="47" border="0"></p>
</form>
</center>
</body>
</html>
