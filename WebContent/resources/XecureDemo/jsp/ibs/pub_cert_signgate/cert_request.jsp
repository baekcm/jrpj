<%@ include file= "/XecureObject/xecure.jsp" %>

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
	
	PublicRA sfra = new PublicRA ( ((XecureHttpServletRequest)request).getXecureSession().getXecureConfig() );

	ra_result = sfra.registerNewUser ( operaterId, user_type, company_name, user_name, euser_name, user_id, 
				ssn, policy_type, email,cell_phone, fax, zipcode, address, phone,
                                czipcode, caddress, cphone );

%>


<html>
<head>
<title>����� ��� Ȯ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987"><style type="text/css">
<!--
.font1 { font-size: 9pt;color:#666666;}
td {  font-size: 9pt;color:#333333}
A:link    {font-size:9pt;color:#010824;text-decoration:none; }
A:active  {font-size:9pt;color:#010824;text-decoration:none; }
A:visited {font-size:9pt;color:#010824;text-decoration:none; }
A:hover   {font-size:9pt;color:#0066cc;text-decoration:none; }
-->
</style>
</head>
<!---BEGIN_ENC--->
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<script language='javascript'>
function cert_request( form )
{
	nRet = RequestCertificate_signGate( form.ref_code.value, form.auth_code.value );
	if ( nRet == 0 )
		confirm("��������(SignGate) ��������������� ���� �������� �߱� �޾ҽ��ϴ�.");
}
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td colspan="2" valign="top"> 
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="92%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td rowspan="2" valign="top"> 
            <table width="106" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="91"><img src="../../../img/img_main_web05.gif" width="91" height="110"></td>
                <td width="14">&nbsp;</td>
                <td width="1"><img src="../../../jsp/img/dot_gray01.gif" width="1" height="100%"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="../../../jsp/img/line_gray.gif" width="1" height="129"></td>
              </tr>
            </table>
          </td>
          <td valign="top" width="845"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="2%" height="30"></td>
                <td height="34"><img src="../../../img/img_main_web04.gif" width="240" height="15"></td>
              </tr>
              <tr> 
                <td colspan="2"><img src="../../../jsp/img/dot_gray01.gif" width="100%" height="1"></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td align="right">
                  <table width="25%" height=20 border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="50%">
                        <div align="center"><a href="../../index.html">TOP �޴�</a></div>
                      </td>
                      <td width="50%">
                        <div align="center"><a href='cert_main.jsp' onClick="return XecureLink(this);">�����޴�</a></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="100" width="8%">&nbsp;</td>
                <td height="120" valign="middle"> 
                  <p align="center"><font size="6" face="Times New Roman, Times, serif">����� 
                    ��� Ȯ��</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 
                        <div align="center">
		
<p>&nbsp;</p>				
<%
	if ( ra_result == 0 ) {
%> 
<table>
<tr><td>�����</td><td><%=user_name%></td></tr>
<tr><td>���¹�ȣ</td><td><%=account%></td></tr>
<tr><td>�����</td><td><%=sfra.getResponseFromRegUser("REGDATE")%></td></tr>
<tr><td>��Ϲ�ȣ</td><td><%=sfra.getResponseFromRegUser("REGSERIAL")%></td></tr>
<tr><td>����� ID</td><td><%=sfra.getResponseFromRegUser("USERID")%></td></tr>
<tr><td>�ֹε�Ϲ�ȣ</td><td><%=sfra.getResponseFromRegUser("SSN")%></td></tr>
<tr><td>�����ڵ�</td><td><%=sfra.getResponseFromRegUser("REFCODE")%></td></tr>
<tr><td>�ΰ��ڵ�</td><td><%=sfra.getResponseFromRegUser("AUTHCODE")%></td></tr>
</table>
<br>
<%=request.getParameter("user_name")%>'���� ����� ������ ��������(SignGate) ��������� ��� �Ǿ����ϴ�. <br>
<br>
                          ���� 'Ȯ��' ��ư�� �����ø� ��������(SignGate) ��������������� ���� �������� �߱޹��� 
                          �� �ֽ��ϴ�.
<p><font color="#000000" size="5"> </font> </p>
<form name='auth' onSubmit='cert_request(this); return false;'>
<input type=hidden name='ref_code' value='<%=sfra.getResponseFromRegUser("REFCODE")%>'>
<input type=hidden name='auth_code' value='<%=sfra.getResponseFromRegUser("AUTHCODE")%>'>
<input type=image src="../../../image/button_ok.jpg" width="90" height="24" border="0">
</form>
<%	}
	else {
%>
<p>		����� ��Ͽ� �����߽��ϴ�.</p>
���� �ڵ� : <%=sfra.getLastError()%><br>
���� �޽��� : <%=sfra.getLastErrorMsg()%><br>
<%	}
%> 

						
						</div>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td width="2%" valign="top">&nbsp;</td>
                      <td> 
                        <p>&nbsp;</p>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%">&nbsp;</td>
                      <td> 
                        <p>&nbsp; </p>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td width="2%">&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td width="2%">&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="40">&nbsp;</td>
                <td height="40">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="24" bgcolor="#345B87"> 
      <div align="right"><font color="#FFFFFF"><b><font color="#CED2DB"><a href="http://www.softforum.com"><font color="#FFFFFF">www.softforum.com</font></a></font></b></font></div>
    </td>
    <td height="24" bgcolor="#345B87" width="3%">&nbsp;</td>
  </tr>
</table>
</body>
<!---END_ENC--->
</html>
