<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="xecure.crypto.jni.*" %>
<%@ page import="java.io.*" %>

<%
	String plainText = "서버 서명문입니다.";
	Signer signer = new Signer(new XecureConfig());
	String signedMsg = signer.signMessage_CMS(plainText);
%>

<html>
<head>
<title>XecureWeb Demo</title>
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
</head>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>

<form name='xecure' ><input type=hidden name='p'></form>

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
                    <p align="center"><font size="3"><font size="6" face="Times New Roman, Times, serif">서버 
                      서명 데모</font></font></p>
                    </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="1%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                        <td width="1%" height="24" bgcolor="#DEDBCB"><b>1.</b></td>
                        <td height="24" bgcolor="#DEDBCB" colspan="2"><b>서버 서명문</b></td>
                      </tr>
                      <tr> 
                        <td width="2%" height="48"> 
                          <div align="left"> </div>
                          <p>&nbsp; </p>
                        </td>
                        <td width="2%" height="48">&nbsp;</td>
                        <td height="96">
                          <table width="530" border="0" cellpadding="0" cellspacing="0">
							<tr>
                              <td><font face="Courier New, Courier, mono" size="2">
							  <%
								for(int i=0 ; i < signedMsg.length() ; i+=80)
									if(i+80 < signedMsg.length())
										out.println(signedMsg.substring(i, i+80));
									else
										out.println(signedMsg.substring(i));
							  %>
							  </font></td>
                            </tr>
						  </table>
                        </td>
                        <td height="96" width="2%">&nbsp;</td>
                      </tr>
                      <tr> 
		            

                      </tr>
                      <tr> 
                        <td colspan="4"> 
                          <div align="center"> 
                            <p>&nbsp;</p>
                            <p><font face="Arial, Helvetica, sans-serif" size="3"><b>서버 
                              서명문 전송</b></font></p>

<form  action='sign_demo_result.jsp' method='POST' onSubmit='return XecureSubmit(this);' >
<input type=hidden name=signed_msg VALUE="<%=signedMsg%>" />
<input type=submit VALUE="전송" />
</form>

                          </div>
                        </td>
                      </tr>

                   </table>
                </td>
              </tr>
              <tr> 
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
