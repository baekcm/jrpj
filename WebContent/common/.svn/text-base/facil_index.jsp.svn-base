<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<c:choose>
						<c:when test="${listOneNotiMng != null && fn:length(listOneNotiMng) > 0  }">
							<p><a href="http://${listOneNotiMng[0].linkUrl }" target="${listOneNotiMng[0].linkTgt }">${listOneNotiMng[0].title }</a></p>
						</c:when>
						<c:otherwise>
							<p><a>등록된 한줄 알림이 없습니다.</a></p>
						</c:otherwise>
						</c:choose>
					</div>
					<div id="pageTopSearch">
						<form name="ptsearch" method="post" id="ptsearch" action="/main/search/21" >
							<input type="text" name="searchVal" id="ptschKwd"  title="검색어 입력"  onKeyDown="if(event.keyCode==13){javascript:subMainSearch();return false;}"  />
							<img style="cursor: pointer;" alt="검색" id="ptschBtn" src="/resources/include/commonfile/image/common/btn_search.gif"/>
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
									<li>
									<c:choose>
										<c:when test="${ listPopup.linkUrl != null &&  listPopup.linkUrl != '' &&  listPopup.linkUrl != '/'}">
										<a href="${ listPopup.linkUrl }" target="${ listPopup.linkTgt }" class="popImgArea" >
										<img src="${ listPopup.filePath }${ listPopup.realFileNm }" alt="${ listPopup.orgnlFileNm }" />
										</a>
										</c:when>
										<c:otherwise>
										<img src="${ listPopup.filePath }${ listPopup.realFileNm }" alt="${ listPopup.orgnlFileNm }" />
										</c:otherwise>
									</c:choose>
									</li>
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
								<p class="btnMore"><a href="#" onclick="moreBoard('4','${listNotice[0].commCodeSeq}');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
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
								<p class="btnMore"><a href="#" onclick="moreBoard('9','${listTender[0].commCodeSeq}');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
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
								<p class="btnMore"><a href="#" onclick="moreBoard('10','${listRecruit[0].commCodeSeq}');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
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
								<p class="btnMore"><a href="#" onclick="moreBoard('8','${listLecture[0].commCodeSeq}');"><img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기"/></a></p>
							</div>
						</div>
						<script type="text/javascript">tabList('tabcontainer', 0);</script> 
					</div>
					<!-- sub main news area --> 
					<!-- sub main photo gal area -->
					<div id="photoGal">
						<div class="pgTop">
							<h2><img src="/resources/include/commonfile/image/common/title_submainphoto.gif" alt="포토갤러리" /></h2>
							<div class="btn_more"> <img src="/resources/include/commonfile/image/common/btn_more.gif" alt="더 보기" style="cursor: pointer;" onclick="morePhoto('7','${listPhoto[0].commCodeSeq}');" /> </div>
						</div>
						<ul>
						<c:choose>
						<c:when test="${listPhoto == null || fn:length(listPhoto) == 0}">
							<li>등록된 게시물이 없습니다.</li>
						</c:when>
						<c:otherwise>
							<c:forEach var="listPhoto" items="${listPhoto}">
								<li>
									<dl data="${listPhoto.boardSeq }" id="${listPhoto.dataSeq }"  com="${listPhoto.commCodeSeq}" name="clkSubject" style="cursor: pointer;">
										
										<dd><img src="${ listPhoto.filePathNm }" alt="포토갤러리 사진" /></dd>
										<dt>${ listPhoto.subject }</dt>
										
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
						<div class="btn_more">
						<c:choose>
							<c:when test="${path eq 'eastcult' }">
								<a href="/front/program/31/01">
							</c:when>
							<c:when test="${path eq 'gumin' }">
								<a href="/front/program/21/01">
							</c:when>
							<c:when test="${path eq 'jculture' }">
								<a href="/front/program/41/01">
							</c:when>
							<c:when test="${path eq 'olympic' }">
								<a href="/front/program/11/01">
							</c:when>
							<c:when test="${path eq 'stennis' }">
								<a href="/front/program/33/01">
							</c:when>
							<c:when test="${path eq 'youth' }">
								<a href="/front/program/32/01">
							</c:when>
						</c:choose>
						
						<img src="/resources/include/commonfile/image/common/btn_total.gif" width="50" height="17" alt="전체보기" /></a> </div>
					</div>
					<div class="tblWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="과정명,프로그램명,요일,시간,대상" class="tbl01">
							<caption>
							프로그램안내
							</caption>
							<colgroup>
							<col style="width:130px;" />
							<col />
							<col style="width:130px;" />
							<col style="width:130px;" />
							<col style="width:100px;" />
							</colgroup>
							<tr>
								<th scope="col" colspan="2">프로그램명</th>
								<th scope="col">요일</th>
								<th scope="col">이용시간</th>
								<th scope="col">대상</th>
							</tr>
							<c:choose>
							<c:when test="${listProgram != null && fn:length(listProgram) > 0 }">
								<c:forEach var="listProgram" items="${listProgram}">
								<tr>
									<td style="text-align: right;border-right-color: white; border-right-width: 0px;">
									<a href="#" name="detailPgm">
									<input type="hidden" name="upId" value="${listProgram.upId }"/>
										<input type="hidden" name="saleId" value="${listProgram.saleComCd }"/>
										<input type="hidden" name="detailPgm" value="${listProgram.comCd3 }"/>
										<input type="hidden" name="pgmCd" value="${listProgram.pgmCd }"/>
										<input type="hidden" name="offCnt" value='${fn:trim(listProgram.offlineAcceptCnt<0?"0":listProgram.offlineAcceptCnt )}' />
										<input type="hidden" name="onCnt" value='${fn:trim(listProgram.onlineAcceptCnt<0?"0":listProgram.onlineAcceptCnt )}' />
										<img src="${listProgram.pgmFileImg}" alt="${fn:trim(listProgram.pgmNm )}" style="width:65px ; height:65px" />
										</a>
									</td>	
									<td style="text-align: left;word-break:break-all;">	
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
									<td name="weekCdTd" >${fn:trim(listProgram.dtWeekCd )}</td>
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