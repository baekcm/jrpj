<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="/resources/admin_include/commonfile/js/excanvas.js"></script><![endif]-->
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript">
  	$(document).ready(function(){
  		$.jqplot.config.enablePlugins = true;
  		//초기 통계
  		 callChart(0,0);
  		
  		//메인탭 통계
  		$("a.mainTab").click(function(){
  			if($(this).parent().hasClass("choiced")) {
  				return;
  			}
  			var idx = $("a.mainTab").index(this);
  			callChart(idx,0);
  			$("a.mainTab").parent().removeClass("choiced");
  			$("a.mainTab:eq("+idx+")").parent().addClass("choiced");
  			$("a.subTab > span").removeClass("point");
  			$("a.subTab:eq(0) > span").addClass("point");
  			$("#yearSpn").hide();
  			$("#monthSpn").hide();
  			$("#weekSpn").hide();
  		});
  		
  		//하위탭통계
  		$("a.subTab").click(function(){
  			if($(this).find("span").hasClass("point")) {
  				return;
  			}
  			var idx = $("a.subTab").index(this);
  			var mainIdx = 0;
  			
  			$("a.mainTab").each(function(i){
  				if($(this).parent().hasClass("choiced")) {
  					mainIdx = i;
  				}
  			});
  			
  			$("a.subTab > span").removeClass("point");
  			$("a.subTab:eq("+idx+") > span").addClass("point");
  			
  			if(idx == 0) {
  				$("#monthSpn").hide();
  				$("#weekSpn").hide();
  				$("#yearSpn").hide();
  			}else if(idx == 1) {
  				$("#yearSpn").show();
  				$("#monthSpn").hide();
  				$("#weekSpn").hide();
  			} else if(idx == 2) {
  				$("#yearSpn").show();
  				$("#monthSpn").show();
  				$("#weekSpn").hide();
  			} else if(idx == 3) {
  				$("#yearSpn").show();
  				$("#monthSpn").show();
  				$("#weekSpn").show();
  			}
  			callChart(mainIdx,idx);
  		});
        
  		//게시물 제목클릭
        $("a[name=clkSubject]").click(function(){
			var boardSeq = $(this).attr("class");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			$("#pageFrm").attr("action","/admin/findBbsData?gseq=3&lseq=0").submit();
		});
  		
  		$("#moreBtn").click(function(){
  			location.href = "/admin/listLeastBbsData";
  		});
    });
  	
  	
</script>
<!-- Don't touch this! -->
<script type="text/javascript" src="/resources/admin_include/commonfile/js/jquery.jqplot.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/syntaxhighlighter/scripts/shBrushXml.js"></script>
<!-- Additional plugins go here -->
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.pointLabels.js"></script>
<!-- End additional plugins -->
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="dataSeq" id="dataSeq" />
	<input type="hidden" name="boardSeq" id="boardSeq" />
