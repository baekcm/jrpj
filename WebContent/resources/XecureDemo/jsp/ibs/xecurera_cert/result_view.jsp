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

<html>
<head>
<title>접수 처리 결과 조회</title>
<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>
</head>
<body bgcolor='#FFFFFF' background='../../../image/back.gif'>
<center>

<img src='../../../image/demo_title.gif' width='523' height='74'> 
<p><font size='6'><font color='#6699CC'><b>접수 처리 결과 조회</b></font></font></p>
<p><font color='#000000' size='5'>사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>
<form name='form1' method=post action='result_view_op.jsp' onSubmit='return XecureSubmit(this);'>
<table>
<tr><td>계좌번호</td><td><input type=text name='account' size='20'></td></tr>
<tr><td>계좌비밀번호</td><td><input type=text name='ac_pwd' size='20'></td></tr>
<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name='pcard' size='20'></td></tr>

<tr><td>사용자 ID</td><td><input type=text name='user_id' size='20'></td></tr>
</table>
<p><input type='image' src='../../../image/button_ok.jpg' width='180' height='47' border='0'></p>
</form>
</center>
</body>
</html>
