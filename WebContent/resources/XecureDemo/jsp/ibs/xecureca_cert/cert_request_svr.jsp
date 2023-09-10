<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.exp.*" %>
<%@ page import="xecure.expcmp.*" %>
<%@ page import="java.io.*" %>

<%
	String account = request.getParameter("account");
	String ac_pwd = request.getParameter("ac_pwd");
	String pcard = request.getParameter("pcard");
	String operaterId = "internet";
	String user_type = request.getParameter("user_type") ; 
	String company_name = request.getParameter("company_name");
	String user_name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");

	String policy_type = "01";

	String email = request.getParameter("email");
	String cell_phone = request.getParameter("cell_phone");
	String fax = request.getParameter("fax");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String czipcode = request.getParameter("czipcode");
	String caddress = request.getParameter("caddress");
	String cphone = request.getParameter("cphone");
	String cert_type = request.getParameter("cert_type");
	String cert_class = request.getParameter("cert_class");
	int	ra_result;

	XecureExpConfig xecConfig = new XecureExpConfig ();	
	XecureCAClient ca_client = new XecureCAClient ( xecConfig );

	ra_result = ca_client.registerNewUser ( operaterId, user_type, company_name, 
				user_name, user_id, ssn, policy_type, 
				email,cell_phone, fax, zipcode, address, phone,
                                czipcode, caddress, cphone,
				cert_type, cert_class );

%>

<html>
<head>
<title>XESign Demo V2.1 </title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script language='javascript' src='/XecureExpObjectV2/xecure_exp_signtool_v2.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>
<script language='javascript'>
function cert_request( form )
{
	nRet = RequestCertificateSvr( form.ref_code.value, form.auth_code.value, form.class_id.value );
	if ( nRet == 0 )
		confirm("XecureCA ����������� ���� �������� �߱� �޾ҽ��ϴ�.");
}
</script>
<body bgcolor="#FFFFFF" background="/XecureExpDemoV2/image/back.gif">
<center>

  <img src="/XecureExpDemoV2/image/demo_title.gif" width="523" height="74">
<%
	if ( ra_result == 0 ) {
%> 
  <p><font size="6"><font color="#6699CC"><b>����� ��� Ȯ��</b></font></font></p>
  <p>&nbsp;</p>
<table>
<tr><td>�����</td><td><%=user_name%></td></tr>
<tr><td>���¹�ȣ</td><td><%=account%></td></tr>
<tr><td>�����</td><td><%=ca_client.getResponseFromRegUser("REGDATE")%></td></tr>
<tr><td>��Ϲ�ȣ</td><td><%=ca_client.getResponseFromRegUser("REGSERIAL")%></td></tr>
<tr><td>����� ID</td><td><%=ca_client.getResponseFromRegUser("USERID")%></td></tr>
<tr><td>�ֹε�Ϲ�ȣ</td><td><%=ca_client.getResponseFromRegUser("SSN")%></td></tr>
<tr><td>�����ڵ�</td><td><%=ca_client.getResponseFromRegUser("REFCODE")%></td></tr>
<tr><td>�ΰ��ڵ�</td><td><%=ca_client.getResponseFromRegUser("AUTHCODE")%></td></tr>
<tr><td>������ �뵵</td><td><%=ca_client.getResponseFromRegUser("CERTTYPE")%></td></tr>
<tr><td>������ ���</td><td><%=ca_client.getResponseFromRegUser("CERTCLASS")%></td></tr>
</table>
<br>
<%=request.getParameter("user_name")%>'���� ����� ������ XecureCA ��������� ��� �Ǿ����ϴ�. <br>
<br>���� 'Ȯ��' ��ư�� �����ø� XecureCA ��������������� ���� �������� �߱޹��� �� �ֽ��ϴ�.</p>
    <p><font color="#000000" size="5"> </font> </p>
<form name='auth' onSubmit='cert_request(this); return false;'>
<input type=hidden name='ref_code' value='<%=ca_client.getResponseFromRegUser("REFCODE")%>'>
<input type=hidden name='auth_code' value='<%=ca_client.getResponseFromRegUser("AUTHCODE")%>'>
<input type=hidden name='class_id' value='<%=ca_client.getResponseFromRegUser("CERTCLASS")%>'>
<input type=image src="/XecureExpDemoV2/image/button_ok.jpg" width="180" height="47" border="0">
</form>
<%	}
	else {
%>
<p>		����� ��Ͽ� �����߽��ϴ�.</p>
���� �ڵ� : <%=ca_client.getLastError()%><br>
���� �޽��� : <%=ca_client.getLastErrorMsg()%><br>
<%	}
%> 
 <p>&nbsp;</p>
    <p><a href='cert_main.jsp' ><font color="#000000" size="5">������ ����</font></a> </p>
  </center>
</body>
</html>
