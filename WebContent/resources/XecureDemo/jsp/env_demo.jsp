<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="xecure.crypto.jni.*" %>


<html>
<head>
<title>전자봉투 데모1</title>
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



<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>

<script language='javascript'>
function sign_submit(form) {

/*
var rec1 = "";
	rec1 += "-----BEGIN CERTIFICATE-----\n";
	rec1 += "MIIDEzCCAnygAwIBAgIEBo53hDANBgkqhkiG9w0BAQQFADBhMQswCQYDVQQGEwJL\n";
	rec1 += "UjELMAkGA1UECBMCYWExCzAJBgNVBAcTAmFhMQswCQYDVQQKEwJhYTELMAkGA1UE\n";
	rec1 += "CxMCYWExCzAJBgNVBAMTAmFhMREwDwYJKoZIhvcNAQkBFgJhYTAeFw0wMDEyMTgw\n";
	rec1 += "MDAwMDBaFw0wNTEyMTcwNDM2NTRaMGExCzAJBgNVBAYTAktSMQswCQYDVQQIEwJj\n";
	rec1 += "YzELMAkGA1UEBxMCY2MxCzAJBgNVBAoTAmNjMQswCQYDVQQLEwJjYzELMAkGA1UE\n";
	rec1 += "AxMCY2MxETAPBgkqhkiG9w0BCQEWAmNjMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB\n";
	rec1 += "iQKBgQCg9cavgxLmFZpjgLVtgVJsNuVV5cG3Q4cFECkwxuyazJi31fpSwqyCmvYf\n";
	rec1 += "Q1o/fIt02MWff8CTdHiTxDQiNgBt9uegkE6fgrSxpSNraP7UXOJsT5Du6wxtcNVF\n";
	rec1 += "jI6Lh/vRplFE5MD32OjiI8ZcbPH4t/ow7yX7Lon1FoaCkl2m4wIDAQABo4HXMIHU\n";
	rec1 += "MGoGCWCGSAGG+EIBDQRdFltZb3VyIENlcnRpZmljYXRlIGlzIGR1ZSB1cHRvIDEg\n";
	rec1 += "eWVhci4gWW91IGhhdmUgdG8gcmVpc3N1ZSB5b3VyIGNlcnRpZmljYXRlIGJlZm9y\n";
	rec1 += "ZSBpdCBleHBpcmVzMCIGCWCGSAGG+EIBAgQVFhN3d3cuc29mdGZvcnVtLmNvLmty\n";
	rec1 += "MBEGCWCGSAGG+EIBAQQEAwIAgDAvBglghkgBhvhCAgUEIhYgZDQxZDhjZDk4ZjAw\n";
	rec1 += "YjIwNGU5ODAwOTk4ZWNmODQyN2UwDQYJKoZIhvcNAQEEBQADgYEAlbsf2dv0EXpX\n";
	rec1 += "JtMYSuGjxSOp13+Nk3SIvjkCqE0638yaHUaIw4NWcNJapwAD9oKciYGH0B3cSYWf\n";
	rec1 += "rVHYg4Ok47Zh0U7VB3A5DgWpa/NZqn7to/iTL13RinqlFRmCoQtpdYXXV+wCaniA\n";
	rec1 += "R/T3HQnfeut6hkJb6d0lIpD/R1lF+Eg=\n";
	rec1 += "-----END CERTIFICATE-----\n";
*/

var rec1 = "";
<%
	XecureLib xecureLib = new XecureLib(new XecureConfig());
	String serverCert = new String(xecureLib.getServerCertPem());

	for(int posBegin=0, posEnd=0 ; posBegin < serverCert.length() ; posBegin=posEnd+1){
		posEnd = serverCert.indexOf("\n", posBegin);
		if(posEnd<0){
			out.println("\trec1 += \""+serverCert.substring(posBegin)+"\\n\";");
			break;
		}else
			out.println("\trec1 += \""+serverCert.substring(posBegin,posEnd)+"\\n\";");
	}
%>

var message = '계좌 이체\r\n';
    message += ' 보내는 이: 조흥은행 111-11-111-1111 예금주 김기영\r\n';
    message += ' 받는   이: 국민은행 222-22-222-2222 예금주 권은정\r\n';
    message += '  송금액  : 100,000 원\r\n';
    message += '  수수료  : 500 원\r\n';

	alert("다음 메세지를 전자봉투에 넣으시겠습니다.\n" + message);
	form.enveloped_msg.value = Envelop_with_option(rec1, message, 1);
	if ( form.enveloped_msg.value=="" ) return false;
	else
		return XecureSubmit(form);
}
</script>

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
                    <p align="center"><font size="3"><font size="6" face="Times New Roman, Times, serif">전자 
                      봉투 데모1</font></font></p>
                    </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                    
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="1%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="1%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB" colspan="2"><b>예약정보입력</b></td>
                    </tr>
                    <tr> 
                      <td colspan="2" height="48"> 
                        <div align="left"> </div>
                        <p>&nbsp; </p>
                      </td>
                      <td height="96"> 
                        <form  action='env_demo_result.jsp' method='POST' onSubmit='return sign_submit(this);' >
                          <input type=hidden name=enveloped_msg>
                          <ul>
                            <p>&nbsp;</p>
                            <table cellPadding='10' height='260' border='1' width="340">
                              <tr> 
                                <td height='25'><b>예약번호 : </b></td>
                                <td height='25'><b> 
                                  <input type='text' name='ReserveNum' size='20'>
                                  </b></td>
                              </tr>
                              <tr> 
                                <td height='24'><b>금액 : </b></td>
                                <td height='24'><b> 
                                  <input type='text' name='fee' size='20'>
                                  </b></td>
                              </tr>
                              <tr> 
                                <td height='25'><b>카드번호 : </b></td>
                                <td height='25'><b> 
                                  <input name='CreditNo' size='16'>
                                  </b></td>
                              </tr>
                              <tr> 
                                <td height='26'><b>유효기간 : </b></td>
                                <td height='26'> 
                                  <select name='Year' size='1'>
                                    <option selected> </option>
                                    <option value='98'>1998 </option>
                                    <option value='99'>1999 </option>
                                    <option value='00'>2000 </option>
                                    <option value='01'>2001 </option>
                                    <option value='02'>2002 </option>
                                    <option value='03'>2003 </option>
                                    <option value='04'>2004 </option>
                                    <option value='05'>2005 </option>
                                    <option value='06'>2006</option>
                                  </select>
                                  년 
                                  <select name='Month' size='1'>
                                    <option selected> </option>
                                    <option value='01'>1 </option>
                                    <option value='02'>2 </option>
                                    <option value='03'>3 </option>
                                    <option value='04'>4 </option>
                                    <option value='05'>5 </option>
                                    <option value='06'>6 </option>
                                    <option value='07'>7 </option>
                                    <option value='08'>8 </option>
                                    <option value='09'>9 </option>
                                    <option value='10'>10 </option>
                                    <option value='11'>11 </option>
                                    <option value='12'>12</option>
                                  </select>
                                  월</td>
                              </tr>
                              <tr> 
                                <td height='26'><b>결제 방법 :</b> </td>
                                <td height='26'> 
                                  <select name='Pay' size='1'>
                                    <option selected > </option>
                                    <option value='01'>일시불 </option>
                                    <option value='03'>할부 3개월 </option>
                                    <option value='06'>할부 6개월 </option>
                                  </select>
                                </td>
                              </tr>
                              <tr> 
                                <td colspan='2' height='2'> 
                                  <p align="center"> 
                                    <input type='submit' value='확  인'>
                                </td>
                              </tr>
                            </table>
                          </ul>
                        </form>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                      </td>
                      <td height="96" width="2%">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="4" height="33"> 
                        <div align="center"><br>
                        </div>
                        <div align="center"> </div>
                      </td>
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
</html>
