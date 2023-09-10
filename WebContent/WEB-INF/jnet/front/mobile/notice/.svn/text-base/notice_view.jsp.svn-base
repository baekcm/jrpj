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
<title>${pTitle}-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<link href="/resources/include/mobile/inc/css/mboard.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
<script type="text/javascript">
//<![CDATA[

	$(function(){
		
		$("#listBtn").click(function(){
			$("#boardSeq").val("${noticeList[0].boardSeq }");
			//location.href="/m/listNotice";
			$("#pageFrm").attr("action", "/m/listNotice").submit();
		});
		$("a[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("data");
			$("#fileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
		
	});
	
	
	
//]]>
</script>
</head>

<body>
<form method="post" name="pageFrm" id="pageFrm">
<input type="hidden" name="boardSeq" id="boardSeq"/>
</form>
<form method="post" name="downFrm" id="downFrm" action="/admin/downBbsFile">
	<input type="hidden" name="fileSeq" id="fileSeq" />
</form>
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
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상세보기" class="bd00view">
		<colgroup>
		<col width="80px" />
		<col  />
		</colgroup>
		<tr>
			<th scope="row">제목</th>
			<td>${ fn:trim(noticeList[0].subject) }</td>
		</tr>
		<tr>
			<th scope="row">공지기관</th>
			<td>
			<c:if test="${facilList != null && fn:length(facilList) > 0 }">
				<c:forEach items="${facilList }" var="list">
						<c:if test="${noticeList[0].commCodeSeq eq  list.commCodeSeq}">${list.codeNm }</c:if>
				</c:forEach>
			</c:if>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부</th>
			<td class="point_blue04">
			<a data="${ noticeList[0].fileSeq }" name="fileDown" style="cursor: pointer;" >${noticeList[0].orgnlFileNm}</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" scope="row" class="bd01tdC">${ fn:trim(noticeList[0].content) }</td>
		</tr>
	</table>
	<p class="btnFarmR"><img id="listBtn" src="/resources/include/mobile/image/board/btn_list.png" width="51" height="20" alt="목록" style="cursor: pointer;" /></p>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