</form>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<div class="lnbBody"> 
				<ul id="lnb" class="lnbul">
					<c:if test="${adminInfo.admAuthCode eq 'S' }">
						<c:if test="${gnb != null && fn:length(gnb) > 0 }">
							<c:forEach items="${gnb }" var="gnb">
								<li> 
									<a href="${gnb.menuUrl }?gseq=${gnb.menuSeq}&lseq=0">
										${gnb.menuNm }
									</a>
								</li>
							</c:forEach>
						</c:if>
					</c:if>
					<c:if test="${adminInfo.admAuthCode eq 'O' }">
						<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
							<c:set var="bbsCnt" value="0" />	
							<c:set var="ctsCnt" value="0" />
							<c:set var="pgmCnt" value="0" />
							<c:set var="cptCnt" value="0" />
							<c:set var="ctsMainUrl" value="" />
							<c:set var="pgmMainUrl" value="" />
							<c:set var="bbsMainUrl" value="" />
							<c:set var="cptMainUrl" value="" />
							<c:forEach items="${authInfo }" var="list">
								<c:if test="${list.menuType eq 'BBS' }">
									<c:if test="${bbsCnt eq 0 }">
										<c:set var="bbsMainUrl" value="/admin/listBbsMng?gseq=3" />
									</c:if>
									<c:set var="bbsCnt" value="${bbsCnt+1 }" />
								</c:if>
								<c:if test="${list.menuType eq 'ACTS' }">
									<c:if test="${ctsCnt eq 0 }">
										<c:set var="ctsMainUrl"  value="${list.menuUrl }?gseq=4" />
									</c:if>								
									<c:set var="ctsCnt" value="${ctsCnt+1 }" />
								</c:if>
								
								<c:if test="${list.menuType eq 'ACPT' }">
									<c:if test="${cptCnt eq 0 }">
										<c:set var="cptMainUrl"  value="${list.menuUrl }?gseq=7" />
									</c:if>								
									<c:set var="cptCnt" value="${cptCnt+1 }" />
								</c:if>
								
							</c:forEach>
							<c:if test="${bbsCnt > 0 }">
								<li id="gnb2" >
									<a href="${bbsMainUrl }">
										게시판관리
									</a>
								</li>
							</c:if>
							<c:if test="${ctsCnt > 0 }">
								<li id="gnb2" >
									<a href="${ctsMainUrl }">
										컨텐츠관리
									</a>
								</li>
							</c:if>
							<c:if test="${cptCnt > 0 }">
								<li id="gnb2" >
									<a href="${cptMainUrl }">
										민원관리
									</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${pgmAuthInfo != null && fn:length(pgmAuthInfo) > 0 }">
							<li id="gnb2" >
								<a href="/admin/listPgmMng?gseq=5">
									프로그램관리
								</a>
							</li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>메인화면</h3>
				<p class="navi"></p>
			</div> 
			<div class="contents"> 
				<h3 class="pTitle">관리자정보</h3>
				<div class="boardWrap mb30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="" class="bd00view" id="empTbl">
						<colgroup>
						<col width="150px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"> 아이디 </th>
							<td class="bd01td"> ${adminInfo.admId }(${adminInfo.admType }) </td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"> 이름(e-mail) </th>
							<td class="bd01td"> ${adminInfo.admNm }(${adminInfo.admEmail1 }@${adminInfo.admEmail2 }) </td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"> 최근접속정보 </th>
							<td class="bd01td"> ${adminInfo.loginHitNum}회방문(${fn:substring(adminInfo.loginYmd,0,4)}.${fn:substring(adminInfo.loginYmd,4,6)}.${fn:substring(adminInfo.loginYmd,6,8)}) </td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"> 최종접속아이피 </th>
							<td class="bd01td"> ${adminInfo.loginIp } </td>
						</tr>
					</table>
				</div>
				<table width="100%">
					<colgroup>
					<col width="50%" />
					<col width="50%" />
					</colgroup>
					<tr>
						<td valign="top"><h3 class="pTitle">회원정보</h3>
							<div class="boardWrap">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="" class="bd00view" id="empTbl">
									<colgroup>
									<col width="150px" />
									<col />
									</colgroup>
									<tr>
										<th class="ta_l" scope="row"> 전체회원수 </th>
										<td class="bd01td" style="text-align: right;"> ${cntResult.allMemCnt }명 </td>
									</tr>
									<tr>
										<th class="ta_l" scope="row"> 오늘가입회원수 </th>
										<td class="bd01td" style="text-align: right;"> ${cntResult.todayMemCnt }명 </td>
									</tr>
								</table>
							</div></td>
						<td><h3 class="pTitle">민원현황</h3>
							<div class="boardWrap">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="" class="bd00view" id="empTbl">
									<colgroup>
									<col width="150px" />
									<col />
									</colgroup>
									<tr>
										<th class="ta_l" scope="row"> 전체민원수 </th>
										<td class="bd01td" style="text-align: right;"> ${cntResult.allMinwonCnt }건 </td>
									</tr>
									<tr>
										<th class="ta_l" scope="row"> 오늘발생민원수 </th>
										<td class="bd01td" style="text-align: right;"> ${cntResult.todayMinwonCnt }건 </td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table>
				
				<h4 class="pTitle mt30">기간별 통계</h4>
				<div class="ttabWrap">
					<ul id="ttab3">
						<li class="choiced"> <a style="text-decoration: none;cursor: pointer;" id="memberTab" class="mainTab"> 회원가입통계 </a> </li>
						<li> <a style="text-decoration: none;cursor: pointer;" id="siteTab" class="mainTab"> 접속통계 </a> </li>
					</ul>
				</div>
				<div class="ttabWrap">
					<ul id="ttab4">
						<li class="choiced"> <a style="text-decoration: none;cursor: pointer;" id="yearTab" class="subTab"> <span class="point">연도별</span> </a> </li>
						<li> <a style="text-decoration: none;cursor: pointer;" id="monthTab" class="subTab"> <span class="">월별</span> </a> </li>
						<li> <a style="text-decoration: none;cursor: pointer;" id="dayTab" class="subTab"> <span class="">일별</span> </a> </li>
						<li> <a style="text-decoration: none;cursor: pointer;" id="dateTab" class="subTab"> <span class="">요일별</span> </a> </li>
					</ul>
				</div>
				<div style="text-align: center; font-size: 15px;font-weight: bold;" class="textBox1">
					 <span id="yearSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;">${year }년</span>
					 <span id="monthSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;">${month }월</span> 
					 <span id="weekSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;">${week }주차</span> </div>
				<div id="chart1" style="height:300px;"></div>
				<h3 class="pTitle mt30">최근게시물</h3>
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
						<colgroup>
						<col width="140px" />
						<col width="140px" />
						<col width="120px" />
						<col />
						<col width="60px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">시설명</th>
								<th scope="col">제목</th>
								<th scope="col">글등록자</th>
								<th scope="col">날짜</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${listLeastBbsData != null && fn:length(listLeastBbsData) > 0 }">
								<c:forEach items="${listLeastBbsData }" var="list">
									<tr>
										<td> ${list.codeNm } </td>
										<td align="center"><a style="text-decoration:underline;font-weight: bold;" href="#" class="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">${list.subject }</a></td>
										<td> ${list.createNm } </td>
										<td> ${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)} </td>
										<td> ${list.hitnum } </td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" align="center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>