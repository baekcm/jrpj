<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
</head>
<body>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>회원통계</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">  
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
						<colgroup>
							<col width="100px" />
							<col  />
							<col width="100px" />
							<col  />
							<col width="100px" />
							<col  />
							<col width="100px" />
							<col  />
						</colgroup>
						<tr>
							<th scope="col" colspan="2">성별</th>
							<th scope="col" colspan="6">연령별</th>
						</tr>
						<tr>
							<td>
								남자
							</td>
							<td style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;"> 
								<c:choose>
									<c:when test="${listMemStatBySex != null && fn:length(listMemStatBySex) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatBySex }" var="list">
											<c:if test="${ list.memSex eq '1' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>
										<c:if test="${cnt eq 0 }">
											0
										</c:if>												
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
							<td>
								10대
							</td>
							<td>
								<c:choose>
									<c:when test="${listMemStatByAge != null && fn:length(listMemStatByAge) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatByAge }" var="list">
											<c:if test="${ list.memAge eq '10' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>
										<c:if test="${cnt eq 0 }">
											0
										</c:if>												
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
							<td>
								20대
							</td>
							<td>
								<c:choose>
									<c:when test="${listMemStatByAge != null && fn:length(listMemStatByAge) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatByAge }" var="list">
											<c:if test="${ list.memAge eq '20' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>	
										<c:if test="${cnt eq 0 }">
											0
										</c:if>											
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
							<td>
								30대
							</td>
							<td>
								<c:choose>
									<c:when test="${listMemStatByAge != null && fn:length(listMemStatByAge) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatByAge }" var="list">
											<c:if test="${ list.memAge eq '30' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>
										<c:if test="${cnt eq 0 }">
											0
										</c:if>												
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
						</tr> 
						<tr>
						<tr>
							<td>
								여자
							</td>
							<td style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
								<c:choose>
									<c:when test="${listMemStatBySex != null && fn:length(listMemStatBySex) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatBySex }" var="list">
											<c:if test="${ list.memSex eq '2' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>
										<c:if test="${cnt eq 0 }">
											0
										</c:if>													
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
							<td>
								40대
							</td>
							<td>
								<c:choose>
									<c:when test="${listMemStatByAge != null && fn:length(listMemStatByAge) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatByAge }" var="list">
											<c:if test="${ list.memAge eq '40' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>	
										<c:if test="${cnt eq 0 }">
											0
										</c:if>											
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
							<td>
								50대
							</td>
							<td>
								<c:choose>
									<c:when test="${listMemStatByAge != null && fn:length(listMemStatByAge) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatByAge }" var="list">
											<c:if test="${ list.memAge eq '50' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>
										<c:if test="${cnt eq 0 }">
											0
										</c:if>												
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
							<td> 
								60대 이상
							</td> 
							<td>
								<c:choose>
									<c:when test="${listMemStatByAge != null && fn:length(listMemStatByAge) > 0 }">
										<c:set var="cnt" value="0" />
										<c:forEach items="${listMemStatByAge }" var="list">
											<c:if test="${ list.memAge eq '60' }">
												<c:set var="cnt" value="${cnt+1 }" />
												${list.memCnt }
											</c:if>
										</c:forEach>	
										<c:if test="${cnt eq 0 }">
											0
										</c:if>												
									</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>