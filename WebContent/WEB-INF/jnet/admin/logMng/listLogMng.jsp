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
	$("#excelBtn").click(function(){
		$("#pageFrm").attr("action","/admin/excelDownLog").submit();
	});
})
	function setPage(pageNo){
		$("#pageNum").val(pageNo); 
		$("#pageFrm").attr("action","/admin/listLogMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
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
				<h3>로그관리</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="140px" />
								<col />
								<col width="140px" />
								<col width="120px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">접속URL</th>
									<th scope="col">접속IP</th>
									<th scope="col">접속시간</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${listLogMng != null && fn:length(listLogMng) > 0 }">
									<c:forEach items="${listLogMng }" var="list">
										<tr>
											<td>
												${list.createId}
											</td>
											<td align="center">
												${list.logUrl}
											</td>
											<td>
												${list.createIp}
											</td>
											<td>
												${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}
												${fn:substring(list.createHms,0,2)}:${fn:substring(list.createHms,2,4)}:${fn:substring(list.createHms,4,6)}
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" align="center">접속 로그가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<c:if test="${listLogMng != null && fn:length(listLogMng) > 0 }">
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