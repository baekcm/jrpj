<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
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
	String corp_code = request.getParameter("corp_code");
	String org_code = request.getParameter("org_code");
	String orgid_code = request.getParameter("orgid_code");
	int	ca_result;

	XecureConfig xecConfig = new XecureConfig ();	
	XecureCA ca_client = new XecureCA ( xecConfig );

	ca_result = ca_client.registerPreNewUser ( operaterId, user_type, company_name, 
																		user_name, user_id, ssn, policy_type, 
																		email,cell_phone, fax, zipcode, address, phone,
                														czipcode, caddress, cphone,
																		cert_type, cert_class, corp_code,
																		org_code, orgid_code);

%>

<html>
<head>
<title>사용자 등록 확인</title>
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

<form name='xecure'><input type=hidden name='p'></form>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>


<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<script language='javascript'>
function cert_request( form )
{
	nRet = RequestCertificate( "14", form.ref_code.value, form.auth_code.value );
	if ( nRet == 0 )
		confirm("XecureCA 인증기관으로 부터 인증서를 발급 받았습니다.");
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
                        <div align="center"><a href="../../index.html">TOP 메뉴</a></div>
                      </td>
                      <td width="50%">
                        <div align="center"><a href="cert_main.jsp" onClick="return XecureLink(this);">이전메뉴</a></div>
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
                  <p align="center"><font size="4" face="Times New Roman, Times, serif">사용자 사전
                    등록 확인</font></p>
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
	if ( ca_result == 0 ) {
%> 

<table>
<tr><td>사용자</td><td><%=user_name%></td></tr>
<tr><td>계좌번호</td><td><%=account%></td></tr>
<tr><td>등록일</td><td><%=ca_client.getResponseFromPreRegUser("MESSAGE")%></td></tr>
</table>
<br>
<%=request.getParameter("user_name")%>'님의 사용자 정보가 XecureCA 인증기관에 사전 등록 되었습니다. <br>
<p><font color="#000000" size="5"> </font> </p>
</form>
<%	}
	else {
%>
<p>		사용자 사전등록에 실패했습니다.</p>
에러 코드 : <%=ca_client.getLastError()%><br>
에러 메시지 : <%=ca_client.getLastErrorMsg()%><br>
xecConfig.getXecureCaHost() : <%= xecConfig.getXecureCaHost()%> <br>
xecConfig.getXecureCaPort() : <%= xecConfig.getXecureCaPort()%> <br>

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
</html>
