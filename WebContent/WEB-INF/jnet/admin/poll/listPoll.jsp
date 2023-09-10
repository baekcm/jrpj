<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<jsp:include page="/common/commoninc.jsp" />
<title>관리자 페이지</title>
<script type="text/javascript">
	$(function(){
		$("#insertBtn").click(function(){
			location.href = "/admin//formCreatePoll?gseq=${gseq}&lseq=${lseq}";
		});	
	});
</script>    
</head>
<body>
<form action="/admin/listPoll?gseq=${gseq}&lseq=${lseq}" method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="pageNum" id="pageNum"  />
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
				<h3>설문조사</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
									<colgroup>
										<col width="40px" />
										<col />
										<col width="140px" />
										<col width="120px" />
									</colgroup>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">설문제목</th>
									<th scope="col">설문날짜</th>
									<th scope="col">등록일자</th>
								</tr>
								<c:choose>
									<c:when test="${listPoll != null && fn:length(listPoll) > 0 }">
										<c:forEach items="${listPoll}" var="listPoll">
											<tr>
												<td>
													${listPoll.listNo }
												</td>
												<td>
													<a href="/admin/findPoll/${listPoll.pollSeq}?gseq=${gseq}&lseq=${lseq}">
														${listPoll.subject }
													</a>
												</td>
												<td>
												${fn:substring(listPoll.stDtm,0,4)}.${fn:substring(listPoll.stDtm,4,6)}.${fn:substring(listPoll.stDtm,6,8)}
													~
												${fn:substring(listPoll.edDtm,0,4)}.${fn:substring(listPoll.edDtm,4,6)}.${fn:substring(listPoll.edDtm,6,8)}
												</td>
												<td>
													${fn:substring(listPoll.createYmd,0,4)}-${fn:substring(listPoll.createYmd,4,6)}-${fn:substring(listPoll.createYmd,6,8)}
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">설문조사가 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					<c:if test="${listPoll != null && fn:length(listPoll) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<div class="btn_farm2 mt20 mb20" style="text-align: right;">
						<span class="txtBtn_lightGray"><a href="#" id="insertBtn" >설문등록</a></span> &nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>