<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery.bxSlider.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/maintab.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("a[name=clkSubject]").click(function(){
		var boardSeq = $(this).attr("data");
		var dataSeq = $(this).attr("id");
		$("#boardSeq").val(boardSeq);
		$("#dataSeq").val(dataSeq);
		$("#pageFrm").attr("action", "/front/notice/notice_view").submit();
	});
})
function setPage(pageNo){
	$("#pageNum").val(pageNo);
	$("#pageFrm").attr("action","/main/search/board/{upId}").submit();
}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="upId" id="upId" value="${upId }" />
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="dataSeq" id="dataSeq" />
	<input type="hidden" name="boardSeq" id="boardSeq" />
</form>
<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="middle" style="background:url(include/commonfile/image/main/bg_body.gif) 0 0 repeat-x">
	<div id="contbody">
		<div class="seh_board">
			<div class="ovh">
				<p class="s_title"><img src="/resources/include/commonfile/image/common/bul_dp1.gif" alt="" />게시판 <span><strong>(총 ${ boardTotCnt }건)</strong></span></p>
			</div>
			<ul>
			<c:choose>
				<c:when test="${listBoard != null && fn:length(listBoard) > 0 }">
				<c:forEach var="listBoard" items="${listBoard}">
				<li>
					<dl>
						<dt>
							<a href="#" data="${ listBoard.boardSeq }" id="${ listBoard.dataSeq }" name="clkSubject">
								<strong><span class="point_color02">[${fn:trim(listBoard.boardNm )}]</span> ${fn:trim(listBoard.subject )}</strong>
							</a> 
						</dt>
						<dd>
							<c:if test="${listBoard.codeNm != null && fn:trim(listBoard.codeNm ) != ''}">
								${fn:trim(listBoard.codeNm )}  &gt;	
							</c:if>
						 	${fn:trim(listBoard.boardNm )}
						 </dd>
					</dl>
				</li>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<li>
					<dl>
						<dt>검색결과가 없습니다.</dt>
						<dd></dd>
					</dl>
				</li>
				</c:otherwise>
			</c:choose>	
			</ul>
		</div>
		<!-- board paging -->
		<!--페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-->
		<c:if test="${listBoard != null && fn:length(listBoard) > 0 }">
			<!-- board paging --> 
			<div class="pgeAbs mt30"> 
				<p class="paging">${pageIndexList }</p>
			</div>
		</c:if>					
		<!-- board paging --> 
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(0,0,0,0);</script>
</body>
</html>