<!--  -->

<!-- JSP 로 서버 쪽의 class들을 호출 -->
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script language=javascript src="/XecureObject/xecureweb_xp.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>

<body>

<script language='JavaScript'>
function sign_submit(form) {
//서버 인증서 pem(cc) - 실제 서버의 인증서로 바꿔주세요.
var rec1 = "";
	rec1 += "-----BEGIN CERTIFICATE-----\n";
	rec1 += "MIIDEzCCAnygAwIBAgIEBo53hDANBgkqhkiG9w0BAQQFADBhMQswCQYDVQQGEwJL\n";
	rec1 += "UjELMAkGA1UECBMCYWExCzAJBgNVBAcTAmFhMQswCQYDVQQKEwJhYTELMAkGA1UE\n";
	rec1 += "CxMCYWExCzAJBgNVBAMTAmFhMREwDwYJKoZIhvcNAQkBFgJhYTAeFw0wMDEyMTgw\n";
	rec1 += "MDAwMDBaFw0wNTEyMTcwNDM2NTRaMGExCzAJBgNVBAYTAktSMQswCQYDVQQIEwJj\n";
	rec1 += "YzELMAkGA1UEBxMCY2MxCzAJBgNVBAoTAmNjMQswCQYDVQQLEwJjYzELMAkGA1UE\n";
	rec1 += "AxMCY2MxETAPBgkqhkiG9w0BCQEWAmNjMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB\n";
	rec1 += "iQKBgQCg9cavgxLmFZpjgLVtgVJsNuVV5cG3Q4cFECkwxuyazJi31fpSwqyCmvYf\n";
	rec1 += "Q1o/fIt02MWff8CTdHiTxDQiNgBt9uegkE6fgrSxpSNraP7UXOJsT5Du6wxtcNVF\n";
	rec1 += "jI6Lh/vRplFE5MD32OjiI8ZcbPH4t/ow7yX7Lon1FoaCkl2m4wIDAQABo4HXMIHU\n";
	rec1 += "MGoGCWCGSAGG+EIBDQRdFltZb3VyIENlcnRpZmljYXRlIGlzIGR1ZSB1cHRvIDEg\n";
	rec1 += "eWVhci4gWW91IGhhdmUgdG8gcmVpc3N1ZSB5b3VyIGNlcnRpZmljYXRlIGJlZm9y\n";
	rec1 += "ZSBpdCBleHBpcmVzMCIGCWCGSAGG+EIBAgQVFhN3d3cuc29mdGZvcnVtLmNvLmty\n";
	rec1 += "MBEGCWCGSAGG+EIBAQQEAwIAgDAvBglghkgBhvhCAgUEIhYgZDQxZDhjZDk4ZjAw\n";
	rec1 += "YjIwNGU5ODAwOTk4ZWNmODQyN2UwDQYJKoZIhvcNAQEEBQADgYEAlbsf2dv0EXpX\n";
	rec1 += "JtMYSuGjxSOp13+Nk3SIvjkCqE0638yaHUaIw4NWcNJapwAD9oKciYGH0B3cSYWf\n";
	rec1 += "rVHYg4Ok47Zh0U7VB3A5DgWpa/NZqn7to/iTL13RinqlFRmCoQtpdYXXV+wCaniA\n";
	rec1 += "R/T3HQnfeut6hkJb6d0lIpD/R1lF+Eg=\n";
	rec1 += "-----END CERTIFICATE-----\n";


var message = '계좌 이체\r\n';
    message += ' 보내는 이: 조흥은행 111-11-111-1111 예금주 김기영\r\n';
    message += ' 받는   이: 국민은행 222-22-222-2222 예금주 권은정\r\n';
    message += '  송금액  : 100,000 원\r\n';
    message += '  수수료  : 500 원\r\n';

	alert("다음 메세지를 전자봉투에 넣으시겠습니다.\n" + message);
	form.enveloped_msg.value = Envelop_with_option(rec1, message, 0);
	if ( form.enveloped_msg.value=="" ) return false;
	else
		return true;
}
</script>

<br><center>
<h3>예약 정보 입력</h3>
<form  action='env_demo_result.jsp' method='POST' onSubmit='return sign_submit(this);' >
<input type=hidden name=enveloped_msg>
  
    <table cellPadding='10' height='260' border='1'>
      <tr>
        <td height='25'><b>예약번호 : </b></td>
        <td height='25'><b><input type='text' name='ReserveNum' size='20'></b></td>
      </tr>
      <tr>
        <td height='24'><b>금액 : </b></td>
        <td height='24'><b><input type='text' name='fee' size='20'></b></td>
      </tr>
      <tr>
        <td height='25'><b>카드번호 :</d> </b></td>
        <td height='25'><b><input name='CreditNo' size='16'></b></td>
      </tr>
      <tr>
        <td height='26'><b>유효기간 : </b></td>
        <td height='26'>
		<select name='Year' size='1'>     
          <option value='01'>2001 </option>
          <option value='02'>2002 </option>
          <option value='03'>2003 </option>
          <option value='04'>2004 </option>
          <option value='05'>2005 </option>
          <option value='06'>2006</option>
        </select> 년 
		<select name='Month' size='1'>
          <option value='01'>1 </option>
          <option value='02'>2 </option>
          <option value='03'>3 </option>
          <option value='04'>4 </option>
          <option value='05'>5 </option>
          <option value='06'>6 </option>
          <option value='07'>7 </option>
          <option value='08'>8 </option>
          <option value='09'>9 </option>
          <option value='10'>10 </option>
          <option value='11'>11 </option>
          <option value='12'>12</option>
        </select> 월</td>
      </tr>
      <tr>
        <td height='26'><b>결제 방법 :</b> </td>
        <td height='26'><select name='Pay' size='1'>
          <option value='01'>일시불 </option>
          <option value='03'>할부 3개월 </option>
          <option value='06'>할부 6개월 </option>
        </select></td>
      </tr>
      <tr>
        <td colspan='2' height='2'><div align='center'><center><p>
        <input type='submit' value='확  인'></td>
      </tr>
    </table>
 
</form>

<br><a href='index.html'>메뉴 페이지로</a>
</center>
</body>

