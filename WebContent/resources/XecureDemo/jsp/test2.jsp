<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>

<%@ page import="java.io.*" %>


<html>
<head><title>TEST</title>
</head>
<body>

<p align='center'><big><strong>���������κ��� �Է¹��� ����Դϴ�.</strong></big></p>	
<p>��</p>

<table border='1' width='100%'>
<tr>
<td width='17%'><strong>parameter :</strong></td>
<td width='83%'><strong>
<pre>

<%=request.getParameter("text_field1" ) %>
<%=request.getParameter("text_field2" ) %>
<%=request.getParameter("text_field3" ) %>
</pre>
</strong></td>
</tr>

<p>

</body></html>