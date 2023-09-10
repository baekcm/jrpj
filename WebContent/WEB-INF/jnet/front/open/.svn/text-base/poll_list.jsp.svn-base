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
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>

<script type="text/javascript">
	$(function(){
		$("a.findPollTag").click(function(){
			$("#pageFrm").find("input[name=pollSeq]").val($(this).attr("data"));
			$("#pageFrm").submit();
		});
	});
</script>


</head>

<body>
<form action="/front/findPoll" method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="pageNum" id="pageNum"  />
	<input type="hidden" name="pollSeq"  />
</form>
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
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- real Contents -->
				<div class="pageSection">
				<div class="boardWrap">  
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,제목,작성자,공지기관명,등록일,첨부">
				<caption>
				게시물 리스트
				</caption>
				<colgroup>
				<col width="40px" />
				<col />
				<col width="65px" />
				<col width="85px" />
				<col width="70px" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">상태</th>
						<th scope="col">게시일</th>
						<th scope="col">투표수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${listPoll != null && fn:length(listPoll) > 0 }">
							<c:forEach items="${listPoll}" var="listPoll">
								<tr >
									<td >${listPoll.listNo }</td>
									<td class="title">
										<a href="#" class="findPollTag" data="${listPoll.pollSeq }">${listPoll.subject }</a>
									</td>
									<td >${listPoll.pollStatus }</td>
									<td>${fn:substring(listPoll.createYmd,0,4)}-${fn:substring(listPoll.createYmd,4,6)}-${fn:substring(listPoll.createYmd,6,8)}</td>
									<td>${listPoll.answerCnt }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr >
								<td colspan="5">등록된 설문이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
			
			<!-- Poll List --> 
			<!--paging -->
				<c:if test="${listPoll != null && fn:length(listPoll) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30">
							<p class="paging">${pageIndexList }</p>
						</div>
				</c:if>
					</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(4,2,0,0);</script>
</body>
</html>