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
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
<script type="text/javascript">
$(function(){
	mergePgmRowSpan("mergeTbl",1);
	
	$(".tblWrap").find("td.weekCdTd").each(function(e){
		var week = $.trim($(this).text());
		var length = week.length;
		var weekNm = "";
		var arr = new Array("월","화","수","목","금","토","일");
		for(var i=0; i<length; i++) {
			if(week.charAt(i) == "1") {
				weekNm += arr[i]+',';
			}
		}
		weekNm = weekNm.substring(0,weekNm.length-1);
		$(this).text(weekNm);
	});
	$("#searchBtn").click(function(){
		$("#basId").val($("#basIdSlct").val());
		$("#timeCd").val($("#timeCdSlct").val());
		$("#pageFrm").attr("action","/front/program/${upId}/${saleId}").submit();
	});
	$("a[name=detailPgm]").click(function(){
		var pgmCd = $(this).attr("data");
		var comCd3 = $(this).attr("id");
		var onCnt = $(this).attr("onCnt");
		var offCnt = $(this).attr("offCnt");
		$("#pgmCd").val(pgmCd);
		$("#comCd3").val(comCd3);
		$("#onlineAcceptCnt").val(onCnt);
		$("#offlineAcceptCnt").val(offCnt);
		$("#pageFrm").attr("action","/front/formViewPgm/${upId}/${saleId}").submit();
	});
});
	function setPage(pageNo){ 
		$("#pageNum").val(pageNo);
		$("#pgmCd").val("");
		$("#comCd3").val("");
		$("#offlineAcceptCnt").val("");
		$("#onlineAcceptCnt").val("");
		$("#pageFrm").attr("action","/front/program/${upId}/${saleId}").submit();
	}
	function mergePgmRowSpan(tableId,idx){
		var that;
		$("#"+tableId+" > tbody tr").each(function(i){
			$(this).find("td:eq("+idx+")").each(function(){
				if ($(this).attr("data") == $(that).attr("data")) {
		            rowspan = $(that).attr("rowSpan");
		            if (rowspan == undefined) {
		       
		              $(that).attr("rowSpan",1);
		              rowspan = $(that).attr("rowSpan");
		            }
		            rowspan = Number(rowspan)+1;
		            $(that).attr("rowSpan",rowspan);
		            $(this).hide();
		            $(that).next().attr("rowSpan",rowspan);
		            $(this).next().hide();
	            	$(that).next().next().attr("rowSpan",rowspan);
		            $(this).next().next().hide();
		          } else {
		            that = this;
		          }
		          that = (that == null) ? this : that; 

			});
		});
	}
	</script>
</head>

