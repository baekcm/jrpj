<%@ page contentType="text/html; charset=euc-kr" %>


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
A:hover   {font-size:9pt;color:#FF6600;text-decoration:none; }
-->
</style>
</head>



<script language=javascript src="/XecureObject/xecureweb.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td colspan="2"> 
      <table width="680" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td rowspan="4" width="168" height="232"><img src="../../../img/img_main_web01.gif" width="168" height="202"></td>
          <td rowspan="4" width="13"><img src="../../../img/dot_trans.gif" width="13" height="8"></td>
          <td rowspan="7"><img src="../../../img/dot_gray01.gif" width="1" height="100%"></td>
          <td width="13"><img src="../../../img/dot_trans.gif" width="13" height="8"></td>
          <td width="485" height="60"><img src="../../../img/img_main_web02.gif" width="269" height="35"></td>
        </tr>
        <tr> 
          <td colspan="2"><img src="../../../img/dot_gray01.gif" width="100%" height="1"></td>
        </tr>
        <tr> 
          <td width="13" rowspan="2"><img src="../../../img/dot_trans.gif" width="13" height="8"></td>
          <td width="485" height="43"><img src="../../../img/img_main_pkitext.gif" width="267" height="18"></td>
        </tr>
        <tr> 
          <td width="485" valign="top"> 
            <p>XecureWeb은 향상된 보안을 위하여 다양한 언어를 지원합니다. PHP, JSP등 웹개발을 위한 다양한 예제를 
              참고하신후 업무에 활용하시기 바랍니다.</p>
            </td>
        </tr>
        <tr> 
          <td width="168"></td>
          <td width="13"></td>
          <td width="13"></td>
          <td width="485"><img src="../../../img/dot_trans.gif" width="13" height="38"></td>
        </tr>
        <tr> 
          <td width="168">&nbsp;</td>
          <td width="13">&nbsp;</td>
          <td width="13">&nbsp;</td>
          <td valign="top"> 
            <table width="200" border="0" cellpadding="0" cellspacing="0">

              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_register.jsp" onClick="return XecureLink(this);">[Client] 인증서 발급</a></td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
<!--              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_renew.jsp" onClick="return XecureLink(this);">[Client] 인증서 갱신</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
-->
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_revoke.jsp" onClick="return XecureLink(this);">[Client] 인증서 폐기</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <!--
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_register_svr.jsp">[Server] 인증서 발급</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_renew_svr.jsp">[Server] 인증서 갱신</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_revoke_svr.jsp">[Server] 인증서 폐기</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              -->
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_man.jsp" onClick="return XecureLink(this);">인증서 조회 / 상태 변경</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="result_view.jsp" onClick="return XecureLink(this);">접수 처리 결과 조회</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="cert_request_offline.jsp" onClick="return XecureLink(this);">참조/인가코드 인증서 발급</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <!--
			  <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="random_gen.jsp" onClick="return XecureLink(this);">Random Generator</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="" onClick="CertManager(); return false;">인증서 관리자</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="" onClick="TNCShotDown(); return false;">TNC Shot Down</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
			  -->
			  
	     <tr> 
                <td height="30"> 
                  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#9DA3A7" height="24">
                    <tr> 
                      <td bgcolor="#F5F5F5">&nbsp;&nbsp;<a href="test.jsp" onClick="return XecureLink(this);">Test Anything</td>
                      <td bgcolor="#FFFFFF" width="10%">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <p>&nbsp;</p>
          </td>
        </tr>
		
        <tr> 
          <td width="170">&nbsp;</td>
          <td width="14">&nbsp;</td>
          <td width="13">&nbsp;</td>
          <td width="483">&nbsp;</td>
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
