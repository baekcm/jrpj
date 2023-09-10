<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% String tmps =""; %>

<ul id="submenu2" class="submenu">
	<% if (sNo=="1") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/parking/intro/index" <%=tmps%>>주차</a></li>
	<% if (sNo=="2") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/parking/public/index" <%=tmps%>>공영주차장</a></li>
</ul>
