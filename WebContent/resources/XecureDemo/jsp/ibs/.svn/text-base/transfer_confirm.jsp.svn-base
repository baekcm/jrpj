<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404">
<COMMENT>
        <EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'>
        <NOEMBED>
</COMMENT>
           No XecureWeb 4.0 PlugIn
        </NOEMBED>
        </EMBED>
</OBJECT>

<form name='xecure'><input type=hidden name='p'></form>

<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<html>
<head>
<title>인터넷뱅킹 계좌이체 확인</title>
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

<!---BEGIN_ENC--->
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
                <td width="91"><img src="../../img/img_main_web05.gif" width="91" height="110"></td>
                <td width="14">&nbsp;</td>
                <td width="1"><img src="../../img/dot_gray01.gif" width="1" height="100%"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="../../img/line_gray.gif" width="1" height="129"></td>
              </tr>
            </table>
          </td>
          <td valign="top" width="845"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="2%" height="30"></td>
                <td height="34"><img src="../../img/img_main_web04.gif" width="240" height="15"></td>
              </tr>
              <tr> 
                <td colspan="2"><img src="../../img/dot_gray01.gif" width="100%" height="1"></td>
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
                        <div align="center"><a href='javascript:history.back();'>이전메뉴</a></div>
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
                  <p align="center"><font face="Times New Roman, Times, serif" size="6">인터넷뱅킹 계좌이체 확인</font></p>
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

		    <tr bgcolor="#FFFFFF"> 
                      <td colspan="3" height="24"> 
                 
                        
<script language='javascript'>
function sign_and_submit(form)
{
	msg = "<%=new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn"))%>->임꺽정\n";
	msg += "계좌번호 : <%=request.getParameter("account")%>\n";
	msg += "이체금액 : <%=request.getParameter("money")%>\n";
	//form.signed_msg.value = Sign( msg );
	form.signed_msg.value = Sign_with_option(2, msg);
	if ( form.signed_msg.value == "" )
		return false;
	return XecureSubmit(form);
}
</script>
<center>
<br>
  <p><font color="#000000">'<b><%=new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn")
)%></b>' 님께서 입력하신 내용은 다음과 같습니다.</font></p>
  <form name="form1" method=post action='transfer_tr.jsp' onSubmit='return sign_and_submit(this);'>
	<input type=hidden name=signed_msg>
<table border=1>
<tr>
	<td width=100>이체은행</td>
	<td width=200><%=new String( request.getParameter("bank").getBytes(), "EUC-KR" )%></td>
</tr>
<tr>	<td>계좌번호</td>
	<td><%=request.getParameter("account")%></td>
</tr>
<tr>	<td>예금주</td>
	<td>임꺽정</td>
</tr>
<tr>	<td>이체금액</td>
	<td><%=request.getParameter("money")%> 원</td>
</tr>
</table>	
    <p><font color="#000000">입력하신 내용이 맞는지 확인하시고 이체하시려면 확인을 누르십시오.</font></p>
    <p><font color="#000000" size="3"> </font> </p>
	<p><input type=image src="/XecureDemo/image/button_ok.jpg" width="90" height="24" border="0"></p>
    </form>
  <p>&nbsp;</p>
  </center>







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
<!---END_ENC--->
</html>
