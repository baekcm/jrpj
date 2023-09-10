<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign 사용자 등록 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>


<%
	String account = request.getParameter("account");
	String ac_pwd = request.getParameter("ac_pwd");
	String pcard = request.getParameter("pcard");
	String operaterId = "internet";
	String user_type = request.getParameter("user_type") ; 
	String company_name = request.getParameter("company_name");
	String user_name = request.getParameter("user_name");
	String euser_name = request.getParameter("euser_name");
	String user_id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");

	String policy_type ;
	if ( user_type.equals("1") ) policy_type = "01";
	else	policy_type = "02";

	String email = request.getParameter("email");
	String cell_phone = request.getParameter("cell_phone");
	String fax = request.getParameter("fax");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String czipcode = request.getParameter("czipcode");
	String caddress = request.getParameter("caddress");
	String cphone = request.getParameter("cphone");
	int	ra_result;
	
	PublicRA sfra = new PublicRA (new XecureConfig() );

	ra_result = sfra.registerNewUser ( operaterId, user_type, company_name, user_name, euser_name, user_id, 
				ssn, policy_type, email,cell_phone, fax, zipcode, address, phone,
                                czipcode, caddress, cphone );

%>

 
<script language='javascript'>
function cert_request( form )
{
	nRet = RequestCertificate( form.ref_code.value, form.auth_code.value );
	if ( nRet == 0 )
		confirm("금융 결제원 공인인증기관으로 부터 인증서를 발급 받았습니다.");
}
</script>

<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74">
<%
 if ( ra_result == 0 ) {
%> 
 <!--Title -->
 <p><font size="6"><font color="#6699CC"><b>사용자 등록 확인</b></font></font></p>
 <p>&nbsp;</p>

<table>
	<tr><td>사용자</td><td><%=user_name%></td></tr>
	<tr><td>계좌번호</td><td><%=account%></td></tr>
	<tr><td>등록일</td><td><%=sfra.getResponseFromRegUser("REGDATE")%></td></tr>
	<tr><td>등록번호</td><td><%=sfra.getResponseFromRegUser("REGSERIAL")%></td></tr>
	<tr><td>사용자 ID</td><td><%=sfra.getResponseFromRegUser("USERID")%></td></tr>
	<tr><td>주민등록번호</td><td><%=sfra.getResponseFromRegUser("SSN")%></td></tr>
	<tr><td>참조코드</td><td><%=sfra.getResponseFromRegUser("REFCODE")%></td></tr>
	<tr><td>인가코드</td><td><%=sfra.getResponseFromRegUser("AUTHCODE")%></td></tr>
</table>

<br>
<%=request.getParameter("user_name")%>'님의 사용자 정보가 금융결제원 인증기관에 등록 되었습니다. <br>
<br>이제 '확인' 버튼을 누르시면 금융결제원 공인인증기관으로 부터 인증서를 발급받을 수 있습니다.</p>
 
<form name='auth' onSubmit='cert_request(this); return false;'>
	<input type=hidden name='ref_code' value='<%=sfra.getResponseFromRegUser("REFCODE")%>'>
	<input type=hidden name='auth_code' value='<%=sfra.getResponseFromRegUser("AUTHCODE")%>'>
	<input type=image src="/XecureDemo/image/button_ok.jpg" width="180" height="47" border="0">
</form>

<%
  }  else {
%>

<p>		사용자 등록에 실패했습니다.</p>
에러 코드 : <%=sfra.getLastError()%><br>
에러 메시지 : <%=sfra.getLastErrorMsg()%><br>
<%	
  }
%> 

 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">인증서 관리</font></a> </p>

  </center>

</body> 
</html>
