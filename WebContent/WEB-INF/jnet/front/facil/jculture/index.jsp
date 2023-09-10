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
	
	$(".tblWrap").find("td[id='weekCdTd']").each(function(e){
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
	
	$(function(){
		$(".noitceBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,4);
		});
		$(".tenderBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,9);
		});
		$(".recBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,10);
		});
		$(".lecBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,8);
		});	
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
	function goBoard(dataSeq ,com,boardSeq){
		$("#dataSeq").val(dataSeq);
		$("#commCodeSeq").val(com);
		$("#boardSeq").val(boardSeq);
		$("#pageFrm").attr("action","/front/notice/notice_view").submit();
	}
	function moreBoard(boardSeq){
		$("#commCodeSeq").val(7);
		$("#pageFrm").attr("action","/front/notice/"+boardSeq).submit();
	}

	
</script>
</head>

<body>
<form name="pageFrm" id="pageFrm" method="post">
	<input type="hidden" name="pgmCd" id="pgmCd" />
	<input type="hidden" name="comCd3" id="comCd3" />
	<input type="hidden" id="yymm" name="yymm" value="${yymm }"  />
	<input type="hidden" id="offlineAcceptCnt" name="offlineAcceptCnt" />
	<input type="hidden" id="onlineAcceptCnt" name="onlineAcceptCnt" />
	<input type="hidden" name="dataSeq" id="dataSeq" />
	<input type="hidden" name="boardSeq" id="boardSeq" />
	<input type="hidden" name="commCodeSeq" id="commCodeSeq" />
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
				<!-- page Top -->
				<div id="pageTop">
					<div id="pageTopNews">
						<p><a href="#link">[회관] 재밌는 오페라 이야기 - 금관악기 연주회 안내 글 줄임 표시 여부 테스트를 위해 길게 늘여 쓰기</a></p>
					</div>
					<div id="pageTopSearch">
						<form name="ptsearch" method="post" id="ptsearch" action="/main/search/41">
							<input type="text" name="searchVal" id="ptschKwd" />
							<input type="image" alt="검색" id="ptschBtn" src="/resources/include/commonfile/image/common/btn_search.gif"/>
						</form>
					</div>
				</div>
				<!-- page Top --> 
				<!-- Sub main rolling banner-->
				<div id="subRollBan"> 
					
					<!-- 팝업존 S --> 
					
					<script type="text/javascript">
                    
                    $(function(){
                    var banner = $('#popZone').bxSlider({
                    mode: 'fade',
                    infiniteLoop: false,
                    //hideControlOnEnd: false,
                    pager: true,  //페이지 설정 css 설정값
                    auto: true,
                    controls: false
                    //randomStart: true
                    });
                    
                    $('#popZoneStart').click(function(){banner.startShow();    return false;  });
                    $('#popZoneStop').click(function(){banner.stopShow();    return false;  });
                    $('#popZoneGoback').click(function(){banner.goToPreviousSlide();    return false;  });
                    $('#popZoneGofor').click(function(){banner.goToNextSlide();    return false;  });
                    });
                    
                    </script>
					<div class="popzoneArea" id="GoContent">
						<ul class="controlArea">
							<li><a id="popZoneStop" href="#none"><img src="/resources/include/commonfile/image/main/btn_rollStop.png" alt="팝업존멈춤" /></a></li>
							<li><a id="popZoneStart" href="#none"><img src="/resources/include/commonfile/image/main/btn_rollPlay.png" alt="팝업존시작" /></a></li>
						</ul>
						<ul class='popView numbg04' id='popZone'>
						<c:choose>
							<c:when test="${listPopup == null || fn:length(listPopup) == 0}">
								<li><img src="/resources/include/commonfile/image/main/rban01.gif"  alt="defalt image" /></li>
							</c:when>
							<c:otherwise>
								<c:forEach var="listPopup" items="${listPopup}">
									<li><a href="http://${ listPopup.linkUrl }" target="${ listPopup.linkTgt }" class="popImgArea" ><img src="${ listPopup.filePath }${ listPopup.realFileNm }" alt="${ listPopup.orgnlFileNm }" /></a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
					
					<!-- 팝업존 E --> 
				</div>
				<!-- Sub main rolling banner--> 
				
				<!-- sub news tab & gal post -->
				<div class="mainmiddle"> 
					<!-- sub main news area -->
					<div id="newsArea">
