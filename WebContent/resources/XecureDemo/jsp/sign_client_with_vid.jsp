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

<form name=signform method=post action='sign_vid_result.jsp' onSubmit='return XecureSubmit(this);'>
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
                    <p align="center"><font size="3"><font size="6" face="Times New Roman, Times, serif">전자 
                      서명 데모</font></font></p>
                    </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>1.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>서명할 데이타</b></td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="24"> 
                          <div align="left"> 
                            <textarea cols=120 rows=15 name='plain'>원문 메시지.....
이 textarea 의 내용이 서명 됩니다.
                            </textarea>
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
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>2.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>서명 메시지</b></td>
                      </tr>
                      <tr> 
                        <td height="24" colspan="3"> 
                          <p> 
                            <textarea cols=120 rows=15 name='signed_msg'></textarea>
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
                        <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>3.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>VID 검증을 위해 암호화 된 데이타</b></td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="24"> 
                          <div align="left"> 
                            <!--
                            <input type=text name="vid_msg" ><br>
                            -->
                            <textarea cols=120 rows=3 name='vid_msg'></textarea>
                          </div>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="24"> <br>
                          <input type=button value='전자서명 (no confirm window, all certificates)' onClick='signform.signed_msg.value = Sign_with_vid_user(0, signform.plain.value, s); vid_msg.value = send_vid_info();' name="Button">
                          <br>
                          <input type=button value='전자서명 (confirm window, all certificates)' onClick='signform.signed_msg.value = Sign_with_vid_user(1, signform.plain.value, s); vid_msg.value = send_vid_info();'>
                          <br>
                          <input type=button value='전자서명 (no confirm window, log-on certificate only)' onClick='signform.signed_msg.value = Sign_with_vid_user(2, signform.plain.value, s); vid_msg.value = send_vid_info();'>
                          <br>
                          <input type=button value='전자서명 (confirm window, log-on certificate only)' onClick='signform.signed_msg.value = Sign_with_vid_user(3, signform.plain.value, s); vid_msg.value = send_vid_info();'>
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
