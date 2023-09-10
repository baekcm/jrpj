<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=Edge" /> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery.bxSlider.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/maintab.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/main.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>

<script type="text/javascript">
$(function(){

	$("#searchBtn").click(function(){
		totalSearch();
	});
	$(".noitceBtn").click(function(){
		var dataSeq = $(this).attr("data");
		goBannerInfo(dataSeq,4);
	});
	$(".tenderBtn").click(function(){
		var dataSeq = $(this).attr("data");
		goBannerInfo(dataSeq,9);
	});
	$(".recBtn").click(function(){
		var dataSeq = $(this).attr("data");
		goBannerInfo(dataSeq,10);
	});
	$(".lecBtn").click(function(){
		var dataSeq = $(this).attr("data");
		goBannerInfo(dataSeq,8);
	});	
});
	
function goBannerInfo(dataSeq ,boardSeq){
	$("#dataSeq").val(dataSeq);
	$("#boardSeq").val(boardSeq);
	$("#pageFrm").attr("action","/front/notice/notice_view").submit();
}
function totalSearch(){
	
	if($.trim($("#msearchKWD").val())==""){
		alert("검색어를 입력해주세요.");
		$("#msearchKWD").focus();
		return false;
	}
	$("#msearch").attr("action","/main/search/00").submit();
}

	
	</script>
</head>