<div id="tabcontainer" class="maintab">
							<h2 class="tabtit1"><a href="#sttab1"><img src="/resources/include/commonfile/image/common/tab_news_on.png" alt="공지사항"/></a></h2>
							<div id="sttab1">
								<ul>						
								<c:choose>
								<c:when test="${listNotice == null || fn:length(listNotice) == 0}">
									<li>등록된 게시물이 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="listNotice" items="${listNotice}">
										<li><span class="listx"><a href="#" class="noitceBtn"  data="${listNotice.dataSeq}" com="${listNotice.commCodeSeq}" >${ listNotice.subject }</a></span>
										<c:if test="${ listNotice.newYn eq 'Y' }">
											<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
										</c:if>								
										<span class="date">${ listNotice.createYmd }</span>
										</li>
									</c:forEach>
								</c:otherwise>
								</c:choose>	
								</ul>
								<p class="btnMore"><a href="#" onclick="moreBoard('4');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
							</div>
							<h2 class="tabtit2"><a href="#sttab2"><img src="/resources/include/commonfile/image/common/tab_notice_off.png" alt="입찰정보"/></a></h2>
							<div id="sttab2">
								<ul>
								<c:choose>
								<c:when test="${listTender == null || fn:length(listTender) == 0}">
									<li>등록된 게시물이 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="listTender" items="${listTender}">
										<li><span class="listx"><a href="#" class="tenderBtn"  data="${listTender.dataSeq}" com="${listTender.commCodeSeq}"  >${ listTender.subject }</a></span>
										<c:if test="${ listTender.newYn eq 'Y' }">
											<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
										</c:if>								
										<span class="date">${ listTender.createYmd }</span>
										</li>
									</c:forEach>
								</c:otherwise>
								</c:choose>	
								</ul>
								<p class="btnMore"><a href="#" onclick="moreBoard('9');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
							</div>
							<h2 class="tabtit3"><a href="#sttab3"><img src="/resources/include/commonfile/image/common/tab_free_off.png" alt="채용공고"/></a></h2>
							<div id="sttab3">
								<ul>
								<c:choose>
								<c:when test="${listRecruit == null || fn:length(listRecruit) == 0}">
									<li>등록된 게시물이 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="listRecruit" items="${listRecruit}">
										<li><span class="listx"><a href="#" class="recBtn"  data="${listRecruit.dataSeq}" com="${listRecruit.commCodeSeq}" >${ listRecruit.subject }</a></span>
										<c:if test="${ listRecruit.newYn eq 'Y' }">
											<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
										</c:if>								
										<span class="date">${ listRecruit.createYmd }</span>
										</li>
									</c:forEach>
								</c:otherwise>
								</c:choose>
								</ul>
								<p class="btnMore"><a href="#" onclick="moreBoard('10');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
							</div>
							<h2 class="tabtit4"><a href="#sttab4"><img src="/resources/include/commonfile/image/common/tab_faq_off.png" alt="강좌안내"/></a></h2>
							<div id="sttab4">
								<ul>
								<c:choose>
								<c:when test="${listLecture == null || fn:length(listLecture) == 0}">
									<li>등록된 게시물이 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="listLecture" items="${listLecture}">
										<li><span class="listx"><a href="#" class="lecBtn"  data="${listLecture.dataSeq}" com="${listLecture.commCodeSeq}" >${ listLecture.subject }</a></span>
										<c:if test="${ listLecture.newYn eq 'Y' }">
											<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
										</c:if>								
										<span class="date">${ listLecture.createYmd }</span>
										</li>
									</c:forEach>
								</c:otherwise>
								</c:choose>	
								</ul>
								<p class="btnMore"><a href="#" onclick="moreBoard('8');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
							</div>
						</div>
						<script type="text/javascript">tabList('tabcontainer', 0);</script> 
					</div>
					<!-- sub main news area --> 
					<!-- sub main photo gal area -->
					<div id="photoGal">
						<div class="pgTop">
							<h2><img src="/resources/include/commonfile/image/common/title_submainphoto.gif" alt="포토갤러리" /></h2>
							<div class="btn_more"> <a href="#link"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기" /></a> </div>
						</div>
						<ul>
						<c:choose>
						<c:when test="${listPhoto == null || fn:length(listPhoto) == 0}">
							<li>등록된 게시물이 없습니다.</li>
						</c:when>
						<c:otherwise>
							<c:forEach var="listPhoto" items="${listPhoto}">
								<li>
									<dl>
										<dd><a href="/open/gallery_view.jsp"><img src="${ listPhoto.filePathNm }" alt="포토갤러리 사진" /></a></dd>
										<dt><a href="/open/gallery_view.jsp">${ listPhoto.subject }</a></dt>
									</dl>
								</li>
							</c:forEach>
						</c:otherwise>
						</c:choose>	
						</ul>
					</div>
					<!-- sub main photo gal area --> 
				</div>
				<div class="pageSection">
					<div class="pgTop mb10">
						<h2><img src="/resources/include/commonfile/image/common/title_program.gif" width="107" height="19" alt="프로그램 안내" /></h2>
						<div class="btn_more"><a href="/front/program/41/01"><img src="/resources/include/commonfile/image/common/btn_total.gif" width="50" height="17" alt="전체보기" /></a> </div>
					</div>
					<div class="tblWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="과정별 프로그램명과 운영 요일 시간, 대상을 안내한 표. " class="tbl01 tdCenter">
							<caption>
							프로그램안내
							</caption>
							<colgroup>
							<col style="width:90px;" />
							<col />
							<col style="width:90px;" />
							<col style="width:130px;" />
							<col style="width:90px;" />
							</colgroup>
							<tr>
								<th scope="col">과정명</th>
								<th scope="col">프로그램명</th>
								<th scope="col">요일</th>
								<th scope="col">시간</th>
								<th scope="col">대상</th>
							</tr>
							<c:choose>
							<c:when test="${listProgram != null && fn:length(listProgram) > 0 }">
								<c:forEach var="listProgram" items="${listProgram}">
								<tr>	
									<td class="progThumb"><img src="${listProgram.pgmFileImg}" alt="${fn:trim(listProgram.pgmNm )}" /></td>
									<td>
										<a href="#" name="detailPgm">
											<input type="hidden" name="upId" value="${listProgram.upId }"/>
											<input type="hidden" name="saleId" value="${listProgram.saleComCd }"/>
											<input type="hidden" name="detailPgm" value="${listProgram.comCd3 }"/>
											<input type="hidden" name="pgmCd" value="${listProgram.pgmCd }"/>
											<input type="hidden" name="offCnt" value='${fn:trim(listProgram.offlineAcceptCnt<0?"0":listProgram.offlineAcceptCnt )}' />
											<input type="hidden" name="onCnt" value='${fn:trim(listProgram.onlineAcceptCnt<0?"0":listProgram.onlineAcceptCnt )}' />
											${fn:trim(listProgram.pgmNm )}
										</a>
									</td>
									<td id="weekCdTd" >${fn:trim(listProgram.dtWeekCd )}</td>
									<td>${fn:substring(listProgram.startT,0,2)}:${fn:substring(listProgram.startT,2,4)}
											~
											${fn:substring(listProgram.endT,0,2)}:${fn:substring(listProgram.endT,2,4)}
									</td>
									<td>${fn:trim(listProgram.comNm3 )}</td>
								</tr>	
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="5">등록된 게시물이 없습니다.</td>
							</tr>	
							</c:otherwise>
							</c:choose>	
						</table>
					</div>
				</div>
				<!-- sub news tab & gal post --> 
				
				<!-- real Contents --> 
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(1,3,0,0);</script>
</body>
</html>