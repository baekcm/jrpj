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
		$("img[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#suggestFileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
		
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#statusCd").val($.trim($("#statusCdSlct").val()));
			$("#suggestGbnCd").val($.trim($("#suggestGbnCdSlct").val()));
			
			$("#pageFrm").attr("action","/admin/listSuggest?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownSuggest").submit();
		});
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/admin/listSuggest?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downSuggestFile">
	<input type="hidden" name="suggestFileSeq" id="suggestFileSeq" />
</form>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="statusCd" id="statusCd" value="${statusCd }" />
	<input type="hidden" name="suggestGbnCd" id="suggestGbnCd" value="${suggestGbnCd }" />
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
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
				<h3>고객제안</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
							<select name="statusCdSlct" id="statusCdSlct">
								<option value="">전체</option>
								<option value="R"
									<c:if test="${statusCd eq 'R' }">selected="selected"</c:if>
								>접수중</option>
								<option value="I"
									<c:if test="${statusCd eq 'I' }">selected="selected"</c:if>
								>처리중</option>
								<option value="C"
									<c:if test="${statusCd eq 'C' }">selected="selected"</c:if>
								>완료</option>
							</select>
							<select name="suggestGbnCdSlct" id="suggestGbnCdSlct">
								<option value="">전체</option>
								<option value="1"
									<c:if test="${suggestGbnCd eq '1' }">selected="selected"</c:if>
								>공단직원</option>
								<option value="2"
									<c:if test="${suggestGbnCd eq '2' }">selected="selected"</c:if>
								>주민제안</option>
							</select>
							<select name="searchKeySlct" id="searchKeySlct" title="검색방법 선택" class="schSel">
							<option value="subject"
								<c:if test="${searchKey eq 'subject' }">selected="selected"</c:if>
							>제목</option>
							<option value="name" 
								<c:if test="${searchKey eq 'name' }">selected="selected"</c:if>
							>작성자</option>
							</select>
						<input type="text" name="searchValTxt" id="searchValTxt" title="검색어 입력" class="schKwd"  style="width:200px;" value="${searchVal }" />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="50px" />
								<col />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">제안구분</th>
									<th scope="col">등록자</th>
									<th scope="col">등록일</th>
									<th scope="col">첨부</th>
									<th scope="col">처리상태</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${listSuggest != null && fn:length(listSuggest) > 0 }">
										<c:forEach items="${listSuggest }" var="list">
										<tr>
											<td>
												${list.listNo }
											</td>
											<td>
												<a style="text-decoration:underline;font-weight: bold;" href="/admin/findSuggest/${list.suggestSeq}?gseq=${gseq}&lseq=${lseq}">
													${list.subject }
												</a>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.suggestGbnCd eq '1' }">
														공단직원
													</c:when>
													<c:otherwise>
														주민제안
													</c:otherwise>
												</c:choose>
											</td>
											<td>
											${list.userNm }
											</td>
											<td>
												${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}
											</td>
											<td>
												<c:choose>
													<c:when test="${list.suggestFileSeq != null && list.suggestFileSeq > 0 }">
														<c:set var="abc" value="${fn:toLowerCase(list.orgnlFileNm)}" />
														<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
															<c:if test="${status.last }">
																<c:choose>
																	<c:when test="${token eq 'hwp' }">
																		<img style="cursor: pointer;" id="${list.suggestFileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${list.orgnlFileNm }" />
																	</c:when>
																	<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																		<img style="cursor: pointer;" id="${list.suggestFileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${list.orgnlFileNm }" />
																	</c:when>
																	<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																		<img style="cursor: pointer;" id="${list.suggestFileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${list.orgnlFileNm }" />	
																	</c:when>
																	<c:when test="${token eq 'pdf'}">
																		<img style="cursor: pointer;width: 23px;height: 23px;" id="${list.suggestFileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${list.orgnlFileNm }" />	
																	</c:when>
																	<c:when test="${token eq 'ppt' }">
																		<img style="cursor: pointer;width: 16px;height: 16px;" id="${list.suggestFileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${list.orgnlFileNm }" />
																	</c:when>
																	<c:otherwise>
																		<img style="cursor: pointer;width: 20px;height: 20px;" id="${list.suggestFileSeq }" name="fileDown" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${list.orgnlFileNm }" />
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
											<td>
												<c:if test="${list.statusCd eq 'R' }">
													접수완료
												</c:if>
												<c:if test="${list.statusCd eq 'I' }">
													처리중
												</c:if>
												<c:if test="${list.statusCd eq 'C' }">
													처리완료
												</c:if>
											</td>
										</tr>
										</c:forEach> 
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" align="center">등록된 제안이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<c:if test="${listSuggest != null && fn:length(listSuggest) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
						<div class="btn_farm2 mt20 mb20" style="text-align: right;">
								<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>