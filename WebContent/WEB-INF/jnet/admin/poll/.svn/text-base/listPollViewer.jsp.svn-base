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
		$("#closeBtn").click(function(){
			self.close();
		});
	});
</script>
</head> 
<body>
	<form action="/ml/listAdmPollViewer/${problemSeq }" method="post" name="pageFrm" id="pageFrm">
		<input type="hidden" name="pageNum" id="pageNum"  />
	</form>
	<table width="97.5%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
		<colgroup>
			<col width="40px" />
			<col width="140px" />
			<col />
			<col width="120px" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">작성자(아이디)</th>
				<th scope="col">내용</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
	</table>
	<div style="width:100%;
 				height:200px;
				overflow-x:hidden; 
				overflow-y:auto; ">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
			<colgroup>
				<col width="40px" />
				<col width="140px" />
				<col />
				<col width="120px" />
			</colgroup>
			<c:choose>
				<c:when test="${list != null && fn:length(list) > 0 }">
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.listNo }</td>
							<td>
								${list.createNm }(${list.createId })	
							</td>
							<td>
								<c:if test="${gbnCd eq 'etc' }">
									${list.aEtc }
								</c:if> 
								<c:if test="${gbnCd eq 'shortAnswer' }">
									${list.aShortAnswer }
								</c:if>
							</td>
							<td>
								${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td colspan="4">
						내용이 존재하지 않습니다.
					</td>	
				</c:otherwise>
			</c:choose>
		</table>		
	</div>
	<c:if test="${list != null && fn:length(list) > 0 }">
		<!-- board paging --> 
		<div class="pgeAbs mt30"> 
			<p class="paging">${pageIndexList }</p>
		</div>
	</c:if>
	<div class="btn_farm2 mt20 mb20" style="text-align: right;">
		<span class="txtBtn_lightGray"><a href="#" id="closeBtn" >닫기</a></span> &nbsp; 
	</div>
</body>
</html>