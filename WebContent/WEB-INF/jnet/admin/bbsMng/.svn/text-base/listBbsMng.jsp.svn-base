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
		$("input[name=mngBtn]").click(function(){
			var menuSeq = $(this).attr("data");
			$("#menuSeq").val(menuSeq); 
			$("#pageFrm").attr("action","/admin/formUpdateBbsMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
	})
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/admin/listBbsMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="menuSeq" id="menuSeq" />
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
				<h3>통합게시판관리</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
								<colgroup>
									<col width="40px" />
									<col width="100px" />
									<col width="110px" />
									<col width="100px" />
									<col width="65px" />
									<col width="80px" /> 
									<col width="65px" />
									<c:if test="${adminInfo.admAuthCode eq 'S' }">
									<col width="60px" />
									</c:if>
								</colgroup>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">유형</th>
									<th scope="col">게시판명</th>
									<th scope="col">글(오늘/전체)</th>
									<th scope="col">담당자</th>
									<th scope="col">연락처</th>
									<th scope="col">수정일</th>
									<c:if test="${adminInfo.admAuthCode eq 'S' }">
									<th scope="col">관리</th>
									</c:if>
								</tr>
								<c:choose>
									<c:when test="${listBbsMng != null && fn:length(listBbsMng) > 0 }">
										<c:forEach items="${listBbsMng }" var="list" varStatus="status">
											<tr>
												<td>
													${status.count }
												</td>
												<td>
													<c:if test="${list.boardType eq 'NOTI' }">
													공지형
													</c:if>
													<c:if test="${list.boardType eq 'NEWS' }">
													뉴스형
													</c:if>
													<c:if test="${list.boardType eq 'GALL' }">
													갤러리형
													</c:if>
													<c:if test="${list.boardType eq 'COMM' }">
													커뮤니티형
													</c:if>
													<c:if test="${list.boardType eq 'FREE' }">
													무료체험강좌형
													</c:if>
													<c:if test="${list.boardType eq 'LOSE' }">
													분실물유형
													</c:if>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.boardSeq != null && list.boardSeq > 0 }">
															<a style="text-decoration:underline;font-weight: bold;" href="/admin/listBbsData/${list.menuSeq}/${list.boardSeq }?gseq=${gseq}">${list.menuNm }</a>
														</c:when>
														<c:otherwise>
															${list.menuNm }
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.boardSeq != null && list.boardSeq > 0 }">
															<a style="text-decoration:underline;font-weight: bold;" href="/admin/listBbsData/${list.menuSeq}/${list.boardSeq }?gseq=${gseq}">${list.todayCnt }/${list.totalCnt }</a>
														</c:when>
														<c:otherwise>
															${list.todayCnt }/${list.totalCnt }
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													${list.empNm }&nbsp;
												</td>
												<td>
													${list.empPhoneNumber }&nbsp;
												</td>
												<td>
													<c:if test="${list.modiYmd != null && list.modiYmd != '' }">
														${fn:substring(list.modiYmd,0,4)}-${fn:substring(list.modiYmd,4,6)}-${fn:substring(list.modiYmd,6,8)}
													</c:if>&nbsp;
												</td>
												<c:if test="${adminInfo.admAuthCode eq 'S' }">
												<td>
													<input type="button" data="${list.menuSeq }" value="관리" name="mngBtn" />
												</td>
												</c:if>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:if test="${adminInfo.admAuthCode eq 'S' }">
											<tr>
												<td colspan="7" align="center">등록된 메뉴가 존재하지 않습니다. 메뉴먼저 등록해주세요.</td>
											</tr>
										</c:if>
										<c:if test="${adminInfo.admAuthCode eq 'O' }">
											<tr>
												<td colspan="6" align="center">등록된 메뉴가 존재하지 않습니다. 메뉴먼저 등록해주세요.</td>
											</tr>
										</c:if>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>