<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="pgmCd" id="pgmCd" />
	<input type="hidden" name="comCd3" id="comCd3" />
	<input type="hidden" name="timeCd" id="timeCd" value="${timeCd }" />
	<input type="hidden" name="basId" id="basId" value="${basId }" />
	<input type="hidden" id="yymm" name="yymm" value="${yymm }"  />
	<input type="hidden" id="offlineAcceptCnt" name="offlineAcceptCnt" />
	<input type="hidden" id="onlineAcceptCnt" name="onlineAcceptCnt" />
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
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
							<select id="basIdSlct" style="width: 100px" title="스포츠 카테고리">
									<option value="">전체</option>
									<c:if test="${basList != null && fn:length(basList) > 0 }">
										<c:forEach items="${basList }" var="list">
											<option value="${list.codeId }"
												<c:if test="${list.codeId eq basId }">selected="selected"</c:if>
											>${list.codeNm }</option>	
										</c:forEach>
									</c:if>
							</select> 
							<select id="timeCdSlct" title="수업시간 카테고리">
								<option value="">전체</option>
								<option value="1"
								 	<c:if test="${timeCd eq '1' }">selected="selected"</c:if>
								>새벽(06~09)</option>
								<option value="2"
									<c:if test="${timeCd eq '2' }">selected="selected"</c:if>
								>오전(09~12)</option>
								<option value="3"
									<c:if test="${timeCd eq '3' }">selected="selected"</c:if>								
								>오후(12~18)</option>
								<option value="4"
									<c:if test="${timeCd eq '4' }">selected="selected"</c:if>
								>저녁(18~종료)</option>
						</select>
							<!-- <input type="text" name="pgtSchKwd" id="pgtSchKwd" title="키워드 입력"/> -->
							<input type="image" alt="검색" id="searchBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
					</div>
					<!-- Sports & culture list top Search -->
					
					<div id="listDiv"/>
					
					<div class="tblWrap">
						<table id="mergeTbl" width="100%" border="0" cellspacing="0" cellpadding="0" summary="번호,프로그램명,요일,시간,대상,회비,접수(오프라인/온라인) " class="tbl01 tdCenter">
							<caption>
							프로그램 리스트
							</caption>
							<colgroup>
							<col style="width:40px" />
							<col />
							<col style="width:120px" />
							<col style="width:120px" />
							<col style="width:80px" />
							<col style="width:80px" />
							<col style="width:115px" />
							</colgroup>
							<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">프로그램명</th>
								<th scope="col">요일</th>
								<th scope="col">이용시간</th>
								<th scope="col">대상</th>
								<th scope="col">수강료</th>
								<th scope="col">정원<br/>(방문/인터넷)</th>
							</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${listProgram != null && fn:length(listProgram) > 0 }">
											<c:forEach items="${listProgram }" var="list" >
											<c:set var="offCnt" value="${fn:trim(list.offlineAcceptCnt<0?'0':list.offlineAcceptCnt )}" />
											<c:set var="onCnt" value="${fn:trim(list.onlineAcceptCnt<0?'0':list.onlineAcceptCnt )}" />
											<tr>
												<td >
													${list.listNo }
												</td>
												<td class="rowSpnTd" data="${list.pgmCd }">
													${fn:trim(list.pgmNm )}
												</td >
												<td class="weekCdTd" data="${list.pgmCd }">
													${fn:trim(list.dtWeekCd )}
												</td>
												<td class="timeCdTd"  data="${list.pgmCd }">
													${fn:substring(list.startT,0,2)}:${fn:substring(list.startT,2,4)}
													~
													${fn:substring(list.endT,0,2)}:${fn:substring(list.endT,2,4)}
												</td>
												<td >
												${fn:trim(list.comNm3 )}
												</td>
												<td>
													<fmt:formatNumber value="${list.uPrice }" pattern="#,###"/> 원
												</td>
												<td>
													<strong class="point_color03"> </strong>
													<a href="#" style="text-decoration:underline;font-weight: bold;" name="detailPgm" id="${list.comCd3 }"  data="${list.pgmCd }" offCnt="${offCnt}" onCnt="${onCnt}" >															
														상세보기<br/>(${offCnt} / ${onCnt})
													</a>
												</td>
											</tr>
											</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7" align="center">결과가 존재하지 않습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
						<c:if test="${listProgram != null && fn:length(listProgram) > 0 }">
							<!-- board paging --> 
							<div class="pgeAbs mt30"> 
								<p class="paging">${pageIndexList }</p>
							</div>
						</c:if>					
					
					<!-- board paging 
					<div class="pgeAbs mt30"> 
						<! --페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-- >
						<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
					</div>
					-->
					<!-- board paging --> 
				</div>
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%-- <jsp:include page="/front/satfact/${menuSeq }" /> --%>
<div class="pollWrap">
	<div class="poll">
		<p class="text">이 페이지의 내용과 편의성에 만족하십니까?</p>
		<ul>
			<li>
				<label for="satisr5">
					<input name="satisr" id="satisr5" type="radio" value="" />매우만족</label>
			</li>
			<li>
				<label for="satisr4">
					<input name="satisr" id="satisr4" type="radio" value="" />만족</label>
			</li>
			<li>
				<label for="satisr3">
					<input name="satisr" id="satisr3" type="radio" value="" />보통</label>
			</li>
			<li>
				<label for="satisr2">
					<input name="satisr" id="satisr2" type="radio" value="" />불만족</label>
			</li>
			<li>
				<label for="satisr1">
					<input name="satisr" id="satisr1" type="radio" value="" />매우불만족</label>
			</li>
		</ul>
	</div>
	<div class="btn"><a href="#link"><img src="/resources/include/commonfile/image/common/btn_regist.png" alt="등록" onclick="alert('만족도 참여에 감사드립니다.')" /></a></div>
	<c:if test="${upId eq '11' }">
		<c:set var="dept" value="생활관팀" />
		<c:set var="tel" value="02-745-6701" />
	</c:if>
	<c:if test="${upId eq '21' }">
		<c:set var="dept" value="구민회관팀" />
		<c:set var="tel" value="02-3672-2530" />
	</c:if>
	<c:if test="${upId eq '41' }">
		<c:set var="dept" value="문화체육센터팀" />
		<c:set var="tel" value="02-732-9392" />
	</c:if>
	<c:if test="${upId eq '31' }">
		<c:set var="dept" value="구민회관팀" />
		<c:set var="tel" value="02-3675-5861" />
	</c:if>
	<c:if test="${upId eq '32' }">
		<c:set var="dept" value="생활관팀" />
		<c:set var="tel" value="02-3675-1318" />
	</c:if>
	<c:if test="${upId eq '33' }">
		<c:set var="dept" value="문화체육센터팀" />
		<c:set var="tel" value="02-2148-4068" />
	</c:if>
	<ul class="satis">
		<li>
			<dl>
				<dt>컨텐츠 관리부서 :</dt>
				<dd>${dept }</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>연락처</dt>
				<dd>${tel }</dd>
			</dl>
		</li>
		<li class="fr">
			<dl>
				<dt>최종수정일:</dt>
				<dd>2013-12-11</dd>
			</dl>
		</li>
	</ul>
</div>


				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(1,${upId=="11"?"1":upId=="21"?"2":upId=="41"?"3":upId=="32"?"5":upId=="33"?"6":4 },2, ${saleId=="01"?"1":saleId=="02"?"2":3 } );</script>
</body>
</html>