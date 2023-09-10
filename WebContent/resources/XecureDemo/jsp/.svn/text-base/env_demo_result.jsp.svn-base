<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<!--- %@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  % --->
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="xecure.crypto.jni.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>웹브라우져로부터 입력받은 결과입니다</title>
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
                <td width="1"><img src="img/dot_gray01.gif" width="1" height="100%"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="img/line_gray.gif" width="1" height="129"></td>
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
                <td colspan="2"><img src="img/dot_gray01.gif" width="100%" height="1"></td>
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
                        <div align="center"><a href="env_demo.jsp">이전메뉴</a></div>
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
                  <p align="center"><font face="Times New Roman, Times, serif" size="5">WebBrowser로부터 입력받은 결과입니다.</font></p>
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

<!---_BEGIN_ENC--->
<table border='1' width='100%%'>
	<tr>
	<td width='17%%'><strong>예약번호 :</strong></td>
	<td width='83%%'><strong>
		<%= request.getParameter("ReserveNum")%>
	</strong></td>
	</tr>
	
	<tr>
	<td width='17%%'><strong>금액 :</strong></td>
	<td width='83%%'><strong>
		<%= request.getParameter("fee" ) %>
	</strong></td>
	</tr>
	
	<tr>
	<td width='17%%'><strong>카드번호 :</strong></td>
	<td width='83%%'><strong>
		<%= request.getParameter("CreditNo" ) %>
	</strong></td>
	</tr>
	<tr>
	
	<td width='17%%'><strong>유효기간 :</strong></td>
	<td width='83%%'><strong>
		<%=request.getParameter("Year" ) + "/" + request.getParameter("Month" )%>
	</strong></td>
	</tr>
	<tr>
	<td width='17%%'><strong>결재방법 :</strong></td>
	<td width='83%%'><strong>
		<%=request.getParameter("Pay" )%>
	</strong></td>
	</tr>
</table>

<%
	EnvelopeData	Enveloper = new EnvelopeData (new XecureConfig());
	String deEveloped = Enveloper.deEnvelopeData(request.getParameter("enveloped_msg"));

	if ( Enveloper.getLastError() != 0 ) {
		out.println("DeEnvelope 결과 : " + Enveloper.getLastErrorMsg() + "<br>");
		out.println("오류 번호 : " + Enveloper.getLastError() + "<br>");
	}
	else {
		out.println("DeEnvelope 결과 : DeEnvelope 성공<br>");
	}

	out.println("Envelope문 <pre>\n");

	String em = request.getParameter("enveloped_msg");
	int i;
	for ( i = 0; i < em.length(); i+=80 ) {
		out.print( "\t\t");
		if ( i + 80 < em.length() ) 
			out.println ( em.substring( i, i+80 ) );
		else
			out.println ( em.substring( i, em.length() ));
	}
	out.println("</pre>\n"); 
	out.println("DeEnvelope된 메시지 원본 : <pre>\n" + deEveloped + "\n</pre><br><br>");

	String pem1="";
