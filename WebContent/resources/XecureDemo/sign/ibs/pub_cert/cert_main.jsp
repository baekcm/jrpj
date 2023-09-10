<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> Yessign 인증서 관리 메뉴선택 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>

<body bgcolor="#FFFFFF" background="/XecureDemo/image/back.gif">

<center>

  <img src="/XecureDemo/image/demo_title.gif" width="523" height="74"> 

  <!--Title -->
  <p><font size="6"><b><font color="#6699CC">Yessign 인증서 관리 메뉴선택 화면입니다.</font></b></font></p>
  <p>&nbsp;</p>

  <p><a href="cert_register.jsp"><img src="/XecureDemo/image/button_new.jpg" width="180" height="47" border="0"></a></p> <!-- 발급 -->
  <p><a href="cert_renew.jsp"><img src="/XecureDemo/image/button_ref.jpg" width="180" height="47" border="0"></a> </p> <!-- 갱신 -->
  <p><a href="cert_revoke.jsp"><img src="/XecureDemo/image/button_del.jpg" width="180" height="47" border="0"></a></p> <!-- 폐기 -->
  <p><a href="cert_man.jsp">인증서 조회 / 상태 변경</a></p>
  <p><a href="result_view.jsp">접수 처리 결과 조회</a></p>
  <p><a href="cert_request_offline.jsp" >참조코드/인가코드 인증서 발급</a></p>
 
</center>

</body>
</html>
