<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>XecureWeb Demo</title>
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
</head><body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form name='xecure'><input type=hidden name='p'></form>
<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>

<script language='javascript'>
//document.writeln( accept_cert );
</script>

<script language='javascript'>
<%
	VidVerifier vid = new VidVerifier(new XecureConfig());
	out.println(vid.ServerCertWriteScript());
%>
</script>

<form name=GetUserHWInfoForm method=post action='GetUserHWInfo_result.jsp' onSubmit='return XecureSubmit(this);'>
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
                    <p align="center"><font size="3"><font size="6" face="Times New Roman, Times, serif">PC Hardware 정보 가져오기 API 테스트</font></font></p>
                    </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
			<td height="24" bgcolor="#DEDBCB"> <p align="center"><b>&nbsp&nbsp&nbsp&nbsp&nbsp HW 정보 전자봉투 내용</b></p></td>
		</tr>
		<tr> 
				<td>
				<textarea name="enveloped_hwinfo_data" readonly="true" rows="15" cols="80">
				</textarea>
				<input type="button" value="GetUserHWInfo - HDD Serial" onClick="GetUserHWInfoForm.enveloped_hwinfo_data.value=GetUserHWInfo(1, s);"/>
				<input type="button" value="GetUserHWInfo - MAC Address" onClick="GetUserHWInfoForm.enveloped_hwinfo_data.value=GetUserHWInfo(2, s);"/>
				<input type="button" value="GetUserHWInfo - IP Address" onClick="GetUserHWInfoForm.enveloped_hwinfo_data.value=GetUserHWInfo(4, s);"/>
				<!--input type="button" value="삭제" onClick="hash_form.hashed_data.value='';"/-->
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
                          <input type=submit value='서버로 전송'>
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
