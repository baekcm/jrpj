<%@ include file="/XecureObject/xecure.jsp" %>

<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
<title>��ȣȭ ���� ���</title>

</head>
<body>

<p align='center'><big><strong>��ȣȭ�� Ŭ���̾�Ʈ Response �Դϴ�. </strong></big></p>
<p align='center'><big><strong>sf_enc2.jsp </strong></big></p>



<!---BEGIN_ENC--->
ù��° ��ȣȭ ���̿���.<br><br>

<!---END_ENC--->

ù��° ������ �̿��ؼ�, ¥��!~ <br><br>

<!---BEGIN_ENC--->
�ι�° ��ȣȭ ���̿���.<br><br>

<!---END_ENC--->

�ι�° ����!~ <br>
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

���̶��ϴ�!~ <br>


<br><br>
<a href="/XecureDemo/jsp/sf_enc3.html"> ��ũ </a>

</body></html>
