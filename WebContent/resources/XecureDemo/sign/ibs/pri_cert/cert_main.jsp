<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> SoftForum 인증기관  인증서 관리 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>
 
<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">
<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74"> 

  <!-- Title -->
  <p><font size="6"><b><font color="#6699CC">SoftForum 인증기관  인증서 관리</font></b></font></p>
  <p>&nbsp;</p>

  <!--<p><a href="cacert_install.jsp" >인증기관 인증서 설치</a></p> 4.0에만 -->
  <p><a href="cert_request.jsp" ><img src="/XecureDemo/image/button_new.jpg" width="180" height="47" border="0"></a></p> <!--발급-->
  <p><a href="cert_renew.jsp" >인증서 갱신</a></p>
  <p><a href="cert_replace.jsp" >인증서 교체</a></p>
  <p><a href="cert_update.jsp" >인증서 변경</a></p>
  <p><a href="cert_get.jsp" >인증서 조회</a></p>
  <p><a href="cert_revoke.jsp" ><img src="/XecureDemo/image/button_del.jpg" width="180" height="47" border="0"></a></p><!--폐기-->
  
</center>

</body> 
</html>
