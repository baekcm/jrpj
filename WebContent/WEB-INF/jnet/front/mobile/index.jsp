<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String pTitle="종로구시설관리공단";
String sTitle="";
String sNo="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" wml:lang="ko">
<head>
<title><%=pTitle%>-환영합니다.</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/maintab.js"></script>
<link href="/resources/include/mobile/inc/css/mmain.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
<script type="text/javascript">
//<![CDATA[

	$(function(){
		
		$("a[name=clkSubjectLi]").click(function(){
			
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
/* 			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id"); */
			$("#bdSeq").val(boardSeq);
			$("#dSeq").val(dataSeq);
			
			$("#frm").attr("action", "/m/findNotice").submit();
		});
		
	});
	
	

	
//]]>
</script>
</head>

<body>
<form method="post" name="frm" id="frm">
<input type="hidden" name="dataSeq" id="dSeq" />
<input type="hidden" name="boardSeq" id="bdSeq"/>
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
	<div class="program">
			<div class="programWrap">
				<div class="ovBoxFront2"></div>
				<div class="ovBoxBody2"><a href="/m/program/index/11"><img src="/resources/include/mobile/image/text_main04.png" width="160" height="31" alt="프로그램안내. program of jongno-gu facilities." /></a></div>
				<div class="ovBoxTrailer2"></div>
			</div></div>
	<div class="mainSlogun">
		<div class="imgMark2"><img src="/resources/include/mobile/image/img_main03.png" width="260" height="101" alt="품격있고 활기찬 문화예술도시 종로. Jongro" /></div>
	</div>
	<div id="notice">
		<div class="noticeArea">
			<div id="tabcontainer" class="maintab">
				<h2 class="tabtit1"><a href="#sttab1"><img width="76" height="26" src="/resources/include/mobile/image/tab_news_on.png" alt="공지사항"/></a></h2>
				<div id="sttab1">
					<ul>
					<c:choose>
						<c:when test="${ noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
							<c:forEach items="${noticeListBbs }" var="list">
							<li >
							<span class="listx"><a name="clkSubjectLi" style="cursor: pointer;" data="${ list.boardSeq }" id="${ list.dataSeq }">${ list.subject }</a></span>
							<span class="date">${ fn:substring(list.createYmd,0,4) }-${ fn:substring(list.createYmd,4,6) }-${ fn:substring(list.createYmd,6,8) }</span>
							 </li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<li>등록된 공지사항이 없습니다.</li>
						</c:otherwise>
					</c:choose>
					</ul>
					<p class="btnMore"><a href="#list" onclick="goList(4);"><img src="/resources/include/mobile/image/btn_more.png" width="50" height="17" alt="더 보기 - more" /></a></p>
				</div>
				<h2 class="tabtit2"><a href="#sttab2"><img width="76" height="26" src="/resources/include/mobile/image/tab_notice_off.png" alt="입찰정보"/></a></h2>
				<div id="sttab2">
					<ul>
					<c:choose>
						<c:when test="${ listTender != null && fn:length(listTender) > 0 }">
							<c:forEach items="${listTender }" var="list">
							<li>
							<span class="listx"><a  name="clkSubjectLi" style="cursor: pointer;" data="${ list.boardSeq }" id="${ list.dataSeq }">${ list.subject }</a></span>
							<span class="date">${ fn:substring(list.createYmd,0,4) }-${ fn:substring(list.createYmd,4,6) }-${ fn:substring(list.createYmd,6,8) }</span>
							 </li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<li>등록된 공지사항이 없습니다.</li>
						</c:otherwise>
					</c:choose>
					</ul>
					<p class="btnMore"><a href="#list" onclick="goList(9);"><img src="/resources/include/mobile/image/btn_more.png" width="50" height="17" alt="더 보기 - more" /></a></p>
				</div>
				<h2 class="tabtit3"><a href="#sttab3"><img width="76" height="26" src="/resources/include/mobile/image/tab_free_off.png" alt="채용공고"/></a></h2>
				<div id="sttab3">
					<ul>
					<c:choose>
						<c:when test="${ listRecruit != null && fn:length(listRecruit) > 0 }">
							<c:forEach items="${listRecruit }" var="list">
							<li >
							<span class="listx"><a  name="clkSubjectLi" style="cursor: pointer;" data="${ list.boardSeq }" id="${ list.dataSeq }">${ list.subject }</a></span>
							<span class="date">${ fn:substring(list.createYmd,0,4) }-${ fn:substring(list.createYmd,4,6) }-${ fn:substring(list.createYmd,6,8) }</span>
							 </li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<li>등록된 공지사항이 없습니다.</li>
						</c:otherwise>
					</c:choose>
					</ul>
					<p class="btnMore"><a href="#list" onclick="goList(10);"><img src="/resources/include/mobile/image/btn_more.png" width="50" height="17" alt="더 보기 - more" /></a></p>
				</div>
				<h2 class="tabtit4"><a href="#sttab4"><img width="76" height="26" src="/resources/include/mobile/image/tab_faq_off.png" alt="강좌안내"/></a></h2>
				<div id="sttab4">
					<ul>
					<c:choose>
						<c:when test="${ listLecture != null && fn:length(listLecture) > 0 }">
							<c:forEach items="${listLecture }" var="list">
							<li>
							<span class="listx"><a  name="clkSubjectLi" style="cursor: pointer;" data="${ list.boardSeq }" id="${ list.dataSeq }">${ list.subject }</a></span>
							<span class="date">${ fn:substring(list.createYmd,0,4) }-${ fn:substring(list.createYmd,4,6) }-${ fn:substring(list.createYmd,6,8) }</span>
							 </li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<li>등록된 공지사항이 없습니다.</li>
						</c:otherwise>
					</c:choose>
					</ul>
					<p class="btnMore"><a href="#list" onclick="goList(8);"><img src="/resources/include/mobile/image/btn_more.png" width="50" height="17" alt="더 보기 - more" /></a></p>
				</div>
			</div>
			<script type="text/javascript">tabList('tabcontainer', 0);</script> 
		</div>
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