<body>
<form name="pageFrm" id="pageFrm" method="post">
<input type="hidden" name="dataSeq" id="dataSeq" />
<input type="hidden" name="boardSeq" id="boardSeq" />
</form>
<div class="accessibility"> <a href="#mSearch">본문바로가기</a> </div>
<div id="topheader">
	<%-- <%@ include file="/resources/include/commonfile/inc/top.jsp" %> --%>
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="middle" style="background:url(/resources/include/commonfile/image/main/bg_body.gif) 0 0 repeat-x">
	<div id="contbody">
		<div id="mSec1">
			<div class="slog1"><img src="/resources/include/commonfile/image/main/text_slog1.png" alt="품격있고 활기찬 문화예술도시 종로 Jongno" /></div>
			<div class="mSec1r">
				<div id="mSearch">
					<form name="msearch" id="msearch" method="post" action="/main/search/00">
						<p><span class="mschTitle"><img src="/resources/include/commonfile/image/main/title_mSearch.png" alt="통합검색" /></span>							
							<input type="text" name="searchVal" id="msearchKWD" title="검색어 입력" onKeyDown="if(event.keyCode==13){javascript:totalSearch();return false;}" />
							<img alt="검색" style="cursor: pointer;" id="searchBtn" src="/resources/include/commonfile/image/main/btn_mSearch.png" />
						</p>
					</form>
				</div>
				<div class="mSec1rBanArea">
					<div class="mSec1Ban1">
						<div class="mSBUp"><img src="/resources/include/commonfile/image/main/title_ms1.gif" alt="문화체육시설. Facilities of culture and gymmasium. 종로구시설관리공단의 문화,체율시설 안내입니다." /></div>
						<div class="mSBDn"> 
							<!--배너영역 S--> 
							<script type="text/javascript">
                    $(document).ready(function(){
                        //배너존 롤링 스크립트
                        var banner = $('#single-slider').bxSlider({
                        displaySlideQty: 1,         //표시갯수
                        moveSlideQty: 1,            //이동갯수
                        speed : 5000,                //이동속도 기본 500
                        controls : false,           //이전, 다음 표시여부 기본 true
                        wrapperWidth : 189,
                        mode : 'vertical',        //스크롤 모드'horizontal', 'vertical', 'fade'
                        auto: true                  //자동스크롤 여부 기본 false
                            });
                    
                        $('#bannerStart2').click(function(){banner.startShow();    return false;  });
                        $('#bannerStop2').click(function(){banner.stopShow();    return false;  });
                        $('#bannerNext2').click(function(){banner.goToNextSlide();    return false;  });
                        $('#bannerPrev2').click(function(){banner.goToPreviousSlide();    return false;  });
                        $('#BannerListSub2').hover(function(){banner.stopShow();    return false;  }, function(){banner.startShow();    return false;  });
                    });
                    </script>
							<div class="singleBannerArea">
								<div class="banhead">
									<div class="bannerControlArea"> <a id="bannerStop2" href="#none"><img src="/resources/include/commonfile/image/main/btn_rollStop.png" alt="배너멈춤" class="MAT5" /></a> <a id="bannerStart2" href="#none"><img src="/resources/include/commonfile/image/main/btn_rollPlay.png" alt="배너시작" /></a> </div>
								</div>
								<div class="banBtnPrev"><a href="#none" id="bannerPrev2"><img src="/resources/include/commonfile/image/main/btn_mBanPrev.gif" alt="이전 배너로 이동" /></a></div>
								<div class="bannerList">
									<ul id="single-slider">
										<li style='margin:0;padding:0;'> <a href='/front/main/11'><img src='/resources/include/commonfile/image/main/sban7.gif' alt="올림픽기념국민생활관.TEL:02-3673-4071.바로가기" /></a> </li>                                       
										<li style='margin:0;padding:0;'> <a href='/front/main/33'><img src='/resources/include/commonfile/image/main/sban2.gif' alt="삼청테니스장.TEL:02-2148-4068.바로가기" /></a> </li>
										<li style='margin:0;padding:0;'> <a href='/front/main/32'><img src='/resources/include/commonfile/image/main/sban3.gif' alt="청소년문화센터.TEL:02-3675-1318. 바로가기" /></a> </li>
										<li style='margin:0;padding:0;'> <a href='/front/main/31'><img src='/resources/include/commonfile/image/main/sban4.gif' alt="동부여성문화센터.TEL:02-3675-5861.바로가기" /></a> </li>
										<li style='margin:0;padding:0;'> <a href='/front/main/41'><img src='/resources/include/commonfile/image/main/sban5.gif' alt="종로문화체윤센터. TEL:02-732-9392. 바로가기" /></a> </li>
										<li style='margin:0;padding:0;'> <a href='/front/main/21'><img src='/resources/include/commonfile/image/main/sban6.gif' alt="종로구민회관.TEL:02-3672-2530.바로가기" /></a> </li>
									</ul>
								</div>
								<div class="banBtnNext"><a href="#none" id="bannerNext2"><img src="/resources/include/commonfile/image/main/btn_mBanNext.gif" alt="다음 배너로 이동" /></a></div>
							</div>
							<!--배너영역 E--> 
						</div>
					</div>
					<div class="mSec1Ban2">
						<div class="mSBUp"><img src="/resources/include/commonfile/image/main/title_ms2.gif" alt="주차시설. Facilities of Parking. 종로구시설관리공단의 주차시설 안내입니다." /></div>
						<div class="mSBDn"> 
							<span class="fl">
								<a href="http://jongno.park119.co.kr/user/index.aspx" target="_blank"><img src="/resources/include/commonfile/image/main/smban1.gif" alt="거주자우선주차안내" /></a>
							</span> 
							<span class="fr"><a href="/front/contents/97">
								<img src="/resources/include/commonfile/image/main/smban2.gif" alt="공영주차장안내" /></a>
							</span> 
						</div>
					</div>
					<div class="mSec1Ban3">
						<div class="mSBUp"><img src="/resources/include/commonfile/image/main/title_ms3.gif" alt="공공시설. Public Facilities. 종로구시설관리공단의 문화,공원시설입니다." /></div>
						<div class="mSBDn">
							<ul class="public">
								<li><a href="/front/contents/48"><img src="/resources/include/commonfile/image/main/slban1.gif" alt="인사동문화지구" /></a></li>
								<li><a href="/front/contents/49"><img src="/resources/include/commonfile/image/main/slban3.gif" alt="북악팔각정" /></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="slog2"><img src="/resources/include/commonfile/image/main/text_slog22.png" alt="눈과 귀를 열고 고객만족 1등 공기업을 만들기 위해 최선을 다하겠습니다." /></div>
			</div>
		</div>
		<div id="mSec2">
			<div class="noticeArea">
				<div id="tabcontainer" class="maintab">
					<h2 class="tabtit1"><a href="#sttab1"><img src="/resources/include/commonfile/image/common/tab_news_on.png" alt="공지사항"/></a></h2>
					<div id="sttab1">
						<ul>						
						<c:choose>
						<c:when test="${listNotice != null && fn:length(listNotice) > 0}">
							<c:forEach var="listNotice" items="${listNotice}">
								<li><span class="listx"><a href="#" class="noitceBtn" data="${listNotice.dataSeq}" >${ listNotice.subject }</a></span>
								<c:if test="${ listNotice.newYn eq 'Y' }">
									<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
								</c:if>								
								<span class="date">${ listNotice.createYmd }</span>
								</li>
							</c:forEach>
							
						</c:when>
						<c:otherwise>
							<li>등록된 게시물이 없습니다.</li>
						</c:otherwise>
						</c:choose>	
						</ul>
						<p class="btnMore"><a href="/front/notice/4"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
					</div>
					<h2 class="tabtit2"><a href="#sttab2"><img src="/resources/include/commonfile/image/common/tab_notice_off.png" alt="입찰정보"/></a></h2>
					<div id="sttab2">
						<ul>
						<c:choose>
						<c:when test="${listTender != null && fn:length(listTender) > 0}">
							<c:forEach var="listTender" items="${listTender}">
								<li><span class="listx"><a href="#" class="tenderBtn"  data="${listTender.dataSeq}" >${ listTender.subject }</a></span>
								<c:if test="${ listTender.newYn eq 'Y' }">
									<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
								</c:if>								
								<span class="date">${ listTender.createYmd }</span>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>등록된 게시물이 없습니다.</li>
						</c:otherwise>
						</c:choose>	
						</ul>
						<p class="btnMore"><a href="/front/notice/9"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
					</div>
					<h2 class="tabtit3"><a href="#sttab3"><img src="/resources/include/commonfile/image/common/tab_free_off.png" alt="채용공고"/></a></h2>
					<div id="sttab3">
						<ul>
						<c:choose>
						<c:when test="${listRecruit != null && fn:length(listRecruit) > 0}">
							<c:forEach var="listRecruit" items="${listRecruit}">
								<li><span class="listx"><a href="#" class="recBtn" data="${listRecruit.dataSeq}" >${ listRecruit.subject }</a></span>
								<c:if test="${ listRecruit.newYn eq 'Y' }">
									<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
								</c:if>								
								<span class="date">${ listRecruit.createYmd }</span>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>등록된 게시물이 없습니다.</li>
						</c:otherwise>
						</c:choose>	
						</ul>
						<p class="btnMore"><a href="/front/notice/10"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
					</div>
					<h2 class="tabtit4"><a href="#sttab4"><img src="/resources/include/commonfile/image/common/tab_faq_off.png" alt="강좌안내"/></a></h2>
					<div id="sttab4">
						<ul>
						<c:choose>
						<c:when test="${listLecture != null && fn:length(listLecture) > 0}">
							<c:forEach var="listLecture" items="${listLecture}">
								<li><span class="listx"><a href="#" class="lecBtn" data="${listLecture.dataSeq}" >${ listLecture.subject }</a></span>
								<c:if test="${ listLecture.newYn eq 'Y' }">
									<img src="/resources/include/commonfile/image/common/icon_new.png" alt="새 글" />
								</c:if>								
								<span class="date">${ listLecture.createYmd }</span>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>등록된 게시물이 없습니다.</li>
						</c:otherwise>
						</c:choose>	
						</ul>
						<p class="btnMore"><a href="/front/notice/8"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
					</div>
				</div>
				<script type="text/javascript">tabList('tabcontainer', 0);</script> </div>
			<div class="popArea"> 
				<!-- 팝업존 S -->
				<p class="popTitle"><img src="/resources/include/commonfile/image/main/title_pop.gif" alt="팝업존" /></p>
				<script type="text/javascript">
                    
                    $(function(){
                    var banner = $('#popZone').bxSlider({
                    mode: 'fade',
                    infiniteLoop: false,
                    pause : 5000,                //이동속도 기본 500
                    controls : false,
                    //hideControlOnEnd: false,
                    pager: true,  //페이지 설정 css 설정값
                    auto: true,
                    controls: false,
                    randomStart: false
                    });
                    
                    $('#popZoneStart').click(function(){banner.startShow();    return false;  });
                    $('#popZoneStop').click(function(){banner.stopShow();    return false;  });
                    $('#popZoneGoback').click(function(){banner.goToPreviousSlide();    return false;  });
                    $('#popZoneGofor').click(function(){banner.goToNextSlide();    return false;  });
                    });
                    
                    </script>
                    
				<div class="popzoneArea">
					<ul class='popView numbg04' id='popZone'>
						<c:choose>
						<c:when test="${listPopup != null && fn:length(listPopup) > 0}">
							<c:forEach var="listPopup" items="${listPopup}">
								<%-- <li><a href="http://${ listPopup.linkUrl }" target="${listPopup.linkTgt }" class="popImgArea"><img src="${ listPopup.filePath }${ listPopup.realFileNm }"  alt="${ listPopup.orgnlFileNm }" /></a></li> --%>
									<c:choose>
										<c:when test="${ listPopup.linkUrl != null &&  listPopup.linkUrl != '' &&  listPopup.linkUrl != '/'}">
										<li><a href="${ listPopup.linkUrl }" target="${ listPopup.linkTgt }" class="popImgArea" >
										<img src="${ listPopup.filePath }${ listPopup.realFileNm }" alt="${ listPopup.orgnlFileNm }" />
										</a>
										</li>
										</c:when>
										<c:otherwise>
										<li>
										<img src="${ listPopup.filePath }${ listPopup.realFileNm }" alt="${ listPopup.orgnlFileNm }" />
										</li>
										</c:otherwise>
									</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li><img src="/resources/include/commonfile/image/main/rban01.gif"  alt="defalt image" /></li>
						</c:otherwise>
					</c:choose>
					</ul>
					<ul class="controlArea">
						<li><a id="popZoneStop" href="#none"><img src="/resources/include/commonfile/image/main/btn_rollStop.png" alt="팝업존멈춤" /></a></li>
						<li><a id="popZoneStart" href="#none"><img src="/resources/include/commonfile/image/main/btn_rollPlay.png" alt="팝업존시작" /></a></li>
					</ul>
				</div>
				
				<!-- 팝업존 E --> 
			</div>
		</div>
	</div>
	
	
	
	<div class="mBanAreaWrap">
		<div class="mBanArea">
			<ul class="mBan">
				<li><a href="/front/minwonList"><img src="/resources/include/commonfile/image/main/micon1.png" alt="전자민원" /></a></li>
				<li><a href="/front/community/6"><img src="/resources/include/commonfile/image/main/micon2.png" alt="자유게시판" /></a></li>
				<li><a href="/front/notice/5"><img src="/resources/include/commonfile/image/main/micon3.png" alt="자주묻는 질문" /></a></li>
				<li><a href="/front/notice/7"><img src="/resources/include/commonfile/image/main/micon4.png" alt="포토갤러리" /></a></li>
				<li><a href="/front/cleanMain"><img src="/resources/include/commonfile/image/main/micon5.png" alt="클린신고센터" /></a></li>
				<li><a href="/front/contents/185"><img src="/resources/include/commonfile/image/main/micon6.png" alt="온라인접수안내" /></a></li>
			</ul>
		</div>
	</div>
	
