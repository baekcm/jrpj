<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>XecureHttpJspPageEnv Ŭ���� ��ȣ ����</title>
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

<form name='xecure'><input type=hidden name='ep'></form>
<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>
<script language='javascript'>
PrintObjectTag();
</script>

<!-- ======================================
	 XecureWeb Server Certificate
	 ======================================

<script language='javascript'>
var serverCert = '';
serverCert += '-----BEGIN CERTIFICATE-----\n';
serverCert += 'MIIDlDCCAv2gAwIBAgIDAT7AMA0GCSqGSIb3DQEBBQUAME0xCzAJBgNVBAYTAmty\n';
...
serverCert += '28QH+i7wLog=\n';
serverCert += '-----END CERTIFICATE-----\n';
serverCert += '';
</script>
-->
<script language='javascript'>
<%
	xecure.crypto.VidVerifier vid = new xecure.crypto.VidVerifier(new xecure.servlet.XecureConfig());
	out.println(vid.ServerCertWriteScript("serverCert"));
%>
</script>

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
                  <p align="center"><font size="6" face="Times New Roman, Times, serif">XecureHttpJspPageEnv 
                    Ŭ���� ��ȣ ����</font></p>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="2%" height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td width="2%" height="24" bgcolor="#DEDBCB"><b>1.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureLink_Env�� �̿����� ���� 
                        Ŭ���̾�Ʈ Request</b></td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 
                        <p>&lt;a href=&quot;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot; 
                          &gt;&lt;/a&gt; </p>
						<a href="/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi" >����</a></td>
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
                      <td height="24" bgcolor="#DEDBCB"><b>XecureLink_Env�� �̿��� Ŭ���̾�Ʈ 
                        ���� ��� ( http:// ���� ) Request </b></td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 
                        <p>&lt;a href=&quot;http://&lt;hostname&gt;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot; 
                          onClick=&quot;return XecureLink_Env(this);&quot;&gt;&lt;/a&gt; 
                        </p>
						
<script language=javascript>
document.writeln ("<a href='http://"+window.location.host+"/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi' onClick='return XecureLink_Env(this);'>����</a><br><br>");
</script>

                      </td>
                    </tr>



                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td width="2%" valign="top">&nbsp; </td>
                      <td> 
                        <p>&nbsp;</p>
                        </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>3.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureLink_Env�� �̿��� Ŭ���̾�Ʈ 
                        ���� ��� Request</b></td>
                    </tr>
                    <tr> 
                      <td height="24" colspan="3"> 
                        <p>&lt;a href=&quot;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot; 
                          onClick=&quot;return XecureLink_Env(this);&quot;&gt;&lt;/a&gt; 
                        </p>
<a href="/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi" onClick="return XecureLink_Env(this);">����</a>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%">&nbsp; </td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>4.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureLink_Env�� �̿��� Ŭ���̾�Ʈ 
                        ��� ��� Request</b></td>
                    </tr>
                      <td height="24" colspan="3"> 
                        <p>&lt;a href=&quot;env_server_response.jsp?abc=def&amp;pop=hi&quot; 
                          onClick=&quot;return XecureLink_Env(this);&quot;&gt;&lt;/a&gt; 
                        </p>
<a href="env_server_response.jsp?abc=def4&pop=hi4" onClick="return XecureLink_Env(this);">����</a>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>5.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureLink_Env�� �̿��� Ŭ���̾�Ʈ 
                        ��� ��� Request</b></td>
                    </tr>
          
		  
		  
		              <td height="24" colspan="3"> 
                        <p>&lt;a href=&quot;./env_server_response.jsp?abc=def&amp;pop=hi&quot; 
                          onClick=&quot;return XecureLink_Env(this);&quot;&gt;&lt;/a&gt; 
                        </p>
                        <p><a href="./env_server_response.jsp?abc=def5&pop=hi5" onClick="return XecureLink_Env(this);">����</a> 
                        </p>

                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>6.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureSubmit_Env�� �̿����� 
                        ���� Ŭ���̾�Ʈ FORM Request</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;form action=&quot;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot;<br>
                          method=&quot;post&quot; &gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>

<form action="/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi" method="post" >
<input type=text name="text_field1" ><br>
<input type=text name="text_field2"><br>
<input type=submit value="����">
</form>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>7.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureSubmit_Env�� �̿��� Ŭ���̾�Ʈ 
                        ���� ��� ( http:// ���� ) FORM Request ( POST )</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;form action=&quot;http://&lt;hostname&gt;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot;<br>
                          method=&quot;post&quot; onSubmit=&quot;return XecureSubmit_Env(this);&quot;&gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>
                        <blockquote> 
                          <p></p>
                        </blockquote>

<script language=javascript>
document.writeln("<form action='http://" + window.location.host + "/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi' method='post' onSubmit='return XecureSubmit_Env(this);'>");
document.writeln("<input type=text name='text_field1' ><br>");
document.writeln("<input type=text name='text_field2'><br>");
document.writeln("<input type=submit value='����'>");
document.writeln("</form>");
</script>

                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>8.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureSubmit_Env�� �̿��� Ŭ���̾�Ʈ 
                        ���� ��� FORM Request ( POST )</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;form action=&quot;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot;<br>
                          method=&quot;post&quot; onSubmit='return XecureSubmit_Env(this);' 
                          &gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>
                        <form action="/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi" method="post" onSubmit='return XecureSubmit_Env(this);' >
                          <input type=text name="text_field1" >
                          <br>
                          <input type=text name="text_field2">
                          <br>
                          <input type=submit value="����">
                        </form>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>9.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureSubmit_Env�� �̿��� Ŭ���̾�Ʈ 
                        ��� ��� FORM Request ( POST )</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;form action=&quot;env_server_response.jsp?abc=def&amp;pop=hi&quot;<br>
                          method=&quot;post&quot; onSubmit='return XecureSubmit_Env(this);' 
                          &gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>


<form action="env_server_response.jsp?abc=def&pop=hi" method="post" onSubmit='return XecureSubmit_Env(this);' >
<input type=text name="text_field1" ><br>
<input type=text name="text_field2"><br>
<input type=submit value="����">
</form>

                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>10.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureSubmit_Env�� �̿��� Ŭ���̾�Ʈ 
                        ��� ��� FORM Request ( POST )</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;form action=&quot;./env_server_response.jsp?abc=def&amp;pop=hi&quot;<br>
                          method=&quot;post&quot; onSubmit='return XecureSubmit_Env(this);' 
                          &gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>
<form action="./env_server_response.jsp?abc=def&pop=hi" method="post" onSubmit='return XecureSubmit_Env(this);' >
<input type=text name="text_field1" ><br>
<input type=text name="text_field2"><br>
<input type=submit value="����">
</form>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>11.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureSubmit_Env�� �̿��� Ŭ���̾�Ʈ 
                        FORM Request ( GET )</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;form action=&quot;/XecureDemo/jsp/env_server_response.jsp&quot;<br>
                          method=&quot;GET&quot; onSubmit=&quot;return XecureSubmit_Env(this);&quot;&gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>
<form action="/XecureDemo/jsp/env_server_response.jsp" method="GET" onSubmit="return XecureSubmit_Env(this);">
<input type=text name="text_field1" ><br>
<input type=text name="text_field2"><br>
<input type=submit value="����">
</form>
                        <p>&lt;form action=&quot;/XecureDemo/jsp/env_server_response.jsp?abc=def&amp;pop=hi&quot;<br>
                          method=&quot;GET&quot; onSubmit=&quot;return XecureSubmit_Env(this);&quot;&gt;<br>
                          &lt;input type=text name=&quot;text_field1&quot; &gt;&lt;br&gt;<br>
                          &lt;input type=text name=&quot;text_field2&quot;&gt;&lt;br&gt;<br>
                          &lt;input type=submit value=&quot;����&quot;&gt;<br>
                          &lt;/form&gt; </p>

<form action="/XecureDemo/jsp/env_server_response.jsp?abc=def&pop=hi" method="SSL" onSubmit="return XecureSubmit_Env(this);">
<input type=text name="text_field1" ><br>
<input type=text name="text_field2"><br>
<input type=submit value="����">
</form>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>12.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureNavigate_Env�� �̿��� 
                        Ŭ���̾�Ʈ ���� ��� Request ��ȣ</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;script language=javascript&gt;<br>
                          function navigate(url, target)<br>
                          {<br>
                          url += &quot;?abc=def&amp;amp;pop=hi&quot;;<br>
                          XecureNavigate_Env( url, target);<br>
                          }<br>
                          &lt;/script&gt;<br>
                          &lt;a href=&quot;javascript:navigate('http://&lt;hostname&gt;/XecureDemo/jsp/env_server_response.jsp','_self');&quot;&gt;����&lt;/a&gt; 
                        </p>
<script language=javascript>
function navigate(url, target)
{
	url += "?abc=def&pop=hi";
	XecureNavigate_Env( url, target );
}
</script>
<a href="javascript:navigate('http://' + window.location.host + '/XecureDemo/jsp/env_server_response.jsp','_self');">����</a>
                      </td>
                    </tr>
					
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>13.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureNavigate_Env�� �̿��� 
                        Ŭ���̾�Ʈ ���� ��� Request ��ȣ</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;script language=javascript&gt;<br>
                          function navigate(url, target)<br>
                          {<br>
                          url += &quot;?abc=def&amp;amp;pop=hi&quot;;<br>
                          XecureNavigate_Env( url, target);<br>
                          }<br>
                          &lt;/script&gt;<br>
                          &lt;a href=&quot;javascript:navigate('/XecureDemo/jsp/env_server_response.jsp','_self');&quot;&gt;����&lt;/a&gt; 
                        </p>
<script language=javascript>
function navigate(url, target)
{
	url += "?abc=def&pop=hi";
	XecureNavigate_Env( url, target );
}
</script>
<a href="javascript:navigate('/XecureDemo/jsp/env_server_response.jsp','_self');">����</a>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>14.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureNavigate_Env�� �̿��� 
                        Ŭ���̾�Ʈ ��� ��� Request ��ȣ</b></td>
                    </tr>
          
                      <td height="24" colspan="3"> 
                        <p>&lt;script language=javascript&gt;<br>
                          function navigate(url, target)<br>
                          {<br>
                          url += &quot;?abc=def&amp;amp;pop=hi&quot;;<br>
                          XecureNavigate_Env( url, target);<br>
                          }<br>
                          &lt;/script&gt;<br>
                          &lt;a href=&quot;javascript:navigate('env_server_response.jsp','_self');&quot;&gt;����&lt;/a&gt; 
                        </p>
<script language=javascript>
function navigate(url, target)
{
	url += "?abc=def&pop=hi";
	XecureNavigate_Env( url, target );
}
</script>
<a href="javascript:navigate('env_server_response.jsp','_self');">����</a>
                      </td>
                    </tr>
                    <tr> 
                      <td width="2%">&nbsp;</td>
                      <td valign="top" width="2%"></td>
                      <td>&nbsp; </td>
                    </tr>

<!--
                    <tr> 
                      <td height="24" bgcolor="#DEDBCB">&nbsp;</td>
                      <td height="24" bgcolor="#DEDBCB"><b>15.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureNavigate_NoEnc�� 
                        �̿��� Ŭ���̾�Ʈ Request</b></td>
                    </tr>
          
          
		              <td height="24" colspan="3"> 
                        <p>XecureNavigate_NoEnc �Լ��� ȣ���ϸ� Request URL �� QueryString 
                          �κ��� ��ȣȭ ���� �ʴ´�. </p>
                        <p>&lt;script language=javascript&gt;<br>
                          function navigate_noenc(url, target)<br>
                          {<br>
                          url += &quot;?abc=def&amp;amp;pop=hi&quot;;<br>
                          XecureNavigate_NoEnc( url, target);<br>
                          }<br>
                          &lt;/script&gt;<br>
                          &lt;a href=&quot;javascript:navigate_noenc('/XecureDemp/jsp/env_server_response.jsp','_self');&quot;&gt;����&lt;/a&gt;</p>
<script language=javascript>
function navigate_noenc(url, target)
{
	url += "?abc=def&pop=hi";
	XecureNavigate_NoEnc( url, target );
}
</script>
<a href="javascript:navigate_noenc('/XecureDemo/jsp/env_server_response.jsp','_self');">����</a>
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
                      <td width="2%" height="24" bgcolor="#DEDBCB"><b>16.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>TransferMode �� encrypt 
                        �ǳ� �ٱ�</b></td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24">&lt;a href=&quot;env_server_response_test.jsp?abc=def&amp;pop=hi&quot; 
                        onClick=&quot;return XecureLink_Env(this);&quot;&gt;&lt;/a&gt;
                        <p></p>
<a href="env_server_response_test.jsp?abc=def4&pop=hi4" onClick="return XecureLink_Env(this);">����</a>
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
                      <td width="2%" height="24" bgcolor="#DEDBCB"><b>17.</b></td>
                      <td height="24" bgcolor="#DEDBCB"><b>XecureLinkReset �� �̿��� 
                        Ŭ���̾�Ʈ ��� ��� Request</b></td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24">&lt;a href=&quot;env_server_response.jsp?abc=def&amp;pop=hi&quot; 
                        onClick=&quot;return XecureLinkReset(this);&quot;&gt;&lt;/a&gt;
                        <p></p>
<a href="env_server_response.jsp?abc=def4&pop=hi4" onClick="return XecureLinkReset(this);">����</a>
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
                      <td width="2%">&nbsp;</td>
                      <td width="2%">&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
-->

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
</html>
