<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="xecure.crypto.jni.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<form name='xecure'><input type=hidden name='p'></form>
<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404" CODEBASE="http://phobos.softforum.co.kr:8188/XecureObject/xw50_install.cab#Version=5,0,3,6" width=0 height=0>No XecureWeb 5.0 PlugIn</OBJECT>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<%
	String path = request.getRealPath("");
	path += "/jsp/pem/cert2.pem";

	XecureLib xecureLib = new XecureLib(new XecureConfig());

	EnvelopeFile envelope = new EnvelopeFile(this.getXecureConfig());

	byte[][] certs = new byte[2][];
	
	byte[] serverCert = new XecureLib(this.getXecureConfig()).getServerCertPem();

	InputStream otherCert = new FileInputStream(path);

	certs[0] = new byte[serverCert.length];
	certs[1] = new byte[otherCert.available()];

	System.arraycopy(serverCert, 0, certs[0], 0, serverCert.length);

	int offset = 0;
	int numRead = 0;

	while (offset < certs[1].length && (numRead=otherCert.read(certs[1], offset, certs[1].length-offset)) >= 0) 
	{
		offset += numRead;
	}
										    
	// Ensure all the bytes have been read in
	if (offset < certs[1].length) 
	{
   		throw new IOException("Could not completely read file "+ "cert2.pem");
	}

	otherCert.close();

	int err = envelope.multiCertsEnvFileCMS(
					 certs,
					 request.getParameter("fileIn"),
					 request.getParameter("fileOut"));
%>

<title>�������� ��ȣȭ ���(FILE, ������)</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-Cache"><style type="text/css">
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
                <td width="91"><img src="../img/img_main_web05.gif" width="91" height="110"></td>
                <td width="14">&nbsp;</td>
                <td width="1"><img src="../img/dot_gray01.gif" width="1" height="100%"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="../img/line_gray.gif" width="1" height="129"></td>
              </tr>
            </table>
          </td>
          <td valign="top" width="845"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="2%" height="30"></td>
                <td height="34"><img src="../img/img_main_web04.gif" width="240" height="15"></td>
              </tr>
              <tr> 
                <td colspan="2"><img src="../img/dot_gray01.gif" width="100%" height="1"></td>
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
                        <div align="center"><a href="sign_client.html">�����޴�</a></div>
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
                  <p align="center"><font size="5" face="Times New Roman, Times, serif">���ں��� ��ȣȭ ����Դϴ�.(FILE, ������)</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"></td>
                    </tr>                   
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%">&nbsp;</td>
                      <td> 
                        <p>&nbsp; </p>
                      </td>
                    </tr>               
		    <tr bgcolor="#FFFFFF"> 
		      <td colspan="3" height="24" bgcolor="#FFFFFF">
		      					  
<!---BEGIN_ENC--->
<form name=envelopeForm method=post action='env_demo_file_result.jsp' onSubmit='return XecureSubmit(this);'>
<table border='1' width='100%'>
<tr>
<td width='17%'><strong>��� :</strong></td>
<td width='83%'><strong>
<pre>
<%
	int	result = envelope.getLastError();
	if ( result != 0 ) {
		out.println("������ �ֽ��ϴ�.<br>");
		out.println("���� ��ȣ : " + envelope.getLastError() + "<br>");
		out.println("���� ���� : " + envelope.getLastErrorMsg() + "<br>");
	}
	else {
		out.println("���ں��� ����<br>");
	}
%>
</pre>
</strong></td>
</tr>
<%
	if ( result == 0 ) {
%>
<tr>
<td width='17%'><strong>���ں��� ����</strong></td>
<td width='83%'><strong>
<pre>
<%
	out.println ( "���� ȭ�� :"+request.getParameter("fileIn") );
	out.println ( "��� ȭ�� :"+request.getParameter("fileOut") );
%>
</pre>
</strong></td>
</tr>
<tr>
<td><strong>DeEnvelope�� ȭ�� ���</strong>
</td>
<td>
<input type=text name='fileIn' size=100 value='<%=request.getParameter("fileOut")%>'></input>
</td>
</tr>
<tr>
<td><strong>DeEnvelope�� ������ ������ ȭ�� ���</strong>
</td>
<td>
<input type=text name='fileOut' size=100 value='<%=request.getParameter("fileIn")+".org_cert"%>'></input>
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type=submit value='����'>
</td>
</tr>
<%
	} else {
%>

<%
	}
%>
</table>
</form>
<!---END_ENC--->

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
</html>
