<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404">
<COMMENT>
        <EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'>
        <NOEMBED>
</COMMENT>
           No XecureWeb 4.0 PlugIn
        </NOEMBED>
        </EMBED>
</OBJECT>

<form name='xecure'><input type=hidden name='p'></form>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<html>
<head>
<title>���ͳݹ�ŷ ������ü</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"><style type="text/css">
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

<%=request.getServerName() %>

<!---BEGIN_ENC--->
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
                <td width="91"><img src="../../img/img_main_web05.gif" width="91" height="110"></td>
                <td width="14">&nbsp;</td>
                <td width="1"><img src="../../img/dot_gray01.gif" width="1" height="100%"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="../../img/line_gray.gif" width="1" height="129"></td>
              </tr>
            </table>
          </td>
          <td valign="top" width="845"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="2%" height="30"></td>
                <td height="34"><img src="../../img/img_main_web04.gif" width="240" height="15"></td>
              </tr>
              <tr> 
                <td colspan="2"><img src="../../img/dot_gray01.gif" width="100%" height="1"></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td align="right">
                  <table width="25%" height=20 border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="50%">
                        <div align="center"></div>
                      </td>
                      <td width="50%">
                        <div align="center"><a href='javascript:history.back();'>�����޴�</a></div>
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
                  <p align="center"><font face="Times New Roman, Times, serif" size="6">���ͳݹ�ŷ ������ü</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><font color="#000000"><b>������ü 
                        �������� ���¸� �Է��Ͻʽÿ�. </b></font></td>
                    </tr>                   
				    <tr bgcolor="#FFFFFF"> 
                      <td colspan="3" height="24"> 
                        <%
                
        Certificate user_cert = ((XecureHttpServletRequest)request).getXecureUserCert();
	int	cert_location = ((XecureHttpServletRequest)request).getXecureSession().getCertLocation();
	//kmb test
	String uid = ((XecureHttpServletRequest)request).getXecureUserId();
	out.println("userid [" + uid +"]");
	if(uid.equals("$")) {

		PublicOCSP	ocsp = new PublicOCSP ( this.getXecureConfig() );
		ocsp.registerCertificate("12345", user_cert.getCertPem());

		int	nResult = ocsp.getLastError();
		if ( nResult != 0 ) {
			//out.println(verifier.getSignerCertificate().getCertPem());
			out.println("���� ��ȣ : " + ocsp.getLastError() + "<br>");
			out.println("���� �޽��� : " + ocsp.getLastErrorMsg() + "<br>");

		}
		else {
			out.println("Ÿ��������� ��ϼ���<br>");

			out.println("���� Code: " + ocsp.getResponseFromOCSP("CODE") + "<br>");
			out.println("����޽��� : " + ocsp.getResponseFromOCSP("MESSAGE") + "<br>");
			out.println("�������������ð� : " + ocsp.getResponseFromOCSP("PRODUCEAT") + "<br>");
			out.println("�߱���DN : " + ocsp.getResponseFromOCSP("ISSUERDN") + "<br>");
			out.println("�������ø��� : " + ocsp.getResponseFromOCSP("CERTSERIAL") + "<br>");
			out.println("���������� : " + ocsp.getResponseFromOCSP("CERTSTATUS") + "<br>");
			out.println("���ð� : " + ocsp.getResponseFromOCSP("REVOKETIME") + "<br>");
			out.println("������� : " + ocsp.getResponseFromOCSP("REVOKEREASON") + "<br>");
		}
		
	}	
	
	String	location_str;

	if ( user_cert != null ) {	
		if ( cert_location == 0 ) location_str = new String("�ϵ��ũ KeyDB"); 
		else if ( cert_location == 1 ) location_str = new String("�÷��ǵ�ũ"); 
		else if ( cert_location == 2 ) location_str = new String("IC ī��");
		else if ( cert_location == 3 ) location_str = new String("CSP");
		else if ( cert_location == 4 ) location_str = new String("Virtual Smart Card");
		else location_str = null;
	 
		if ( user_cert.isSFCAcert() ) {
                        out.println("<br>");
			out.println("�缳������� " + user_cert.getIssuer() + " ���� �߱��� �������� �α��� �ϼ̽��ϴ�.<br><br>" );
			out.println("'<b>" + user_cert.getSubject("cn") + "</b>'�� ȯ���մϴ�.");
			if ( location_str != null ) 
				out.println("<br>����� �������� <b>" + location_str + "</b>���� �����Խ��ϴ�.<br>"); 			
			out.println( "<table border=1>");
			out.println( "<tr><td>������ DN</td><td>" + user_cert.getSubject() + "</td></tr>" );
			out.println( "<tr><td>������ CN</td><td>" + user_cert.getSubject("cn") + "</td></tr>" );
			out.println( "<tr><td>ID</td><td>" + user_cert.getSubject("id") + "</td></tr>" );
			out.println( "</table>");
		}
		else {
                        out.println("<br>");
			out.println("����������� " + user_cert.getIssuer() + " ���� �߱��� �������� �α��� �ϼ̽��ϴ�.<br><br>" );
			YessignCN ycn = new YessignCN ( user_cert.getSubject("cn") );
			out.println("'<b>" + ycn.getKName() + "</b>'�� ȯ���մϴ�.<br><br>");
			if ( location_str != null ) 
				out.println("<br>����� �������� <b>" + location_str + "</b>���� �����Խ��ϴ�.<br>"); 			

			out.println( "<table border=1>");
			out.println( "<tr><td>������ DN</td><td>" + user_cert.getSubject() + "</td></tr>" );
			out.println( "<tr><td>������ CN</td><td>" + user_cert.getSubject("cn") + "</td></tr>" );
			out.println( "<tr><td>�����̸�</td><td>" + ycn.getEName() + "</td></tr>" );
			out.println( "<tr><td>������ ��ϱ�� �ڵ�</td><td>" + ycn.getOrgCode() + "</td></tr>" );
			out.println( "<tr><td>������ ����� �˸� ����(User Notice)</td><td>" + user_cert.getUserNotice() + "</td></tr>" );
			out.println( "<tr><td>������ ��å URL(CPS)</td><td>" + user_cert.getCPS() + "</td></tr>" );
			out.println( "<tr><td>ID</td><td>" + ycn.getId() + "</td></tr>" );
			out.println( "</table>");
		}
	}
