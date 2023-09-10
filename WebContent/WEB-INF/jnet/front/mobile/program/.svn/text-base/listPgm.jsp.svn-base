<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>프로그램안내-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<link href="/resources/include/mobile/inc/css/mboard.css" rel="stylesheet" type="text/css" />
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
		$("div.title").text(tag);
		
		$("span.weekCdTd").each(function(e){
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
	});
	function setPage(pageNo){ 
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/m/program/listPgm/${upId}/${saleId}").submit();
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
</form>
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
	<ul class="bbs_list">
		<c:choose>
			<c:when test="${listProgram != null && fn:length(listProgram) > 0 }">
					<c:forEach items="${listProgram }" var="list" >
						<c:set var="offCnt" value="${fn:trim(list.offlineAcceptCnt<0?'0':list.offlineAcceptCnt )}" />
						<c:set var="onCnt" value="${fn:trim(list.onlineAcceptCnt<0?'0':list.onlineAcceptCnt )}" />
						<li>
							<div class="bg">
								<a href="/m/program/findPgm/${upId }/${saleId}/${list.pgmCd }/${list.comCd3}">
									<dl>
										<dt>${fn:trim(list.pgmNm )}</dt>
										<dd> 
											<!--프로그램 정보--> 
											<span class="title">요일:</span><span class="ddata weekCdTd">${fn:trim(list.dtWeekCd )}</span> 
											<!--프로그램 정보--> 
										</dd>
										<dd> 
											<!--프로그램 정보--> 
											<span class="title">시간:</span><span class="ddata">
													${fn:substring(list.startT,0,2)}:${fn:substring(list.startT,2,4)}
													~
													${fn:substring(list.endT,0,2)}:${fn:substring(list.endT,2,4)}</span> 
											<!--프로그램 정보--> 
										</dd>
										<dd> 
											<!--프로그램 정보--> 
											<span class="title">대상:</span><span class="ddata">${fn:trim(list.comNm3 )}</span> 
											<!--프로그램 정보--> 
										</dd>
										<dd> 
											<!--프로그램 정보--> 
											<span class="title">회비:</span><span class="ddata"><fmt:formatNumber value="${list.uPrice }" pattern="#,###"/> 원</span> 
											<!--프로그램 정보--> 
										</dd>
										<dd> 
											<!--프로그램 정보--> 
											<span class="title">접수:</span><span class="ddata"><strong class="point_blue01">접수중</strong>(${offCnt} / ${onCnt})</span> 
											<!--프로그램 정보--> 
										</dd>
									</dl>
								</a> 
							</div>
						</li>
					</c:forEach>
			</c:when>
			<c:otherwise>
				<dl>
					<dd>결과가 존재하지 않습니다</dd>
				</dl>
			</c:otherwise>
		</c:choose>
	</ul>
	<c:if test="${listProgram != null && fn:length(listProgram) > 0 }">
		<div class="paging">${pageIndexList }</div>
	</c:if>
	<!--real Contents E--> 
</div>
<jsp:include page="/resources/include/mobile/inc/bottom.jsp" />
</body>
</html>
