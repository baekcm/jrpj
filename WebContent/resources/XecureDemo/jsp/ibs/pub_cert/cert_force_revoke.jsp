<%@ include file= '/XecureObject/xecure.jsp' %>
<html>
<head>
<title>인증서 강제 폐기</title>
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
<script language="javascript">
<!--
		function clickshow(num) {
			for (i=1;i<=10;i++) {
				if(imgch=eval("document.bar"+i)) {
					menu=eval("document.all.block"+i+".style"); 
					if (num==i) {
						if (menu.display=="block"){	// 메뉴 닫힘
							menu.display="none"; 
							//imgch.src="./MenuImage/b_1.gif";       
						} else {					// 메뉴 열림
							menu.display="block";
							//imgch.src="./MenuImage/b_2.gif";
						}
					} else {
						menu.display="none";
						//imgch.src="./MenuImage/b_1.gif";
					}
				} else {
					break ;
				}
			}
	}
//-->
</script>

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
                  <p align="center"><font size="6" face="Times New Roman, Times, serif">인증서 
                    조회/상태 변경</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB">사용자 확인을 위해서 아래의 정보를 입력해주세요.</td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 

<div align="center">
<br>
<form name='form1' method=post action='cert_force_revoke_op.jsp' onSubmit='return XecureSubmit(this);'>
                          <table width="534">
                            <tr>
                            
                            <td width="213">주민등록번호 ( 사업자 등록번호 ) </td>
                              <td width="309">
<input type=text name='ssn' size='30'></td></tr>

			   <td width="213">개인 (법인단체) ID </td>
                              <td width="309">
<input type=text name='user_id' size='30'></td></tr>
<tr><td colspan=2>또는</td></tr>
<tr> 
<!--
<td width="213"> 개인 or 법인 </td>
                              <td width="309">
		<INPUT type=radio name=corporate value=1 checked> 개인
		<INPUT type=radio name=corporate value=2> 법인
		<INPUT type=radio name=corporate value=3> 특수목적용</td>
-->

<!-- 추가 -->
<tr><td>개인/법인/단체 구분</td><tr>
<!--
<tr>
-->
<td style='CURSOR: hand' onclick='javascript:clickshow(1)' width='149' bgcolor='F5F5F5' height='25'>
&nbsp;

<img src='./MenuImage/b_2.gif' name='bar1' width='9' height='9' border='0'>

<b><font face='굴림' size='2'>개인</font></b>

<td style='CURSOR: hand' onclick='javascript:clickshow(2)' width='149' bgcolor='F5F5F5' height='25'>
&nbsp;
<img src='./MenuImage/b_3.gif' name='bar2' width='9' height='9' border='0'>

<b><font face='굴림' size='2'>법인</font></b>
</td>
</tr>

<tr>
<td width='249'>
<span id='block1' style='DISPLAY: block; MARGIN-LEFT: 0px; CURSOR: hand'>
	<input type=radio name="user_policy_type" value="101" checked>전자거래범용
	<input type=radio name="user_policy_type" value="104">은행/보험용 <br>
	<input type=radio name="user_policy_type" value="162">신용카드결제용
	<input type=radio name="user_policy_type" value="169">보안메일용

<td width='249'>
<span id='block2' style='DISPLAY: none; MARGIN-LEFT: 0px; CURSOR: hand'>
	<input type=radio name="user_policy_type" value="202" checked>금용거래용
	<input type=radio name="user_policy_type" value="205">전자거래범용<br>
	<input type=radio name="user_policy_type" value="261">기업뱅킹용
	<input type=radio name="user_policy_type" value="269">보안메일용

</td>
</tr>
<tr></tr><tr></tr><tr></tr>
<!-- 추가 -->


</table>
                          <p align="center">
                            <input type='image' src='../../../image/button_ok.jpg' width='90' height='24' border='0'>
                          </p>
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
