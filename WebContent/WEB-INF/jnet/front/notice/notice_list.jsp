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
		
		$("img[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#fileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
		
		$("a[name=clkSubject]").click(function(){
			
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			
			$("#pageFrm").attr("action", "/front/notice/notice_view").submit();
		});
		
	});
	
	function goSearch(){
		
//		if( $('#searchValTxt').val() == '' && $('#searchKeySlct').val() != '' )
		/* if( $('#searchValTxt').val() == '' )
		{
			alert("검색 키워드를 주십시오.");
			$('#searchValTxt').focus();
			return;
		} */
		
		/* var boardSeq = $(this).attr("data");
		var dataSeq = $(this).attr("id");
		$("#boardSeq").val(boardSeq);
		$("#dataSeq").val(dataSeq); */
		
		//alert('commCodeSeq = '+ $('#commCodeSeq').val());
		//alert('searchKeySlct = '+ $('#searchKeySlct').val());
		
		//$("#pageFrm").attr("action", "/front/notice/${menuSeq}/${boardSeq}").submit();
		if("${boardSeq}" =="3" || "${boardSeq}" =="16" ||  "${boardSeq}" =="17"){
			$("#pageFrm").attr("action", "/front/notice/${boardSeq}/${comCd}").submit();
		}else{
			$("#pageFrm").attr("action", "/front/notice/${boardSeq}").submit();
		}
    }
	
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		if( "${boardSeq}" =="3" || "${boardSeq}" =="16" ||  "${boardSeq}" =="17" ){
			$("#pageFrm").attr("action", "/front/notice/${boardSeq}/${comCd}").submit();
		}else{
			$("#pageFrm").attr("action", "/front/notice/${boardSeq}").submit();
		}
	}
	
//]]>
</script>

</head>

<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downBbsFile">
	<input type="hidden" name="fileSeq" id="fileSeq" />
