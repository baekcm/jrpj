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

<!--
<script language='javascript'>
document.writeln( accept_cert );
</script>
-->

<script language='javascript'>
<%
	VidVerifier vid = new VidVerifier(new XecureConfig());
	out.println(vid.ServerCertWriteScript()); 
%>
</script>

<form name=signform method=post action='sign_vid_result2.jsp' onSubmit='return XecureSubmit(this);'>
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
                        <div align="center"><a href="../index.html">TOP �޴�</a></div>
                      </td>
                      <td width="50%">
                        <div align="center"><a href="index.html">�����޴�</a></div>
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
                    <p align="center"><font size="3"><font size="6" face="Times New Roman, Times, serif">���� 
                      ���� ����</font></font></p>
                    </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>1.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>�ֹε�Ϲ�ȣ(����ڵ�Ϲ�ȣ) - ������� ���ڸ� �Է�</b></td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="24"> 
                          <div align="left"> 
                            <input type=text name="idn"><br>
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
                        <td height="24" bgcolor="#DEDBCB"><b>������ ����Ÿ</b></td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="24"> 
                          <div align="left"> 
                            <textarea cols=120 rows=15 name='plain'>���� �޽���.....
�� textarea �� ������ ���� �˴ϴ�.
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
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>3.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>���� �޽���</b></td>
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
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>4.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>VID ������ ���� ��ȣȭ �� ����Ÿ</b></td>
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
                        <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                        <td width="2%" height="24" bgcolor="#DEDBCB"><b>4.</b></td>
                        <td height="24" bgcolor="#DEDBCB"><b>VID ������ ���� ����� �ֹε�Ϲ�ȣ(����� ��Ϲ�ȣ)-������ �ʽ��ϴ�.</b></td>
                      </tr>
					  <tr> 
                        <td colspan="3" height="24"> 
                          <div align="left"> 
                            <!--
                            <input type=text name="vid_msg" ><br>
                            -->
                            <textarea cols=120 rows=3 name='idn_msg'></textarea>
                          </div>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="3" height="24"> <br>
                          <input type=button value='���ڼ��� (no confirm window, all certificates)' onClick='signform.signed_msg.value = Sign_with_vid_web(0, signform.plain.value, s, idn.value); vid_msg.value = send_vid_info();' name="Button">
                          <br>
                          <input type=button value='���ڼ��� (confirm window, all certificates)' onClick='signform.signed_msg.value = Sign_with_vid_web(1, signform.plain.value, s, idn.value); vid_msg.value = send_vid_info();'>
                          <br>
                          <input type=button value='���ڼ��� (no confirm window, log-on certificate only)' onClick='signform.signed_msg.value = Sign_with_vid_web(2, signform.plain.value, s, idn.value); vid_msg.value = send_vid_info();'>
                          <br>
                          <input type=button value='���ڼ��� (confirm window, log-on certificate only)' onClick='signform.signed_msg.value = Sign_with_vid_web(3, signform.plain.value, s, idn.value); vid_msg.value = send_vid_info();'>
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
                          <input type=submit value='������ ����'>
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
