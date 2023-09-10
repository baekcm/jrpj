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

<%

	//String is_corp= request.getParameter("corporate");
	String user_policy_type = request.getParameter("user_policy_type");
	String serial = request.getParameter("serial");
	String id = request.getParameter("user_id");
	String ssn = request.getParameter("ssn");
	//String policy_type = request.getParameter("policy_type");
	PublicRA sfra = new PublicRA ( getXecureConfig() );
	String is_corp;	
	String service_code, service_key;
	String policy_type;
	boolean invalid_input = false;
	boolean is_corp_ssn = false;
	int	i;
	int	ra_result = 1;
	int start_rec_num = 0;
	int req_rec_num = 1;

	service_code = "2";
	service_key = "";

/*
	if(is_corp.equals("1"))	policy_type = "01";
	else if(is_corp.equals("2"))	policy_type = "02";
	else if(is_corp.equals("3"))	policy_type = "06";
	else policy_type = "01";
*/

//
	is_corp = user_policy_type.substring(0, 1);

	if( is_corp.equals("1") ) {

		policy_type = user_policy_type.substring(1,3);
	}
	else if ( is_corp.equals("2") ) {

		policy_type = user_policy_type.substring(1,3);

	}
	else
		policy_type = user_policy_type.substring(1,3);
//

	if ( id != null && id.length() > 0 ) {
		service_code = "2";
		service_key = id;
	}
	else if ( ssn != null && ssn.length() > 0) {
		service_code = "3";
		service_key = ssn;
		if(!is_corp.equals("1")) {
			//req_rec_num = 10;
			//ra_result = 10;
			req_rec_num = 10;
			ra_result = 10;
			is_corp_ssn = true;
		}
	}
	else if(serial != null && serial.length() > 0) {
		service_code = "1";
		service_key = serial;
	}
	
	else 
		invalid_input = true;

%>

<html>
<head>
<title>사용자 인증서 상태 조회</title>
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
                  <p align="center"><font size="6" face="Times New Roman, Times, serif">사용자 
                    인증서 상태 조회</font></p>
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

<table border=1>
<%
		
	if ( !invalid_input ) {
		while ( ra_result == req_rec_num ) { 
			ra_result = sfra.viewCertificate ( "internet", policy_type, service_code, service_key, start_rec_num,req_rec_num, 1);
		//	ra_result = sfra.viewCertificate ( "internet", "05", "3","1388102262",0,10,0);
			if ( ra_result > 0 ) {
%>
<tr>	<td colspan=6 align=center>총 레코드 수 : <%=ra_result%></td></tr>
<tr>
	<td>번호</td>
	<td>일련번호</td>
	<td>사용자 ID</td>
	<td>주민번호</td>
	<td>인증정책식별코드</td>
	<td>인증서 정보</td>
	<td>상태</td>
	<td>상태 변경</td>
</tr>
<%
				for ( i=1; i<= ra_result; ++i ) {
%>
<tr>
				<td><%=sfra.getResponseFromCertView("RECNUM",i)%></td>
				<td><%=sfra.getResponseFromCertView("SERIAL",i)%></td>
				<td><%=sfra.getResponseFromCertView("USERID",i)%></td>
				<td><%=sfra.getResponseFromCertView("SSN",i)%></td>
				<td><%=sfra.getResponseFromCertView("POLICYTYPE",i)%></td>
				<td>DN : <%=sfra.getResponseFromCertView("USERDN",i)%><br>
				    유효기간 : <%=sfra.getResponseFromCertView("VALIDFROM",i)%> - <%=sfra.getResponseFromCertView("VALIDTO",i)%></td>
				<td><% 
					String cert_status = (String)sfra.getResponseFromCertView("STATUS",i);
					if ( cert_status.equals("10") ) out.println("유효");
					else if ( cert_status.equals("30") ) out.println("폐지");
					else if ( cert_status.equals("40") ) out.println("효력정지");
					else out.println("오류[" + cert_status + "]");
			
				    %></td>
				<td><%
					if ( cert_status.equals("10") ) {
						out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
						out.println("<br>");
						out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=40' onClick='return XecureLink(this);'>효력정지</a>");
					}
					else if ( cert_status.equals("40") ) {
						out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
						out.println("<br>");
						out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=41' onClick='return XecureLink(this);'>효력회복</a>");

					}
					//added by utpark 2003-09-02
					else
						out.println("<a href='cert_man_op.jsp?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
						out.println("<br>");
	    %></td>
</tr>
<%				}
				if ( ra_result != req_rec_num ) break;
				if(is_corp_ssn)//added for 
					start_rec_num = start_rec_num + req_rec_num + 1;
				else
					break;
			}
			else {
%>

<tr><td>error code : <%=sfra.getLastError()%></td><td>error msg : <%=sfra.getLastErrorMsg()%>

<%
				break;
			}
			if ( ra_result != req_rec_num ) break;
			if(!is_corp_ssn)
				break;
			
		}
	}
	else {
%>
<tr><td>error code : <%=sfra.getLastError()%></td><td>error msg : <%=sfra.getLastErrorMsg()%>
<%
	}
%>

</table>


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
