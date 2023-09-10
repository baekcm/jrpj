<%@ include file="/XecureObject/xecure.jsp" %>

<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
<title>암호화 데모 결과</title>

</head>
<body>

<p align='center'><big><strong>암호화된 클라이언트 Response 입니다. </strong></big></p>
<p align='center'><big><strong>sf_enc2.jsp </strong></big></p>



<!---BEGIN_ENC--->
첫번째 암호화 블럭이에요.<br><br>

<!---END_ENC--->

첫번째 막간을 이용해서, 짜잔!~ <br><br>

<!---BEGIN_ENC--->
두번째 암호화 블럭이에요.<br><br>

<!---END_ENC--->

두번째 막간!~ <br>
<br><br>

<!---BEGIN_ENC--->
<table border=1>
<tr>
<td width='200'><strong>Decrypted text_field1 :</strong></td>
<td width='400'><strong>
<%=request.getParameter("text_field1" ) %>
</strong></td>
</tr>
<tr>
<td width='200'><strong>Decrypted text_field2 :</strong></td>
<td width='400'><strong>
<%=request.getParameter("text_field2" ) %>
</strong></td>
</tr>
</table>

<br><br><br>

<!---END_ENC--->

끝이랍니다!~ <br>


<br><br>
<a href="/XecureDemo/jsp/sf_enc3.html"> 링크 </a>

</body></html>
