<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<colgroup>
	<col />
	<col />
	<col />
</colgroup>
<thead> 
<tr>
	<th scope="col">사업장</th>
	<th scope="col">접수사항</th>
	<th scope="col">
		<c:set var="yearFlag" value="" />
		<c:if test="${flag eq 'year' }">연도별  <c:set var="yearFlag" value="년" /></c:if>
		<c:if test="${flag eq 'area' }">분야별</c:if>
		<c:if test="${flag eq 'status' }">만족도별</c:if>
		<c:if test="${flag eq 'age' }">연령대별</c:if>
		<c:if test="${flag eq 'happyCall' }">해피콜별</c:if>
		<c:if test="${flag eq 'sex' }">성별</c:if>
		<c:if test="${flag eq 'answerDate' }">처리기일별</c:if>
	</th>
	<th scope="col">민원수</th>
</tr>
</thead>
<tbody>
	<c:if test="${listCptStatsRight != null && fn:length(listCptStatsRight) > 0 }">
		<c:forEach items="${listCptStatsRight }" var="list">
			<tr>
				<td style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;" class="rowSpnTd" data="${list.leftCodeId }" >${list.leftCodeNm }</td>
				<td style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;" class="totCnt" data="${list.leftCodeId }" >
					<c:set var="cnt" value="0" />
					<c:if test="${listCptStatsTotCnt != null && fn:length(listCptStatsTotCnt) > 0 }">
						<c:forEach items="${listCptStatsTotCnt }" var="list2">
							<c:if test="${list2.codeId eq list.leftCodeId }">
								${list2.cnt }건
								<c:set var="cnt" value="${cnt+1 }" />
							</c:if>
						</c:forEach>
						<c:if test="${cnt eq 0 }">
							0건
						</c:if>
					</c:if>
				</td>
				<td style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;" >${list.middleCodeNm }${yearFlag }</td>
				<td>${list.cnt }건</td>
			</tr>	
		</c:forEach>
	</c:if>
</tbody>