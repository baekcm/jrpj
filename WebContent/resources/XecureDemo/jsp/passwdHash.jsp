<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.custom.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<form name='xecure'><input type=hidden name='p'></form>
<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404" CODEBASE="http://phobos.softforum.co.kr:8188/XecureObject/xw50_install.cab#Version=5,0,3,6" width=0 height=0>No XecureWeb 5.0 PlugIn</OBJECT>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<%
        PasswordCrypt crypt1 = null;
		String hash1 = null;
		crypt1 = new PasswordCrypt();
		hash1 = crypt1.encrypt(request.getParameter("passwd1"));

        PasswordCrypt crypt2 = null;
		String hash2 = null;
		crypt2 = new PasswordCrypt();
		hash2 = crypt2.encrypt(request.getParameter("passwd2"));
%>

<title>패스워드 해쉬 결과</title>
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
                        <div align="center"><a href="sign_client.html">이전메뉴</a></div>
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
                  <p align="center"><font size="5" face="Times New Roman, Times, serif">패스워드 해쉬 결과입니다.</font></p>
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
<table border='1' width='100%'>
<tr>
<td width='17%'><strong>결과 1:</strong></td>
<td width='83%'><strong>
<pre>
<%
	if ( hash1 == null ) {
		out.println("오류가 있습니다.<br>");
	}
	else {
		out.println("패스워드 해쉬 성공<br>");
	}
%>
</pre>
</strong></td>
</tr>
<%
	if ( hash1 != null ) {
%>
<tr>
<td width='17%'><strong>해쉬값</strong></td>
<td width='83%'><strong>
<pre>
<%
			out.println ( hash1 );
%>
</pre>
</strong></td>
</tr>
<%
	}
%>
<tr>
<td width='17%'><strong>에러메세지</strong></td>
<td width='83%'><strong>
<pre>
<%
			out.println ( crypt1.getLastErrorMsg() );
%>
</pre>
</strong></td>
</tr>
</table>
<!-- -------------------------------------------------------------  -->
<!--
<tr> 
<td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
</tr>
-->
<table border='1' width='100%'>
<tr>
<td width='17%'><strong>결과 2:</strong></td>
<td width='83%'><strong>
<pre>
<%
	if ( hash2 == null ) {
		out.println("오류가 있습니다.<br>");
	}
	else {
		out.println("패스워드 해쉬 성공<br>");
	}
%>
</pre>
</strong></td>
</tr>
<%
	if ( hash2 != null ) {
%>
<tr>
<td width='17%'><strong>해쉬값</strong></td>
<td width='83%'><strong>
<pre>
<%
			out.println ( hash2 );
%>
</pre>
</strong></td>
</tr>
<%
	}
%>
<tr>
<td width='17%'><strong>에러메세지</strong></td>
<td width='83%'><strong>
<pre>
<%
			out.println ( crypt2.getLastErrorMsg() );
%>
</pre>
</strong></td>
</tr>
</table>
<!--       ------------------------------------- -->
<table border='1' width='100%'>
<tr>
<td width='17%'><strong>패스워드 비교 결과</strong></td>
<td width='83%'><strong>
<pre>
<%
	if ( (hash1!=null && hash2!=null) && hash2.equals(hash1) ) {
		out.println("패스워드가 일치합니다.<br>");
	}
	else {
		out.println("패스워드가 일치하지 않습나다.<br>");
	}
%>
</pre>
</strong></td>
</tr>
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
