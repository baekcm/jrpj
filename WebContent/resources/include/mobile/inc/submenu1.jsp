<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% String tmps =""; %>

<ul id="submenu1" class="submenu">
	<% if (sNo=="1") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/facil/olympic/index" <%=tmps%>>올림픽기념국민생활관</a></li>
	<% if (sNo=="2") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/facil/gumin/index" <%=tmps%>>종로구민회관</a></li>
	<% if (sNo=="3") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/facil/jculture/index" <%=tmps%>>종로문화체육센터</a></li>
	<% if (sNo=="4") { tmps="class='on'";} 
	else { tmps="";}%>
	<li class="none"><a href="/m/facil/eastcult/index" <%=tmps%>>동부여성문화센터</a></li>
	<% if (sNo=="5") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/facil/youth/index" <%=tmps%>>청소년문화센터</a></li>
	<% if (sNo=="6") { tmps="class='on'";} 
	else { tmps="";}%>
	<li><a href="/m/facil/stennis/index" <%=tmps%>>삼청테니스장</a></li>
</ul>
