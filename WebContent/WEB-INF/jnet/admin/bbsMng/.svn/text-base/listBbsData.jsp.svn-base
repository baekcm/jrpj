<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript">
	$(function(){
		$("a[name=clkSubject]").click(function(){
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			$("#pageFrm").attr("action","/admin/findBbsData?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		$("#insertBtn").click(function(){
			location.href="/admin/formCreateBbsData/${menuSeq}/${boardSeq}?gseq=${gseq}&lseq=${lseq}";
		});
		 
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#searchFacil").val($.trim($("#searchFacilSlct").val()));
			$("#boardSeq").val("");
			$("#dataSeq").val("");
			$("#pageFrm").attr("action","/admin/listBbsData/${menuSeq}/${boardSeq}?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		$("#removeBtn").click(function(){
			if($("input[name=dataSeqChk]:checked").size() == 0) {
				alert("삭제할 게시물을 선택하세요");
				return;
			} else {
				var f = confirm("정말 삭제하시겠습니까?");
				if(f){
					var tag = "";
					$("input[name=dataSeqChk]:checked").each(function(){
						tag += "<input type='hidden' name='dataSeqArr' value='"+$(this).val()+"'/>";
					});
					$("#removeFrm").html(tag);
					$("#removeFrm").attr("action","/admin/removeBbsData/${menuSeq}/${boardSeq}?gseq=${gseq}&lseq=${lseq}").submit();
				} else {
					return;
				}
			}
		});
		
		$("#allChk").click(function(){
			if($("#allChk").prop("checked")) {
				$("input[name=dataSeqChk]").prop("checked",true);
			} else {
				$("input[name=dataSeqChk]").prop("checked",false);	
			}
		});
		
		
		$("#listBtn").click(function(){
			location.href="/admin/listBbsMng?gseq=${gseq}&lseq=${lseq}";
		});
		
		$("img[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#fileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
		
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#boardSeq").val("");
		$("#dataSeq").val("");
		$("#pageFrm").attr("action","/admin/listBbsData/${menuSeq}/${boardSeq}?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downBbsFile">
	<input type="hidden" name="fileSeq" id="fileSeq" />
</form>
<form method="post" name="removeFrm" id="removeFrm" action="/admin/removeBbsData">
</form>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="dataSeq" id="dataSeq" />
	<input type="hidden" name="searchFacil" id="searchFacil" value="${searchFacil }" />
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="boardSeq" id="boardSeq" value="${boardSeq }" />
	<input type="hidden" name="pageNum" id="pageNum" />
</form>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>[
				<c:if test="${bbs.boardType eq 'NOTI'}">
				공지형
				</c:if>
				<c:if test="${bbs.boardType eq 'NEWS'}">
				뉴스형
				</c:if>
				<c:if test="${bbs.boardType eq 'GALL'}">
				갤러리형
				</c:if>
				<c:if test="${bbs.boardType eq 'COMM'}">
				커뮤니티형
				</c:if>
				<c:if test="${bbs.boardType eq 'FREE'}">
				무료체험강좌형
				</c:if>
				<c:if test="${bbs.boardType eq 'LOSE'}">
				분실물습득형
				</c:if>
				] &nbsp;${bbs.boardNm }</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						<c:if test="${bbs.catCdYn eq 'Y' }">
							<select id="searchFacilSlct">
								<option value="">전체</option>
								<c:if test="${listFacil != null && fn:length(listFacil) > 0 }">
									<c:forEach items="${listFacil }" var="list">
										<option value="${list.commCodeSeq }"
											<c:if test="${searchFacil eq list.commCodeSeq}">selected="selected"</c:if>
										>${list.codeNm }</option>
									</c:forEach>
								</c:if>
							</select>
						</c:if>
						<select id="searchKeySlct">
							<option value="subject"
								<c:if test="${searchKey eq 'subject' }">selected="selected"</c:if>
							>제목</option>
							<option value="content"
								<c:if test="${searchKey eq 'content' }">selected="selected"</c:if>
							>내용</option>
							<option value="name"
								<c:if test="${searchKey eq 'name' }">selected="selected"</c:if>
							>작성자</option>
						</select>
						<input type="text" id="searchValTxt" value="${searchVal }" />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<c:choose>
							<c:when test="${bbs.boardType eq 'GALL' }">
								<c:choose>
										<c:when test="${listBbsData != null && fn:length(listBbsData) > 0 }">
											<ul id="galleryList" class="galleryList">
												<c:forEach items="${listBbsData }" var="list">
													<li>
														<dl>
															<dt><a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject"><img src="${list.filePathNm }" alt="1이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
															<dd style="text-align: center;">
																<input type="checkbox" name="dataSeqChk" value="${list.dataSeq }" />
																<a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">${list.subject }</a>
															</dd>
															<dd style="text-align: center;">
																(${list.codeNm })${list.createNm }
															</dd>
														</dl>
													</li>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
										<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
											<tr>
												<td align="center">등록된 갤러리가 존재하지 않습니다.</td>
											</tr>
										</table>
										</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${bbs.boardType eq 'LOSE' || bbs.boardType eq 'FREE' }">
								<c:choose>
										<c:when test="${listBbsData != null && fn:length(listBbsData) > 0 }">
											<ul class="thumbList">
												<c:forEach items="${listBbsData }" var="list">
													<li>
														<dl>
															<dd class="photo">
																<a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">
																	<c:choose>
																		<c:when test="${list.filePathNm != null && list.filePathNm != '' }">
																			<img src="${list.filePathNm }" alt="분실물 제목으로 alt값" />
																		</c:when>
																		<c:otherwise>
																			<img src="/resources/admin_include/commonfile/image/common/no_img.gif" alt="이미지 존재하지 않음"  style="width: 110px;height: 80px;"/>
																		</c:otherwise>
																	</c:choose>
																</a>
															</dd>
															<dt>
																<input type="checkbox" name="dataSeqChk" value="${list.dataSeq }" />
																<a href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">
																${list.subject }</a>
																</dt>
															<dd class="desc"><strong>사업장</strong> :
																${list.codeNm }
															</dd>
															<c:if test="${bbs.boardType eq 'LOSE' }">
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
															</c:if>
														</dl>
													</li>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<c:if test="${bbs.boardType eq 'LOSE'}">
													<li style="text-align: center;padding-top: 10px;">등록된 분실물이 존재하지 않습니다.</li>
												</c:if>
												<c:if test="${bbs.boardType eq 'FREE' }">
													<li style="text-align: center;padding-top: 10px;">등록된 무료강좌가 존재하지 않습니다.</li>
												</c:if>
											</ul>
										</c:otherwise>
								</c:choose>
							</c:when> 
							<c:otherwise>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
									<colgroup>
										<col width="40px" />
										<c:if test="${bbs.catCdYn eq 'Y' }">
											<col width="70px" />
										</c:if>
										<col width="120px" />
										<col width="400px" />
										<col />
										<col width="60px" />
										<col width="60px" />
									</colgroup>
									<thead>
										<tr> 
											<th scope="col"><input type="checkbox" id="allChk" /> </th>
											<th scope="col">번호</th>
											<c:if test="${bbs.catCdYn eq 'Y' }">
												<th scope="col">시설명</th>
											</c:if>
											<th scope="col">제목</th>
											<th scope="col">이름</th>
											<th scope="col">날짜</th>
											<th scope="col">조회</th>
											<th scope="col">첨부</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${listBbsData != null && fn:length(listBbsData) > 0 }">
											<c:forEach items="${listBbsData }" var="list">
												<tr>
													<td>
														<input type="checkbox" name="dataSeqChk" value="${list.dataSeq }" />
													</td>
													<td>
														${list.listNo }
													</td>
													<c:if test="${bbs.catCdYn eq 'Y' }">
													<td>
														${list.codeNm }&nbsp;
													</td>
													</c:if>
													<td align="center">
														<a style="text-decoration:underline;font-weight: bold;" href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">${list.subject }</a>
													</td>
													<td>
														${list.createNm }&nbsp;
													</td>
													<td>
														${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}&nbsp;
													</td>
													<td>
														${list.hitnum }&nbsp;
													</td>
													<td>
														<c:choose>
															<c:when test="${list.fileSeq != null && list.fileSeq > 0 }">
																<c:set var="abc" value="${fn:toLowerCase(list.filePathNm)}" />
																<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
																	<c:if test="${status.last }">
																		<c:choose>
																			<c:when test="${token eq 'hwp' }">
																				<img style="cursor: pointer;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${list.filePathNm }" />
																			</c:when>
																			<c:when test="${token eq 'xls' || fn:split(list.filePathNm,'.')[1] eq 'xlsx' }">
																				<img style="cursor: pointer;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${list.filePathNm }" />
																			</c:when>
																			<c:when test="${token eq 'jpg' || fn:split(list.filePathNm,'.')[1] eq 'gif' || token eq 'png' || token eq 'bmp' }">
																				<img style="cursor: pointer;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${list.filePathNm }" />	
																			</c:when>
																			<c:when test="${token eq 'pdf'}">
																				<img style="cursor: pointer;width: 23px;height: 23px;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${list.filePathNm }" />	
																			</c:when>
																			<c:when test="${token eq 'ppt' }">
																				<img style="cursor: pointer;width: 16px;height: 16px;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${list.filePathNm }" />
																			</c:when>
																			<c:otherwise>
																				<img style="cursor: pointer;width: 20px;height: 20px;" id="${list.fileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${list.filePathNm }" />
																			</c:otherwise>
																		</c:choose>
																	</c:if>
														        </c:forTokens>
															</c:when>
															<c:otherwise>
																&nbsp;
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<c:if test="${bbs.catCdYn eq 'Y' }">
												<td colspan="8" align="center">등록된 게시물이 존재하지 않습니다.</td>
												</c:if>
												<c:if test="${bbs.catCdYn eq 'N' }">
												<td colspan="7" align="center">등록된 게시물이 존재하지 않습니다.</td>
												</c:if>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
					<c:if test="${listBbsData != null && fn:length(listBbsData) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<div class="btn_farm2 mt20 mb20" style="text-align: right;">
						<c:choose>
							<c:when test="${adminInfo.admAuthCode eq 'S' }">
								<span class="txtBtn_lightGray"><a href="#" id="insertBtn" >글쓰기</a></span> &nbsp;
								<span class="txtBtn_lightGray"><a href="#" id="removeBtn" >삭제</a></span> &nbsp;
							</c:when>
							<c:when test="${adminInfo.admAuthCode eq 'O' }">
								<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
									<c:set var="doneLoop" value="false"/>
									<c:forEach items="${authInfo }" var="list">
										<c:if test="${not doneLoop}">
											<c:if test="${bbs.menuSeq  eq list.menuSeq}">
												<c:set var="doneLoop" value="true"/>
												<span class="txtBtn_lightGray"><a href="#" id="insertBtn" >글쓰기</a></span> &nbsp;
												<span class="txtBtn_lightGray"><a href="#" id="removeBtn" >삭제</a></span> &nbsp;
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>	
							</c:when>
						</c:choose>
						
						<span class="txtBtn_lightGray"><a href="#" id="listBtn" >통합게시판목록</a></span> &nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>