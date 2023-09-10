<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" wml:lang="ko">
<head>
<title>${pTitle}-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<link href="/resources/include/mobile/inc/css/mboard.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
<script type="text/javascript">
//<![CDATA[

	$(function(){
		
		$("li[name=clkSubjectLi]").click(function(){
			
			var boardSeq = $(this).find("span[name=clkSubject]").attr("data");
			var dataSeq = $(this).find("span[name=clkSubject]").attr("id");
/* 			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id"); */
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			
			$("#pageFrm").attr("action", "/m/findNotice").submit();
		});
		
	});
	
	function goSearch(){
		
		if( $('#searchVal').val() == '' && $('#searchKeySlct').val() != '' )
		{
			alert("검색 키워드를 주십시오.");
			$('#searchVal').focus();
			return;
		}
		$("#pageFrm").attr("action", "/m/listNotice").submit();
    }
	
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/m/listNotice").submit();
	}
	
//]]>
</script>
</head>

<body>

<div id="header">
	<%@ include file="/resources/include/mobile/inc/top.jsp" %>
	<div id="headNavi">
		<div class="prev"><a href="javascript:history.go(-1);" onclick="history.go(-1);"><img src="/resources/include/mobile/image/btn_prev.png" width="25" height="24" alt="이전으로" /></a></div>
		<div class="title">${pTitle}</div>
		<div class="home"><a href="/m/index"><img src="/resources/include/mobile/image/btn_home.png" width="25" height="24" alt="홈으로" /></a></div>
	</div>
	<p id="navi"> <a href="/m/index"><img src="/resources/include/mobile/image/icon_home.png" height="12" alt="홈으로" /></a> &gt; ${pTitle}</p>
</div>
<div id="body"> 
	<!--real Contents S--> 
	
	<!--Baord Search -->
<form method="post" name="pageFrm" id="pageFrm">
<input type="hidden" name="dataSeq" id="dataSeq" />
<input type="hidden" name="boardSeq" id="boardSeq" value="${boardSeq }"/>
<input type="hidden" name="pageNum" id="pageNum" />

		<div id="search2">
			<select name="searchKey" id="searchKeySlct" title="검색방법선택">
				<option value="subject" <c:if test="${searchKey eq 'subject' }">selected="selected"</c:if> >제목</option>
				<option value="content"	<c:if test="${searchKey eq 'content' }">selected="selected"</c:if> >내용</option>
				<option value="name" <c:if test="${searchKey eq 'name' }">selected="selected"</c:if> >작성자</option>
			</select>
			<span class="input">
			<input type="text" name="searchVal" id="searchVal" value="${ searchVal }" title="검색어 입력" onKeyDown="if(event.keyCode==13){javascript:goSearch();return false;}" />
			</span> <span class="btn">
			<a href="javaScript:goSearch();" id="searchBtn" name="searchBtn"><input type="image" src="/resources/include/mobile/image/btn_searchMain.png" alt="검색" height="20"/></a>
			</span>
			</div>
</form>
	<!--Baord Search -->
	
	<ul class="list3">
	<c:choose>
		<c:when test="${ noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
			<c:forEach items="${noticeListBbs }" var="list">
			<li name="clkSubjectLi" style="cursor: pointer;">
			<dl>
				<dt><span class="title" data="${ list.boardSeq }" id="${ list.dataSeq }" name="clkSubject" >${ list.subject }</span>
				</dt>
				<dd>작성자:${ list.createNm } | ${ list.hitnum }</dd>
			</dl>
			 </li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<li>
			<dl>
				<dt><span class="title">등록된 공지사항이 없습니다.</span></dt>
			</dl>
			 </li>
		</c:otherwise>
	</c:choose>

	</ul>
	<!-- <div class="paging"> 
		<span class="pagePrev"><img src="/resources/include/mobile/image/board/btn_pagePrev.png" width="22" height="22" alt="이전페이지로" /></span>
		<p class="page"> <a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> </p>
		<span class="pageNext"><img src="/resources/include/mobile/image/board/btn_pageNext.png" width="22" height="22" alt="다음페이지로" /></span> 
	</div> -->
	<c:if test="${noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
		<!-- board paging --> 
		<div class="paging">
			${pageIndexList }
		</div>
	</c:if>
	
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