<!--- 새로 추가된 전체 메뉴 영역 시작. 202Line에서 삽입하면 됨 -->
	<div id="totalMenuWrap">
				<script type="text/javascript">
$(document).ready(function(e) {
	var tmpHtml = $('#indexNavi').html();

	$('#totalMenu').html($('#indexNavi').html());
	
	$('#totalMenu > ul > li > a').each(function(index, element) {
		$(this).text($(this).find('img').attr('alt'));
	});
	
	$('#totalMenu').html($('#totalMenu').html().replace('topmenu','totMenu'));
	
	
	
	

	$('#btnTotal a').toggle(
		function() { 
		$('#totalMenu').show();
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace('.gif','_over.gif'));  
		$(this).find('img').attr('alt','전체메뉴닫기');},
		function() {
			 $('#totalMenu').hide(); 
			 $(this).find('img').attr('src',$(this).find('img').attr('src').replace('_over.gif','.gif')); 
			 $(this).find('img').attr('alt','전체메뉴보기');}
		);
		
});


</script> 
		<p id="btnTotal"><a href="#link"><img src="/resources/include/commonfile/image/main/btn_totalMenu.gif" alt="전제메뉴보기" /></a></p>
		<div id="totalMenu"></div>
	</div>
	<!--- 새로 추가된 전체 메뉴 영역 끝. 202 Line에서 삽입하면 됨 -->	
	
	
	<div class="mBanArea2Wrap"> 
		<!--배너영역 S--> 
		<script type="text/javascript">
                    $(document).ready(function(){
                        //배너존 롤링 스크립트
                        var banner = $('#main-slider').bxSlider({
                        displaySlideQty: 7,         //표시갯수
                        moveSlideQty: 1,            //이동갯수
                        speed : 2000,                //이동속도 기본 500
                        controls : false,           //이전, 다음 표시여부 기본 true
                        wrapperWidth : 845,
                        mode : 'horizontal',        //스크롤 모드'horizontal', 'vertical', 'fade'
                        auto: true                  //자동스크롤 여부 기본 false
                            });
                    
                        $('#bannerStart').click(function(){banner.startShow();    return false;  });
                        $('#bannerStop').click(function(){banner.stopShow();    return false;  });
                        $('#bannerNext').click(function(){banner.goToNextSlide();    return false;  });
                        $('#bannerPrev').click(function(){banner.goToPreviousSlide();    return false;  });
                        $('#BannerListSub').hover(function(){banner.stopShow();    return false;  }, function(){banner.startShow();    return false;  });
                    });
                    </script>
		<div class="bannerArea">
			<div class="banhead">
				<div class="bannerControlArea"> 
					<a id="bannerStop" href="#none">
						<img src="/resources/include/commonfile/image/main/btn_rollStop.png" alt="배너멈춤" class="MAT5" />
					</a> 
					<a id="bannerStart" href="#none">
						<img src="/resources/include/commonfile/image/main/btn_rollPlay.png" alt="배너시작" />
					</a> 
				</div>
			</div>
			<div class="banBtnPrev"><a href="#none" id="bannerPrev"><img src="/resources/include/commonfile/image/main/btn_banPrev.gif" alt="이전 배너로 이동" /></a></div>
			<div class="bannerList">
				<ul id="main-slider">
				<c:choose>
					<c:when test="${listBanner != null && fn:length(listBanner) > 0}">
						<c:forEach var="listBanner" items="${listBanner}">
						 
							<c:choose>
								<c:when test="${ listBanner.linkUrl != null &&  listBanner.linkUrl != '' &&  listBanner.linkUrl != '/'}">
									<li style='margin:0;padding:0;'>
										<a href="http://${ listBanner.linkUrl }" target="${ listBanner.linkTgt }" class="popImgArea" >
											<img src="${ listBanner.filePath }${ listBanner.realFileNm }" alt="${ listBanner.orgnlFileNm }" />
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li style='margin:0;padding:0;'>
										<img src="${ listBanner.filePath }${ listBanner.realFileNm }" alt="${ listBanner.orgnlFileNm }" />
									</li>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style='margin:0;padding:0;'><img src='/resources/include/commonfile/image/main/mban1.png' alt="~~~" /></li>
						<li style='margin:0;padding:0;'><img src='/resources/include/commonfile/image/main/mban2.png' alt="~~~" /></li>
						<li style='margin:0;padding:0;'><img src='/resources/include/commonfile/image/main/mban3.png' alt="~~~" /></li>
						<li style='margin:0;padding:0;'><img src='/resources/include/commonfile/image/main/mban4.png' alt="~~~" /></li>
						<li style='margin:0;padding:0;'><img src='/resources/include/commonfile/image/main/mban5.png' alt="~~~" /></li>
						<li style='margin:0;padding:0;'><img src='/resources/include/commonfile/image/main/mban6.png' alt="~~~" /></li>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
			<div class="banBtnNext"><a href="#none" id="bannerNext"><img src="/resources/include/commonfile/image/main/btn_banNext.gif" alt="다음 배너로 이동" /></a></div>
		</div>
		<!--배너영역 E--> 
		
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(0,0,0,0);</script>
</body>
</html>