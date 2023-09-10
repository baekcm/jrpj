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

<%
        FileMultiSignVerifier    verifier = null;
        verifier = new FileMultiSignVerifier ( this.getXecureConfig(), request.getParameter("filePath"));
%>

<title>서명 검증 결과</title>
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
                        <div align="center"><a href="javascript:history.back();">이전메뉴</a></div>
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
                  <p align="center"><font size="5" face="Times New Roman, Times, serif">서버로 부터 받은 결과입니다.</font></p>
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
		      					  
<!---BEGIN_ENC1--->
<table border='1' width='100%'>
<tr>
<td width='17%'><strong>검증결과 :</strong></td>
<td width='83%'><strong>
<pre>
<%
	int	nVerifierResult = verifier.getLastError();
	if ( nVerifierResult != 0 ) {
		out.println("서명 확인에 문제가 있습니다.<br>");
		out.println("오류 번호 : " + verifier.getLastError() + "<br>");
		out.println("오류 내용 : " + verifier.getLastErrorMsg() + "<br>");

	}
	else {
		out.println("서명 확인 성공<br>");
	}
%>
</pre>
</strong></td>
</tr>
<%
	if ( nVerifierResult == 0 ) {
%>	
<tr>
<td width='17%'><strong>서명 개수</strong></td>
<td width='83%'><strong>
<pre>
<%=verifier.getNumberOfSigner()%>
</pre>
</strong></td>
</tr>
<tr>
<td width='17%'><strong>서명자 인증서 DN</strong></td>
<td width='83%'><strong>
<pre>
<%
	int nSigner=verifier.getNumberOfSigner();
	int i;
	for(i=0 ; i < nSigner ; i++){
%>
<%=verifier.getSignerSubject(i)%>
<%
	}
%>
</pre>

<%
		Certificate cert;
		int ret;
		String u_name;

	    for(int j = 0; j < nSigner; j++) {
	     	cert = verifier.getSignerCertificate(j);
			YessignCN ycn	= new YessignCN( cert.getSubject("cn") );
			u_name			= ycn.getKName();
	       	ret = cert.VerifyCertificate(cert.getCertPem());
%>
              <tr bgcolor="#FFFFFF"> 
                <td width="160" height="25"> <div align="left"><B>&nbsp;&nbsp;</B>인증서 상태</div></td>
                <td height="25">
<%
			if(ret != 0) {
				out.println(cert.getLastErrorMsg());
			}
			else {
				out.println("정상");
			}
		}
%>
				</td>
              </tr>

</strong></td>
</tr>
<%	
	}
%>

</table>
<!---END_ENC1--->

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
                      <td width="100%">
                        <div align="center"><a href="javascript:history.back();">이전메뉴</a></div>
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