/*
		pem1 +="-----BEGIN CERTIFICATE-----\n";
		pem1 +="MIIDKjCCApOgAwIBAgIEC+vKZTANBgkqhkiG9w0BAQQFADBhMQswCQYDVQQGEwJL\n";
		pem1 +="UjELMAkGA1UECBMCYWExCzAJBgNVBAcTAmFhMQswCQYDVQQKEwJhYTELMAkGA1UE\n";
		pem1 +="CxMCYWExCzAJBgNVBAMTAmFhMREwDwYJKoZIhvcNAQkBFgJhYTAeFw0wMTA2MjIw\n";
		pem1 +="MDAwMDBaFw0wMjA2MjIxMTI4NTFaMHkxCzAJBgNVBAYTAktSMQ4wDAYDVQQHFAVu\n";
		pem1 +="bm5ubjEOMAwGA1UEChQFbm5ubm4xDjAMBgNVBAsUBW5ubm5uMQ4wDAYDVQQDFAVu\n";
		pem1 +="bm5ubjEUMBIGCSqGSIb3DQEJARYFbm5ubm4xFDASBgkqhkiG9w0BCQIWBW5ubm5u\n";
		pem1 +="MIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgEH2PINr/FgnE88AS7xuJV6kusqT\n";
		pem1 +="eWzb6MPiUuCEwzBJvwP7BK2xVevGwaGYUiZOBxTuIM5ZOmgipOQU0xnuB7SzKDq7\n";
		pem1 +="4vzCC7zkw/FKOkCBfaBEbmuk1q3z7j0TwtDvn+zxF+Kd/1dih/RzObmbazoQci1B\n";
		pem1 +="kDGc47dMKkmFUchjAgMBAAGjgdcwgdQwagYJYIZIAYb4QgENBF0WW1lvdXIgQ2Vy\n";
		pem1 +="dGlmaWNhdGUgaXMgZHVlIHVwdG8gMSB5ZWFyLiBZb3UgaGF2ZSB0byByZWlzc3Vl\n";
		pem1 +="IHlvdXIgY2VydGlmaWNhdGUgYmVmb3JlIGl0IGV4cGlyZXMwIgYJYIZIAYb4QgEC\n";
		pem1 +="BBUWE3d3dy5zb2Z0Zm9ydW0uY28ua3IwEQYJYIZIAYb4QgEBBAQDAgCAMC8GCWCG\n";
		pem1 +="SAGG+EICBQQiFiBkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZTANBgkq\n";
		pem1 +="hkiG9w0BAQQFAAOBgQCyebfQ9QTKLcgGpfgCy/u2GCQZkOd/fTdRhOkc3vhGowzS\n";
		pem1 +="rPI3UXoANLb3L/VqGti/eNsunJSOCLi+x6hHMzejm5z6052QsXIH5FjQMTHmV/sE\n";
		pem1 +="gBhx7tlMkZGMs7KHS29a2Oiwd3aA7FmqBsA9kHrLpo6EtLdf+vgzixnDhLMm7A==\n";
		pem1 +="-----END CERTIFICATE-----\n";
*/
		pem1 +="-----BEGIN CERTIFICATE-----\n";
		pem1 +="MIIEnzCCBAigAwIBAgICAekwDQYJKoZIhvcNAQEFBQAwUDELMAkGA1UEBhMCS1Ix";
		pem1 +="HDAaBgNVBAoTE0dvdmVybm1lbnQgb2YgS29yZWExEjAQBgNVBAsMCeuzkeustOyy";
		pem1 +="rTEPMA0GA1UEAxMGbW1hIGNhMB4XDTA0MDEyMDAyMjIwM1oXDTA3MTAyMzAwMDAw";
		pem1 +="MFowaDELMAkGA1UEBhMCa3IxHDAaBgNVBAoTE0dvdmVybm1lbnQgb2YgS29yZWEx";
		pem1 +="EjAQBgNVBAsMCeuzkeustOyyrTEPMA0GA1UECxMGcGVvcGxlMRYwFAYDVQQDEw1n";
		pem1 +="cGtpMDEyMGt5aDAwMIIBtzCCASwGCCqDGoyaRAEVMIIBHgKBgQCWCxOswkesWqRd";
		pem1 +="0LarPv4wdPBmRxp/vzbZlEAMdes5wLV2r49LRs0FqM5m+EksNIgzm415Cb2XSgcT";
		pem1 +="qBC9jtu6XmgaXKnYUsotLVKi588+EgZhdMfDGfSPi/YONXfkyxbE2uU54bAuB7wQ";
		pem1 +="D3C8IzNIM8ZVQds6ohyY+ryfpy+QrwIVANwNV7JcOf11JIei2HXF5j1WLMcrAoGA";
		pem1 +="Ow0PGYA43ztT/S9DECilB4W7hUVXKCEJq1cnjK8idQRcngYczMtu1+DhWR9mg1/I";
		pem1 +="1zwyPC1Se7aAqdP90SpIyOamlOZDuplMNUvj8hU5m/cB6TRUDtfKX8kU8LSCIzTd";
		pem1 +="GNQy64UHq5AiXk7q7lwaMcz0c9YhEEBByOwxar4ZgNgDgYQAAoGAQ++jY9tRAIoA";
		pem1 +="Zg4S2a/2mtL5WZvEXYuCn9PtORr5k9c4D5LvdNxSODusBpfftG2Ti9wIxtqO25D0";
		pem1 +="11Rf3QGIQUji7Kga4Ah/QLPXQ9wC91Swv0/A7kknmRGf///f9DW9iseYdz1TZv0q";
		pem1 +="5CTib6AZX8xsZOLtiDfHGiQJtb2vKwujggFVMIIBUTAfBgNVHSMEGDAWgBTee6xO";
		pem1 +="hWi7N0n5SwoPl6vu6JDU5TAdBgNVHQ4EFgQU4HhpTemKkTg9VxYUkBfKFXFFdDww";
		pem1 +="DgYDVR0PAQH/BAQDAgeAMBYGA1UdIAQPMA0wCwYJKoMaho0hBQYBMIHTBgNVHR8E";
		pem1 +="gcswgcgwZKBioGCGXmxkYXA6Ly8xOTIuMTY4LjEwLjI1OjM4OS9jbj1tbWEgY2Es";
		pem1 +="bz1Hb3Zlcm5tZW50IG9mIEtvcmVhLGM9a3I/Y2VydGlmaWNhdGVSZXZvY2F0aW9u";
		pem1 +="bGlzdDtiaW5hcnkwYKBeoFyGWmxkYXA6Ly8laG9zdCU6JXBvcnQlL2NuPW1tYSBj";
		pem1 +="YSxvPUdvdmVybm1lbnQgb2YgS29yZWEsYz1rcj9jZXJ0aWZpY2F0ZVJldm9jYXRp";
		pem1 +="b25saXN0O2JpbmFyeTARBglghkgBhvhCAQEEBAMCBaAwDQYJKoZIhvcNAQEFBQAD";
		pem1 +="gYEAJVEZJZpV76AuYxFJRTNWBgjflmpsjfmYzfAnfhOyedR/iizPw5wAL6nuHlva";
		pem1 +="1ETdjgXoE+hIqtj82GtkguHKUQSfW+T/3i/S139+CxXJ7Zsc4Hn3+aLFDSr0msWb";
		pem1 +="OHMQ6ea6eXPPsdyDfuBBfw7LOLlxj022/0PWmDu8Krr+/d8=\n";
		pem1 +="-----END CERTIFICATE-----\n";

	XecureLib xecureLib = new XecureLib(new XecureConfig());
	String serverCert = new String(xecureLib.getServerCertPem());

	String sem = "계좌이체가 성공적으로 이루어졌습니다.";
	String enveloped = Enveloper.envelopeData(serverCert, sem);
//	if(Enveloper.getLastError()==0)
//		out.println("enveloped : "+enveloped);
//	else
//		out.println("오류 :"+Enveloper.getLastError()+Enveloper.getLastErrorMsg());
	
%>
<!---_END_ENC--->
<%
/*	out.println("<script>");
	out.println("var devloped = UnsealData('" + enveloped + "');");
	out.println("alert(devloped);");
	out.println("</script>");
*/
%>



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
