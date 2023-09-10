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
<title>접수 처리 결과</title>
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
                <td width="91"><img src="../../../img/img_main_web05.gif" width="91" height="110"></td>
                <td width="14">&nbsp;</td>
                <td width="1"><img src="../../../jsp/img/dot_gray01.gif" width="1" height="100%"></td>
              </tr>
              <tr> 
                <td width="91">&nbsp;</td>
                <td width="11">&nbsp;</td>
                <td width="1"><img src="../../../jsp/img/line_gray.gif" width="1" height="129"></td>
              </tr>
            </table>
          </td>
          <td valign="top" width="845"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="2%" height="30"></td>
                <td height="34"><img src="../../../img/img_main_web04.gif" width="240" height="15"></td>
              </tr>
              <tr> 
                <td colspan="2"><img src="../../../jsp/img/dot_gray01.gif" width="100%" height="1"></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td align="right">
                  <table width="25%" height=20 border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="50%">
                        <div align="center"><a href="../../index.html">TOP 메뉴</a></div>
                      </td>
                      <td width="50%">
                        <div align="center"><a href="cert_main.jsp" onClick="return XecureLink(this);">이전메뉴</a></div>
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
                  <p align="center"><font size="6" face="Times New Roman, Times, serif">접수 
                    처리 결과</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 
                        <div align="center">
                          <p>&nbsp;</p>
						  
<%
	String reg_date = request.getParameter("reg_date");
	String reg_serial = request.getParameter("reg_serial");
	String policy_type = request.getParameter("policy_type");
	String user_id = request.getParameter("user_id");
	String status;
	int	ra_result;

	PublicRA sfra = new PublicRA ( getXecureConfig() );

	ra_result = sfra.viewRegisterUserResult ( reg_date, reg_serial, policy_type, user_id );

	if ( ra_result != 0 ) {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 오류</font></p>
		error code : <%=sfra.getLastError()%> <br>
		error msg : <%=sfra.getLastErrorMsg()%> <br>
<%
	}
	else {
%>
		<p><font color='#000000' size='5'>접수 처리 조회 성공</font></p>

		<table>
		
		<tr><td>응답메시지</td><td><%=sfra.getResponseFromResultView("MESSAGE")%></td></tr>
		<tr><td>등록일시</td><td><%=sfra.getResponseFromResultView("REGDATE")%></td></tr>
		<tr><td>접수일련번호</td><td><%=sfra.getResponseFromResultView("REGSERIAL")%></td></tr>
		<tr><td>접수처리결과 타입코드</td><td><%=sfra.getResponseFromResultView("REGTYPE")%></td></tr>
		
<%
		if ( sfra.getResponseFromResultView("REGTYPE").equals("1") ) {
%>			
			<tr><td colspan=2>사용자 등록후 인증서를 아직 발급받지 않은 경우</td></tr>
			<tr><td>법인명</td><td><%=sfra.getResponseFromResultView("COMPANY")%></td></tr>
			<tr><td>개인명,법인단체 세부명</td><td><%=sfra.getResponseFromResultView("USERNAME")%></td></tr>
			<tr><td>개인(법인)ID</td><td><%=sfra.getResponseFromResultView("USERID")%></td></tr>
			<tr><td>주민등록번호</td><td><%=sfra.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>참조번호</td><td><%=sfra.getResponseFromResultView("REFCODE")%></td></tr>
			<tr><td>인가코드</td><td><%=sfra.getResponseFromResultView("AUTHCODE")%></td></tr>
			<tr><td>인증정책 식별코드</td><td><%=sfra.getResponseFromResultView("POLICYTYPE")%></td></tr>
			<tr><td>최상위 인증기관 해쉬값</td><td><%=sfra.getResponseFromResultView("ROOTHASH")%></td></tr>
			
<%
		}
		else {
%>		
			
			<tr><td colspan=2>사용자 등록후 인증서를 발급받은 경우</td></tr>
			<tr><td>이벤트발생일</td><td><%=sfra.getResponseFromResultView("EVENTDATE")%></td></tr>
			<tr><td>인증서일련번호</td><td><%=sfra.getResponseFromResultView("SERIAL")%></td></tr>
			<tr><td>이벤트타입코드</td><td><%=sfra.getResponseFromResultView("EVENTTYPE")%></td></tr>
			<tr><td>유효기간시작</td><td><%=sfra.getResponseFromResultView("VALIDFROM")%></td></tr>
			<tr><td>유효기간종료</td><td><%=sfra.getResponseFromResultView("VALIDTO")%></td></tr>
			<tr><td>주민등록번호</td><td><%=sfra.getResponseFromResultView("SSN")%></td></tr>
			<tr><td>인증정책 식별코드</td><td><%=sfra.getResponseFromResultView("POLICYTYPE")%></td></tr>
			<tr><td>가입자DN</td><td>
				<%
					String pubkey = sfra.getResponseFromResultView("DN");
					int i;
					for ( i = 0; i < pubkey.length(); i+=80 ) {
						if ( i + 80 < pubkey.length() )
							out.println ( pubkey.substring( i, i+80 ) );
						else
							out.println ( pubkey.substring( i, pubkey.length() ));
						out.println("<br>");
					}
				%>
			
			    </td></tr>
<%
		}
%>
		</table>
<%
	}
%> 

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
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%">&nbsp;</td>
                      <td> 
                        <p>&nbsp; </p>
                      </td>
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
