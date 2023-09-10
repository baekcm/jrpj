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
		$("input[name=memMngBtn]").click(function(){
			var seq = $(this).attr("data");
			$("#userSeq").val(seq);
			$("#pageFrm").attr("action","/admin/formUpdateMemMng?gseq=${gseq}&lseq=${lseq}").submit();
		}) 
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#userSeq").val("");
			$("#pageFrm").attr("action","/admin/listMemMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownMemMng").submit();
		});
	});
	
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#userSeq").val("");
		$("#pageFrm").attr("action","/admin/listMemMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<jsp:include page="/common/gnb.jsp" />
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="userSeq" id="userSeq" />
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="pageNum" id="pageNum" />
</form>
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>회원 리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						<select id="searchKeySlct">
							<option value="user_id"
								<c:if test="${searchKey eq 'user_id'}">selected="selected"</c:if>
							>아이디</option>
							<option value="user_nm"
								<c:if test="${searchKey eq 'user_nm'}">selected="selected"</c:if>
							>이름</option>
						</select>
						<input type="text" id="searchValTxt" value="${searchVal }" />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
								<colgroup>
									<col width="40px" />
									<col width="140px" />
									<col width="120px" />
									<col />
									<col width="60px" />
									<col width="60px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">최근접속</th>
										<th scope="col">가입일</th>
										<th scope="col">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${listMemMng != null && fn:length(listMemMng) > 0 }">
										<c:forEach items="${listMemMng }" var="list">
											<tr>
												<td>
													${list.listNo }
												</td>
												<td align="center">
													${list.userId }
												</td>
												<td>
													${list.userNm }
												</td>
												<td>
													<c:choose>
														<c:when test="${list.loginYmd != null && list.loginYmd != '' }">
															${fn:substring(list.loginYmd,0,4)}-${fn:substring(list.loginYmd,4,6)}-${fn:substring(list.loginYmd,6,8)}
															${fn:substring(list.loginHms,0,2)}:${fn:substring(list.loginHms,2,4)}:${fn:substring(list.loginHms,4,6)}	
														</c:when>
														<c:otherwise>
															&nbsp;
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													${fn:substring(list.signYmd,0,4)}-${fn:substring(list.signYmd,4,6)}-${fn:substring(list.signYmd,6,8)}
												</td>
												<td>
													<input type="button" data="${list.userSeq }" name="memMngBtn" value="관리"/>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6" align="center">가입된 회원이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
										
								</tbody>
							</table>
					</div>
					<c:if test="${listMemMng != null && fn:length(listMemMng) > 0 }">
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