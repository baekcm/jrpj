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
	
	$(".tblWrap").find("span[id='weekCdTd']").each(function(e){
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
	
	$("a[name=detailPgm]").click(function(){
		var pgmCd = $(this).find("input[name=pgmCd]").val();
		var comCd3 = $(this).find("input[name=detailPgm]").val();
		var onCnt = $(this).find("input[name=onCnt]").val();
		var offCnt = $(this).find("input[name=offCnt]").val();
		var saleId = $(this).find("input[name=saleId]").val();
		var upId = $(this).find("input[name=upId]").val();
		
		$("#pgmCd").val(pgmCd);
		$("#comCd3").val(comCd3);
		$("#onlineAcceptCnt").val(onCnt);
		$("#offlineAcceptCnt").val(offCnt);
		$("#pageFrm").attr("action","/front/formViewPgm/"+upId+"/"+saleId).submit();
	});
});
function setPage(pageNo){
	$("#pageNum").val(pageNo);
	$("#pgmCd").val("");
	$("#comCd3").val("");
	$("#offlineAcceptCnt").val("");
	$("#onlineAcceptCnt").val("");
	$("#pageFrm").attr("action","/main/search/pgm/${upId}").submit();
}
</script>
</head>

<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="pgmCd" id="pgmCd" />
	<input type="hidden" name="comCd3" id="comCd3" />
	<input type="hidden" id="yymm" name="yymm" value="${yymm }"  />
	<input type="hidden" id="offlineAcceptCnt" name="offlineAcceptCnt" />
	<input type="hidden" id="onlineAcceptCnt" name="onlineAcceptCnt" />
</form>
<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="middle" >
	<div id="contbody">
		<div class="seh_board mb40">
			<div class="ovh">
				<p class="s_title"><img src="/resources/include/commonfile/image/common/bul_dp1.gif" alt="" />강좌 <span><strong>(총 ${pgmTotCnt }건)</strong></span></p>
			</div>
			<ul class="tblWrap">
				<li>
				<c:choose>
					<c:when test="${listProgram != null && fn:length(listProgram) > 0 }">
					<c:forEach items="${listProgram }" var="listProgram" >
					<dl>
						<dt> 
							<a href="#" name="detailPgm">
								<input type="hidden" name="upId" value="${listProgram.upId }"/>
								<input type="hidden" name="saleId" value="${listProgram.saleComCd }"/>
								<input type="hidden" name="detailPgm" value="${listProgram.comCd3 }"/>
								<input type="hidden" name="pgmCd" value="${listProgram.pgmCd }"/>
								<input type="hidden" name="offCnt" value='${fn:trim(listProgram.offlineAcceptCnt<0?"0":listProgram.offlineAcceptCnt )}' />
								<input type="hidden" name="onCnt" value='${fn:trim(listProgram.onlineAcceptCnt<0?"0":listProgram.onlineAcceptCnt )}' />
								<strong><span class="point_pulple">[${fn:trim(listProgram.comNm4 )}]</span> <span class="point_blue01">[${fn:trim(listProgram.comNm2 )}]</span> ${fn:trim(listProgram.pgmNm )}</strong>
							</a> 
						</dt>
						<dd>요일 : <span id="weekCdTd">${fn:trim(listProgram.dtWeekCd )}</span> 
						| 시간 : ${fn:substring(listProgram.startT,0,2)}:${fn:substring(listProgram.startT,2,4)}~${fn:substring(listProgram.endT,0,2)}:${fn:substring(listProgram.endT,2,4)} 
						| 대상 : ${fn:trim(listProgram.comNm3 )} 
						| 회비: <fmt:formatNumber value="${listProgram.uPrice }" pattern="#,###"/>원 
						| 접수중 (${fn:trim(listProgram.offlineAcceptCnt<0?"0":listProgram.offlineAcceptCnt )} / ${fn:trim(listProgram.onlineAcceptCnt<0?"0":listProgram.onlineAcceptCnt )})</dd>
					</dl>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<dl>
						<dt>검색결과가 없습니다.</dt>
						<dd></dd>
					</dl>
					</c:otherwise>
				</c:choose>		
					
				</li>
			</ul>
		</div>
		<!-- board paging -->
			<!--페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-->
			<c:if test="${listProgram != null && fn:length(listProgram) > 0 }">
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