<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String pTitle="공지사항";
String sTitle="";
String sNo="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" wml:lang="ko">
<head>
<title><%=pTitle%>-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/mmain.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
<script type="text/javascript">
//<![CDATA[

	$(function(){
		
		$("li[name=clkSubjectLi]").click(function(){
			
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
/* 			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id"); */
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			
			$("#pageFrm").attr("action", "/m/findNotice").submit();
		});
		
	});
	
	
//]]>
</script>
</head>

<body>
<form method="post" name="pageFrm" id="pageFrm">
<input type="hidden" name="dataSeq" id="dataSeq" />
<input type="hidden" name="boardSeq" id="boardSeq"/>
</form>
<div id="header">
	<%@ include file="/resources/include/mobile/inc/top.jsp" %>
	<%@ include file="/resources/include/mobile/inc/navi2.jsp" %>
</div>
<div id="body2"> 
	<!--real Contents S-->
	<div id="visualLine2">
		<div id="mvl1">
			<div class="shadoWrap mbg1">
				<div class="ovBoxFront"></div>
				<div class="ovBoxBody"><a href="/m/facil/olympic/index"><img src="/resources/include/mobile/image/text_main01.png" width="87" height="55" alt="문화,체육시설 안내. Facilities of Culture and Gymnasium" /></a></div>
				<div class="ovBoxTrailer"></div>
			</div>
		</div>
		<div id="mvl2">
			<div class="shadoWrap mbg2">
				<div class="ovBoxFront"></div>
				<div class="ovBoxBody"><a href="/m/parking/intro/index"><img src="/resources/include/mobile/image/text_main02.png" width="69" height="52" alt="주차시설 Facilities of Parking" /></a></div>
				<div class="ovBoxTrailer"></div>
			</div>
		</div>
		<div id="mvl3">
			<div class="shadoWrap mbg3">
				<div class="ovBoxFront"></div>
				<div class="ovBoxBody"><a href="/m/public/insadong"><img src="/resources/include/mobile/image/text_main03.png" width="55" height="51" alt="공공시설 Public Facilities" /></a></div>
				<div class="ovBoxTrailer"></div>
			</div>
		</div>
	</div>
	<div class="mainSlogun">
		<div class="imgMark"><img src="/resources/include/mobile/image/img_main01.png" width="113" height="101" alt="" /></div>
		<div class="TextMark"><img src="/resources/include/mobile/image/text_main.png" width="156" height="68" alt="품격있고 활기찬 문화예술도시 종로. Jongro" /></div>
	</div>
	<div id="notice">
		<div class="noticeTitle"><p>공지사항</p></div>
		<ul class="noticeList">
	<c:choose>
		<c:when test="${ noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
			<c:forEach items="${noticeListBbs }" var="list">
			<li name="clkSubjectLi" style="cursor: pointer;" data="${ list.boardSeq }" id="${ list.dataSeq }">
			${ list.subject }
			 </li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<li>등록된 공지사항이 없습니다.</li>
		</c:otherwise>
	</c:choose>
		</ul>
		<p class="btnMore"><a href="#이도"><img src="/resources/include/mobile/image/btn_more.png" width="50" height="17" alt="더 보기 - more" /></a></p>
	</div>
	
	<div class="mainBottom">
		<div class="mBleft"><a href="/m/intro/organ"><img src="/resources/include/mobile/image/btn_mborgan.png" width="130" height="24" alt="조직안내" /></a></div>
		<div class="mBright"><a href="/m/intro/location"><img src="/resources/include/mobile/image/btn_mblocation.png" width="130" height="24" alt="오시는길" /></a></div>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
