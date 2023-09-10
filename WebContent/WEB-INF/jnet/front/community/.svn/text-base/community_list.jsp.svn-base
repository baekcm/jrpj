<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />

<script type="text/javascript">
//<![CDATA[

	$(function(){
		
		// 상세 보기 및 수정
		$("a[name=clkSubject]").click(function(){
			
			var dataSeq = $(this).attr("id");
			$("#dataSeq").val(dataSeq);
			$("#mode").val('update');
			
			$("#pageFrm").attr("action", "/front/community/community_view").submit();
		});
		
		// 등록
		$("#insertBtn").click(function(){
			$("#mode").val('insert');
			$("#pageFrm").attr("action", "/front/community/community_writeForm").submit();
		});
		
	});
	
	function goSearch(){
/* 		
		if( $('#searchValTxt').val() == '' && $('#searchKeySlct').val() != '' )
		{
			alert("검색 키워드를 주십시오.");
			$('#searchValTxt').focus();
			return;
		} */
		
		var boardSeq = $(this).attr("data");
		var dataSeq = $(this).attr("id");
		$("#boardSeq").val(boardSeq);
		$("#dataSeq").val(dataSeq);
		
		$("#pageFrm").attr("action", "/front/community/${boardSeq}").submit();
    }
	
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/front/community/${boardSeq}").submit();
	}
	
//]]>
</script>

</head>

<body>

<form method="post" name="pageFrm" id="pageFrm">
<input type="hidden" name="dataSeq" id="dataSeq" />
<input type="hidden" name="boardSeq" id="boardSeq" value="${ boardSeq }" />
<input type="hidden" name="pageNum" id="pageNum" />
<input type="hidden" name="mode" id="mode" />
<input type="hidden" name="menuSeq" id="menuSeq" value="${menuSeq }" />

<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="topVisual">
	<div id="visual"><img src="/resources/include/commonfile/image/visual/visual01.jpg" alt="눈과 귀를 열고 고객만족 1등 공기업을 만들기위해 최선을 다하겠습니다." /> </div>
</div>
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<div class="lnbBody">
				<ul id="lnb" class="lnbul">
					<li></li>
				</ul>
			</div>
			<!--lnb Bottom Icon Area -->
			<jsp:include page="/resources/include/commonfile/inc/lnb_bottom.jsp" />
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<div class="top_info"> 
					<p class="infom">자유게시판은 건전하고 자유로운 의견을 나눌 수 있는 공간입니다.<br />
답변을 원하시는 사항이나 민원관련 내용은 전자민원 메뉴를 이용하여 주시기 바랍니다.<br />
<strong>개인정보, 음란물, 상품광고 등의 본래의 취지에 부합되지 않은 게시물은 예고 없이 삭제 될 수 있습니다.</strong></p>
				</div>
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
						<select name="commCodeSeq" id="commCodeSeq" title="시설 카테고리">
							<option value="">전체</option>
							<c:if test="${ facilList != null && fn:length(facilList) > 0 }">
								<c:forEach items="${ facilList }" var="list">
									<option value="${ list.commCodeSeq }" <c:if test="${ list.commCodeSeq eq commCodeSeq }">selected="selected"</c:if> >${list.codeNm }</option>
								</c:forEach>
							</c:if>
						</select>
						<select name="searchKey" id="searchKeySlct" title="검색 방법 선택">
							<option value="subject" <c:if test="${searchKey eq 'subject' }">selected="selected"</c:if> >제목</option>
							<option value="content"	<c:if test="${searchKey eq 'content' }">selected="selected"</c:if> >내용</option>
							<option value="name" <c:if test="${searchKey eq 'name' }">selected="selected"</c:if> >작성자</option>
						</select>
						<input type="text" name="searchVal" id="searchValTxt" value="${ searchVal }" title="검색어 입력" class="schKwd" style="width:200px;" onKeyDown="if(event.keyCode==13){javascript:goSearch();return false;}" />
						<a href="javaScript:goSearch();" id="searchBtn" name="searchBtn"><img src="/resources/include/commonfile/image/common/btn_search.gif" alt="검색" /></a>
					</div>
					<!-- Sports & culture list top Search -->
					
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 게시물의 목록표">
							<caption>게시물 리스트</caption>
							<colgroup>
								<col width="70px" />
								<col width="" />
								<col width="120px" />
								<col width="120px" />
								<col width="70px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ communityListBbs != null && fn:length(communityListBbs) > 0 }">
										<c:forEach items="${ communityListBbs }" var="list">
											<tr>
												<td>
													${ list.listNo }
												</td>
												<td class="title">
													<a href="#" data="${ list.boardSeq }" id="${ list.dataSeq }" name="clkSubject">${ list.subject }</a>
												</td>
												<td>
													
													${ fn:trim(list.createNm)}
												</td>
												<td>
													${ fn:substring(list.createYmd,0,4) }-${ fn:substring(list.createYmd,4,6) }-${ fn:substring(list.createYmd,6,8) }
												</td>
												<td>
													${ list.hitnum }
												</td>
											</tr>
										</c:forEach>  
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" align="center">등록된 게시물이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					<!-- 
					<div class="pgeAbs mt30"> 
						<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
					</div>
					-->
						<!-- board paging --> 
						<div class="pgeAbs mt30">
							<c:if test="${communityListBbs != null && fn:length(communityListBbs) > 0 }">
							<p class="paging">${pageIndexList }</p>
							</c:if>
							<div class="frBtn"> 
							<!-- Text Button -->
							<!-- c:if test="${userInfo.userNm ne null && userInfo.userNm ne ''}"-->
								<span class="txtBtn_Gray"><a href="#" id="insertBtn">글쓰기</a></span>
							<!-- /c:if-->
							<!-- Text Button --> 
							</div>
						</div>
					<!-- board paging --> 
				</div>
				
				<!-- search Box -->
				<!-- search Box --> 
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
</form>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(4,3,0,0);</script>

</body>
</html>