%>
                        <form name="form1" method='post' action='transfer_confirm.jsp' onSubmit='return XecureSubmit(this);'>
                          <p>&nbsp;</p>
                          <div align="center">
                            <table>
                              <tr> 
                                <td>����</td>
                                <td>
                                  <select name="bank">
                                    <option selected value="��������">��������</option>
                                    <option value="��������">��������</option>
                                    <option value="��ȯ����">��ȯ����</option>
                                    <option value="�츮����">�츮����</option>
                                    <option value="�������">�������</option>
                                    <option value="�ѹ�����">�ѹ�����</option>
                                  </select>
                                </td>
                              </tr>
                              <tr> 
                                <td>���¹�ȣ</td>
                                <td>
                                  <input type="text" name="account" maxlength="20" size="20">
                                </td>
                              </tr>
                              <tr> 
                                <td>��ü �ݾ�</td>
                                <td>
                                  <input type="text" name="money" size="20" maxlength="20">
                                  ��</td>
                              </tr>
                              <tr> 
                                <td>���� ��й�ȣ</td>
                                <td>
                                  <input type="password" name="pwd" size="20" maxlength="20">
                                </td>
                              </tr>
                              <tr> 
                                <td>��ü ��й�ȣ</td>
                                <td>
                                  <input type="password" name="tr_pwd" size="20" maxlength="20">
                                </td>
                              </tr>
                            </table>
                          <p>&nbsp;</p></div>
                          <div align="center"></div>
                          <p align="center"> 
                            <input type='image' src="/XecureDemo/image/button_ok.jpg" width="90" height="24" border="0">
                          </p>
</form>







                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%">&nbsp;</td>
                      <td> 
                        <p>&nbsp; </p>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
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
