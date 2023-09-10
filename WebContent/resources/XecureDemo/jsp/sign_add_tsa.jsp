<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<form name='xecure'><input type=hidden name='p'></form>
<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404" CODEBASE="http://phobos.softforum.co.kr:8188/XecureObject/xw50_install.cab#Version=5,0,3,6" width=0 height=0>No XecureWeb 5.0 PlugIn</OBJECT>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<%
	//SignVerifier	verifier = new SignVerifier ( this.getXecureConfig(), request.getParameter("signed_msg") );
	Signer tsa = new Signer(this.getXecureConfig());
	String tsa_msg;
	String sign_msg;
	sign_msg = request.getParameter("signed_msg");
	tsa_msg = tsa.addTimeStampMessage(sign_msg);
	//out.println(tsp_msg);
	
%>

<title>타임스탬프 메시지</title>
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
<form name=signform method=post action='sign_tsa_result.jsp' onSubmit='return XecureSubmit(this);'>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td colspan="2" valign="top"> 
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="92%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
            <td rowspan="2" valign="top" width="106"> 
              <table width="106" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="91"><img src="../img/img_main_web05.gif" width="91" height="110"></td>
                <td width="14">&nbsp;</td>
                 <td width="1"><img src="../img/dot_gray01.gif" width="1" height="110"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="../img/line_gray.gif" width="1" height="129"></td>
              </tr>
            </table>
            </td>
            <td valign="top" width="*%"> 
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
                        <div align="center"><a href="../index.html">TOP 메뉴</a></div>
                      </td>
                      <td width="50%">
                        <div align="center"><a href="index.html">이전메뉴</a></div>
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
                    <p align="center"><font size="3"><font size="6" face="Times New Roman, Times, serif">타임스탬프 
                      데모</font></font></p>
                    </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>2.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>타임스탬프 메시지</b></td>
                      </tr>
                      <tr> 
                        <td height="24" colspan="3"> 
                          <p> 
                            <textarea cols=120 rows=15 name='tsa_msg'>
<%
out.println(tsa_msg);
%>
							</textarea>
                          </p>
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
                        <td colspan="3" height="25"> 
                          <input type=submit value='타임스탬프 검증'>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="63"> <br>
                          <br>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="3"> </td>
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
</form>
</body>
</html>