</form>
<form method="post" name="pageFrm" id="pageFrm">
<input type="hidden" name="dataSeq" id="dataSeq" />
<input type="hidden" name="boardSeq" id="boardSeq" value="${ boardSeq }" />
<input type="hidden" name="pageNum" id="pageNum" />

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
				
				<c:if test="${ boardSeq eq 4}">
					<div class="top_info"> 
						<p class="infom">공단에서 <strong>각종공지사항</strong>과 <strong>행사소식</strong>을 알려드립니다.</p>
					</div>
				</c:if>
				<c:if test="${ boardSeq eq 8}">
					<div class="top_info"> 
						<p class="infom">공단에서 진행하는 <strong>새로운 강좌</strong>를 알려드립니다.</p>
					</div>
				</c:if>
				<c:if test="${ boardSeq eq 9}">
					<div class="top_info"> 
						<p class="infom">공단에서 진행하는 <strong>입찰정보</strong>를 알려드립니다.</p>
					</div>
				</c:if>
				<c:if test="${ boardSeq eq 10}">
					<div class="top_info"> 
						<p class="infom">공단에서 <strong>채용정보</strong>를 알려드립니다.</p>
					</div>
				</c:if>
				<c:if test="${ boardSeq eq 11}">
					<div class="top_info"> 
						<p class="infom">공단에서 <strong>언론에 보도된 자료</strong>를 안내합니다.</p>
					</div>
				</c:if>
				<c:if test="${ boardSeq eq 12}">
					<div class="top_info"> 
						<p class="infom">공단에서 발행하는 <strong>소식지</strong>를 알려드립니다.</p>
					</div>
				</c:if>
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
					<c:choose>
					<c:when test="${bbs.boardType eq 'FREE' }">
						<select name="pgmCatGbnCd" id="pgmCatGbnCd" title="프로그램 카테고리">
							<option value="">전체</option>
							<c:if test="${saleList != null && fn:length(saleList) > 0 }">
								<c:forEach items="${saleList }" var="list">
									<option value="${ list.codeId }" <c:if test="${ list.codeId eq pgmCatGbnCd }">selected="selected"</c:if> >${list.codeNm }</option>
								</c:forEach>
							</c:if>
						</select>
					</c:when>
					<c:when test="${bbs.boardType eq 'LOSE' }">
					</c:when>
					<c:otherwise>
						<select name="commCodeSeq" id="commCodeSeq"  title="시설 카테고리">
							<option value="">전체</option>
							<c:if test="${ facilList != null && fn:length(facilList) > 0 }">
								<c:forEach items="${ facilList }" var="list">
									<option value="${ list.commCodeSeq }" <c:if test="${ list.commCodeSeq eq commCodeSeq }">selected="selected"</c:if> >${list.codeNm }</option>
								</c:forEach>
							</c:if>
						</select>
					</c:otherwise>
					</c:choose>
						<select name="searchKey" id="searchKeySlct" title="검색 방법선택">
							<option value="subject" <c:if test="${searchKey eq 'subject' }">selected="selected"</c:if> >제목</option>
							<option value="content"	<c:if test="${searchKey eq 'content' }">selected="selected"</c:if> >내용</option>
							<option value="name" <c:if test="${searchKey eq 'name' }">selected="selected"</c:if> >작성자</option>
						</select>
						<input type="text" name="searchVal" id="searchValTxt" value="${ searchVal }" title="검색어 입력" class="schKwd" style="width:200px;" onKeyDown="if(event.keyCode==13){javascript:goSearch();return false;}" />
						<a href="javaScript:goSearch();" id="searchBtn" name="searchBtn"><img src="/resources/include/commonfile/image/common/btn_search.gif" alt="검색" /></a>
					</div>
					<div class="boardWrap">
					<c:choose>
						<c:when test="${bbs.boardType eq 'GALL' }">
							<c:choose>
										<c:when test="${noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
											<ul id="galleryList" class="galleryList">
												<c:forEach items="${noticeListBbs }" var="list">
													<li>
														<dl>
															<dt><a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject"><img src="${list.filePathNm }" alt="${ fn:trim(list.content) }" /></a> </dt>
															<dd style="text-align: center;">
																<a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">${list.subject }</a>
															</dd>
														</dl>
													</li>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
										<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="사진,제목">
											<tr>
												<td align="center">등록된 갤러리가 존재하지 않습니다.</td>
											</tr>
										</table>
										</c:otherwise>
								</c:choose>
						</c:when>
						<c:when test="${bbs.boardType eq 'FREE'  }">
								<c:choose>
										<c:when test="${noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
											<ul class="thumbList">
												<c:forEach items="${noticeListBbs }" var="list">
													<li>
														<dl>
															<dd class="photo">
																<a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">
																<c:choose>
																	<c:when test="${list.filePathNm != null && list.filePathNm != ''  }">
																		<img src="${list.filePathNm }" alt="${list.subject }" />
																	</c:when>
																	<c:otherwise>
																		<img src="/resources/include/commonfile/image/common/no_img.gif" alt="이미지 없음" />
																	</c:otherwise>
																</c:choose>
																</a>
															</dd>
															<dt>
															<%-- <a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">
																</a> --%>
																${list.subject }
																</dt>
															<dd class="desc"><strong>일시</strong> :
																${list.freeDtm }
															</dd>
															<dd class="desc"><strong>장소</strong> : 
																${list.freePlace }
															</dd>
															<dd class="desc"><strong>강사</strong> : 
																<c:if test="${list.teacherList != null && fn:length(list.teacherList) > 0 }">
																	<c:forEach items="${list.teacherList}" var="teacherList" varStatus="status2">
																		${teacherList.teacherNm } 강사
																		<c:if test="${!status2.last }">
																			,
																		</c:if>
																	</c:forEach>
																</c:if>
															</dd>
														</dl>
													</li>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<li style="text-align: center;padding-top: 10px;">등록된 무료체험강좌가 존재하지 않습니다.</li>
											</ul>
										</c:otherwise>
								</c:choose>
							</c:when> 
						<c:when test="${bbs.boardType eq 'LOSE'  }">
								<c:choose>
										<c:when test="${noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
											<ul class="thumbList">
												<c:forEach items="${noticeListBbs }" var="list">
													<li>
														<dl>
															<dd class="photo">
																<a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">
																<c:choose>
																	<c:when test="${list.filePathNm != null && list.filePathNm != ''  }">
																		<img src="${list.filePathNm }" alt="${list.subject }" />
																	</c:when>
																	<c:otherwise>
																		<img src="/resources/include/commonfile/image/common/no_img.gif" alt="이미지 없음" />
																	</c:otherwise>
																</c:choose>
																</a>
															</dd>
															<dt>
															<%-- <a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">
																</a> --%>
																${list.subject }
																</dt>
															<%-- <dd class="desc"><strong>사업장</strong> :
																${list.codeNm }
															</dd> --%>
															<dd class="desc"><strong>습득 및 분실일</strong> : 
																${fn:substring(list.learnYmd,0,4)}년${fn:substring(list.learnYmd,4,6)}월${fn:substring(list.learnYmd,6,8)}일
															</dd>
															<dd class="desc"><strong>습득 및 분실장소:</strong> ${list.learnArea }</dd>
															<dd class="desc"><strong>보관유무</strong> : 
																<c:choose>
																	<c:when test="${list.learnStoreYn eq 'Y' }">
																		보관중
																	</c:when>
																	<c:otherwise>
																		찾아감
																	</c:otherwise>
																</c:choose>
															</dd>
														</dl>
													</li>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<li style="text-align: center;padding-top: 10px;">등록된 분실물이 존재하지 않습니다.</li>
											</ul>
										</c:otherwise>
								</c:choose>
							</c:when> 
						<c:otherwise>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 게시물의 목록표">
								<caption>게시물 리스트</caption>
								<colgroup>
									<col width="50px" />
								<c:if test="${noticeListBbs[0].catCdYn eq 'Y' }">
									<col width="120px" />
								</c:if>
									<col width="250px" />
									<col width="80px" />
									<col width="120px" />
									<col width="50px" />
								<c:if test="${noticeListBbs[0].boardSeq eq '13' or noticeListBbs[0].boardSeq eq '14' or noticeListBbs[0].boardSeq eq '15' }">
								<col width="50px" />
								</c:if>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
									<c:if test="${noticeListBbs[0].catCdYn eq 'Y' }">
										<th scope="col">시설명</th>
									</c:if>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>
										<c:if test="${noticeListBbs[0].boardSeq eq '13' or noticeListBbs[0].boardSeq eq '14' or noticeListBbs[0].boardSeq eq '15' }">
										<th scope="col">첨부</th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${ noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
											<c:forEach items="${ noticeListBbs }" var="list">
												<tr>
													<td>
														${ list.listNo }
													</td>
												<c:if test="${list.catCdYn eq 'Y' }">
													<td>
														${ list.codeNm }
													</td>
												</c:if>
													<td class="title">
														<a href="#" data="${ list.boardSeq }" id="${ list.dataSeq }" name="clkSubject" >${ list.subject }</a>
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
												<c:if test="${list.boardSeq eq '13' or list.boardSeq eq '14' or list.boardSeq eq '15' }">
													<td>
														<c:if test="${list.fileSeq != null && list.fileSeq > 0 }">
															<c:set var="abc" value="${fn:toLowerCase(list.filePathNm)}" />
															<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
																<c:if test="${status.last }">
																	<c:choose>
																		<c:when test="${token eq 'hwp' }">
																			<img style="cursor: pointer;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="hwp" />
																		</c:when>
																		<c:when test="${token eq 'xls' || fn:split(list.filePathNm,'.')[1] eq 'xlsx' }">
																			<img style="cursor: pointer;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="xls" />
																		</c:when>
																		<c:when test="${token eq 'jpg' || fn:split(list.filePathNm,'.')[1] eq 'gif' || token eq 'png' || token eq 'bmp' }">
																			<img style="cursor: pointer;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="jpg" />	
																		</c:when>
																		<c:when test="${token eq 'pdf'}">
																			<img style="cursor: pointer;width: 23px;height: 23px;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="pdf" />	
																		</c:when>
																		<c:when test="${token eq 'ppt' }">
																			<img style="cursor: pointer;width: 16px;height: 16px;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="ppt" />
																		</c:when>
																		<c:otherwise>
																			<img style="cursor: pointer;width: 20px;height: 20px;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="etc" />
																		</c:otherwise>
																	</c:choose>
																</c:if>
													        </c:forTokens>
														</c:if>
													
													</td>
												</c:if>
												</tr>
											</c:forEach>  
										</c:when>
										<c:otherwise>
											<tr>
											<c:choose>
												<c:when test="${list.boardSeq eq '13' or list.boardSeq eq '14' or list.boardSeq eq '15' }">
													<c:choose>
														<c:when test="${list.catCdYn eq 'Y' }">
															<td colspan="7" align="center">등록된 게시물이 존재하지 않습니다.</td>
														</c:when>
														<c:otherwise>
															<td colspan="6" align="center">등록된 게시물이 존재하지 않습니다.</td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${list.catCdYn eq 'Y' }">
															<td colspan="6" align="center">등록된 게시물이 존재하지 않습니다.</td>
														</c:when>
														<c:otherwise>
															<td colspan="5" align="center">등록된 게시물이 존재하지 않습니다.</td>
														</c:otherwise>
													</c:choose>												
												</c:otherwise>
											</c:choose>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
					</div>
					<!-- Sports & culture list top Search -->
					
					
				</div>
					<!-- board paging -->
					<!-- 
					<div class="pgeAbs mt30"> 
						<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
					</div>
					-->
					<c:if test="${noticeListBbs != null && fn:length(noticeListBbs) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30">
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<!-- board paging --> 
				
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
<script type="text/javascript">
<c:if test="${boardSeq eq 3}">
	<c:if test="${comCd eq 80}">
	initMenu(1,1,1,5);
	</c:if>
	<c:if test="${comCd eq 81}">
	initMenu(1,2,1,5);
	</c:if>
	<c:if test="${comCd eq 82}">
	initMenu(1,4,1,3);
	</c:if>
	<c:if test="${comCd eq 83}">
	initMenu(1,5,1,4);
	</c:if>
	<c:if test="${comCd eq 84}">
	initMenu(1,6,1,3);
	</c:if>
	<c:if test="${comCd eq 85}">
	initMenu(1,3,1,5);
	</c:if>
</c:if>
<c:if test="${boardSeq eq 4}">
initMenu(5,1,0,0);
</c:if>
<c:if test="${boardSeq eq 5}">
initMenu(4,1,0,0);
</c:if>
<c:if test="${boardSeq eq 7}">
initMenu(4,4,0,0);
</c:if>
<c:if test="${boardSeq eq 8}">
initMenu(5,2,0,0);
</c:if>
<c:if test="${boardSeq eq 9}">
initMenu(5,3,0,0);
</c:if>
<c:if test="${boardSeq eq 10}">
initMenu(5,5,0,0);
</c:if>
<c:if test="${boardSeq eq 11}">
initMenu(5,6,0,0);
</c:if>
<c:if test="${boardSeq eq 12}">
initMenu(5,7,0,0);
</c:if>
<c:if test="${boardSeq eq 13}">
initMenu(6,1,3,0);
</c:if>
<c:if test="${boardSeq eq 14}">
initMenu(6,2,7,0);
</c:if>
<c:if test="${boardSeq eq 15}">
initMenu(6,2,8,0);
</c:if>
<c:if test="${boardSeq eq 16}">
	<c:if test="${comCd eq 80}">
	initMenu(1,1,2,5);
	</c:if>
	<c:if test="${comCd eq 81}">
	initMenu(1,2,2,5);
	</c:if>
	<c:if test="${comCd eq 82}">
	initMenu(1,4,2,5);
	</c:if>
	<c:if test="${comCd eq 83}">
	initMenu(1,5,2,5);
	</c:if>
	<c:if test="${comCd eq 84}">
	initMenu(1,6,2,2);
	</c:if>
	<c:if test="${comCd eq 85}">
	initMenu(1,3,2,5);
	</c:if>
</c:if>
<c:if test="${boardSeq eq 17}">
	<c:if test="${comCd eq 80}">
	initMenu(1,1,3,0);
	</c:if>
	<c:if test="${comCd eq 81}">
	initMenu(1,2,3,0);
	</c:if>
	<c:if test="${comCd eq 82}">
	initMenu(1,4,3,0);
	</c:if>
	<c:if test="${comCd eq 83}">
	initMenu(1,5,3,0);
	</c:if>
	<c:if test="${comCd eq 84}">
	initMenu(1,6,3,0);
	</c:if>
	<c:if test="${comCd eq 85}">
	initMenu(1,3,3,0);
	</c:if>
</c:if>
<% //20140313 추가내용	%>
<c:if test="${boardSeq eq 18}">
initMenu(5,4,0,0);
</c:if>
<c:if test="${boardSeq eq 19}">
initMenu(6,4,0,0);
</c:if>
</script>
</body>
</html>