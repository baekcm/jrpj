<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />

<script type="text/javascript">
//<![CDATA[

	$(function(){
		  
		$("a[name=clkPrevNext]").click(function(){
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			$("#pageFrm").attr("action","/front/notice/notice_view?gseq="+ boardSeq +"&lseq="+ dataSeq).submit();
		});
		
		$("a[name=clkSubject]").click(function(){
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			$("#pageFrm").attr("action","/front/notice/notice_view?gseq="+ boardSeq +"&lseq="+ dataSeq).submit();
		});
		
		// 첨부파일 다운로드
		$("a[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#fileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
		 <c:if test="${noticeList[0].boardType eq 'GALL'  }">
		 /* $("img[name=thumbImg]").click(function(){
			 window.open($(this).attr("src").replace("thumb_",""),'','width=600,height=400,top=500,left=400,scrollbars=no,resizable=no')
		 }); */
		 /* $('#thumbList li img').click(function(e) {
				//$('#viewPhoto').find('img').attr('src',$(this).find('img').attr('src'));
				//$('#viewDesc').text($(this).find('img').attr('alt'));
				$('#viewPhoto').find('img').attr('src',$(this).attr('src'));
				//$('#viewDesc').text($(this).attr('alt'));
			}); */
		 $("img[name='thumbImg']").click(function() {
				$('#viewPhoto').find('img').attr('src',$(this).attr('src').replace("thumb_",""));
			});
	 </c:if>
		
	});

//]]>
</script>           
							<!-- <script type="text/javascript">
							$(document).ready(function(e) {
								$('#thumbList li a').click(function(e) {
									$('#viewPhoto').find('img').attr('src',$(this).find('img').attr('src'));
									$('#viewDesc').text($(this).find('img').attr('alt'));
								});
							});
							</script> --> 
</head>

<body>

<form method="post" name="downFrm" id="downFrm" action="/admin/downBbsFile">
	<input type="hidden" name="fileSeq" id="fileSeq" />
</form>

<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="dataSeq" id="dataSeq" />
	<input type="hidden" name="boardSeq" id="boardSeq" />
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
				<c:choose>
					<c:when test="${noticeList[0].boardType eq 'GALL' }">

						<c:if test="${noticeList != null && fn:length(noticeList) > 0 }">
							
									<c:forEach items="${noticeList }" var="list" varStatus="status">
									
										<c:if test="${status.count eq 1 }">
										<div class="boardWrap">
										<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자를 포함한 게시물 상세보기의 표" class="bd00view">
										<caption>
										게시물 내용 상세보기
										</caption>
											<colgroup>
												<col width="120px" />
												<col />
											</colgroup>
											<tr>
												<th class="ta_l" scope="row">제목</th>
												<td class="bd01td listx">${ fn:trim(noticeList[0].subject) }</td>
											</tr>
											<tr>
												<th class="ta_l" scope="row">사업장</th>
												<td class="bd01td listx">${ fn:trim(noticeList[0].codeNm) }</td>
											</tr>
											<tr>
												<th class="ta_l" scope="row">작성자
												</th>
												<td class="bd01td listx">${ fn:trim(noticeList[0].createNm) }</td>
											</tr>
											</table>
											</div>
											<div class="viewer mt30">
												<div id="viewPhoto"><img src="${list.filePath }${list.realFileNm}" alt="함께 작성된 게시글 내용이 alt값으로" /></div>
												<div id="viewDesc">${fn:trim(noticeList[0].content) }</div>
											</div>
										</c:if>
									</c:forEach>
									<div id="thumbnail" class="ovh">
										<c:forEach items="${noticeList }" var="list" varStatus="status">
											<c:if test="${status.count ne 1 }">
												<c:if test="${list.thumbYn eq 'Y' }">
														<ul id="thumbList">
															<li><img name="thumbImg" src="${list.filePath }${list.realFileNm}" style="cursor: pointer;" alt="매월 격주로 운동하고 있는 혜화 Hans입니다." /></li>
														</ul>
												</c:if>		
											</c:if>
										</c:forEach>
									</div>
							

						</c:if>
					</c:when>
					<c:otherwise>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자를 포함한 게시물 상세보기의 표" class="bd00view">
							<caption>
							게시물 내용 상세보기
							</caption>
							<c:choose>
								<c:when test="${noticeList[0].boardType eq 'LOSE' }">
								<colgroup>
									<col width="120px" />
									<col />
								</colgroup>
								<tr>
									<th class="ta_l" scope="row">제목</th>
									<td class="bd01td listx">${ fn:trim(noticeList[0].subject) }</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">작성자</th>
									<td class="bd01td">${ fn:trim(noticeList[0].createNm) }</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">습득 및 분실일</th>
									<td class="bd01td">${ fn:substring(noticeList[0].learnYmd,0,4) }년${ fn:substring(noticeList[0].learnYmd,4,6) }월${ fn:substring(noticeList[0].learnYmd,6,8) }일</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">습득 및 분실 장소</th>
									<td class="bd01td">${noticeList[0].learnArea }</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">보관 유무</th>
									<td class="bd01td">
									<c:if test="${noticeList[0].learnStoreYn eq 'Y' }">보관중</c:if>
									<c:if test="${noticeList[0].learnStoreYn eq 'N' }">찾아감</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2" scope="row" class="bd01tdC"><p>

									<img src="${noticeList[0].filePath }${noticeList[0].realFileNm}"  width="257" height="198" alt="${ fn:trim(noticeList[0].subject) }" />
									</p>
										${noticeList[0].content }
									</td>
								</tr>

								</c:when>
								<c:when test="${noticeList[0].boardType eq 'FREE' }">
								<colgroup>
									<col width="120px" />
									<col />
								</colgroup>
								<tr>
									<th class="ta_l" scope="row">제목</th>
									<td class="bd01td listx">${ fn:trim(noticeList[0].subject) }</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">작성자</th>
									<td class="bd01td">${ fn:trim(noticeList[0].createNm) }</td>
								</tr>
								<c:if test="${noticeList[0].pgmCatGbnCd eq 'Y' }">
									<tr>
										<th class="ta_l" scope="row">프로그램 카테고리</th>
										<td class="bd01td">
											<c:if test="${saleList != null && fn:length(saleList) > 0 }">
												<c:forEach items="${saleList }" var="list">
													<c:if test="${list.codeId eq bbs[0].pgmCatGbnCd }">${list.codeNm }</c:if>
												</c:forEach>
											</c:if>
										</td>
									</tr>
								</c:if>
								<tr>
									<th class="ta_l" scope="row">장소</th>
									<td class="bd01td">
									${noticeList[0].freePlace }
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">일시</th>
									<td class="bd01td">
										${noticeList[0].freeDtm }	
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">강사</th>
									<td class="bd01td">
										<c:if test="${bbsTeacherResult != null && fn:length(bbsTeacherResult) > 0 }">
											<c:forEach items="${bbsTeacherResult}" var="teacherList" varStatus="status2">
												<b>${teacherList.teacherNm }</b> 강사
												<c:if test="${!status2.last }">
													<br/>
												</c:if>
											</c:forEach>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2" scope="row" class="bd01tdC"><p>

									<img src="${noticeList[0].filePath }${noticeList[0].realFileNm}"  width="257" height="198" alt="${ fn:trim(noticeList[0].subject) }" />
									</p>
										${noticeList[0].content }
									</td>
								</tr>

								</c:when>
								<c:otherwise>
							<colgroup>
							<col width="120px" />
							<col />
							<col width="120px" />
							<col width="200px" />
							</colgroup>
							<c:if test="${noticeList[0].boardSeq ne '13' and noticeList[0].boardSeq ne '14' and noticeList[0].boardSeq ne '15' }">
							<tr>
								<th class="bd01th" scope="row">담당부서</th>
								<td colspan="3" class="bd01td">${ fn:trim(noticeList[0].codeNm) }</td>
							</tr>
							</c:if>
							<tr>
								<th class="bd01th" scope="row">구분</th>
								<td colspan="3" class="bd01td">${ fn:trim(noticeList[0].boardNm) }</td>
							</tr>
							<tr>
								<th class="bd01th" scope="row">제목</th>
								<td colspan="3" class="bd01td listx">${ fn:trim(noticeList[0].subject) }</td>
							</tr>
							<tr>
								<th class="bd01th" scope="row">작성자</th>
								<td colspan="3" class="bd01td">${ fn:trim(noticeList[0].createNm) }</td>
							</tr>
							<tr>
								<th class="bd01th" scope="row">등록일</th>
								<td class="bd01td">${ fn:substring(noticeList[0].createYmd,0,4) }-${ fn:substring(noticeList[0].createYmd,4,6) }-${ fn:substring(noticeList[0].createYmd,6,8) }</td>
								<th class="bd01th">조회수</th>
								<td class="bd01td">${ noticeList[0].hitnum }</td>
							</tr>
							<c:if test="${noticeList[0].boardType ne 'GALL' }">
								<tr>
									<th class="bd01th" scope="row">첨부파일</th>
									<td colspan="3" class="bd01td">
										<%-- <c:if test="${noticeList[0].fileSeq != null && noticeList[0].fileSeq > 0 }">
											<c:set var="abc" value="${fn:toLowerCase(noticeList[0].orgnlFileNm)}" />
											<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
												<c:if test="${status.last }">
													<c:choose>
														<c:when test="${token eq 'hwp' }">
															<img style="cursor: pointer;" id="${noticeList[0].fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="hwp" />
															${noticeList[0].orgnlFileNm}
														</c:when>
														<c:when test="${token eq 'xls' || fn:split(noticeList[0].orgnlFileNm,'.')[1] eq 'xlsx' }">
															<img style="cursor: pointer;" id="${noticeList[0].fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="xls" />
															${noticeList[0].orgnlFileNm}
														</c:when>
														<c:when test="${token eq 'jpg' || fn:split(noticeList[0].orgnlFileNm,'.')[1] eq 'gif' || token eq 'png' || token eq 'bmp' }">
															<img style="cursor: pointer;" id="${noticeList[0].fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="jpg" />
															${noticeList[0].orgnlFileNm}	
														</c:when>
														<c:when test="${token eq 'pdf'}">
															<img style="cursor: pointer;width: 23px;height: 23px;" id="${noticeList[0].fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="pdf" />
															${noticeList[0].orgnlFileNm}	
														</c:when>
														<c:when test="${token eq 'ppt' }">
															<img style="cursor: pointer;width: 16px;height: 16px;" id="${noticeList[0].fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="ppt" />
															${noticeList[0].orgnlFileNm}
														</c:when>
														<c:otherwise>
															<img style="cursor: pointer;width: 20px;height: 20px;" id="${noticeList[0].fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="etc" />
															${noticeList[0].orgnlFileNm}
														</c:otherwise>
													</c:choose>
												</c:if>
									        </c:forTokens>
										</c:if> --%>
										<c:if test="${noticeList != null && fn:length(noticeList) > 0 }">
											<c:forEach items="${noticeList }" var="list">
												<c:if test="${list.thumbYn eq 'N' }">
													<c:set var="abc" value="${fn:toLowerCase(list.orgnlFileNm)}" />
													<a id="${list.fileSeq }" name="fileDown" href="#">
														<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
															<c:if test="${status.last }">
																<c:choose>
																	<c:when test="${token eq 'hwp' }">
																		<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${list.orgnlFileNm }" />
																	</c:when>
																	<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																		<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${list.orgnlFileNm }" />
																	</c:when>
																	<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																		<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${list.orgnlFileNm }" />	
																	</c:when>
																	<c:when test="${token eq 'pdf'}">
																		<img style="cursor: pointer;width: 23px;height: 23px;" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${list.orgnlFileNm }" />	
																	</c:when>
																	<c:when test="${token eq 'ppt' }">
																		<img style="cursor: pointer;width: 16px;height: 16px;" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${list.orgnlFileNm }" />
																	</c:when>
																	<c:otherwise>
																		<img style="cursor: pointer;width: 20px;height: 20px;" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${list.orgnlFileNm }" />
																	</c:otherwise>
																</c:choose>
															</c:if>
												        </c:forTokens>
												        ${list.orgnlFileNm}
											        </a>
										        </c:if>
											</c:forEach>
										</c:if>
										
									</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="4" scope="row" class="bd01tdC">

									${ fn:trim(noticeList[0].content) }
								</td>
							</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					</c:otherwise>
				</c:choose>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<c:choose>
					<c:when test="${boardSeq eq 3 or boardSeq eq 16 or boardSeq eq 17}">
						<span class="txtBtn_lightGray"><a href="/front/notice/${noticeList[0].boardSeq}/${comCd}" >목록으로</a></span>
					</c:when>
					<c:otherwise>
						<span class="txtBtn_lightGray"><a href="/front/notice/${noticeList[0].boardSeq}" >목록으로</a></span>
					</c:otherwise>
					</c:choose>
					<!-- Text Button --> 
				</div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="이전글과 다음글의 제목으로 구성된 표 제목" class="prevNext">
					<caption>
						이전글,다음글
					</caption>
					<colgroup>
						<col width="70px" />
						<col />
					</colgroup>
					<tr>
						<th scope="row">이전글</th>
						<td class="listx">
							<c:choose>
								<c:when test="${noticePrev != null && fn:length(noticePrev) > 0 }">
									<a href="#" data="${ noticePrev[0].boardSeq }" id="${ noticePrev[0].dataSeq }" name="clkPrevNext" >${ fn:trim(noticePrev[0].subject) }</a>
								</c:when>
								<c:otherwise>
									이전글이 없습니다.
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th  scope="row">다음글</th>
						<td class="listx">
							<c:choose>
								<c:when test="${noticeNext != null && fn:length(noticeNext) > 0 }">
									<a href="#" data="${ noticeNext[0].boardSeq }" id="${ noticeNext[0].dataSeq }" name="clkPrevNext" >${ fn:trim(noticeNext[0].subject) }</a>
								</c:when>
								<c:otherwise>
									다음글이 없습니다.
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
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