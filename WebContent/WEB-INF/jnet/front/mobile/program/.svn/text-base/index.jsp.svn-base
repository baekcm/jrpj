<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>프로그램안내-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<jsp:include page="/resources/include/mobile/inc/header.jsp" />
<script type="text/javascript">
	$(function(){
		var truefalse = true;
		var tag = "";
		$("a[name=upNm]").each(function(){
			if($(this).hasClass("on")){
				tag = $.trim($(this).text());
				truefalse = false;
				return false;
			}
		});
		if(truefalse) {
			return;
		}
		$("#catNm").text(tag);
	});
</script>
</head>
<body>
<div id="header">
	<jsp:include page="/resources/include/mobile/inc/top.jsp" />
	<ul id="submenu1" class="submenu">
		<c:if test="${listFacil != null && fn:length(listFacil) > 0 }">
			<c:forEach items="${listFacil }" var="list">
				<li>
					<a href="/m/program/index/${list.codeId}" name="upNm" 
						<c:if test="${upId eq list.codeId }">class="on"</c:if>
					>
						${list.codeNm }
					</a>
				</li>	
			</c:forEach>
		</c:if>
	</ul>
	<div id="headNavi">
		<div class="prev">
			<a href="javascript:history.go(-1);" onclick="history.go(-1);"><img src="/resources/include/mobile/image/btn_prev.png" width="25" height="24" alt="이전으로" /></a>
		</div>
		<div class="title">프로그램안내</div>
		<div class="home">
			<a href="/m/index"><img src="/resources/include/mobile/image/btn_home.png" width="25" height="24" alt="홈으로" /></a>
		</div>
	</div>
	<p id="navi"> 
		<a href="/m/index"><img src="/resources/include/mobile/image/icon_home.png" height="12" alt="홈으로" /></a> 
		&gt; 프로그램안내
	 	&gt; <span id="catNm"></span>
	</p>
</div>
<div id="body"> 
	<!--real Contents S--> 
	<ul class="listIndex">
		<c:if test="${listSaleIdByUpId != null && fn:length(listSaleIdByUpId) > 0 }">
			<c:forEach items="${listSaleIdByUpId }" var="list">
				<li><a href="/m/program/listPgm/${upId }/${list.codeId}">${list.codeNm }</a></li>	
			</c:forEach>
		</c:if>
	</ul>
	<!--real Contents E--> 
</div>
<jsp:include page="/resources/include/mobile/inc/bottom.jsp" />
</body>
</html>
