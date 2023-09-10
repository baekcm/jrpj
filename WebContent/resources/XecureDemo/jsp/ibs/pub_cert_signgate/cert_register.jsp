<%@ include file= "/XecureObject/xecure.jsp" %>

<html>
<head>
<title>인증서 발급</title>
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
                        <div align="center"><a href='cert_main.jsp' onClick="return XecureLink(this);">이전메뉴</a></div>
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
                  <p align="center"><font size="6" face="Times New Roman, Times, serif">인증서 발급</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">
                        <p><b>이 페이지는 금융결제원 인증기관에 사용자를 등록하는 작업을 수행합니다. 반드시 운영시스템에서는 
                          이페이지를 웹상에서 제거하고, 절대 운영시스템에서는 수행하지 마십시요</b></p>
                        <p><b>사용자 확인을 위해서 아래의 정보를 입력해 주십시요.</b></p>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 
                        <div align="center">

<br>						
<form name="form1" method=post action='cert_request.jsp' onSubmit='return XecureSubmit(this);'>
<table>
<tr><td>계좌번호</td><td><input type=text name="account" size="20"></td></tr>
<tr><td>계좌비밀번호</td><td><input type=text name="ac_pwd" size="20"></td></tr>
<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name="pcard" size="20"></td></tr>

<tr><td>개인/법인/단체 구분</td><td>
	<input type=radio name="user_type" value="1" checked>개인
	<input type=radio name="user_type" value="2">법인
	<input type=radio name="user_type" value="3">단체
</td></tr>
<tr><td>법인/단체명 ( 법인/단체일 경우 필수, 영문 필수 )</td><td><input type=text name="company_name" size="40"></td></tr>
<tr><td>개인명 / 법인단체 세부명 ( 필수 )</td><td><input type=text name="user_name" size="40"></td></tr>
<tr><td>영문 개인명 / 영문 법인단체 세부명 ( 옵션 ) </td><td><input type=text name="euser_name" size="40"></td></tr>
<tr><td>개인 (법인단체) ID ( 필수 )</td><td><input type=text name="user_id" size="20"></td></tr>
<tr><td>주민등록번호 ( 사업자 등록번호 ) ( 필수 ) </td><td><input type=text name="ssn" size="20"></td></tr>
<tr><td>전자우편 ( 옵션 )</td><td><input type=text name="email" size="20"></td></tr>
<tr><td>핸드폰 ( 옵션 )</td><td><input type=text name="cell_phone" size="20"></td></tr>
<tr><td>Fax ( 옵션 )</td><td><input type=text name="fax" size="20"></td></tr>
<tr><td>자택 우편번호 ( 개인 필수 )</td><td><input type=text name="zipcode" size="20"></td></tr>
<tr><td>자택 주소 ( 개인 필수 )</td><td><input type=text name="address" size="40"></td></tr>
<tr><td>자택 전화 ( 개인 필수 )</td><td><input type=text name="phone" size="20"></td></tr>
<tr><td>회사 우편번호 ( 법인 필수 )</td><td><input type=text name="czipcode" size="20"></td></tr>
<tr><td>회사 주소 ( 법인 필수 )</td><td><input type=text name="caddress" size="40"></td></tr>
<tr><td>회사 전화 ( 법인 필수 )</td><td><input type=text name="cphone" size="20"></td></tr>
</table>
<p><input type='image' src="../../../image/button_ok.jpg" width="90" height="24" border="0"></p>
</form>						
						
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
